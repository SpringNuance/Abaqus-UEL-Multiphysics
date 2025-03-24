!====================================================================
!          Program for phase field damage coupled with 
!          mechanical loading and hydrogen diffusion 
!          Mechanical model: standard Hooke's law elasticity 
!                            isotropic Von Mises plasticity
!          by Nguyen Xuan Binh
!          binh.nguyen@aalto.fi
!          July 2024, Abaqus 2023
!====================================================================

!     State variables  
    ! 1 to 6: sig11, sig22, sig33, sig12, sig13, sig23
    ! 7 to 12: stran11, stran22, stran33, stran12, stran13, stran23
    ! 13 to 18: eelas11, eelas22, eelas33, eelas12, eelas13, eelas23
    ! 19 to 24: eplas11, eplas22, eplas33, eplas12, eplas13, eplas23
    
    ! "25, AR13_eqplas, AR13_eqplas   ", 
    ! "26, AR14_deqplas, AR14_deqplas   ",

    ! "27, AR14_sig_H, AR14_sig_H   ",
    ! "28, AR15_sig_vonMises, AR15_sig_vonMises   ",

    ! "29, AR16_triax, AR16_triax   ",
    ! "30, AR17_lode, AR17_lode   ",

!***********************************************************************

! To ensure that the code are highly optimized, we should avoid
! using division and exponentiation as much as possible
! Specifically, replace division by multiplying with its constant inverse
! Replace squares by multiplication with itself

module precision
    use iso_fortran_env
    integer, parameter :: dp = real64
end module precision

!***********************************************************************

module common_block
    use precision
    implicit none

    ! THESE TWO VALUES ARE HARD-CODED
    ! YOU MUST CHANGE IT TO THE ACTUAL NUMBER OF ELEMENTS IN .INP FILE

    integer, parameter :: total_elems = 1 ! Storing the actual number of elements
    integer, parameter :: total_nodes = 8 ! Storing the actual number of nodes

    real(kind=dp), parameter :: pi = 3.14159d0 ! dimless
    real(kind=dp), parameter :: inv_pi = 1.0d0 / 3.14159d0 ! dimless
    real(kind=dp), parameter :: half = 1.0d0 / 2.0d0 ! dimless
    real(kind=dp), parameter :: third = 1.0d0 / 3.0d0 ! dimless
    real(kind=dp), parameter :: fourth = 1.0d0 / 4.0d0 ! dimless
    real(kind=dp), parameter :: sixth = 1.0d0 / 6.0d0 ! dimless
    real(kind=dp), parameter :: three_half = 3.0d0 / 2.0d0 ! dimless
    real(kind=dp), parameter :: sqrt_three_half = dsqrt(3.0d0 / 2.0d0) ! dimless
    real(kind=dp), parameter :: two_third = 2.0d0 / 3.0d0 ! dimless
    real(kind=dp), parameter :: sqrt_two_third = dsqrt(2.0d0 / 3.0d0) ! dimless
    real(kind=dp), parameter :: nine_half = 9.0d0 / 2.0d0 ! dimless

    integer, parameter :: before_mech_props_idx = 0 ! Index of the first mechanical property in props
    integer, parameter :: before_flow_props_idx = 8 ! Index of the first flow curve data in props
    
    integer, parameter :: sig_start_idx = 1 ! Starting index of the stress component in statev
    integer, parameter :: sig_end_idx = 6 ! Ending index of the strain component in statev
    integer, parameter :: stran_start_idx = 7 ! Starting index of the total strain component in statev
    integer, parameter :: stran_end_idx = 12 ! Ending index of the total strain component in statev
    integer, parameter :: eelas_start_idx = 13 ! Starting index of the elastic strain component in statev
    integer, parameter :: eelas_end_idx = 18 ! Ending index of the elastic strain component in statev
    integer, parameter :: eplas_start_idx = 19 ! Starting index of the plastic strain component in statev
    integer, parameter :: eplas_end_idx = 24 ! Ending index of the plastic strain component in statev

    integer, parameter :: eqplas_idx = 25 ! Index of the equivalent plastic strain in statev
    integer, parameter :: deqplas_idx = 26 ! Index of the increment of the equivalent plastic strain in statev
    integer, parameter :: sig_H_idx = 27 ! Index of the hydrogen concentration in statev
    integer, parameter :: sig_vonMises_idx = 28 ! Index of the equivalent von Mises stress in statev
    integer, parameter :: triax_idx = 29 ! Index of the triaxiality in statev
    integer, parameter :: lode_idx = 30 ! Index of the Lode parameter in statev
    
    ! First dim: maximum number of elements to accomodate varying number of elements when remeshed
    ! Second dim: number of solution state dependent variables (nsvars in UEL and nstatev in UMAT)
    ! Third dim: number of integration points

    real(kind=dp) :: user_vars(100000, 30, 8)

    real(kind=dp) :: all_shape_int_to_node(8, 8) ! (nnode, ninpt)
    real(kind=dp) :: all_shape_node_to_int(8, 8) ! (ninpt, nnode)
    real(kind=dp) :: all_B_deriv_local(8, 3, 8)  ! (ninpt, ndim, nnode)

    real(kind=dp) :: shape_int_to_center(8) ! (ninpt)
    real(kind=dp) :: shape_node_to_center(8) ! (nnode)
    real(kind=dp) :: center_B_deriv_local(3, 8) ! (ndim, nnode)

    
    
    save
    ! The save command is very important. 
    ! It allows the values to be stored and shared between subroutines 
    ! without resetting them to zero every time the subroutine is called

end module

! Selective reduced integration for C3D8 element
! Deviatoric strain displacement matrix at integration points 1 to 8 (+- 1/sqrt(3))
! Volumetric strain displacement matrix at integration point 0 (0.0, 0.0, 0.0)

