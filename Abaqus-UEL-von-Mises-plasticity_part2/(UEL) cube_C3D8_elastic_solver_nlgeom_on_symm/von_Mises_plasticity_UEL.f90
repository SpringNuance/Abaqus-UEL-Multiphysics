!====================================================================
!          Program for phase field damage coupled with 
!          mechanical loading and hydrogen diffusion 
!          Mechanical model: standard Hooke's law elasticity 
!                            isotropic Von Mises plasticity
!          Mass (hydrogen) transport model: Fick's law of diffusion
!          Damage model: phase field damage model based on Griffith's theory
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

subroutine pause(seconds)
    ! Pauses the program execution for the specified number of seconds.
    integer, intent(in) :: seconds
    integer :: start_time, end_time, rate

    ! Get the system clock rate (ticks per second)
    call system_clock(count_rate = rate)

    ! Get the current time in clock ticks
    call system_clock(start_time)

    ! Loop until the required time has passed
    do
        call system_clock(end_time)
        if ((end_time - start_time) >= seconds * rate) exit
    end do
end subroutine pause


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

    real(kind=dp) :: all_N_shape_int_to_knode(8, 8) ! (nnode, ninpt)
    real(kind=dp) :: all_N_shape_node_to_kinpt(8, 8) ! (ninpt, nnode)
    real(kind=dp) :: all_N_deriv_local_kinpt(8, 3, 8)  ! (ninpt, ndim, nnode)

    real(kind=dp) :: N_shape_int_to_center(8) ! (ninpt)
    real(kind=dp) :: N_shape_node_to_center(8) ! (nnode)
    real(kind=dp) :: N_deriv_local_center(3, 8) ! (ndim, nnode)

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


subroutine calc_N_shape_int_to_knode(xi_node, eta_node, zeta_node, N_shape_int_to_knode)
    ! Calculate the shape function at the nodal points
    ! xi_node, eta_node, zeta_node: Isoparametric coordinates of the nodal points

    use precision
    real(kind=dp), dimension(8) :: N_shape_int_to_knode ! ninpt
    real(kind=dp) :: xi_node, eta_node, zeta_node

    !   shape functions
    N_shape_int_to_knode(1) = 0.125d0 * (1.d0 - xi_node) * (1.d0 - eta_node) * (1.d0 - zeta_node)
    N_shape_int_to_knode(2) = 0.125d0 * (1.d0 + xi_node) * (1.d0 - eta_node) * (1.d0 - zeta_node)
    N_shape_int_to_knode(3) = 0.125d0 * (1.d0 - xi_node) * (1.d0 + eta_node) * (1.d0 - zeta_node)
    N_shape_int_to_knode(4) = 0.125d0 * (1.d0 + xi_node) * (1.d0 + eta_node) * (1.d0 - zeta_node)
    N_shape_int_to_knode(5) = 0.125d0 * (1.d0 - xi_node) * (1.d0 - eta_node) * (1.d0 + zeta_node)
    N_shape_int_to_knode(6) = 0.125d0 * (1.d0 + xi_node) * (1.d0 - eta_node) * (1.d0 + zeta_node)
    N_shape_int_to_knode(7) = 0.125d0 * (1.d0 - xi_node) * (1.d0 + eta_node) * (1.d0 + zeta_node)
    N_shape_int_to_knode(8) = 0.125d0 * (1.d0 + xi_node) * (1.d0 + eta_node) * (1.d0 + zeta_node)

return
end

subroutine calc_N_shape_node_to_kinpt(xi_int, eta_int, zeta_int, N_shape_node_to_kinpt)
    ! Calculate the shape function at the integration points
    ! xi_int, eta_int, zeta_int: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(8) :: N_shape_node_to_kinpt ! nnode
    real(kind=dp) :: xi_int, eta_int, zeta_int

    !   shape functions
    N_shape_node_to_kinpt(1)=0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int) * (1.d0 - zeta_int)
    N_shape_node_to_kinpt(2)=0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int) * (1.d0 - zeta_int)
    N_shape_node_to_kinpt(3)=0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int) * (1.d0 - zeta_int)
    N_shape_node_to_kinpt(4)=0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int) * (1.d0 - zeta_int)
    N_shape_node_to_kinpt(5)=0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int) * (1.d0 + zeta_int)
    N_shape_node_to_kinpt(6)=0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int) * (1.d0 + zeta_int)
    N_shape_node_to_kinpt(7)=0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int) * (1.d0 + zeta_int)
    N_shape_node_to_kinpt(8)=0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int) * (1.d0 + zeta_int)

return
end

