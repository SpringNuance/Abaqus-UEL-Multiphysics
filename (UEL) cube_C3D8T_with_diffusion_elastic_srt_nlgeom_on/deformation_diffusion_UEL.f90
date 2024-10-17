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
    
    ! "25, AR25_eqplas, AR25_eqplas   ", 
    ! "26, AR26_deqplas, AR26_deqplas   ",

    ! "27, AR27_sig_H, AR27_sig_H   ",
    ! "28, AR28_sig_vonMises, AR28_sig_vonMises   ",

    ! "29, AR29_triax, AR29_triax   ",
    ! "30, AR30_lode, AR30_lode   ",

    ! "31, AR31_phi, AR31_phi   ",
    ! "32, AR32_history, AR32_history   ",
    ! "33, AR33_Gc, AR33_Gc   ",
    ! "34, AR34_C_mol, AR34_C_mol   ",
    ! "35, AR35_CL_mol, AR35_CL_mol   ",
    ! "36, AR36_CT_mol, AR36_CT_mol   ",

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


! Include the helper function file

include 'helper_functions.f90'

!***********************************************************************

module common_block
    use precision
    implicit none

    ! THESE TWO VALUES ARE HARD-CODED
    ! YOU MUST CHANGE IT TO THE ACTUAL NUMBER OF ELEMENTS IN .INP FILE

    integer, parameter :: total_elems = 1 ! Storing the actual number of elements
    integer, parameter :: total_nodes = 8 ! Storing the actual number of nodes

    real(kind=dp), parameter :: molar_mass_H = 1.00784d0 ! g/mol
    real(kind=dp), parameter :: molar_mass_Fe = 55.845d0 ! g/mol
    real(kind=dp), parameter :: ratio_molar_mass_Fe_H = 55.415d0
    real(kind=dp), parameter :: density_metal = 7900.0d0 ! kg/m^3
    ! CL_wtppm = (CL_mol * molar_mass_H) / (density_metal * 1.d-03)
    real(kind=dp), parameter :: conversion_mol_to_wtppm = 0.127574683544d0 ! wtppm
    ! CL_molfrac = (CL_wtppm * 1.d-6) * (ratio_molar_mass_Fe_H)
    real(kind=dp), parameter :: conversion_wtppm_to_molfrac = 55.4105d-6 ! molfrac 
    ! Inverse of conversion_wtppm_to_mol
    real(kind=dp), parameter :: conversion_wtppm_to_mol = 7.838545801d0 ! mol
    ! In hydrogen diffusion analogy to heat transfer, density and specific heat are 1
    real(kind=dp), parameter :: density_hydro = 1.0d0
    real(kind=dp), parameter :: specific_heat_hydro = 1.0d0

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
    integer, parameter :: before_hydro_props_idx = 8 ! Index of the first hydrogen diffusion property in props
    integer, parameter :: before_damage_props_idx = 32 ! Index of the first phase field damage property in props
    integer, parameter :: before_flow_props_idx = 40 ! Index of the first flow curve data in props
    
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
    integer, parameter :: phi_idx = 31 ! Index of the damage variable in statev
    integer, parameter :: history_idx = 32 ! Index of the history variable in statev
    integer, parameter :: Gc_idx = 33 ! Index of the critical energy release rate in statev
    integer, parameter :: C_mol_idx = 34 ! Index of the concentration of molecular hydrogen in statev
    integer, parameter :: CL_mol_idx = 35 ! Index of the concentration of lattice hydrogen in statev
    integer, parameter :: CT_mol_idx = 36 ! Index of the concentration of trapped hydrogen in statev
    
    ! First dim: maximum number of elements to accomodate varying number of elements when remeshed
    ! Second dim: number of solution state dependent variables (nsvars in UEL and nstatv in UMAT)
    ! Third dim: number of integration points

    real(kind=dp) :: user_vars(100000, 36, 8)

    real(kind=dp) :: all_N_shape_int_to_knode(8, 8) ! (nnode, ninpt)
    real(kind=dp) :: all_N_shape_node_to_kinpt(8, 8) ! (ninpt, nnode)
    real(kind=dp) :: all_N_deriv_local_kinpt(8, 3, 8)  ! (ninpt, ndim, nnode)

    save
    ! The save command is very important. 
    ! It allows the values to be stored and shared between subroutines 
    ! without resetting them to zero every time the subroutine is called

end module

! C3D8 element

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



subroutine kstatevar(kinpt,nstatv,svars,statev,icopy)

!   Transfer data to/from element-level state variable array from/to
!   material-point level state variable array.

    include 'aba_param.inc'

    dimension svars(*),statev(*)

    isvinc=(kinpt-1) * nstatv     ! integration point increment

    if (icopy == 1) then ! Prepare arrays for entry into umat
        do i=1, nstatv
            statev(i) = svars(i+isvinc)
        end do
    else ! Update element state variables upon return from umat
        do i = 1, nstatv
            svars(i+isvinc) = statev(i)
        end do
    end if

return
end


! This is isotropic von Mises plasticity model