!*****************************************************************
!  8-node     8---------------7
!  brick     /|              /|       zeta (positive)
!           / |  x 7   x 8  / |       
!          5---------------6  |       |     eta (positive)
!          |  | x 5   x 6  |  |       |   /
!          |  |    x 0     |  |       |  /
!          |  4------------|--3       | /
!          | /   x 3   x 4 | /        |/
!          |/   x 1   x 2  |/         O--------- xi (positive)
!          1---------------2           origin at cube center
!          
!         Outer number is nodal points
!         Inner number marked with x is integration points
!
!*****************************************************************


module iso_module

    use precision
    real(kind=dp), parameter :: coord_inter = 1.0d0
    real(kind=dp), parameter :: int_inter = 1.0d0 / sqrt(3.0d0)
    real(kind=dp), parameter :: coord_extra = sqrt(3.0d0)
    real(kind=dp), parameter :: int_extra = 1.0d0
    
    ! weight is the integration point weight for their shape function contribution
    real(kind=dp), parameter :: weight(8) = (/1.d0, 1.d0, 1.d0, 1.d0, 1.d0, 1.d0, 1.d0, 1.d0/)
    
    ! Interpolating coordinates (nodal to int)
    ! Isoparametric coordinates for nodal points in hexahedral 3D element
    real(kind=dp), parameter :: xi_nodal_inter(8)   = (/ -coord_inter,  coord_inter,  coord_inter, -coord_inter, &
                                                         -coord_inter,  coord_inter,  coord_inter, -coord_inter /)
    real(kind=dp), parameter :: eta_nodal_inter(8)  = (/ -coord_inter, -coord_inter,  coord_inter,  coord_inter, &
                                                         -coord_inter, -coord_inter,  coord_inter,  coord_inter /)
    real(kind=dp), parameter :: zeta_nodal_inter(8) = (/ -coord_inter, -coord_inter, -coord_inter, -coord_inter, &
                                                          coord_inter,  coord_inter,  coord_inter,  coord_inter /)

    ! Isoparametric coordinates for integration points in hexahedral 3D element
    real(kind=dp), parameter :: xi_int_inter(8)   = (/ -int_inter,  int_inter, -int_inter,  int_inter, &
                                                       -int_inter,  int_inter, -int_inter,  int_inter /)
    real(kind=dp), parameter :: eta_int_inter(8)  = (/ -int_inter, -int_inter,  int_inter,  int_inter, &
                                                       -int_inter, -int_inter,  int_inter,  int_inter /)
    real(kind=dp), parameter :: zeta_int_inter(8) = (/ -int_inter, -int_inter, -int_inter, -int_inter, &
                                                        int_inter,  int_inter,  int_inter,  int_inter /)


    ! Extrapolating coordinates (int to nodal)
    real(kind=dp), parameter :: xi_nodal_extra(8)   = (/ -coord_extra,  coord_extra,  coord_extra, -coord_extra, &
                                                         -coord_extra,  coord_extra,  coord_extra, -coord_extra /)
    real(kind=dp), parameter :: eta_nodal_extra(8)  = (/ -coord_extra, -coord_extra,  coord_extra,  coord_extra, &
                                                         -coord_extra, -coord_extra,  coord_extra,  coord_extra /)
    real(kind=dp), parameter :: zeta_nodal_extra(8) = (/ -coord_extra, -coord_extra, -coord_extra, -coord_extra, &
                                                          coord_extra,  coord_extra,  coord_extra,  coord_extra /)

    real(kind=dp), parameter :: xi_int_extra(8)   = (/ -int_extra,  int_extra, -int_extra,  int_extra, &
                                                       -int_extra,  int_extra, -int_extra,  int_extra /)
    real(kind=dp), parameter :: eta_int_extra(8)  = (/ -int_extra, -int_extra,  int_extra,  int_extra, &
                                                       -int_extra, -int_extra,  int_extra,  int_extra /)
    real(kind=dp), parameter :: zeta_int_extra(8) = (/ -int_extra, -int_extra, -int_extra, -int_extra, &
                                                        int_extra,  int_extra,  int_extra,  int_extra /)

end module iso_module


subroutine calc_shape_int_to_node(xi_node, eta_node, zeta_node, temp_shape_int_to_node)
    ! Calculate the shape function at the nodal points
    ! xi_node, eta_node, zeta_node: Isoparametric coordinates of the nodal points

    use precision
    real(kind=dp), dimension(8) :: temp_shape_int_to_node ! ninpt
    real(kind=dp) :: xi_node, eta_node, zeta_node

    !   shape functions
    temp_shape_int_to_node(1) = 0.125d0 * (1.d0 - xi_node) * (1.d0 - eta_node) * (1.d0 - zeta_node)
    temp_shape_int_to_node(2) = 0.125d0 * (1.d0 + xi_node) * (1.d0 - eta_node) * (1.d0 - zeta_node)
    temp_shape_int_to_node(3) = 0.125d0 * (1.d0 - xi_node) * (1.d0 + eta_node) * (1.d0 - zeta_node)
    temp_shape_int_to_node(4) = 0.125d0 * (1.d0 + xi_node) * (1.d0 + eta_node) * (1.d0 - zeta_node)
    temp_shape_int_to_node(5) = 0.125d0 * (1.d0 - xi_node) * (1.d0 - eta_node) * (1.d0 + zeta_node)
    temp_shape_int_to_node(6) = 0.125d0 * (1.d0 + xi_node) * (1.d0 - eta_node) * (1.d0 + zeta_node)
    temp_shape_int_to_node(7) = 0.125d0 * (1.d0 - xi_node) * (1.d0 + eta_node) * (1.d0 + zeta_node)
    temp_shape_int_to_node(8) = 0.125d0 * (1.d0 + xi_node) * (1.d0 + eta_node) * (1.d0 + zeta_node)

return
end