subroutine calc_N_deriv_local_kinpt(xi_int, eta_int, zeta_int, N_deriv_local_kinpt)
    ! Calculate the shape function derivative at the integration points
    ! Basically derivatives of calc_N_shape_node_to_kinpt
    ! N_deriv_local_kinpt: (ninpt, ndim, nnode)
    ! xi_int, eta_int, zeta_int: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(3, 8) :: N_deriv_local_kinpt ! (ndim, nnode)
    real(kind=dp) :: xi_int, eta_int, zeta_int

    !   derivative d(Ni)/d(xi_int)
    N_deriv_local_kinpt(1, 1) = -0.125d0 * (1.d0 - eta_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(1, 2) =  0.125d0 * (1.d0 - eta_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(1, 3) =  0.125d0 * (1.d0 + eta_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(1, 4) = -0.125d0 * (1.d0 + eta_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(1, 5) = -0.125d0 * (1.d0 - eta_int) * (1.d0 + zeta_int)
    N_deriv_local_kinpt(1, 6) =  0.125d0 * (1.d0 - eta_int) * (1.d0 + zeta_int)
    N_deriv_local_kinpt(1, 7) =  0.125d0 * (1.d0 + eta_int) * (1.d0 + zeta_int)
    N_deriv_local_kinpt(1, 8) = -0.125d0 * (1.d0 + eta_int) * (1.d0 + zeta_int)

    !     derivative d(Ni)/d(eta_int)
    N_deriv_local_kinpt(2, 1) = -0.125d0 * (1.d0 - xi_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(2, 2) = -0.125d0 * (1.d0 + xi_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(2, 3) =  0.125d0 * (1.d0 + xi_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(2, 4) =  0.125d0 * (1.d0 - xi_int) * (1.d0 - zeta_int)
    N_deriv_local_kinpt(2, 5) = -0.125d0 * (1.d0 - xi_int) * (1.d0 + zeta_int)
    N_deriv_local_kinpt(2, 6) = -0.125d0 * (1.d0 + xi_int) * (1.d0 + zeta_int)
    N_deriv_local_kinpt(2, 7) =  0.125d0 * (1.d0 + xi_int) * (1.d0 + zeta_int)
    N_deriv_local_kinpt(2, 8) =  0.125d0 * (1.d0 - xi_int) * (1.d0 + zeta_int)

    !     derivative d(Ni)/d(zeta_int)
    N_deriv_local_kinpt(3, 1) = -0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int)
    N_deriv_local_kinpt(3, 2) = -0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int)
    N_deriv_local_kinpt(3, 3) = -0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int)
    N_deriv_local_kinpt(3, 4) = -0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int)
    N_deriv_local_kinpt(3, 5) =  0.125d0 * (1.d0 - xi_int) * (1.d0 - eta_int)
    N_deriv_local_kinpt(3, 6) =  0.125d0 * (1.d0 + xi_int) * (1.d0 - eta_int)
    N_deriv_local_kinpt(3, 7) =  0.125d0 * (1.d0 + xi_int) * (1.d0 + eta_int)
    N_deriv_local_kinpt(3, 8) =  0.125d0 * (1.d0 - xi_int) * (1.d0 + eta_int)

return
end



!***********************************************************************

subroutine UEXTERNALDB(lop,lrestart,time,dtime,kstep,kinc)
    use precision
    use common_block
    use iso_module
    use iso_c_binding

    include 'aba_param.inc' 
    
    dimension time(2)
    
    integer :: iostat, element_id, node_id, current_element_idx
    integer, dimension(9) :: values

    character(len=256) :: line, outdir, aelread, aelwrite, andread, andwrite, anelwrite
    
    integer, parameter :: nnode = 8 
    integer, parameter :: ninpt = 8
    integer, parameter :: ndim = 3
    real(kind=dp), dimension(ninpt) :: N_shape_int_to_knode
    real(kind=dp), dimension(nnode) :: N_shape_node_to_kinpt
    real(kind=dp), dimension(ndim, nnode) :: N_deriv_local_kinpt


    ! LOP=0 indicates that the subroutine is being called at the start of the analysis.
    if (lop == 0) then 
        call mutexInit(1)

        call mutexLock(1)
        
        do inode = 1, nnode
            xi_node = xi_nodal_extra(inode)
            eta_node = eta_nodal_extra(inode)
            zeta_node = zeta_nodal_extra(inode)

            call calc_N_shape_int_to_knode(xi_node, eta_node, zeta_node, N_shape_int_to_knode)
            all_N_shape_int_to_knode(inode, 1:ninpt) = N_shape_int_to_knode

        end do      

        do kinpt = 1, ninpt

            xi_int = xi_int_inter(kinpt)
            eta_int = eta_int_inter(kinpt)
            zeta_int = zeta_int_inter(kinpt)

            call calc_N_shape_node_to_kinpt(xi_int, eta_int, zeta_int, N_shape_node_to_kinpt)
            all_N_shape_node_to_kinpt(kinpt, 1:nnode) = N_shape_node_to_kinpt(1:nnode)

            call calc_N_deriv_local_kinpt(xi_int, eta_int, zeta_int, N_deriv_local_kinpt)
            all_N_deriv_local_kinpt(kinpt,1:ndim,1:nnode) = N_deriv_local_kinpt(1:ndim,1:nnode)

        end do
 
        call mutexUnlock(1)
        
    end if

return
end


subroutine kjacobian(ndim,nnode,mcrd,coords,N_deriv_local_kinpt, &
                    xjac,xjaci,djac)

    use precision
    include 'aba_param.inc'
    real(kind=dp) :: djac,inv_djac
    real(kind=dp), dimension(ndim,ndim) :: xjac, xjaci
    real(kind=dp), dimension(mcrd,nnode) :: coords
    real(kind=dp), dimension(ndim,nnode) :: N_deriv_local_kinpt

    xjac=0.d0

    do inode=1,nnode
        do idim=1,ndim
            do jdim=1,ndim
                xjac(jdim,idim)=xjac(jdim,idim) + &
                    N_deriv_local_kinpt(jdim,inode) * coords(idim,inode)
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

return
end

! Selectively reduced integration

subroutine kbmatrix_full(N_deriv_global_kinpt,ntens,nnode,ndim,Bu_kinpt)
    !   Full strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt
    real(kind=dp), dimension(ntens, ndim * nnode) :: Bu_kinpt
    integer :: current_node_idx
    
    Bu_kinpt = 0.0d0
    
    do knode=1,nnode
        current_node_idx = ndim * knode - ndim
        ! Normal components
        Bu_kinpt(1,current_node_idx+1) = N_deriv_global_kinpt(1,knode)
        Bu_kinpt(2,current_node_idx+2) = N_deriv_global_kinpt(2,knode)
        Bu_kinpt(3,current_node_idx+3) = N_deriv_global_kinpt(3,knode)
        ! Shear components
        Bu_kinpt(4,current_node_idx+1) = N_deriv_global_kinpt(2,knode)
        Bu_kinpt(4,current_node_idx+2) = N_deriv_global_kinpt(1,knode)
        Bu_kinpt(5,current_node_idx+1) = N_deriv_global_kinpt(3,knode)
        Bu_kinpt(5,current_node_idx+3) = N_deriv_global_kinpt(1,knode)
        Bu_kinpt(6,current_node_idx+2) = N_deriv_global_kinpt(3,knode)
        Bu_kinpt(6,current_node_idx+3) = N_deriv_global_kinpt(2,knode)
        
    end do

return
end


subroutine kbmatrix_vol(N_deriv_global_kinpt,ntens,nnode,ndim,Bu_vol_kinpt)

    !   Volumetric strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_vol_kinpt
    integer :: current_node_idx
    
    Bu_vol_kinpt = 0.0d0
    
    ! Loop through each node
    do knode = 1, nnode
        ! Normal strain components in e11, e22, e33
        current_node_idx = ndim * knode - ndim
        Bu_vol_kinpt(1,current_node_idx+1) = N_deriv_global_kinpt(1, knode)
        Bu_vol_kinpt(1,current_node_idx+2) = N_deriv_global_kinpt(2, knode)
        Bu_vol_kinpt(1,current_node_idx+3) = N_deriv_global_kinpt(3, knode)
        Bu_vol_kinpt(2,current_node_idx+1) = N_deriv_global_kinpt(1, knode)
        Bu_vol_kinpt(2,current_node_idx+2) = N_deriv_global_kinpt(2, knode)
        Bu_vol_kinpt(2,current_node_idx+3) = N_deriv_global_kinpt(3, knode)
        Bu_vol_kinpt(3,current_node_idx+1) = N_deriv_global_kinpt(1, knode)
        Bu_vol_kinpt(3,current_node_idx+2) = N_deriv_global_kinpt(2, knode)
        Bu_vol_kinpt(3,current_node_idx+3) = N_deriv_global_kinpt(3, knode)
        
        ! Shear strain components in e12, e13, e23
        ! No contribution, all are zero
    end do
    
    Bu_vol_kinpt = Bu_vol_kinpt / 3.0d0

return
end


subroutine kstatevar(npt,nstatev,svars,statev,icopy)

!   Transfer data to/from element-level state variable array from/to
!   material-point level state variable array.

    include 'aba_param.inc'

    dimension svars(*),statev(*)

    isvinc=(npt-1) * nstatev     ! integration point increment

    if (icopy == 1) then ! Prepare arrays for entry into umat
        do i=1, nstatev
            statev(i) = svars(i+isvinc)
        end do
    else ! Update element state variables upon return from umat
        do i = 1, nstatev
            svars(i+isvinc) = statev(i)
        end do
    end if

return
end


! This is isotropic von Mises plasticity model

subroutine UMAT_von_Mises(stress,statev,ddsdde,stran_prev,dstran,time,dtime, &
                            ndi,nshr,ntens,ndim,nstatv,props,nprops,drot, &
                            dfgrd0,dfgrd1,noel,npt,jstep,kinc)

    ! Input: props, nprops, stress, dstran, ntens, ndi, nshr, statev
    ! Output: ddsdde, stress, statev (eelas, eplas, eqplas, deqplas, sig_vonMises, sig_H)
    
    use precision
    use common_block
    include 'aba_param.inc'
      
    real(kind=dp), dimension(ntens) :: stress, eelas, eplas, flow, &
                                       stran, dstran, olds, oldpl
    real(kind=dp), dimension(nprops) :: props
    real(kind=dp), dimension(nstatv) :: statev
    real(kind=dp), dimension(ntens,ntens) :: ddsdde
    real(kind=dp), dimension(2) :: time
    real(kind=dp), dimension(ndim) :: hard
    real(kind=dp), dimension(ndim,ndim) :: drot, dfgrd0, dfgrd1
    integer :: jstep(4)

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
    ddsdde = 0.0 
    
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

    ! Rotate the stress and strain to account for large deformation (NLGEOM=ON)
    ! Number 2 means for strain. If it is stress, it should be 1
    call rotsig(statev(eelas_start_idx), drot, eelas, 2, ndi, nshr)
    call rotsig(statev(eplas_start_idx), drot, eplas, 2, ndi, nshr)

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

! This is isotropic elastic model

subroutine UMAT_elastic(props,nprops,ddsdde,stress,stran,dstran, &
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


subroutine calc_u_grad(u_grad, N_deriv_global_kinpt, u_values, ndim, nnode)
    
    use precision
    real(kind=dp), dimension(ndim, ndim) :: u_grad  ! Gradient of displacement tensor
    real(kind=dp), dimension(ndim, nnode) :: N_deriv_global_kinpt  ! Shape function derivatives (global)
    real(kind=dp), dimension(ndim, nnode) :: u_values  ! Displacement vector (e.g., u_prev or du_current)
    
    integer :: idim, jdim, knode
    integer :: u_index

    ! Initialize the displacement gradient tensor to zero
    u_grad = 0.0d0

    ! Compute the displacement gradient (u_grad)
    do knode = 1, nnode
        do idim = 1, ndim 
            do jdim = 1, ndim
                u_grad(idim, jdim) = u_grad(idim, jdim) + N_deriv_global_kinpt(jdim, knode) * u_values(idim, knode)
            end do
        end do
    end do

return
end

subroutine inverse_matrix(A, inv_A, ndim)
    use precision
    implicit none
    integer, intent(in) :: ndim
    real(kind=dp), intent(in) :: A(ndim, ndim)       ! Input matrix
    real(kind=dp), intent(out) :: inv_A(ndim, ndim)  ! Output inverse matrix
    real(kind=dp) :: work(4*ndim)
    integer :: ipiv(ndim)
    integer :: lwork, info

    ! Copy A to inv_A because LAPACK routines overwrite the input matrix
    inv_A = A

    ! Step 1: LU factorization of the matrix (A = P * L * U)
    call dgetrf(ndim, ndim, inv_A, ndim, ipiv, info)

    if (info /= 0) then
        print *, 'Error: Matrix is singular or LAPACK DGETRF failed, INFO = ', info
        return
    end if

    ! Step 2: Compute the inverse of the matrix using the LU factorization
    lwork = 4 * ndim
    call dgetri(ndim, inv_A, ndim, ipiv, work, lwork, info)

    if (info /= 0) then
        print *, 'Error: LAPACK DGETRI failed, INFO = ', info
        return
    end if

end subroutine inverse_matrix


subroutine calc_matrix_log(matrix, log_matrix, ndim)
    use precision
    
    integer :: ndim
    real(kind=dp) :: matrix(ndim, ndim)
    real(kind=dp) :: log_matrix(ndim, ndim)
    real(kind=dp) :: eigen_vectors(ndim, ndim), eigen_values(ndim)
    real(kind=dp) :: temp_matrix(ndim, ndim)
    real(kind=dp) :: work(3*ndim-1)
    integer :: info, lwork, i, j

    ! 1. Perform eigenvalue decomposition using LAPACK
    ! Use dsyev for symmetric matrix eigenvalue decomposition (you can use dgeev for non-symmetric)

! subroutine dsyev	(JOBZ, UPLO, N, A, LDA, W, WORK, LWORK, INFO)	

! https://netlib.org/lapack/explore-html-3.6.1/d2/d8a/group__double_s_yeigen_ga442c43fca5493590f8f26cf42fed4044.html

    ! Initialize log_matrix
    log_matrix = 0.0d0

    ! 1. Perform eigenvalue decomposition using LAPACK dsyev
    ! Copy matrix to eigen_vectors because dsyev will overwrite it
    eigen_vectors = matrix

    ! Call dsyev to compute the eigenvalues and eigenvectors
    call dsyev('V', 'U', ndim, eigen_vectors, ndim, eigen_values, work, size(work), info)

    if (info /= 0) then
        print *, 'Error: DSYEV failed with INFO = ', info
        return
    end if

    ! 2. Compute the logarithm of the eigenvalues
    do i = 1, ndim
        if (eigen_values(i) <= 0.0d0) then
            print *, 'Error: Eigenvalue less than or equal to zero, cannot compute log'
            return
        else
            eigen_values(i) = log(eigen_values(i))
        end if
    end do

    ! 3. Reconstruct the logarithm of the matrix using V * log(Λ) * V^T
    ! Construct the diagonal matrix from the log eigenvalues
    temp_matrix = 0.0d0
    do i = 1, ndim
        temp_matrix(i, i) = eigen_values(i)
    end do

    ! log_matrix = V * log(Λ) * V^T
    log_matrix = matmul(eigen_vectors, matmul(temp_matrix, transpose(eigen_vectors)))

return
end

subroutine calc_matrix_sqrt(matrix, matrix_sqrt, ndim)
    use precision
    integer :: ndim
    real(kind=dp) :: matrix(ndim, ndim)          ! Input matrix
    real(kind=dp) :: matrix_sqrt(ndim, ndim)     ! Output matrix square root
    real(kind=dp) :: eigen_vectors(ndim, ndim), eigen_values(ndim)
    real(kind=dp) :: temp_matrix(ndim, ndim)
    real(kind=dp) :: work(3*ndim-1)
    integer :: info, i, j

    ! Initialize matrix_sqrt to zero
    matrix_sqrt = 0.0d0

    ! Copy the input matrix to eigen_vectors because LAPACK routines will overwrite it
    eigen_vectors = matrix

    ! 1. Perform eigenvalue decomposition using LAPACK dsyev
    call dsyev('V', 'U', ndim, eigen_vectors, ndim, eigen_values, work, size(work), info)

    if (info /= 0) then
        print *, 'Error: DSYEV failed with INFO = ', info
        return
    end if

    ! 2. Take the square root of the eigenvalues
    do i = 1, ndim
        if (eigen_values(i) < 0.0d0) then
            print *, 'Error: Negative eigenvalue encountered, cannot compute square root'
            return
        else
            eigen_values(i) = sqrt(eigen_values(i))
        end if
    end do

    ! 3. Reconstruct the square root of the matrix using V * sqrt(Λ) * V^T
    ! Construct the diagonal matrix from the square root of the eigenvalues
    temp_matrix = 0.0d0
    do i = 1, ndim
        temp_matrix(i, i) = eigen_values(i)
    end do

    ! matrix_sqrt = V * sqrt(Λ) * V^T
    matrix_sqrt = matmul(eigen_vectors, matmul(temp_matrix, transpose(eigen_vectors)))

return
end


subroutine calc_matrix_inv(matrix, matrix_inv, ndim)
    use precision
    implicit none
    integer :: ndim
    real(kind=dp) :: matrix(ndim, ndim)         ! Input matrix
    real(kind=dp) :: matrix_inv(ndim, ndim)     ! Output inverse matrix
    real(kind=dp) :: work(3*ndim)               ! Workspace
    integer :: ipiv(ndim)                       ! Pivot indices for LU factorization
    integer :: info, lwork

    ! Copy the input matrix to matrix_inv because LAPACK routines will overwrite it
    matrix_inv = matrix

    ! 1. Perform LU factorization of the matrix using dgetrf
    call dgetrf(ndim, ndim, matrix_inv, ndim, ipiv, info)
    if (info /= 0) then
        print *, 'Error: DGETRF failed with INFO = ', info
        return
    end if

    ! 2. Use dgetri to compute the inverse of the matrix
    lwork = 3 * ndim
    call dgetri(ndim, matrix_inv, ndim, ipiv, work, lwork, info)
    if (info /= 0) then
        print *, 'Error: DGETRI failed with INFO = ', info
        return
    end if

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
    integer, parameter :: nstatev = 30 ! Number of state variables at integration points
    integer, parameter :: ndof = 3 ! Number of degrees of freedom per node (3 displacements)
    
    integer, parameter :: start_u_idx = 1
    integer, parameter :: end_u_idx = 24 ! = ndim * nnode
    
    ! The following data is not part of UEL, defined by the user    
    real(kind=dp), dimension(mcrd,nnode) :: coords_current, coords_prev, coords_initial     ! For updated Lagrangian formulation when NLGEOM=ON
    real(kind=dp), dimension(ndim,nnode) :: u_current, du_current, u_prev
    real(kind=dp), dimension(ndim*nnode) :: u_current_flat, du_current_flat, u_prev_flat
    
    real(kind=dp), dimension(nnode) :: N_shape_node_to_kinpt    ! Shape function that interpolates from nodal points to integration points
                                                                    ! The extra 1 dimension is for matrix multiplication, otherwise it would be a vector
    real(kind=dp), dimension(ninpt) :: N_shape_int_to_knode         ! Shape function that extrapolates from integration points to nodal points
    real(kind=dp), dimension(ndim,nnode) :: N_deriv_local_kinpt           ! Derivatives of N_shape_nodal_to_int with respect to isoparametric coordinates
    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt_current          ! Derivatives of N_shape_nodal_to_int with respect to global coordinates
    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt_prev          ! Derivatives of N_shape_nodal_to_int with respect to global coordinates                                           
    real(kind=dp), dimension(ndim,nnode) :: N_bar_deriv_global_current      ! Normalized derivatives of N_shape_nodal_to_int with respect to global coordinates
    real(kind=dp), dimension(ndim,nnode) :: N_bar_deriv_global_prev      ! Normalized derivatives of N_shape_nodal_to_int with respect to global coordinates
    real(kind=dp), dimension(ndim,ndim) :: xjac_current, xjaci_current
    real(kind=dp), dimension(ndim,ndim) :: xjac_prev, xjaci_prev
    real(kind=dp), dimension(ndim,ndim) :: identity                  ! Identity matrix 
    real(kind=dp), dimension(ndim,ndim) :: F_grad_current, F_grad_prev, F_grad_inv_prev, dF_grad                  ! Deformation gradient F
    real(kind=dp), dimension(ndim,ndim) :: u_grad_current, u_grad_prev, du_grad                  ! Displacement gradient u
    real(kind=dp), dimension(ndim,ndim) :: C_right_Cauchy_current, C_right_Cauchy_prev                 ! Right Cauchy-Green tensor C
    real(kind=dp), dimension(ndim,ndim) :: b_left_Cauchy_current, b_left_Cauchy_prev                 ! Left Cauchy-Green tensor b
    real(kind=dp), dimension(ndim,ndim) :: U_right_stretch_current, U_right_stretch_prev                 ! Right stretch tensor U
    real(kind=dp), dimension(ndim,ndim) :: U_right_stretch_inv_current, U_right_stretch_inv_prev                 ! Inverse of right stretch tensor U
    real(kind=dp), dimension(ndim,ndim) :: v_left_stretch_current, v_left_stretch_prev                 ! Left stretch tensor v
    real(kind=dp), dimension(ndim,ndim) :: v_left_stretch_inv_current, v_left_stretch_inv_prev                 ! Inverse of left stretch tensor v
    real(kind=dp), dimension(ndim,ndim) :: R_right_rotation_current, R_right_rotation_prev, R_right_rotation_inv_prev
    real(kind=dp), dimension(ndim,ndim) :: dR_right_rotation, dR_right_rotation_inv                 ! Rotation tensor R
    real(kind=dp), dimension(ndim,ndim) :: R_left_rotation_current, R_left_rotation_prev, R_left_rotation_inv_prev
    real(kind=dp), dimension(ndim,ndim) :: dR_left_rotation, dR_left_rotation_inv                 ! Rotation tensor R 
    real(kind=dp), dimension(ndim,ndim) :: eps_Hencky_current, eps_Hencky_prev, deps_Hencky                     ! Hencky strain tensor (true strain)
    real(kind=dp), dimension(ndim,ndim) :: eps_Green_current, eps_Green_prev, deps_Green                ! Green-Lagrange strain tensor (engineering strain)
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_kinpt_current, Bu_kinpt_prev         ! Strain-displacement matrix (B matrix)
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_vol_kinpt_current, Bu_vol_kinpt_prev          ! Volumetric strain-displacement matrix (B matrix)
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_bar_current, Bu_bar_prev         
    real(kind=dp), dimension(ntens,ndim * nnode) :: Bu_bar_vol_current, Bu_bar_vol_prev          

    real(kind=dp), dimension(ntens,ntens) :: ddsdde                 ! Tangent stiffness matrix 
    real(kind=dp), dimension(ntens) :: stress                       ! Stress vector of the current element jelem
    
    real(kind=dp), dimension(ndim, ndim) :: stran_tensor_current, stran_tensor_prev
    real(kind=dp), dimension(ntens) :: stran_current, stran_prev, dstran                       ! Incremental strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: eelas                        ! Elastic strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: eplas                        ! Plastic strain vector of the current element jelem

    real(kind=dp), dimension(nstatev) :: statev                      ! Local state variables of the current element jelem for integration points at (+-1/sqrt(3.0))

    ! Declaring all props as real(kind=dp) for consistency

    real(kind=dp) :: djac, eqplas, deqplas, elem_vol
    real(kind=dp) :: sig_vonMises, sig_hydrostatic, triaxility, lode_angle
    real(kind=dp) :: invariant_p, invariant_q, invariant_r
    real(kind=dp) :: E, nu, lambda, mu, kappa, hard_mod, syield, psi_plas

    ! print *, 'LFLAGS(1) = ', lflags(1) ! Value is 1
    ! Static analysis
    ! print *, 'LFLAGS(2) = ', lflags(2) ! Value is 1
    ! ! Large-displacement analysis (nonlinear geometric effects included in the step)
    ! ! see (General and Perturbation Procedures).
    ! ! https://help.3ds.com/2023/english/dssimulia_established/SIMACAEANLRefMap/simaanl-c-linearnonlinear.htm?contextscope=all
    
    ! Note: coords in UEL is always fixed, which is the initial coordinates of the element jelem
    
!   initialising
    do k1=1,ndofel
        rhs(k1,1)=0.d0
    end do
    amatrx=0.d0

    identity = 0.0d0
    do kdim=1,ndim
        identity(kdim,kdim)=1.d0
    end do

    ! Extract from the variable u and du
    do kdim=1,ndim
        do knode=1,nnode
            disp_index = ndim * knode - ndim + kdim
            u_current(kdim,knode) = u(disp_index)
            du_current(kdim,knode) = du(disp_index, 1)
            u_prev(kdim,knode) = u_current(kdim,knode) - du_current(kdim,knode)
        end do
    end do

    u_current_flat(1:ndim*nnode) = u(start_u_idx:end_u_idx)
    du_current_flat(1:ndim*nnode) = du(start_u_idx:end_u_idx, 1)
    u_prev_flat(1:ndim*nnode) = u_current_flat - du_current_flat
    
    ! Current coordinates of the element jelem
    ! It will be used to calculate N_deriv_global_kinpt_current for updated Lagrangian formulation
    coords_initial = coords

    if (lflags(2) == 0) then ! NLGEOM off
        ! Use original coordinates for total Lagrangian formulation
        coords_current = coords_initial
        coords_prev = coords_initial
    else if (lflags(2) == 1) then ! NLGEOM on
        ! Use updated coordinates for updated Lagrangian formulation
        coords_current = coords_initial + u_current
        coords_prev = coords_initial + u_prev
    end if

    N_bar_deriv_global_current = 0.0d0
    N_bar_deriv_global_prev = 0.0d0
    elem_vol_current = 0.0d0
    elem_vol_prev = 0.0d0

    ! Average volumetric strain
    omega_hencky_stran_current = 0.0d0
    omega_hencky_stran_prev = 0.0d0

    do kinpt=1, ninpt
         
        N_deriv_local_kinpt(1:ndim,1:nnode) = all_N_deriv_local_kinpt(kinpt,1:ndim,1:nnode) 

        call kjacobian(ndim,nnode,mcrd,coords_current,N_deriv_local_kinpt, &
                        xjac_current,xjaci_current,djac_current)
        call kjacobian(ndim,nnode,mcrd,coords_prev,N_deriv_local_kinpt, &
                        xjac_prev,xjaci_prev,djac_prev)

        dvol_current = weight(kinpt) * djac_current
        dvol_prev = weight(kinpt) * djac_prev

        N_deriv_global_kinpt_current = matmul(xjaci_current,N_deriv_local_kinpt)
        N_deriv_global_kinpt_prev = matmul(xjaci_prev,N_deriv_local_kinpt)

        N_bar_deriv_global_current = N_bar_deriv_global_current + N_deriv_global_kinpt_current * dvol_current
        N_bar_deriv_global_prev = N_bar_deriv_global_prev + N_deriv_global_kinpt_prev * dvol_prev
        
        elem_vol_current = elem_vol_current + dvol_current
        elem_vol_prev = elem_vol_prev + dvol_prev

        ! ! Assembling hencky volumetric strain

        ! if (lflags(2) == 1) then 
        !     call calc_u_grad(u_grad_current, N_deriv_global_kinpt_current, u_current, ndim, nnode)
        !     call calc_u_grad(u_grad_prev, N_deriv_global_kinpt_prev, u_prev, ndim, nnode)

        !     F_grad_current = identity + u_grad_current
        !     F_grad_prev = identity + u_grad_prev

        !     C_right_Cauchy_current = matmul(transpose(F_grad_current), F_grad_current)
        !     C_right_Cauchy_prev = matmul(transpose(F_grad_prev), F_grad_prev)

        !     call calc_matrix_sqrt(C_right_Cauchy_current, U_right_stretch_current, ndim)
        !     call calc_matrix_sqrt(C_right_Cauchy_prev, U_right_stretch_prev, ndim)

        !     call calc_matrix_log(U_right_stretch_current, eps_Hencky_current, ndim)
        !     call calc_matrix_log(U_right_stretch_prev, eps_Hencky_prev, ndim)

        !     omega_hencky_stran_current = omega_hencky_stran_current + dvol_current * &
        !             (eps_Hencky_current(1,1) + eps_Hencky_current(2,2) + eps_Hencky_current(3,3))
        !     omega_hencky_stran_prev = omega_hencky_stran_prev + dvol_prev * &
        !             (eps_Hencky_prev(1,1) + eps_Hencky_prev(2,2) + eps_Hencky_prev(3,3))
        ! end if

    end do

    N_bar_deriv_global_current = N_bar_deriv_global_current / elem_vol_current
    N_bar_deriv_global_prev = N_bar_deriv_global_prev / elem_vol_prev

    omega_hencky_stran_current = omega_hencky_stran_current / elem_vol_current
    omega_hencky_stran_prev = omega_hencky_stran_prev / elem_vol_prev

    do kinpt=1,ninpt
        !   Transfer data from svars to statev for current integration point
        call kstatevar(kinpt,nstatev,svars,statev,1)

        !   Compute N_shape_node_to_kinpt and N_deriv_local_kinpt
        N_shape_node_to_kinpt(1:nnode) = all_N_shape_node_to_kinpt(kinpt,1:nnode)
        N_deriv_local_kinpt(1:ndim,1:nnode) = all_N_deriv_local_kinpt(kinpt,1:ndim,1:nnode) 

        ! Use updated coordinates for updated Lagrangian formulation
        call kjacobian(ndim,nnode,mcrd,coords_current,N_deriv_local_kinpt, &
                        xjac_current,xjaci_current,djac_current) 
        call kjacobian(ndim,nnode,mcrd,coords_prev,N_deriv_local_kinpt, &
                        xjac_prev,xjaci_prev,djac_prev)

        !   Differential volume at the integration point
        dvol_current = weight(kinpt) * djac_current
        dvol_prev = weight(kinpt) * djac_prev  

        N_deriv_global_kinpt_current = matmul(xjaci_current,N_deriv_local_kinpt)
        N_deriv_global_kinpt_prev = matmul(xjaci_prev,N_deriv_local_kinpt)

        !   Calculate strain displacement B-matrix
        call kbmatrix_full(N_deriv_global_kinpt_current,ntens,nnode,ndim,Bu_kinpt_current)     
        call kbmatrix_vol(N_deriv_global_kinpt_current,ntens,nnode,ndim,Bu_vol_kinpt_current)
        call kbmatrix_vol(N_bar_deriv_global_current,ntens,nnode,ndim,Bu_bar_vol_current)

        call kbmatrix_full(N_deriv_global_kinpt_prev,ntens,nnode,ndim,Bu_kinpt_prev)
        call kbmatrix_vol(N_deriv_global_kinpt_prev,ntens,nnode,ndim,Bu_vol_kinpt_prev)
        call kbmatrix_vol(N_bar_deriv_global_prev,ntens,nnode,ndim,Bu_bar_vol_prev)
        
        Bu_bar_current = Bu_kinpt_current - Bu_vol_kinpt_current + Bu_bar_vol_current
        Bu_bar_prev = Bu_kinpt_prev - Bu_vol_kinpt_prev + Bu_bar_vol_prev

        if (lflags(2) == 0) then 
            
            ! Small-displacement analysis (infinitesimal strain theory) when NLGEOM=OFF

            ! stran_prev = matmul(Bu_bar_current, u_prev_flat)
            ! dstran = matmul(Bu_bar_current, du_current_flat)
            ! stran_current = stran_prev + dstran

            omega_stran_current = 0.0d0
            omega_stran_prev = 0.0d0

            do knode=1, nnode
                do kdim=1, ndim
                    omega_stran_current = omega_stran_current + N_bar_deriv_global_current(kdim,knode) * u_current(kdim,knode)
                    omega_stran_prev = omega_stran_prev + N_bar_deriv_global_prev(kdim,knode) * coords_initial(kdim,knode)
                end do
            end do

            ! Compute strain components
            
            stran_tensor_current= 0.0d0
            stran_tensor_prev = 0.0d0
            
            do idim = 1, ndim
                do jdim = 1, ndim
                    do knode = 1, nnode
                        stran_tensor_current(idim, jdim) = stran_tensor_current(idim, jdim) + &
                            0.5d0 * (u_current(idim,knode) * N_deriv_global_kinpt_current(jdim, knode) + &
                                    u_current(jdim,knode) * N_deriv_global_kinpt_current(idim, knode))
                        stran_tensor_prev(idim, jdim) = stran_tensor_prev(idim, jdim) + &
                            0.5d0 * (du_current(idim,knode) * N_deriv_global_kinpt_prev(jdim, knode) + &
                                    du_current(jdim,knode) * N_deriv_global_kinpt_prev(idim, knode))
                    end do
                end do
            end do

            ekk_stran_current = stran_tensor_current(1,1) + stran_tensor_current(2,2) + stran_tensor_current(3,3)
            ekk_stran_prev = stran_tensor_prev(1,1) + stran_tensor_prev(2,2) + stran_tensor_prev(3,3)
            
            ! 3.0d0 is ndim but in double precision
            stran_tensor_current(1,1) = stran_tensor_current(1,1) - ekk_stran_current/3.0d0 + omega_stran_current/3.0d0
            stran_tensor_current(2,2) = stran_tensor_current(2,2) - ekk_stran_current/3.0d0 + omega_stran_current/3.0d0
            stran_tensor_current(3,3) = stran_tensor_current(3,3) - ekk_stran_current/3.0d0 + omega_stran_current/3.0d0
            
            stran_tensor_prev(1,1) = stran_tensor_prev(1,1) - ekk_stran_prev/3.0d0 + omega_dstran/3.0d0
            stran_tensor_prev(2,2) = stran_tensor_prev(2,2) - ekk_stran_prev/3.0d0 + omega_dstran/3.0d0
            stran_tensor_prev(3,3) = stran_tensor_prev(3,3) - ekk_stran_prev/3.0d0 + omega_dstran/3.0d0

            stran_current(1) = stran_tensor_current(1,1)
            stran_current(2) = stran_tensor_current(2,2)
            stran_current(3) = stran_tensor_current(3,3)
            stran_current(4) = stran_tensor_current(1,2) + stran_tensor_current(2,1)
            stran_current(5) = stran_tensor_current(1,3) + stran_tensor_current(3,1)
            stran_current(6) = stran_tensor_current(2,3) + stran_tensor_current(3,2)

            stran_prev(1) = stran_tensor_prev(1,1)
            stran_prev(2) = stran_tensor_prev(2,2)
            stran_prev(3) = stran_tensor_prev(3,3)
            stran_prev(4) = stran_tensor_prev(1,2) + stran_tensor_prev(2,1)
            stran_prev(5) = stran_tensor_prev(1,3) + stran_tensor_prev(3,1)
            stran_prev(6) = stran_tensor_prev(2,3) + stran_tensor_prev(3,2)

            dstran = stran_current - stran_prev

            ! ====================================================
            ! GREEN-LAGRANGE STRAIN (for small displacement analysis)
            ! It is probably not used by Abaqus for large displacement analysis
            ! ====================================================

            ! call calc_u_grad(u_grad_current, N_deriv_global_kinpt_current, u_current, ndim, nnode)
            ! call calc_u_grad(u_grad_prev, N_deriv_global_kinpt_prev, u_prev, ndim, nnode)
            
            ! F_grad_current = identity + u_grad_current
            ! F_grad_prev = identity + u_grad_prev

            ! eps_Green_current = 0.5d0 * (matmul(transpose(F_grad_current), F_grad_current) - identity)
            ! eps_Green_prev = 0.5d0 * (matmul(transpose(F_grad_prev), F_grad_prev) - identity)

            ! stran_current(1) = eps_Green_current(1,1)
            ! stran_current(2) = eps_Green_current(2,2)
            ! stran_current(3) = eps_Green_current(3,3)
            ! stran_current(4) = eps_Green_current(1,2) + eps_Green_current(2,1)
            ! stran_current(5) = eps_Green_current(1,3) + eps_Green_current(3,1)
            ! stran_current(6) = eps_Green_current(2,3) + eps_Green_current(3,2)

            ! stran_prev(1) = eps_Green_prev(1,1)
            ! stran_prev(2) = eps_Green_prev(2,2)
            ! stran_prev(3) = eps_Green_prev(3,3)
            ! stran_prev(4) = eps_Green_prev(1,2) + eps_Green_prev(2,1)
            ! stran_prev(5) = eps_Green_prev(1,3) + eps_Green_prev(3,1)
            ! stran_prev(6) = eps_Green_prev(2,3) + eps_Green_prev(3,2)

            ! dstran = stran_current - stran_prev

        else if (lflags(2) == 1) then
            
            ! ====================================================
            ! HENCKY STRAIN: It is strain path independent and approximates additive strains
            ! Hencky(u current) approx = Hencky(u prev) + Hencky(du current)    
            ! Abaqus Manual: In finite-strain problems the strain components have been rotated to account for 
            ! rigid body motion in the increment before UMAT is called and are approximations to logarithmic strain
            ! ====================================================
            
            ! ====================================================
            ! Right version (polar decomposition - Material)
            ! ====================================================
            
            call calc_u_grad(u_grad_current, N_deriv_global_kinpt_current, u_current, ndim, nnode)
            call calc_u_grad(u_grad_prev, N_deriv_global_kinpt_prev, u_prev, ndim, nnode)

            F_grad_current = identity + u_grad_current
            F_grad_prev = identity + u_grad_prev
            call calc_matrix_inv(F_grad_prev, F_grad_inv_prev, ndim)
            dF_grad = matmul(F_grad_current, F_grad_inv_prev)

            C_right_Cauchy_current = matmul(transpose(F_grad_current), F_grad_current)
            C_right_Cauchy_prev = matmul(transpose(F_grad_prev), F_grad_prev)

            call calc_matrix_sqrt(C_right_Cauchy_current, U_right_stretch_current, ndim)
            call calc_matrix_sqrt(C_right_Cauchy_prev, U_right_stretch_prev, ndim)

            call calc_matrix_inv(U_right_stretch_current, U_right_stretch_inv_current, ndim)
            call calc_matrix_inv(U_right_stretch_prev, U_right_stretch_inv_prev, ndim)

            R_right_rotation_current = matmul(F_grad_current, U_right_stretch_inv_current)
            R_right_rotation_prev = matmul(F_grad_prev, U_right_stretch_inv_prev)
            call calc_matrix_inv(R_right_rotation_prev, R_right_rotation_inv_prev, ndim)

            dR_right_rotation = matmul(R_right_rotation_current, R_right_rotation_inv_prev)
            call calc_matrix_inv(dR_right_rotation, dR_right_rotation_inv, ndim)
            du_grad = matmul(dR_right_rotation_inv, dF_grad)
            
            call calc_matrix_log(U_right_stretch_current, eps_Hencky_current, ndim)
            call calc_matrix_log(U_right_stretch_prev, eps_Hencky_prev, ndim)
            call calc_matrix_log(du_grad, deps_Hencky, ndim)

            stran_current(1) = eps_Hencky_current(1,1)
            stran_current(2) = eps_Hencky_current(2,2)
            stran_current(3) = eps_Hencky_current(3,3)
            stran_current(4) = eps_Hencky_current(1,2) + eps_Hencky_current(2,1)
            stran_current(5) = eps_Hencky_current(1,3) + eps_Hencky_current(3,1)
            stran_current(6) = eps_Hencky_current(2,3) + eps_Hencky_current(3,2)

            stran_prev(1) = eps_Hencky_prev(1,1)
            stran_prev(2) = eps_Hencky_prev(2,2)
            stran_prev(3) = eps_Hencky_prev(3,3)
            stran_prev(4) = eps_Hencky_prev(1,2) + eps_Hencky_prev(2,1)
            stran_prev(5) = eps_Hencky_prev(1,3) + eps_Hencky_prev(3,1)
            stran_prev(6) = eps_Hencky_prev(2,3) + eps_Hencky_prev(3,2)
            
            ! dstran(1) = deps_Hencky(1,1)
            ! dstran(2) = deps_Hencky(2,2)
            ! dstran(3) = deps_Hencky(3,3)
            ! dstran(4) = deps_Hencky(1,2) + deps_Hencky(2,1)
            ! dstran(5) = deps_Hencky(1,3) + deps_Hencky(3,1)
            ! dstran(6) = deps_Hencky(2,3) + deps_Hencky(3,2)

            ! or 

            dstran = stran_current - stran_prev

            ! ====================================================
            ! Left version (polar decomposition - Spatial)
            ! Abaqus logarithmic Hencky strain LE properly used the left stretch tensor v
            ! ====================================================

            ! call calc_u_grad(u_grad_current, N_deriv_global_kinpt_current, u_current, ndim, nnode)
            ! call calc_u_grad(u_grad_prev, N_deriv_global_kinpt_prev, u_prev, ndim, nnode)

            ! F_grad_current = identity + u_grad_current
            ! F_grad_prev = identity + u_grad_prev
            ! call calc_matrix_inv(F_grad_prev, F_grad_inv_prev, ndim)
            ! dF_grad = matmul(F_grad_current, F_grad_inv_prev)

            ! b_left_Cauchy_current = matmul(F_grad_current, transpose(F_grad_current))
            ! b_left_Cauchy_prev = matmul(F_grad_prev, transpose(F_grad_prev))

            ! call calc_matrix_sqrt(b_left_Cauchy_current, v_left_stretch_current, ndim)
            ! call calc_matrix_sqrt(b_left_Cauchy_prev, v_left_stretch_prev, ndim)

            ! call calc_matrix_inv(v_left_stretch_current, v_left_stretch_inv_current, ndim)
            ! call calc_matrix_inv(v_left_stretch_prev, v_left_stretch_inv_prev, ndim)

            ! R_left_rotation_current = matmul(v_left_stretch_inv_current, F_grad_current)
            ! R_left_rotation_prev = matmul(v_left_stretch_inv_prev, F_grad_prev)
            ! ! Since R is orthogonal, R^T = R^-1
            ! call calc_matrix_inv(R_left_rotation_prev, R_left_rotation_inv_prev, ndim)
            ! dR_left_rotation = matmul(R_left_rotation_current, R_left_rotation_inv_prev)

            ! call calc_matrix_inv(dR_left_rotation, dR_left_rotation_inv, ndim)
            ! du_grad = matmul(dR_left_rotation_inv, dF_grad)


            ! call calc_matrix_log(v_left_stretch_current, eps_Hencky_current, ndim)
            ! call calc_matrix_log(v_left_stretch_prev, eps_Hencky_prev, ndim)
            ! call calc_matrix_log(du_grad, deps_Hencky, ndim)

            ! stran_current(1) = eps_Hencky_current(1,1)
            ! stran_current(2) = eps_Hencky_current(2,2)
            ! stran_current(3) = eps_Hencky_current(3,3)
            ! stran_current(4) = eps_Hencky_current(1,2) + eps_Hencky_current(2,1)
            ! stran_current(5) = eps_Hencky_current(1,3) + eps_Hencky_current(3,1)
            ! stran_current(6) = eps_Hencky_current(2,3) + eps_Hencky_current(3,2)

            ! stran_prev(1) = eps_Hencky_prev(1,1)
            ! stran_prev(2) = eps_Hencky_prev(2,2)
            ! stran_prev(3) = eps_Hencky_prev(3,3)
            ! stran_prev(4) = eps_Hencky_prev(1,2) + eps_Hencky_prev(2,1)
            ! stran_prev(5) = eps_Hencky_prev(1,3) + eps_Hencky_prev(3,1)
            ! stran_prev(6) = eps_Hencky_prev(2,3) + eps_Hencky_prev(3,2)
            
            ! ! dstran(1) = deps_Hencky(1,1)
            ! ! dstran(2) = deps_Hencky(2,2)
            ! ! dstran(3) = deps_Hencky(3,3)
            ! ! dstran(4) = deps_Hencky(1,2) + deps_Hencky(2,1)
            ! ! dstran(5) = deps_Hencky(1,3) + deps_Hencky(3,1)
            ! ! dstran(6) = deps_Hencky(2,3) + deps_Hencky(3,2)
            
            ! dstran = stran_current - stran_prev

        end if

        !   ====================================================
        !   Calculate deformation field (stress and strain, etc)
        !   ====================================================
                
        ! Extract stress and stran
        
        stress = statev(sig_start_idx : sig_end_idx)
        
        ! Call the von Mises plasticity model
        
        call UMAT_von_Mises(stress,statev,ddsdde,stran_prev,dstran,time,dtime, &
                            ndi,nshr,ntens,ndim,nstatv,props,nprops,dR_right_rotation, &
                            F_grad_prev,F_grad_current,jelem,kinpt,kstep,kinc)

        ! call UMAT_von_Mises(stress,statev,ddsdde,stran_prev,dstran,time,dtime, &
        !                     ndi,nshr,ntens,ndim,nstatv,props,nprops,dR_left_rotation, &
        !                     F_grad_prev,F_grad_current,jelem,kinpt,kstep,kinc)

        ! Update the state variables
        ! eelas, eplas, eqplas, deqplas, sig_vonMises, sig_H are already updated in statev in UMAT_von_Mises
        statev(sig_start_idx : sig_end_idx) = stress
        statev(stran_start_idx : stran_end_idx) = stran_current
        
        ! Update the other SDVs
        statev(triax_idx) = 0.0
        statev(lode_idx) = 0.0
        
        !   Transfer data from statev to svars
        !   This stage basically updates the state variables for the current element in UEL
        call kstatevar(kinpt,nstatev,svars,statev,0)

        ! ********************************************!
        ! DISPLACEMENT CONTRIBUTION TO amatrx AND rhs !
        ! ********************************************!

        ! 3D case
        ! 8 nodes x 3 displacement dofs ux, uy, uz = 24

        amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) = &
            amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) + dvol_current * &
                               (matmul(matmul(transpose(Bu_bar_current),ddsdde),Bu_bar_current))
            
        rhs(start_u_idx:end_u_idx,1) = rhs(start_u_idx:end_u_idx,1) - &
            dvol_current * (matmul(transpose(Bu_bar_current),stress))        

        !   Transfer data from statev to dummy mesh for visualization
        
        ! Updating sig11, sig22, sig33, sig12, sig13, sig23
        user_vars(jelem,sig_start_idx : sig_end_idx,kinpt) = statev(sig_start_idx : sig_end_idx)
        ! Updating stran11, stran22, stran33, stran12, stran13, stran23
        user_vars(jelem,stran_start_idx : stran_end_idx,kinpt) = statev(stran_start_idx : stran_end_idx)
        ! Updating eelas11, eelas22, eelas33, eelas12, eelas13, eelas23
        user_vars(jelem,eelas_start_idx : eelas_end_idx,kinpt) = statev(eelas_start_idx : eelas_end_idx)
        ! Updating eplas11, eplas22, eplas33, eplas12, eplas13, eplas23
        user_vars(jelem,eplas_start_idx : eplas_end_idx,kinpt) = statev(eplas_start_idx : eplas_end_idx)
        ! Updating the rest SDVs
        user_vars(jelem,eplas_end_idx+1:nstatev,kinpt) = statev(eplas_end_idx+1:nstatev)
        
    end do       ! end loop on material integration points
    
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

! https://abaqus.yahoogroups.narkive.com/JmvQxO17/logarithmic-strain-measure-umat
! https://abaqus.yahoogroups.narkive.com/tRfncHT7/rotsig-in-umat
! https://www.continuummechanics.org/polardecomposition.html