subroutine UMAT_von_Mises(stress,statev,ddsdde,stran_old,dstran,time,dtime, &
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

subroutine UMAT_elastic(stress,statev,ddsdde,stran_old,dstran,time,dtime, &
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

    real(kind=dp) :: E, nu, lambda, mu, eqplas, deqplas, sig_vonMises, sig_H

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

    ! Rotate the stress and strain to account for large deformation (NLGEOM=ON)
    ! Number 2 means for strain. If it is stress, it should be 1
    call rotsig(statev(eelas_start_idx), drot, eelas, 2, ndi, nshr)
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
    real(kind=dp), dimension(ndim, nnode) :: u_values  ! Displacement vector 
    
    integer :: idim, jdim, knode
    integer :: u_index

    ! Initialize the displacement gradient tensor to zero
    u_grad = 0.0d0

    ! Compute the displacement gradient (u_grad)
    
    do idim = 1, ndim 
        do jdim = 1, ndim
            do knode = 1, nnode
                u_grad(idim, jdim) = u_grad(idim, jdim) + N_deriv_global_kinpt(jdim, knode) * u_values(idim, knode)
            end do
        end do
    end do

return
end


!***********************************************************************

subroutine UMATHT_diffusion(u_heat_old,u_heat_new,dudt_heat,dudg_heat, &
                            flux_heat,dfdt_heat,dfdg_heat, &
                            temp_kinpt_old,dtemp_kinpt,dtemdx_kinpt_new,time,dtime,ndim, &
                            statev,nstatv,props,nprops,noel,npt,kstep,kinc)
!   
    use precision
    include 'aba_param.inc'
!   ntgrd is exactly the same as ndim in deformation field
    real(kind=dp), dimension(ndim) :: dudg_heat,flux_heat,dfdt_heat,dtemdx_kinpt_new
    real(kind=dp), dimension(ndim,ndim) :: dfdg_heat
    real(kind=dp), dimension(nstatv) :: statev
    real(kind=dp), dimension(nprops) :: props
    real(kind=dp), dimension(2) :: time

    conductivity = 1.0d-5
    cp_heat = 1.0d0

    dudt_heat = cp_heat
    du_heat = dudt_heat * dtemp_kinpt
    u_heat_new = u_heat_old + du_heat
    
    dudg_heat = 0.0d0
    dfdg_heat = 0.0d0

    do kdim=1, ndim
        flux_heat(kdim) = - conductivity * dtemdx_kinpt_new(kdim)
        dfdt_heat(kdim) = 0.0d0
        dfdg_heat(kdim,kdim) = - conductivity
    end do

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

    ! Degree of freedom order for u, du, v, a
    ! ux_node1, uy_node1, uz_node1, ..., ux_nnode, uy_nnode, uz_nnode
    ! Then temp_node1, temp_node2, ..., temp_nnode, then phi_node1, phi_node2, ..., phi_nnode

    integer, parameter :: ndim = 3 ! Number of spatial dimensions
    integer, parameter :: ntens = 6 ! Number of stress-strain components
    integer, parameter :: ndi = 3 ! Number of direct stress-strain components
    integer, parameter :: nshr = 3 ! Number of shear stress-strain components
    integer, parameter :: ninpt = 8 ! Number of integration points
    integer, parameter :: nstatv = 36 ! Number of state variables at integration points
    
    ! The starting and ending index of the dof in u, du, v, a
    integer, parameter :: start_u_idx = 1
    integer, parameter :: end_u_idx = 24 ! = ndim * nnode
    integer, parameter :: start_temp_idx = 25
    integer, parameter :: end_temp_idx = 32
    integer, parameter :: start_phi_idx = 33
    integer, parameter :: end_phi_idx = 40

    integer, parameter :: UMAT_choice = 1 ! 1 for isotropic elastic, 2 for isotropic von Mises plasticity

    ! The following data is not part of UEL, defined by the user    
    
    ! ==============================================================
    ! TENSORS COMMON TO ALL FIELDS (DEFORMATION, DIFFUSION, DAMAGE)
    ! ==============================================================

    real(kind=dp), dimension(mcrd,nnode) :: coords_new, coords_old, coords_initial
    real(kind=dp), dimension(nnode) :: N_shape_node_to_kinpt                 
    real(kind=dp), dimension(ninpt) :: N_shape_int_to_knode         
    real(kind=dp), dimension(ndim,nnode) :: N_deriv_local_kinpt           
    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt_new      
    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt_old      
    real(kind=dp), dimension(ndim,nnode) :: N_bar_deriv_global_new     
    real(kind=dp), dimension(ndim,nnode) :: N_bar_deriv_global_old    
    real(kind=dp), dimension(ndim,ndim) :: xjac_new, xjaci_new
    real(kind=dp), dimension(ndim,ndim) :: xjac_old, xjaci_old
    real(kind=dp), dimension(ndim,ndim) :: identity
    real(kind=dp), dimension(nstatv) :: statev

    ! =======================================================
    ! TENSORS DEFINED FOR THE DEFORMATION FIELD: UX, UY, UZ
    ! =======================================================

    ! Defined at nodal points
    real(kind=dp), dimension(ndim,nnode) :: u_node_new, du_node_new, u_node_old
    real(kind=dp), dimension(ndim*nnode) :: u_node_new_flat, du_node_new_flat, u_node_old_flat

    real(kind=dp), dimension(ndim,ndim) :: F_grad_new, F_grad_old, F_grad_inv_old, dF_grad    
    real(kind=dp), dimension(ndim,ndim) :: F_grad_bar_new, F_grad_bar_old, F_grad_bar_inv_old, dF_grad_bar            
    real(kind=dp), dimension(ndim,ndim) :: u_grad_new, u_grad_old, du_grad               
    real(kind=dp), dimension(ndim,ndim) :: C_right_Cauchy_new, C_right_Cauchy_old              
    real(kind=dp), dimension(ndim,ndim) :: b_left_Cauchy_new, b_left_Cauchy_old              
    real(kind=dp), dimension(ndim,ndim) :: U_right_stretch_new, U_right_stretch_old              
    real(kind=dp), dimension(ndim,ndim) :: U_right_stretch_inv_new, U_right_stretch_inv_old            
    real(kind=dp), dimension(ndim,ndim) :: v_left_stretch_new, v_left_stretch_old               
    real(kind=dp), dimension(ndim,ndim) :: v_left_stretch_inv_new, v_left_stretch_inv_old             
    real(kind=dp), dimension(ndim,ndim) :: R_right_rotation_new, R_right_rotation_old, R_right_rotation_inv_old
    real(kind=dp), dimension(ndim,ndim) :: dR_right_rotation, dR_right_rotation_inv               
    real(kind=dp), dimension(ndim,ndim) :: R_left_rotation_new, R_left_rotation_old, R_left_rotation_inv_old
    real(kind=dp), dimension(ndim,ndim) :: dR_left_rotation, dR_left_rotation_inv               
    real(kind=dp), dimension(ndim,ndim) :: eps_Hencky_new, eps_Hencky_old, deps_Hencky                     
    real(kind=dp), dimension(ndim,ndim) :: eps_Green_new, eps_Green_old, deps_Green              
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_kinpt_new, Bu_kinpt_old        
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_vol_kinpt_new, Bu_vol_kinpt_old
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_bar_new, Bu_bar_old         
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_bar_vol_new, Bu_bar_vol_old          

    real(kind=dp), dimension(ntens,ntens) :: ddsdde
    real(kind=dp), dimension(ntens) :: stress, eelas, eplas
    real(kind=dp), dimension(ndim, ndim) :: stran_tensor_new, stran_tensor_old, dstran_tensor ! Full tensor notation 
    real(kind=dp), dimension(ntens) :: stran_new, stran_old, dstran                           ! Voigt notation
                   
    ! =====================================================================!
    ! TENSORS DEFINED FOR THE DIFFUSION FIELD: CL (hydrogen concentration) !
    ! =====================================================================!

    ! Defined at nodal points
    real(kind=dp), dimension(nnode) :: temp_node_new, dtemp_node, temp_node_old

    ! Defined at each integration point
    real(kind=dp) :: temp_kinpt_new, dtemp_kinpt, temp_kinpt_old
    real(kind=dp), dimension(ndim) :: dtemdx_kinpt_new

    real(kind=dp) :: u_heat_new, u_heat_old, dudt_heat, du_heat, dr_heat
    real(kind=dp), dimension(ndim) :: dudg_heat, flux_heat, dfdt_heat
    real(kind=dp), dimension(ndim,ndim) :: dfdg_heat

    real(kind=dp), dimension(nnode) :: sig_H_knode                 
    real(kind=dp), dimension(nnode) :: softened_sig_H_knode      
    real(kind=dp), dimension(nnode,nnode) :: softened_sig_H_kinpt
    real(kind=dp), dimension(ndim,nnode) :: softened_grad_sig_kinpt

    real(kind=dp), dimension(nnode,nnode)  :: M_capacitance, K_conductivity
    real(kind=dp), dimension(nnode,nnode) :: dudt_contribution, dudg_contribution, dfdt_contribution, dfdg_contribution
    real(kind=dp), dimension(nnode) :: f_node_heat, dudt_heat_contribution, dr_heat_contribution, flux_contribution

    

    ! =============================================== !
    ! TENSORS DEFINED FOR THE PHASE FIELD DAMAGE: phi !
    ! =============================================== !
    
    ! Defined at nodal points
    real(kind=dp), dimension(nnode) :: phi_node_new, dphi_node, phi_node_old

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

    ! For deformation field

    do kdim=1,ndim
        do knode=1,nnode
            disp_index = ndim * knode - ndim + kdim
            u_node_new(kdim,knode) = u(disp_index)
            du_node_new(kdim,knode) = du(disp_index, 1)
            u_node_old(kdim,knode) = u_node_new(kdim,knode) - du_node_new(kdim,knode)
        end do
    end do

    u_node_new_flat(1:ndim*nnode) = u(start_u_idx:end_u_idx)
    du_node_new_flat(1:ndim*nnode) = du(start_u_idx:end_u_idx, 1)
    u_node_old_flat(1:ndim*nnode) = u_node_new_flat - du_node_new_flat
    


    ! For damage field

    ! phi_node_new(1:nnode) = u(start_phi_idx:end_phi_idx)
    ! dphi_node(1:nnode) = du(start_phi_idx:end_phi_idx, 1)
    ! phi_node_old(1:nnode) = phi_node_new(1:nnode) - dphi_node(1:nnode)

    ! Current coordinates of the element jelem
    ! It will be used to calculate N_deriv_global_kinpt_new for updated Lagrangian formulation
    
    coords_initial = coords

    if (lflags(2) == 0) then ! NLGEOM off
        ! Use original coordinates for total Lagrangian formulation
        coords_new = coords_initial
        coords_old = coords_initial
    else if (lflags(2) == 1) then ! NLGEOM on
        ! Use updated coordinates for updated Lagrangian formulation
        coords_new = coords_initial + u_node_new
        coords_old = coords_initial + u_node_old
    end if
    
    
    N_bar_deriv_global_new = 0.0d0
    N_bar_deriv_global_old = 0.0d0
    elem_vol_new = 0.0d0
    elem_vol_old = 0.0d0

    ! Average volumetric strain
    omega_hencky_stran_new = 0.0d0
    omega_hencky_stran_old = 0.0d0

    djac_bar_new = 0.0d0
    djac_bar_old = 0.0d0 

    do kinpt=1, ninpt
         
        N_deriv_local_kinpt(1:ndim,1:nnode) = all_N_deriv_local_kinpt(kinpt,1:ndim,1:nnode) 

        call kjacobian(ndim,nnode,mcrd,coords_new,N_deriv_local_kinpt, &
                        xjac_new,xjaci_new,djac_new)
        call kjacobian(ndim,nnode,mcrd,coords_old,N_deriv_local_kinpt, &
                        xjac_old,xjaci_old,djac_old)

        dvol_new = weight(kinpt) * djac_new
        dvol_old = weight(kinpt) * djac_old

        N_deriv_global_kinpt_new = matmul(xjaci_new,N_deriv_local_kinpt)
        N_deriv_global_kinpt_old = matmul(xjaci_old,N_deriv_local_kinpt)

        N_bar_deriv_global_new = N_bar_deriv_global_new + N_deriv_global_kinpt_new * dvol_new
        N_bar_deriv_global_old = N_bar_deriv_global_old + N_deriv_global_kinpt_old * dvol_old
        
        elem_vol_new = elem_vol_new + dvol_new
        elem_vol_old = elem_vol_old + dvol_old

        djac_bar_new = djac_bar_new + djac_new * dvol_new
        djac_bar_old = djac_bar_old + djac_old * dvol_old

        ! Assembling hencky volumetric strain

        if (lflags(2) == 1) then 

            call calc_u_grad(u_grad_new, N_deriv_global_kinpt_new, u_node_new, ndim, nnode)
            call calc_u_grad(u_grad_old, N_deriv_global_kinpt_old, u_node_old, ndim, nnode)

            F_grad_new = identity + u_grad_new
            F_grad_old = identity + u_grad_old
            call calc_matrix_inv(F_grad_old, F_grad_inv_old, ndim)
            dF_grad = matmul(F_grad_new, F_grad_inv_old)

            C_right_Cauchy_new = matmul(transpose(F_grad_new), F_grad_new)
            C_right_Cauchy_old = matmul(transpose(F_grad_old), F_grad_old)

            call calc_matrix_sqrt(C_right_Cauchy_new, U_right_stretch_new, ndim)
            call calc_matrix_sqrt(C_right_Cauchy_old, U_right_stretch_old, ndim)

            call calc_matrix_inv(U_right_stretch_new, U_right_stretch_inv_new, ndim)
            call calc_matrix_inv(U_right_stretch_old, U_right_stretch_inv_old, ndim)

            R_right_rotation_new = matmul(F_grad_new, U_right_stretch_inv_new)
            R_right_rotation_old = matmul(F_grad_old, U_right_stretch_inv_old)
            call calc_matrix_inv(R_right_rotation_old, R_right_rotation_inv_old, ndim)

            dR_right_rotation = matmul(R_right_rotation_new, R_right_rotation_inv_old)
            call calc_matrix_inv(dR_right_rotation, dR_right_rotation_inv, ndim)
            du_grad = matmul(dR_right_rotation_inv, dF_grad)
            
            call calc_matrix_log(U_right_stretch_new, eps_Hencky_new, ndim)
            call calc_matrix_log(U_right_stretch_old, eps_Hencky_old, ndim)
            call calc_matrix_log(du_grad, deps_Hencky, ndim)

            omega_hencky_stran_new = omega_hencky_stran_new + dvol_new * &
                    (eps_Hencky_new(1,1) + eps_Hencky_new(2,2) + eps_Hencky_new(3,3))
            omega_hencky_stran_old = omega_hencky_stran_old + dvol_old * &
                    (eps_Hencky_old(1,1) + eps_Hencky_old(2,2) + eps_Hencky_old(3,3))
        end if

    end do

    N_bar_deriv_global_new = N_bar_deriv_global_new / elem_vol_new
    N_bar_deriv_global_old = N_bar_deriv_global_old / elem_vol_old

    omega_hencky_stran_new = omega_hencky_stran_new / elem_vol_new
    omega_hencky_stran_old = omega_hencky_stran_old / elem_vol_old

    djac_bar_new = djac_bar_new / elem_vol_new
    djac_bar_old = djac_bar_old / elem_vol_old

    do kinpt=1,ninpt
        !   Transfer data from svars to statev for current integration point
        call kstatevar(kinpt,nstatv,svars,statev,1)

        ! ================================================================== !
        !                                                                    !
        !                    SOLVING THE DEFORMATION FIELD                   !
        !                                                                    !
        ! ================================================================== !

        !   Compute N_shape_node_to_kinpt and N_deriv_local_kinpt
        N_shape_node_to_kinpt(1:nnode) = all_N_shape_node_to_kinpt(kinpt,1:nnode)
        N_deriv_local_kinpt(1:ndim,1:nnode) = all_N_deriv_local_kinpt(kinpt,1:ndim,1:nnode) 

        ! Use updated coordinates for updated Lagrangian formulation
        call kjacobian(ndim,nnode,mcrd,coords_new,N_deriv_local_kinpt, &
                        xjac_new,xjaci_new,djac_new) 
        call kjacobian(ndim,nnode,mcrd,coords_old,N_deriv_local_kinpt, &
                        xjac_old,xjaci_old,djac_old)

        !   Differential volume at the integration point
        dvol_new = weight(kinpt) * djac_new
        dvol_old = weight(kinpt) * djac_old  

        N_deriv_global_kinpt_new = matmul(xjaci_new,N_deriv_local_kinpt)
        N_deriv_global_kinpt_old = matmul(xjaci_old,N_deriv_local_kinpt)

        !   Calculate strain displacement B-matrix
        call kbmatrix_full(N_deriv_global_kinpt_new,ntens,nnode,ndim,Bu_kinpt_new)     
        call kbmatrix_vol(N_deriv_global_kinpt_new,ntens,nnode,ndim,Bu_vol_kinpt_new)
        call kbmatrix_vol(N_bar_deriv_global_new,ntens,nnode,ndim,Bu_bar_vol_new)

        call kbmatrix_full(N_deriv_global_kinpt_old,ntens,nnode,ndim,Bu_kinpt_old)
        call kbmatrix_vol(N_deriv_global_kinpt_old,ntens,nnode,ndim,Bu_vol_kinpt_old)
        call kbmatrix_vol(N_bar_deriv_global_old,ntens,nnode,ndim,Bu_bar_vol_old)
        
        Bu_bar_new = Bu_kinpt_new - Bu_vol_kinpt_new + Bu_bar_vol_new
        Bu_bar_old = Bu_kinpt_old - Bu_vol_kinpt_old + Bu_bar_vol_old

        if (lflags(2) == 0) then 
            
            ! Small-displacement analysis (infinitesimal strain theory) when NLGEOM=OFF

            ! stran_old = matmul(Bu_bar_new, u_node_old_flat)
            ! dstran = matmul(Bu_bar_new, du_node_new_flat)
            ! stran_new = stran_old + dstran

            omega_stran_new = 0.0d0
            omega_stran_old = 0.0d0

            do knode=1, nnode
                do kdim=1, ndim
                    omega_stran_new = omega_stran_new + N_bar_deriv_global_new(kdim,knode) * u_node_new(kdim,knode)
                    omega_stran_old = omega_stran_old + N_bar_deriv_global_old(kdim,knode) * coords_initial(kdim,knode)
                end do
            end do

            ! Compute strain components
            
            stran_tensor_new= 0.0d0
            stran_tensor_old = 0.0d0
            
            do idim = 1, ndim
                do jdim = 1, ndim
                    do knode = 1, nnode
                        stran_tensor_new(idim, jdim) = stran_tensor_new(idim, jdim) + &
                            0.5d0 * (u_node_new(idim,knode) * N_deriv_global_kinpt_new(jdim, knode) + &
                                    u_node_new(jdim,knode) * N_deriv_global_kinpt_new(idim, knode))
                        stran_tensor_old(idim, jdim) = stran_tensor_old(idim, jdim) + &
                            0.5d0 * (du_node_new(idim,knode) * N_deriv_global_kinpt_old(jdim, knode) + &
                                    du_node_new(jdim,knode) * N_deriv_global_kinpt_old(idim, knode))
                    end do
                end do
            end do

            ekk_stran_new = stran_tensor_new(1,1) + stran_tensor_new(2,2) + stran_tensor_new(3,3)
            ekk_stran_old = stran_tensor_old(1,1) + stran_tensor_old(2,2) + stran_tensor_old(3,3)
            
            ! 3.0d0 is ndim but in double precision
            stran_tensor_new(1,1) = stran_tensor_new(1,1) - ekk_stran_new/3.0d0 + omega_stran_new/3.0d0
            stran_tensor_new(2,2) = stran_tensor_new(2,2) - ekk_stran_new/3.0d0 + omega_stran_new/3.0d0
            stran_tensor_new(3,3) = stran_tensor_new(3,3) - ekk_stran_new/3.0d0 + omega_stran_new/3.0d0
            
            stran_tensor_old(1,1) = stran_tensor_old(1,1) - ekk_stran_old/3.0d0 + omega_dstran/3.0d0
            stran_tensor_old(2,2) = stran_tensor_old(2,2) - ekk_stran_old/3.0d0 + omega_dstran/3.0d0
            stran_tensor_old(3,3) = stran_tensor_old(3,3) - ekk_stran_old/3.0d0 + omega_dstran/3.0d0

            stran_new(1) = stran_tensor_new(1,1)
            stran_new(2) = stran_tensor_new(2,2)
            stran_new(3) = stran_tensor_new(3,3)
            stran_new(4) = stran_tensor_new(1,2) + stran_tensor_new(2,1)
            stran_new(5) = stran_tensor_new(1,3) + stran_tensor_new(3,1)
            stran_new(6) = stran_tensor_new(2,3) + stran_tensor_new(3,2)

            stran_old(1) = stran_tensor_old(1,1)
            stran_old(2) = stran_tensor_old(2,2)
            stran_old(3) = stran_tensor_old(3,3)
            stran_old(4) = stran_tensor_old(1,2) + stran_tensor_old(2,1)
            stran_old(5) = stran_tensor_old(1,3) + stran_tensor_old(3,1)
            stran_old(6) = stran_tensor_old(2,3) + stran_tensor_old(3,2)

            dstran = stran_new - stran_old

            ! ====================================================
            ! GREEN-LAGRANGE STRAIN (for small displacement analysis)
            ! It is probably not used by Abaqus for large displacement analysis
            ! ====================================================

            ! call calc_u_grad(u_grad_new, N_deriv_global_kinpt_new, u_node_new, ndim, nnode)
            ! call calc_u_grad(u_grad_old, N_deriv_global_kinpt_old, u_node_old, ndim, nnode)
            
            ! F_grad_new = identity + u_grad_new
            ! F_grad_old = identity + u_grad_old

            ! eps_Green_new = 0.5d0 * (matmul(transpose(F_grad_new), F_grad_new) - identity)
            ! eps_Green_old = 0.5d0 * (matmul(transpose(F_grad_old), F_grad_old) - identity)

            ! stran_new(1) = eps_Green_new(1,1)
            ! stran_new(2) = eps_Green_new(2,2)
            ! stran_new(3) = eps_Green_new(3,3)
            ! stran_new(4) = eps_Green_new(1,2) + eps_Green_new(2,1)
            ! stran_new(5) = eps_Green_new(1,3) + eps_Green_new(3,1)
            ! stran_new(6) = eps_Green_new(2,3) + eps_Green_new(3,2)

            ! stran_old(1) = eps_Green_old(1,1)
            ! stran_old(2) = eps_Green_old(2,2)
            ! stran_old(3) = eps_Green_old(3,3)
            ! stran_old(4) = eps_Green_old(1,2) + eps_Green_old(2,1)
            ! stran_old(5) = eps_Green_old(1,3) + eps_Green_old(3,1)
            ! stran_old(6) = eps_Green_old(2,3) + eps_Green_old(3,2)

            ! dstran = stran_new - stran_old

        else if (lflags(2) == 1) then
            
            print *, 'Large-displacement analysis (NLGEOM=ON)'
            ! ====================================================
            ! HENCKY STRAIN: It is strain path independent and approximates additive strains
            ! Hencky(u current) approx = Hencky(u prev) + Hencky(du current)    
            ! Abaqus Manual: In finite-strain problems the strain components have been rotated to account for 
            ! rigid body motion in the increment before UMAT is called and are approximations to logarithmic strain
            ! ====================================================
            
            ! ====================================================
            ! Right version (polar decomposition - Material)
            ! ====================================================
            
            call calc_u_grad(u_grad_new, N_deriv_global_kinpt_new, u_node_new, ndim, nnode)
            call calc_u_grad(u_grad_old, N_deriv_global_kinpt_old, u_node_old, ndim, nnode)

            F_grad_new = identity + u_grad_new
            F_grad_old = identity + u_grad_old

            F_grad_bar_new = F_grad_new * (djac_bar_new / djac_new) ** third
            F_grad_bar_old = F_grad_old * (djac_bar_old / djac_old) ** third

            call calc_matrix_inv(F_grad_old, F_grad_inv_old, ndim)
            dF_grad_bar = matmul(F_grad_bar_new, F_grad_inv_old)

            C_right_Cauchy_new = matmul(transpose(F_grad_bar_new), F_grad_bar_new)
            C_right_Cauchy_old = matmul(transpose(F_grad_bar_old), F_grad_bar_old)

            call calc_matrix_sqrt(C_right_Cauchy_new, U_right_stretch_new, ndim)
            call calc_matrix_sqrt(C_right_Cauchy_old, U_right_stretch_old, ndim)

            call calc_matrix_inv(U_right_stretch_new, U_right_stretch_inv_new, ndim)
            call calc_matrix_inv(U_right_stretch_old, U_right_stretch_inv_old, ndim)

            R_right_rotation_new = matmul(F_grad_bar_new, U_right_stretch_inv_new)
            R_right_rotation_old = matmul(F_grad_bar_old, U_right_stretch_inv_old)
            call calc_matrix_inv(R_right_rotation_old, R_right_rotation_inv_old, ndim)

            dR_right_rotation = matmul(R_right_rotation_new, R_right_rotation_inv_old)
            call calc_matrix_inv(dR_right_rotation, dR_right_rotation_inv, ndim)
            du_grad = matmul(dR_right_rotation_inv, dF_grad_bar)
            
            call calc_matrix_log(U_right_stretch_new, eps_Hencky_new, ndim)
            call calc_matrix_log(U_right_stretch_old, eps_Hencky_old, ndim)
            call calc_matrix_log(du_grad, deps_Hencky, ndim)

            ! call calc_matrix_inv(F_grad_old, F_grad_inv_old, ndim)
            ! dF_grad = matmul(F_grad_new, F_grad_inv_old)

            ! C_right_Cauchy_new = matmul(transpose(F_grad_new), F_grad_new)
            ! C_right_Cauchy_old = matmul(transpose(F_grad_old), F_grad_old)

            ! call calc_matrix_sqrt(C_right_Cauchy_new, U_right_stretch_new, ndim)
            ! call calc_matrix_sqrt(C_right_Cauchy_old, U_right_stretch_old, ndim)

            ! call calc_matrix_inv(U_right_stretch_new, U_right_stretch_inv_new, ndim)
            ! call calc_matrix_inv(U_right_stretch_old, U_right_stretch_inv_old, ndim)

            ! R_right_rotation_new = matmul(F_grad_new, U_right_stretch_inv_new)
            ! R_right_rotation_old = matmul(F_grad_old, U_right_stretch_inv_old)
            ! call calc_matrix_inv(R_right_rotation_old, R_right_rotation_inv_old, ndim)

            ! dR_right_rotation = matmul(R_right_rotation_new, R_right_rotation_inv_old)
            ! call calc_matrix_inv(dR_right_rotation, dR_right_rotation_inv, ndim)
            ! du_grad = matmul(dR_right_rotation_inv, dF_grad)
            
            ! call calc_matrix_log(U_right_stretch_new, eps_Hencky_new, ndim)
            ! call calc_matrix_log(U_right_stretch_old, eps_Hencky_old, ndim)
            ! call calc_matrix_log(du_grad, deps_Hencky, ndim)

            stran_new(1) = eps_Hencky_new(1,1)
            stran_new(2) = eps_Hencky_new(2,2)
            stran_new(3) = eps_Hencky_new(3,3)
            stran_new(4) = eps_Hencky_new(1,2) + eps_Hencky_new(2,1)
            stran_new(5) = eps_Hencky_new(1,3) + eps_Hencky_new(3,1)
            stran_new(6) = eps_Hencky_new(2,3) + eps_Hencky_new(3,2)

            stran_old(1) = eps_Hencky_old(1,1)
            stran_old(2) = eps_Hencky_old(2,2)
            stran_old(3) = eps_Hencky_old(3,3)
            stran_old(4) = eps_Hencky_old(1,2) + eps_Hencky_old(2,1)
            stran_old(5) = eps_Hencky_old(1,3) + eps_Hencky_old(3,1)
            stran_old(6) = eps_Hencky_old(2,3) + eps_Hencky_old(3,2)
            
            ! Replace volumetric strain with average volumetric strain

            ! ekk_stran_new = stran_new(1) + stran_new(2) + stran_new(3)
            ! ekk_stran_old = stran_old(1) + stran_old(2) + stran_old(3)

            ! stran_new(1) = stran_new(1) - ekk_stran_new/3.0d0 + omega_hencky_stran_new/3.0d0
            ! stran_new(2) = stran_new(2) - ekk_stran_new/3.0d0 + omega_hencky_stran_new/3.0d0
            ! stran_new(3) = stran_new(3) - ekk_stran_new/3.0d0 + omega_hencky_stran_new/3.0d0

            ! stran_old(1) = stran_old(1) - ekk_stran_old/3.0d0 + omega_hencky_stran_old/3.0d0
            ! stran_old(2) = stran_old(2) - ekk_stran_old/3.0d0 + omega_hencky_stran_old/3.0d0
            ! stran_old(3) = stran_old(3) - ekk_stran_old/3.0d0 + omega_hencky_stran_old/3.0d0

            ! dstran(1) = deps_Hencky(1,1)
            ! dstran(2) = deps_Hencky(2,2)
            ! dstran(3) = deps_Hencky(3,3)
            ! dstran(4) = deps_Hencky(1,2) + deps_Hencky(2,1)
            ! dstran(5) = deps_Hencky(1,3) + deps_Hencky(3,1)
            ! dstran(6) = deps_Hencky(2,3) + deps_Hencky(3,2)

            ! or 

            dstran = stran_new - stran_old

            ! ====================================================
            ! Left version (polar decomposition - Spatial)
            ! ====================================================

            ! call calc_u_grad(u_grad_new, N_deriv_global_kinpt_new, u_node_new, ndim, nnode)
            ! call calc_u_grad(u_grad_old, N_deriv_global_kinpt_old, u_node_old, ndim, nnode)

            ! F_grad_new = identity + u_grad_new
            ! F_grad_old = identity + u_grad_old
            ! call calc_matrix_inv(F_grad_old, F_grad_inv_old, ndim)
            ! dF_grad = matmul(F_grad_new, F_grad_inv_old)

            ! b_left_Cauchy_new = matmul(F_grad_new, transpose(F_grad_new))
            ! b_left_Cauchy_old = matmul(F_grad_old, transpose(F_grad_old))

            ! call calc_matrix_sqrt(b_left_Cauchy_new, v_left_stretch_new, ndim)
            ! call calc_matrix_sqrt(b_left_Cauchy_old, v_left_stretch_old, ndim)

            ! call calc_matrix_inv(v_left_stretch_new, v_left_stretch_inv_new, ndim)
            ! call calc_matrix_inv(v_left_stretch_old, v_left_stretch_inv_old, ndim)

            ! R_left_rotation_new = matmul(v_left_stretch_inv_new, F_grad_new)
            ! R_left_rotation_old = matmul(v_left_stretch_inv_old, F_grad_old)
            ! ! Since R is orthogonal, R^T = R^-1
            ! call calc_matrix_inv(R_left_rotation_old, R_left_rotation_inv_old, ndim)
            ! dR_left_rotation = matmul(R_left_rotation_new, R_left_rotation_inv_old)

            ! call calc_matrix_inv(dR_left_rotation, dR_left_rotation_inv, ndim)
            ! du_grad = matmul(dR_left_rotation_inv, dF_grad)


            ! call calc_matrix_log(v_left_stretch_new, eps_Hencky_new, ndim)
            ! call calc_matrix_log(v_left_stretch_old, eps_Hencky_old, ndim)
            ! call calc_matrix_log(du_grad, deps_Hencky, ndim)

            ! stran_new(1) = eps_Hencky_new(1,1)
            ! stran_new(2) = eps_Hencky_new(2,2)
            ! stran_new(3) = eps_Hencky_new(3,3)
            ! stran_new(4) = eps_Hencky_new(1,2) + eps_Hencky_new(2,1)
            ! stran_new(5) = eps_Hencky_new(1,3) + eps_Hencky_new(3,1)
            ! stran_new(6) = eps_Hencky_new(2,3) + eps_Hencky_new(3,2)

            ! stran_old(1) = eps_Hencky_old(1,1)
            ! stran_old(2) = eps_Hencky_old(2,2)
            ! stran_old(3) = eps_Hencky_old(3,3)
            ! stran_old(4) = eps_Hencky_old(1,2) + eps_Hencky_old(2,1)
            ! stran_old(5) = eps_Hencky_old(1,3) + eps_Hencky_old(3,1)
            ! stran_old(6) = eps_Hencky_old(2,3) + eps_Hencky_old(3,2)
            
            ! ! dstran(1) = deps_Hencky(1,1)
            ! ! dstran(2) = deps_Hencky(2,2)
            ! ! dstran(3) = deps_Hencky(3,3)
            ! ! dstran(4) = deps_Hencky(1,2) + deps_Hencky(2,1)
            ! ! dstran(5) = deps_Hencky(1,3) + deps_Hencky(3,1)
            ! ! dstran(6) = deps_Hencky(2,3) + deps_Hencky(3,2)
            
            ! dstran = stran_new - stran_old

        end if

        ! ==================================================== !
        ! Calculate deformation field (stress and strain, etc) !
        ! ==================================================== !
                        
        stress = statev(sig_start_idx : sig_end_idx)
        
        if (lflags(2) == 0) then
            if (UMAT_choice == 1) then
                call UMAT_elastic(stress,statev,ddsdde,stran_old,dstran,time,dtime, &
                                  ndi,nshr,ntens,ndim,nstatv,props,nprops,identity, &
                                  identity,identity,jelem,kinpt,kstep,kinc)
            else if (UMAT_choice == 2) then
                call UMAT_von_Mises(stress,statev,ddsdde,stran_old,dstran,time,dtime, &
                                    ndi,nshr,ntens,ndim,nstatv,props,nprops,identity, &
                                    identity,identity,jelem,kinpt,kstep,kinc)
            end if
        
        else if (lflags(2) == 1) then
            
            if (UMAT_choice == 1) then
                call UMAT_elastic(stress,statev,ddsdde,stran_old,dstran,time,dtime, &
                                  ndi,nshr,ntens,ndim,nstatv,props,nprops,dR_right_rotation, &
                                  F_grad_old,F_grad_new,jelem,kinpt,kstep,kinc)
            
            else if (UMAT_choice == 2) then
                call UMAT_von_Mises(stress,statev,ddsdde,stran_old,dstran,time,dtime, &
                                    ndi,nshr,ntens,ndim,nstatv,props,nprops,dR_right_rotation, &
                                    F_grad_old,F_grad_new,jelem,kinpt,kstep,kinc)
                !  call UMAT_von_Mises(stress,statev,ddsdde,stran_old,dstran,time,dtime, &
                !                 ndi,nshr,ntens,ndim,nstatv,props,nprops,dR_left_rotation, &
                !                 F_grad_old,F_grad_new,jelem,kinpt,kstep,kinc)
            end if
           
        end if

        ! Update the state variables
        ! eelas, eplas, eqplas, deqplas, sig_vonMises, sig_H are already updated in statev in UMAT_von_Mises
        statev(sig_start_idx : sig_end_idx) = stress
        statev(stran_start_idx : stran_end_idx) = stran_new
        
        call calc_stress_invariants(stress, ntens, invariant_p, invariant_q, invariant_r)
        call calc_triaxiality(invariant_p, invariant_q, triaxiality)
        call calc_normalized_lode(invariant_r, invariant_q, lode_norm)
        
        ! Update the other SDVs
        statev(triax_idx) = triaxiality
        statev(lode_idx) = lode_norm
        

        ! ********************************************!
        ! DISPLACEMENT CONTRIBUTION TO amatrx AND rhs !
        ! ********************************************!

        ! 3D case
        ! 8 nodes x 3 displacement dofs ux, uy, uz = 24

        amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) = &
            amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) + dvol_new * &
                               (matmul(matmul(transpose(Bu_bar_new),ddsdde),Bu_bar_new))
            
        rhs(start_u_idx:end_u_idx,1) = rhs(start_u_idx:end_u_idx,1) - &
            dvol_new * (matmul(transpose(Bu_bar_new),stress))    
        

        ! ================================================================== !
        !                                                                    !
        !                    SOLVING THE DIFFUSION FIELD                     !
        !                                                                    !
        ! ================================================================== !
        
        ! Variables to be defined
        ! u_heat_new: Internal thermal energy per unit mass, U, at the end of increment. 
        !         This variable is passed in as the value at the start of the increment (u_heat_old)
        !         and must be updated to its value at the end of the increment.
        ! dudt_heat: Variation of internal thermal energy per unit mass with respect to temperature, 
        !         ∂U/∂θ, evaluated at the end of the increment.
        ! dudg_heat(ndim): Variation of internal thermal energy per unit mass with respect to the 
        !           spatial gradients of temperature, ∂U/∂(∂θ/∂x), evaluated at the end of the increment.
        !           The size of this array depends on ndim and it is typically zero in classical heat transfer analysis.
        ! flux_heat(ndim): Heat flux vector at the end of the increment. 
        !            This variable is passed in with the values at the beginning of the increment and 
        !            must be updated to the values at the end of the increment.
        ! dfdt(ndim): Variation of the heat flux vector with respect to temperature, 
        !        ∂q/∂θ, evaluated at the end of the increment.
        ! dfdg(ndim,ndim): Variation of the heat flux vector with respect to the spatial gradients of temperature,
        !        ∂f/∂(∂θ/∂x), evaluated at the end of the increment.

        ! Variables passed in for Information
        ! temp_kinpt_old: Temperature at the start of the increment.
        ! dtemp_kinpt: Increment of temperature.
        ! dtemdx_kinpt_new: Current values of the spatial gradients of temperature, ∂θ/∂x.
        ! u_heat_old is at the beginning of the increment
      
        ! For diffusion field

        temp_node_new(1:nnode) = u(start_temp_idx:end_temp_idx)
        dtemp_node(1:nnode) = du(start_temp_idx:end_temp_idx, 1)
        temp_node_old(1:nnode) = temp_node_new(1:nnode) - dtemp_node(1:nnode)

        rho_heat = props(before_hydro_props_idx + 1) ! It must be 1 if hydrogen diffusion analogy is used
        cp_heat = props(before_hydro_props_idx + 2) ! It must be 1 if hydrogen diffusion analogy is used

        N_shape_node_to_kinpt(1:nnode) = all_N_shape_node_to_kinpt(kinpt,1:nnode)
        N_deriv_local_kinpt(1:ndim,1:nnode) = all_N_deriv_local_kinpt(kinpt,1:ndim,1:nnode)

        call kjacobian(ndim,nnode,mcrd,coords_new,N_deriv_local_kinpt, &
                        xjac_new,xjaci_new,djac_new)

        dvol_new = weight(kinpt) * djac_new
        
        N_deriv_global_kinpt_new = matmul(xjaci_new,N_deriv_local_kinpt)

        ! temp_kinpt_old, dtemp_kinpt, dtemdx_kinpt_new, u_heat are all defined at integration points

        temp_kinpt_old = dot_product(N_shape_node_to_kinpt, temp_node_old)
        temp_kinpt_new = dot_product(N_shape_node_to_kinpt, temp_node_new)
        dtemp_kinpt = dot_product(N_shape_node_to_kinpt, temp_node_new - temp_node_old)
        
        ! The internal energy of ideal gas
        u_heat_old = cp_heat * temp_kinpt_old

        dtemdx_kinpt_new = matmul(N_deriv_global_kinpt_new, temp_node_new)

        call UMATHT_diffusion(u_heat_old,u_heat_new,dudt_heat,dudg_heat,flux_heat,dfdt_heat,dfdg_heat, &
                              temp_kinpt_old,dtemp_kinpt,dtemdx_kinpt_new,time,dtime,ndim, &
                              statev,nstatv,props,nprops,jelem,kinpt,kstep,kinc)

        ! In our equation, we have du_heat = u_heat_new - u_heat_old
        ! Then we also have the remaining value, which is dr_heat = du_heat - dudt_heat
        
        du_heat = u_heat_new - u_heat_old
        dr_heat = du_heat - dudt_heat

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, 1) @ (1, nnode)
        dfdt_contribution    = - matmul( &
                                        matmul(transpose(N_deriv_global_kinpt_new), & 
                                        reshape(dfdt_heat, (/ndim, 1/))), & 
                                        reshape(N_shape_node_to_kinpt, (/1, nnode/)) &
                                        )

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, ndim) @ (ndim, nnode)
        dfdg_contribution    = - matmul(matmul(transpose(N_deriv_global_kinpt_new), dfdg_heat), N_deriv_global_kinpt_new)
        
        ! (nnode, nnode) = (nnode, 1) @ (1, nnode)
        dudt_contribution    = + matmul(&
                                        reshape(N_shape_node_to_kinpt * dudt_heat, (/nnode, 1/)), &
                                        reshape(N_shape_node_to_kinpt, (/1, nnode/)) &
                                        )
        
        ! (nnode, nnode) = (nnode, 1) @ (1, ndim) @ (ndim, nnode)
        dudg_contribution    = + matmul(matmul( &
                                        reshape(N_shape_node_to_kinpt, (/nnode, 1/)), &
                                        reshape(dudg_heat, (/1, ndim/)) &
                                        ), N_deriv_global_kinpt_new)

        ! (nnode) = (nnode) * scalar : (nnode)
        dudt_heat_contribution = + N_shape_node_to_kinpt * dudt_heat * (dtemp_node/dtime)
        
        ! (nnode) = (nnode) * scalar : (nnode)
        dr_heat_contribution   = + N_shape_node_to_kinpt * dr_heat * temp_node_new
        
        ! (nnode) = (nnode, ndim) @ (ndim)
        flux_contribution      = + matmul(transpose(N_deriv_global_kinpt_new), flux_heat)
        
        M_capacitance = dudt_contribution + dudg_contribution
        
        K_conductivity = dfdt_contribution + dfdg_contribution
        
        f_node_heat = dudt_heat_contribution + dr_heat_contribution + flux_contribution
        
        ! Galerkin representation of the transient heat transfer equation
        ! K_conductivity * dtemp_node_new + M_capacitance * dtemp_node_new/dtemp = f_node_heat
        ! => (K_conductivity * M_capacitance /dtime) * dtemp_node_new = f_node_heat

        ! **************************************************!
        ! HYDROGEN DIFFUSION CONTRIBUTION TO amatrx AND rhs !
        ! **************************************************!

        ! 3D case
        ! 8 nodes x 1 heat concentration dof = 8

        amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) = &
            amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) &
            + dvol_new * (K_conductivity + M_capacitance/dtime)
            
        rhs(start_temp_idx:end_temp_idx,1) = rhs(start_temp_idx:end_temp_idx,1) &
            - dvol_new * f_node_heat
        
        ! M_capacitance = matmul(transpose(N_shape_node_to_kinpt),N_shape_node_to_kinpt)/DL
        ! BB = matmul(transpose(B_deriv_global),B_deriv_global)

        ! K_conductivity = BB - VH/(R*T) * matmul(BB,matmul((sig_H_node * softened_factor),N_shape_node_to_kinpt))

        ! K_heat_sum = K_conductivity + K_convectivity
        ! f_boundary_heat_flux = 0.0d0
        ! f_heat_flux = 0.0d0
        ! f_heat_sum = f_heat_source + f_boundary_heat_flux + f_heat_flux

        ! amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) = &
        !     amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) &
        !     +dvol * (M_capacitance/dtime + K_conductivity)
            
        ! rhs(start_temp_idx:end_temp_idx,1) = rhs(start_temp_idx:end_temp_idx,1) - &
        !     dvol * (matmul(K_conductivity,temp_node_new) + &
        !             matmul(M_capacitance,dtemp_node)/dtime)
        
        

        ! ================================================================== !
        !                                                                    !
        !                    TRANSFERRING DATA STAGE                         !
        !                                                                    !
        ! ================================================================== !

        !   Transfer data from statev to svars
        !   This stage basically updates the state variables for the current element in UEL
        
        call kstatevar(kinpt,nstatv,svars,statev,0)
        
        !   Transfer data from statev to dummy mesh for visualization
        
        user_vars(jelem,1:nstatv,kinpt) = statev(1:nstatv)
        
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