subroutine calc_shape_node_to_int(xi_int, eta_int, zeta_int, temp_shape_node_to_int)
    ! Calculate the shape function at the integration points
    ! xi_int, eta_int, zeta_int: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(8) :: temp_shape_node_to_int ! nnode
    real(kind=dp) :: xi_int, eta_int, zeta_int

    !   shape functions
    temp_shape_node_to_int(1)=0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int) * (1.d0 - zeta_int)
    temp_shape_node_to_int(2)=0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int) * (1.d0 - zeta_int)
    temp_shape_node_to_int(3)=0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int) * (1.d0 - zeta_int)
    temp_shape_node_to_int(4)=0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int) * (1.d0 - zeta_int)
    temp_shape_node_to_int(5)=0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int) * (1.d0 + zeta_int)
    temp_shape_node_to_int(6)=0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int) * (1.d0 + zeta_int)
    temp_shape_node_to_int(7)=0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int) * (1.d0 + zeta_int)
    temp_shape_node_to_int(8)=0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int) * (1.d0 + zeta_int)

return
end

subroutine calc_B_deriv_local(xi_int, eta_int, zeta_int, temp_B_deriv_local)
    ! Calculate the shape function derivative at the integration points
    ! Basically derivatives of calc_shape_node_to_int
    ! temp_B_deriv_local: (ninpt, ndim, nnode)
    ! xi_int, eta_int, zeta_int: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(3, 8) :: temp_B_deriv_local
    real(kind=dp) :: xi_int, eta_int, zeta_int

    !   derivative d(Ni)/d(xi_int)
    temp_B_deriv_local(1, 1) = -0.125d0 * (1.d0 - eta_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(1, 2) =  0.125d0 * (1.d0 - eta_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(1, 3) =  0.125d0 * (1.d0 + eta_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(1, 4) = -0.125d0 * (1.d0 + eta_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(1, 5) = -0.125d0 * (1.d0 - eta_int) * (1.d0 + zeta_int)
    temp_B_deriv_local(1, 6) =  0.125d0 * (1.d0 - eta_int) * (1.d0 + zeta_int)
    temp_B_deriv_local(1, 7) =  0.125d0 * (1.d0 + eta_int) * (1.d0 + zeta_int)
    temp_B_deriv_local(1, 8) = -0.125d0 * (1.d0 + eta_int) * (1.d0 + zeta_int)

    !     derivative d(Ni)/d(eta_int)
    temp_B_deriv_local(2, 1) = -0.125d0 * (1.d0 - xi_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(2, 2) = -0.125d0 * (1.d0 + xi_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(2, 3) =  0.125d0 * (1.d0 + xi_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(2, 4) =  0.125d0 * (1.d0 - xi_int) * (1.d0 - zeta_int)
    temp_B_deriv_local(2, 5) = -0.125d0 * (1.d0 - xi_int) * (1.d0 + zeta_int)
    temp_B_deriv_local(2, 6) = -0.125d0 * (1.d0 + xi_int) * (1.d0 + zeta_int)
    temp_B_deriv_local(2, 7) =  0.125d0 * (1.d0 + xi_int) * (1.d0 + zeta_int)
    temp_B_deriv_local(2, 8) =  0.125d0 * (1.d0 - xi_int) * (1.d0 + zeta_int)

    !     derivative d(Ni)/d(zeta_int)
    temp_B_deriv_local(3, 1) = -0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int)
    temp_B_deriv_local(3, 2) = -0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int)
    temp_B_deriv_local(3, 3) = -0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int)
    temp_B_deriv_local(3, 4) = -0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int)
    temp_B_deriv_local(3, 5) =  0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int)
    temp_B_deriv_local(3, 6) =  0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int)
    temp_B_deriv_local(3, 7) =  0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int)
    temp_B_deriv_local(3, 8) =  0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int)

return
end



!***********************************************************************

subroutine UEXTERNALDB(lop,lrestart,time,dtime,kstep,kinc)
    use precision
    use common_block
    use iso_module
    use iso_c_binding

    include 'aba_param.inc' 
    
    ! !DEC$ NOFREEFORM
    ! #include <SMAAspUserSubroutines.hdr>
    ! !DEC$ FREEFORM

    dimension time(2)
    
    integer :: iostat, element_id, node_id, current_element_idx
    integer, dimension(9) :: values

    character(len=256) :: line, outdir, aelread, aelwrite, andread, andwrite, anelwrite
    
    integer, parameter :: nnode = 8 
    integer, parameter :: ninpt = 8
    integer, parameter :: ndim = 3
    real(kind=dp), dimension(ninpt) :: temp_shape_int_to_node
    real(kind=dp), dimension(nnode) :: temp_shape_node_to_int
    real(kind=dp), dimension(ndim, nnode) :: temp_B_deriv_local


    ! LOP=0 indicates that the subroutine is being called at the start of the analysis.
    if (lop == 0) then 
        call mutexInit(1)

        call mutexLock(1)
        
        do inode = 1, nnode
            xi_node = xi_nodal_extra(inode)
            eta_node = eta_nodal_extra(inode)
            zeta_node = zeta_nodal_extra(inode)

            call calc_shape_int_to_node(xi_node, eta_node, zeta_node, temp_shape_int_to_node)
            all_shape_int_to_node(inode, 1:ninpt) = temp_shape_int_to_node

        end do      

        !print *, "all_shape_int_to_node: ", all_shape_int_to_node

        do kintk = 1, ninpt

        !   determine (g,h,r)
            xi_int = xi_int_inter(kintk)
            eta_int = eta_int_inter(kintk)
            zeta_int = zeta_int_inter(kintk)

            call calc_shape_node_to_int(xi_int, eta_int, zeta_int, temp_shape_node_to_int)
            all_shape_node_to_int(kintk, 1:nnode) = temp_shape_node_to_int

            call calc_B_deriv_local(xi_int, eta_int, zeta_int, temp_B_deriv_local)
            all_B_deriv_local(kintk,1:ndim,1:nnode) = temp_B_deriv_local

        end do

        ! Calculate the shape function derivative at the center of the element C3D8
        xi_node = 0.0d0
        eta_node = 0.0d0
        zeta_node = 0.0d0

        xi_int = 0.0d0
        eta_int = 0.0d0
        zeta_int = 0.0d0

        call calc_shape_int_to_node(xi_node, eta_node, zeta_node, shape_int_to_center)
        ! call calc_shape_node_to_int(xi_int, eta_int, zeta_int, shape_node_to_center)
        call calc_B_deriv_local(xi_int, eta_int, zeta_int, center_B_deriv_local)

        call mutexUnlock(1)
        
    end if

return
end


subroutine kjacobian(jelem,ndim,nnode,coords,B_deriv_local,djac,B_deriv_global,mcrd)

!     Notation: djac - Jac determinant; xjaci - inverse of Jac matrix
!     B_deriv_global - shape functions derivatives w.r.t. global coordinates
    use precision
    include 'aba_param.inc'
    real(kind=dp) :: djac,inv_djac
    dimension xjac(ndim,ndim),xjaci(ndim,ndim),coords(mcrd,nnode), &
        B_deriv_local(ndim,nnode),B_deriv_global(ndim,nnode)

    xjac=0.d0

    do inode=1,nnode
        do idim=1,ndim
            do jdim=1,ndim
                xjac(jdim,idim)=xjac(jdim,idim) + &
                    B_deriv_local(jdim,inode) * coords(idim,inode)
            end do
        end do
    end do

    djac = xjac(1,1) * xjac(2,2) * xjac(3,3) + xjac(2,1) * xjac(3,2) * xjac(1,3) &
         + xjac(3,1) * xjac(2,3) * xjac(1,2) - xjac(3,1) * xjac(2,2) * xjac(1,3) &
         - xjac(2,1) * xjac(1,2) * xjac(3,3) - xjac(1,1) * xjac(2,3) * xjac(3,2)
    
    inv_djac = 1.0d0 / djac
    
    !if (djac>0.d0) then ! jacobian is positive - o.k.
    xjaci(1,1) = (xjac(2,2) * xjac(3,3) - xjac(2,3) * xjac(3,2)) * inv_djac
    xjaci(1,2) = (xjac(1,3) * xjac(3,2) - xjac(1,2) * xjac(3,3)) * inv_djac
    xjaci(1,3) = (xjac(1,2) * xjac(2,3) - xjac(1,3) * xjac(2,2)) * inv_djac
    xjaci(2,1) = (xjac(2,3) * xjac(3,1) - xjac(2,1) * xjac(3,3)) * inv_djac
    xjaci(2,2) = (xjac(1,1) * xjac(3,3) - xjac(1,3) * xjac(3,1)) * inv_djac
    xjaci(2,3) = (xjac(1,3) * xjac(2,1) - xjac(1,1) * xjac(2,3)) * inv_djac
    xjaci(3,1) = (xjac(2,1) * xjac(3,2) - xjac(2,2) * xjac(3,1)) * inv_djac
    xjaci(3,2) = (xjac(1,2) * xjac(3,1) - xjac(1,1) * xjac(3,2)) * inv_djac
    xjaci(3,3) = (xjac(1,1) * xjac(2,2) - xjac(1,2) * xjac(2,1)) * inv_djac

    B_deriv_global = matmul(xjaci,B_deriv_local)

return
end

! Selectively reduced integration

subroutine kbmatrix_full(B_deriv_global,ntens,nnode,ndim,Bu_matrix_full)
    !   Full strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    include 'aba_param.inc'

    dimension B_deriv_global(ndim,nnode),Bu_matrix_full(ntens,ndim * nnode)

    Bu_matrix_full=0.d0
    
    do inode=1,nnode
        ! Normal components
        Bu_matrix_full(1,ndim * inode-ndim+1) = B_deriv_global(1,inode)
        Bu_matrix_full(2,ndim * inode-ndim+2) = B_deriv_global(2,inode)
        Bu_matrix_full(3,ndim * inode-ndim+3) = B_deriv_global(3,inode)
        ! Shear components
        Bu_matrix_full(4,ndim * inode-ndim+1) = B_deriv_global(2,inode)
        Bu_matrix_full(4,ndim * inode-ndim+2) = B_deriv_global(1,inode)
        Bu_matrix_full(5,ndim * inode-ndim+1) = B_deriv_global(3,inode)
        Bu_matrix_full(5,ndim * inode-ndim+3) = B_deriv_global(1,inode)
        Bu_matrix_full(6,ndim * inode-ndim+2) = B_deriv_global(3,inode)
        Bu_matrix_full(6,ndim * inode-ndim+3) = B_deriv_global(2,inode)
        
    end do

return
end


! subroutine kbmatrix_full(B_deriv_global,ntens,nnode,ndim,Bu_matrix)

!     !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
!     include 'aba_param.inc'

!     dimension B_deriv_global(ndim,nnode),Bu_matrix(ntens,nnode * ndim)

!     Bu_matrix=0.d0
!     do inode=1,nnode
!         Bu_matrix(1,ndim * inode-ndim+1) = B_deriv_global(1,inode)
!         Bu_matrix(2,ndim * inode-ndim+2) = B_deriv_global(2,inode)
!         Bu_matrix(4,ndim * inode-ndim+1) = B_deriv_global(2,inode)
!         Bu_matrix(4,ndim * inode-ndim+2) = B_deriv_global(1,inode)
!         if (ndim==3) then
!             Bu_matrix(3,ndim * inode) = B_deriv_global(3,inode)
!             Bu_matrix(5,ndim * inode-2) = B_deriv_global(3,inode)
!             Bu_matrix(5,ndim * inode) = B_deriv_global(1,inode)
!             Bu_matrix(6,ndim * inode-1) = B_deriv_global(3,inode)
!             Bu_matrix(6,ndim * inode) = B_deriv_global(2,inode)
!         endif
!     end do
! return
! end

subroutine kbmatrix_vol(B_deriv_global,ntens,nnode,ndim,Bu_matrix_vol)
    !   Volumetric strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    include 'aba_param.inc'

    dimension B_deriv_global(ndim,nnode),Bu_matrix_vol(ntens,ndim * nnode)

    Bu_matrix_vol = 0.d0
    
    ! Loop through each node
    do inode = 1, nnode
        ! Normal strain components in e11, e22, e33
        
        Bu_matrix_vol(1, ndim * inode-ndim+1) = B_deriv_global(1, inode)
        Bu_matrix_vol(1, ndim * inode-ndim+2) = B_deriv_global(2, inode)
        Bu_matrix_vol(1, ndim * inode-ndim+3) = B_deriv_global(3, inode)
        Bu_matrix_vol(2, ndim * inode-ndim+1) = B_deriv_global(1, inode)
        Bu_matrix_vol(2, ndim * inode-ndim+2) = B_deriv_global(2, inode)
        Bu_matrix_vol(2, ndim * inode-ndim+3) = B_deriv_global(3, inode)
        Bu_matrix_vol(3, ndim * inode-ndim+1) = B_deriv_global(1, inode)
        Bu_matrix_vol(3, ndim * inode-ndim+2) = B_deriv_global(2, inode)
        Bu_matrix_vol(3, ndim * inode-ndim+3) = B_deriv_global(3, inode)
        
        ! Shear strain components in e12, e13, e23
        ! No contribution, all are zero
    end do
    
    Bu_matrix_vol = Bu_matrix_vol * (1.0d0 / 3.0d0)

return
end

subroutine kbmatrix_dev(Bu_matrix_full, Bu_matrix_vol, Bu_matrix_dev, &
                        ntens, nnode, ndim)
    !   Deviatoric strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    include 'aba_param.inc'

    dimension Bu_matrix_full(ntens,ndim * nnode), &
              Bu_matrix_vol(ntens,ndim * nnode), &
              Bu_matrix_dev(ntens,ndim * nnode)

    Bu_matrix_dev = Bu_matrix_full - Bu_matrix_vol

return
end

subroutine kstatevar(npt,nsvint,svars,statev,icopy)

!   Transfer data to/from element-level state variable array from/to
!   material-point level state variable array.

    include 'aba_param.inc'

    dimension svars(*),statev(*)

    isvinc=(npt-1) * nsvint     ! integration point increment

    if (icopy == 1) then ! Prepare arrays for entry into umat
        do i=1, nsvint
            statev(i) = svars(i+isvinc)
        end do
    else ! Update element state variables upon return from umat
        do i = 1, nsvint
            svars(i+isvinc) = statev(i)
        end do
    end if

return
end


! This is isotropic von Mises plasticity model


subroutine UMAT_von_Mises(props,nprops,ddsdde,stress,stran,dstran, &
                          ntens,ndi,nshr,statev)

    ! Input: props, nprops, stress, dstran, ntens, ndi, nshr, statev
    ! Output: ddsdde, stress, statev (eelas, eplas, eqplas, deqplas, sig_vonMises, sig_H)
    
    use precision
    use common_block
    include 'aba_param.inc'
      
    real(kind=dp), dimension(*) :: props, statev
    real(kind=dp), dimension(ntens,ntens) :: ddsdde
    real(kind=dp), dimension(ntens) :: stress, eelas, eplas, flow, &
                                       stran, dstran, olds, oldpl
    real(kind=dp), dimension(3) :: hard

    real(kind=dp) :: E, nu, lambda, mu, eqplas, deqplas, syield, syiel0, sig_vonMises, sig_H, rhs 
    real(kind=dp) :: effective_mu, effective_lambda, effective_hard    

    
    real(kind=dp), parameter :: toler = 1.0d-6
    integer :: newton = 100
    integer :: k_newton

    ! LOCAL ARRAYS
    ! ----------------------------------------------------------------
    ! EELAS - ELASTIC STRAINS
    ! EPLAS - PLASTIC STRAINS
    ! FLOW - DIRECTION OF PLASTIC FLOW
    ! ----------------------------------------------------------------
    
    ! ----------------------------------------------------------------
    ! UMAT FOR ISOTROPIC ELASTICITY AND ISOTROPIC MISES PLASTICITY
    ! CANNOT BE USED FOR PLANE STRESS
    ! ----------------------------------------------------------------
    ! PROPS(before_mech_props_idx+1) - E
    ! PROPS(before_mech_props_idx+2) - NU
    ! PROPS(before_flow_props_idx+1:nprops) - SYIELD AN HARDENING DATA
    ! props(before_flow_props_idx+1) - syiel0, 
    ! props(before_flow_props_idx+2) - eqpl0, 
    ! props(before_flow_props_idx+3) - syiel1, 
    ! props(before_flow_props_idx+4) - eqpl1, ...
    ! and props(nprops-1) - syield_N, props(nprops) - eqplas_N
    ! CALLS UHARD FOR CURVE OF YIELD STRESS VS. PLASTIC STRAIN
    ! ----------------------------------------------------------------

    ! material properties
    
    E = props(before_mech_props_idx+1)           ! Young's modulus 
    nu = props(before_mech_props_idx+2)          ! Poisson's ratio 

    ! Lame's parameters
    mu = E/(2.0d0 * (1.0 + nu))  ! Shear modulus
    lambda = E*nu/((1.0 + nu) * (1.0 - 2.0 * nu)) ! Lame's first constant

    eelas = statev(eelas_start_idx : eelas_end_idx)
    eplas = statev(eplas_start_idx : eplas_end_idx)
    eqplas = statev(eqplas_idx)
    deqplas = statev(deqplas_idx)

    ! initialize as 0
    ddsdde = 0.0 ! Their unit is Pa
    
    do i = 1, ndi
        do j = 1, ndi
            ddsdde(j, i) = lambda
        end do 
        ddsdde(i,i) = lambda + 2.0 * mu
    end do 

    ! Shear contribution
    do i = ndi + 1, ntens
        ddsdde(i,i) = mu
    end do 

    ! call rotsig(statev(eelas_start_idx), drot, eelas, 2, ndi, nshr)
    ! call rotsig(statev(eplas_start_idx), drot, eplas, 2, ndi, nshr)

    !    Calculate predictor stress and elastic strain
    stress = stress + matmul(ddsdde,dstran)
    eelas = eelas + dstran

    ! Calculate equivalent von Mises stress
    
    sig_vonMises = (stress(1) - stress(2))**2 + &
                   (stress(2) - stress(3))**2 + &
                   (stress(3) - stress(1))**2
    
    do i = ndi + 1, ntens
        sig_vonMises = sig_vonMises + 6.d0 * stress(i)**2
    end do
    sig_vonMises = sqrt(sig_vonMises * half) ! Unit is Pa
    
    ! get yield stress from the specified hardening curve
    ! nvalue equal to number of points on the hardening curve
    
    nvalue = (nprops - before_flow_props_idx) / 2

    !print *, 'nvalue = ', nvalue ! 100
    !print *, 'before_flow_props_idx = ', before_flow_props_idx ! 8
    
    call UHARD_von_Mises(syiel0, hard, eqplas, &
                                statev, nvalue, props(before_flow_props_idx + 1))
    
    ! Determine if active yielding

    if (sig_vonMises > (1.d0 + toler) * syiel0) then

        ! actively yielding
        ! separate the hydrostatic from the deviatoric stress
        ! calculate the flow direction

        sig_H = (stress(1) + stress(2) + stress(3)) * third
        flow(1:ndi) = (stress(1:ndi) - sig_H)/sig_vonMises
        flow(ndi+1:ntens) = stress(ndi+1:ntens)/sig_vonMises
        
        ! solve for equivalent von Mises stress and equivalent plastic strain increment 
        ! using Newton-Raphson iteration

        syield = syiel0
        deqplas = 0.d0
        do k_newton = 1, newton
            rhs = sig_vonMises - (3.d0 * mu * deqplas) - syield
            deqplas = deqplas + rhs / ((3.d0 * mu) + hard(1))

            call UHARD_von_Mises(syield, hard, eqplas + deqplas, &
                                statev, nvalue, props(before_flow_props_idx + 1))
            if (abs(rhs) < toler * syiel0) exit

        end do

        if (k_newton == newton) write(7,*) 'WARNING: plasticity loop failed'

        ! Update stresses, elastic and plastic strains
 
        stress(1:ndi) = flow(1:ndi) * syield + sig_H
        eplas(1:ndi) = eplas(1:ndi) + three_half * flow(1:ndi) * deqplas
        eelas(1:ndi) = eelas(1:ndi) - three_half * flow(1:ndi) * deqplas
        
        stress(ndi + 1:ntens) = flow(ndi + 1:ntens) * syield
        eplas(ndi + 1:ntens) = eplas(ndi + 1:ntens) + 3.d0 * flow(ndi + 1:ntens) * deqplas
        eelas(ndi + 1:ntens) = eelas(ndi + 1:ntens) - 3.d0 * flow(ndi + 1:ntens) * deqplas

        ! Finally, we update the equivalent plastic strain
        eqplas = eqplas + deqplas

        ! Formulate the jacobian (material tangent)   

        ! effective shear modulus
        effective_mu = mu * syield / sig_vonMises 

        ! effective Lame's constant
        effective_lambda = (E/(1.d0 - 2.d0 * nu) - 2.d0 * effective_mu) * third

        ! effective hardening modulus
        effective_hard = 3.d0 * mu * hard(1)/(3.d0 * mu + hard(1)) - 3.d0 * effective_mu 

        do i = 1, ndi
            do j = 1, ndi
                ddsdde(j,i) = effective_lambda
            end do
            ddsdde(i,i) = 2.d0 * effective_mu + effective_lambda
        end do

        do i = ndi + 1, ntens
            ddsdde(i,i) = effective_mu
        end do

        do i = 1, ntens
            do j = 1, ntens
                ddsdde(j,i) = ddsdde(j,i) + effective_hard * flow(j) * flow(i)
            end do
        end do

    endif


    ! Recalculate equivalent von Mises stress
    
    sig_vonMises = (stress(1) - stress(2))**2 + &
                   (stress(2) - stress(3))**2 + &
                   (stress(3) - stress(1))**2
    
    do i = ndi + 1, ntens
        sig_vonMises = sig_vonMises + 6.d0 * stress(i)**2
    end do
    sig_vonMises = sqrt(sig_vonMises * half) ! Unit is Pa

    ! Recalculate hydrostatic stress
    sig_H = (stress(1) + stress(2) + stress(3)) * third

    ! update state variables
    statev(eelas_start_idx : eelas_end_idx) = eelas
    statev(eplas_start_idx : eplas_end_idx) = eplas
    statev(eqplas_idx) = eqplas
    statev(deqplas_idx) = deqplas
    statev(sig_vonMises_idx) = sig_vonMises
    statev(sig_H_idx) = sig_H

    
return
end

!***********************************************************************

subroutine UHARD_von_Mises(syield, hard, eqplas, statev, nvalue, table)

    include 'aba_param.inc'

    character*80 cmname
    dimension hard(3),statev(*),table(2, nvalue)
    
    ! set yield stress to last value of table, hardening to zero
    
    syield = table(1, nvalue)
    ! print *, 'table(1, 1) = ', table(1, 1)
    ! print *, 'table(2, 1) = ', table(2, 1)
    ! print *, 'table(1, 2) = ', table(1, 2)
    ! print *, 'table(2, 2) = ', table(2, 2)
    ! print *, 'table(1, nvalue) = ', table(1, nvalue)
    ! print *, 'table(2, nvalue) = ', table(2, nvalue)

    hard(1) = 0.d0

    ! if more than one entry, search table
    
    if (nvalue > 1) then
        do k1 = 1, nvalue - 1
            eqpl1 = table(2, k1 + 1)
            if (eqplas < eqpl1) then
                eqpl0 = table(2, k1)
                if (eqpl1 <= eqpl0) then
                    write(7,*) 'error - plastic strain must be entered in ascending order'
                end if

                ! current yield stress and hardening

                deqplas = eqpl1 - eqpl0
                syiel0 = table(1, k1)
                syiel1 = table(1, k1 + 1)
                dsyiel = syiel1 - syiel0
                hard(1) = dsyiel/deqplas
                syield = syiel0 + (eqplas - eqpl0) * hard(1)
                exit
            endif
        end do
    endif

return
end



!***********************************************************************

subroutine UEL(rhs,amatrx,svars,energy,ndofel,nrhs,nsvars, &
    props,nprops,coords,mcrd,nnode,u,du,v,a,jtype,time,dtime, &
    kstep,kinc,jelem,params,ndload,jdltyp,adlmag,predef,npredf, &
    lflags,mlvarx,ddlmag,mdload,pnewdt,jprops,njpro,period)

    use precision
    use common_block
    use iso_module
    include 'aba_param.inc' !implicit real(a-h o-z)
      
    dimension rhs(mlvarx,*),amatrx(ndofel,ndofel),props(*),svars(*), &
        energy(8),coords(mcrd,nnode),u(ndofel),du(mlvarx,*),v(ndofel), &
        a(ndofel),time(2),params(*),jdltyp(mdload,*),adlmag(mdload,*), &
        ddlmag(mdload,*),predef(2,npredf,nnode),lflags(*),jprops(*)

    integer, parameter :: ndim = 3 ! Number of spatial dimensions
    integer, parameter :: ntens = 6 ! Number of stress-strain components
    integer, parameter :: ndi = 3 ! Number of direct stress-strain components
    integer, parameter :: nshr = 3 ! Number of shear stress-strain components
    integer, parameter :: ninpt = 8 ! Number of integration points
    integer, parameter :: nsvint = 30 ! Number of state variables at integration points
    integer, parameter :: ndof = 3 ! Number of degrees of freedom per node (3 displacements)
    
    integer, parameter :: start_u_idx = 1
    integer, parameter :: end_u_idx = 24 ! = ndim * nnode
    
    ! The following data is not part of UEL, defined by the user    
    real(kind=dp), dimension(ndim * nnode) :: u_prev, du_prev
    
    real(kind=dp), dimension(nnode) :: shape_node_to_int    ! Shape function that interpolates from nodal points to integration points
                                                                    ! The extra 1 dimension is for matrix multiplication, otherwise it would be a vector
    real(kind=dp), dimension(ninpt) :: shape_int_to_node         ! Shape function that extrapolates from integration points to nodal points
    real(kind=dp), dimension(ndim,nnode) :: B_deriv_local           ! Derivatives of N_shape_nodal_to_int with respect to isoparametric coordinates
    real(kind=dp), dimension(ndim,nnode) :: B_deriv_global          ! Derivatives of N_shape_nodal_to_int with respect to global coordinates
                                                                    ! This is the collection of vectors with spatial derivatives of N_shape_nodal_to_int
                                                                    ! Each column is the vector B_i in Emilio et al.     
    real(kind=dp), dimension(ndim,nnode) :: B_deriv_global_center

    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_matrix_full         ! Strain-displacement matrix (B matrix)
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_matrix_vol          ! Volumetric strain-displacement matrix (B matrix)
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_matrix_dev          ! Deviatoric strain-displacement matrix (B matrix)
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_matrix_full_center  ! Strain-displacement matrix at the center of the element jelem
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_matrix_vol_center   ! Volumetric strain-displacement matrix at the center of the element jelem
    
    real(kind=dp), dimension(nnode, nnode) :: BB                    ! Bu matrix transpose times Bu matrix
    real(kind=dp), dimension(ntens,ntens) :: ddsdde                 ! Tangent stiffness matrix 
    real(kind=dp), dimension(ntens) :: stress                       ! Stress vector of the current element jelem
    real(kind=dp), dimension(ntens) :: stran                        ! Strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: dstran                       ! Incremental strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: eelas                        ! Elastic strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: eplas                        ! Plastic strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: flow                         ! plastic flow direction for the von Mises plasticity model

    real(kind=dp), dimension(nnode,1) :: sig_H_node                 ! Hydrostatic stress at each node
    
    real(kind=dp), dimension(nsvint) :: statev                      ! Local state variables of the current element jelem for integration points at (+-1/sqrt(3.0))
    real(kind=dp), dimension(nsvint) :: statev_center               ! Local state variables at the center of the element jelem (xi = eta = zeta = 0)

 
    ! Declaring all props as real(kind=dp) for consistency

    real(kind=dp) :: djac, eqplas, deqplas
    real(kind=dp) :: sig_vonMises, sig_hydrostatic, triaxility, lode_angle
    real(kind=dp) :: invariant_p, invariant_q, invariant_r
    real(kind=dp) :: E, nu, lambda, mu, kappa, hard_mod, syield, psi_plas

!   initialising
    do k1=1,ndofel
        rhs(k1,1)=0.d0
    end do
    amatrx=0.d0
    
    ! Extract from the variable u and du
    u_prev(1:ndim * nnode)  = u(start_u_idx:end_u_idx)
    du_prev(1:ndim * nnode) = du(start_u_idx:end_u_idx, 1)
    

! isvinc=(npt-1) * nsvint     ! integration point increment

!     if (icopy == 1) then ! Prepare arrays for entry into umat
!         do i=1, nsvint
!             statev(i) = svars(i+isvinc)
!         end do
    statev_center = 0.0d0

    do isdv = 1, nsvint
        do kintk=1,ninpt           
            isvinc = (kintk - 1) * nsvint
            sdv_value = svars(isvinc + isdv)
            statev_center(isdv) = statev_center(isdv) + shape_int_to_center(kintk) * sdv_value
        end do
    end do

    do kintk=1,ninpt
        !   Compute shape_node_to_int and B_deriv_local
        shape_node_to_int(1:nnode) = all_shape_node_to_int(kintk,1:nnode)
        B_deriv_local(1:ndim,1:nnode) = all_B_deriv_local(kintk,1:ndim,1:nnode) 

        !   Compute djac and B_deriv_global
        call kjacobian(jelem,ndim,nnode,coords,B_deriv_local,djac,B_deriv_global,mcrd)
        ! kjacobian(jelem,ndim,nnode,coords,B_deriv_local,djac,B_deriv_global,mcrd)
        
        !   Calculate strain displacement B-matrix
        call kbmatrix_full(B_deriv_global,ntens,nnode,ndim,Bu_matrix_full)     
        call kbmatrix_vol(B_deriv_global,ntens,nnode,ndim,Bu_matrix_vol)

        Bu_matrix_dev = Bu_matrix_full - Bu_matrix_vol

        !   Differential volume at the integration point
        dvol = weight(kintk) * djac        
       
        !   ====================================================
        !   Calculate deformation field (stress and strain, etc)
        !   ====================================================

        !   compute the increment of strain
        dstran = matmul(Bu_matrix_full, du_prev)
        
        !   Transfer data from svars to statev for current integration point
        call kstatevar(kintk,nsvint,svars,statev,1)
        ! subroutine kstatevar(npt,nsvint,svars,statev,icopy)
        
        ! Extract stress and stran
        stress = statev(sig_start_idx : sig_end_idx)
        stran = statev(stran_start_idx : stran_end_idx)
        
        ! Call the von Mises plasticity model
        call UMAT_von_Mises(props,nprops,ddsdde,stress,stran,dstran, &
                          ntens,ndi,nshr,statev)

        ! Update stran
        stran = stran + dstran

        ! Update the state variables
        ! eelas, eplas, eqplas, deqplas, sig_vonMises, sig_H are already updated in statev in UMAT_von_Mises
        statev(sig_start_idx : sig_end_idx) = stress
        statev(stran_start_idx : stran_end_idx) = stran
        
        ! Update the other SDVs
        statev(triax_idx) = 0.0
        statev(lode_idx) = 0.0
        
        !   Transfer data from statev to svars
        !   This stage basically updates the state variables for the current element in UEL
        call kstatevar(kintk,nsvint,svars,statev,0)

        ! ********************************************!
        ! DISPLACEMENT CONTRIBUTION TO amatrx AND rhs !
        ! ********************************************!

        ! 3D case
        ! 8 nodes x 3 displacement dofs ux, uy, uz = 24

        amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) = &
            amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) + dvol * &
                               (matmul(matmul(transpose(Bu_matrix_dev),ddsdde),Bu_matrix_dev))
            
        rhs(start_u_idx:end_u_idx,1) = rhs(start_u_idx:end_u_idx,1) - &
            dvol * (matmul(transpose(Bu_matrix_dev),stress))       

        ! amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) = &
        !     amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) + dvol * &
        !                        (matmul(matmul(transpose(Bu_matrix_full),ddsdde),Bu_matrix_full))
            
        ! rhs(start_u_idx:end_u_idx,1) = rhs(start_u_idx:end_u_idx,1) - &
        !     dvol * (matmul(transpose(Bu_matrix_full),stress))       

        !   Transfer data from statev to dummy mesh for visualization
        
        ! Updating sig11, sig22, sig33, sig12, sig13, sig23
        user_vars(jelem,sig_start_idx : sig_end_idx,kintk) = statev(sig_start_idx : sig_end_idx)
        ! Updating stran11, stran22, stran33, stran12, stran13, stran23
        user_vars(jelem,stran_start_idx : stran_end_idx,kintk) = statev(stran_start_idx : stran_end_idx)
        ! Updating eelas11, eelas22, eelas33, eelas12, eelas13, eelas23
        user_vars(jelem,eelas_start_idx : eelas_end_idx,kintk) = statev(eelas_start_idx : eelas_end_idx)
        ! Updating eplas11, eplas22, eplas33, eplas12, eplas13, eplas23
        user_vars(jelem,eplas_start_idx : eplas_end_idx,kintk) = statev(eplas_start_idx : eplas_end_idx)
        ! Updating the rest values
        user_vars(jelem,eplas_end_idx+1:nsvint,kintk) = statev(eplas_end_idx+1:nsvint)
        
    end do       ! end loop on material integration points
    

    ! Calculate volumetric

    !   Compute djac and B_deriv_global for center integration point
    call kjacobian(jelem,ndim,nnode,coords,center_B_deriv_local, &
                    djac,B_deriv_global_center,mcrd)
    
    !   Calculate strain displacement B-matrix
    call kbmatrix_full(B_deriv_global_center,ntens,nnode,ndim,Bu_matrix_full_center)
    call kbmatrix_vol(B_deriv_global_center,ntens,nnode,ndim,Bu_matrix_vol_center)
    
    !   Differential volume at the integration point
    dvol = 8.0d0 * djac  

    !   ====================================================
    !   Calculate deformation field (stress and strain, etc)
    !   ====================================================

    !   compute the increment of strain
    dstran = matmul(Bu_matrix_full_center, du_prev)
        
    ! Extract stress and stran
    stress = statev_center(sig_start_idx : sig_end_idx)
    stran = statev_center(stran_start_idx : stran_end_idx)
    
    ! Call the von Mises plasticity model
    call UMAT_von_Mises(props,nprops,ddsdde,stress,stran,dstran, &
                        ntens,ndi,nshr,statev_center)
    
    ! ********************************************!
    ! DISPLACEMENT CONTRIBUTION TO amatrx AND rhs !
    ! ********************************************!

    ! 3D case
    ! 8 nodes x 3 displacement dofs ux, uy, uz = 24

    amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) = &
        amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) + dvol * &
            (matmul(matmul(transpose(Bu_matrix_vol_center),ddsdde),Bu_matrix_vol_center))

    rhs(start_u_idx:end_u_idx,1) = rhs(start_u_idx:end_u_idx,1) - &
        dvol * (matmul(transpose(Bu_matrix_vol_center),stress))
 

return
end
    

!***********************************************************************

subroutine UMAT(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp2,dtemp,predef,dpred, &
    cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    use common_block
    include 'aba_param.inc' 

    character*8 cmname
    dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens), &
        ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens), &
        time(2),predef(1),dpred(1),props(nprops),coords(3),drot(3,3), &
        dfgrd0(3,3),dfgrd1(3,3),jstep(4)

    ddsdde = 0.0d0
    noffset = noel - total_elems    
    ! total_elems: number of elements of UEL: [1, total_elems]
    ! noel: number of elements of UMAT: [total_elems + 1, 2 * total_elems]
    ! => noffset: number of elements of UMAT offset by total_elems: [total_elems + 1, 2 * total_elems] - total_elems = [1, total_elems]
    statev(1:nstatv) = user_vars(noffset,1:nstatv,npt)

return
end