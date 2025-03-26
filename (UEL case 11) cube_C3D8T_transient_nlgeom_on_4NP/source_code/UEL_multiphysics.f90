!===========================================================================
!   UEL-Multiphysics: A user element for generalized coupled field problems
!
!   Author:        Nguyen Xuan Binh
!   Affiliation:   Aalto University
!   Contact:       binh.nguyen@aalto.fi
!   Date:          July 2024
!
!   Description:
!   This program simulates advanced multiphysics problems involving:
!
!   ▸ Mechanical field:
!       - Hookean elasticity
!       - Isotropic von Mises plasticity
!
!   ▸ Thermal field:
!       - Transient heat conduction
!
!   ▸ Mass diffusion field (hydrogen):
!       - Fick's Second Law with Oriani's theory
!
!   ▸ Damage field:
!       - Phase-field damage model based on Griffith's thermodynamics
!
!   Structure:
!       Each field is implemented independently but solved in a monolithic
!       framework for tightly coupled multiphysics interaction.
!
!   Inspiration: Emilio Martinez (for modular field architecture)
!
!===========================================================================


!***********************************************************************

! To ensure that the code are optimized, we should avoid
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

include 'userinputs.f90'

include 'utilities.f90'

!***********************************************************************

module common_block
    use precision
    use userinputs
    implicit none

    ! First dim: maximum number of elements to accomodate varying number of elements when remeshed
    ! Second dim: number of state dependent variables (nstatev in UMAT/UMATHT)
    ! Third dim: number of integration points

    real(kind=dp) :: user_vars(100000, nsvint, ninpt)

    ! This stores the IP coordinates at previous increment
    real(kind=dp) :: coords_all_inpts(total_elems, ninpt, ndim) ! (total_elems, ninpt, ndim)

    ! This stores the nodal coordinates at previous increment
    real(kind=dp) :: coords_all_nodes(total_nodes, ndim) ! (total_nodes, ndim)

    ! First dim: number of elements in the mesh
    ! Second dim: number of nodes in the element
    ! Since all elements must have 8 nodes, it does not need to be padded
    ! The nodes are also in their correct order as well from knode to 1 to 8
    
    integer :: elems_to_nodes_matrix(total_elems, nnode) ! 8 is nnode

    ! First dim: number of nodes on the mesh
    ! Second dim: maximum number of elements that contains the node in the first dim
    ! In meshing algorithm in FEA softwares lie Abaqus that used hexahedral, nmax_elems for C3D8 is proven to be 10
    ! Third dim: first value tells the element ID that contains this node
    !            second value tells the ith position of the node in this element ID
    ! When this node does not have nmax_elems containing it, all others are padded with 0

    ! Example: Lets say element of ID 10, 20, 30, 40 contains node of ID 7
    !          In element 10, node 7 is at position 1
    !          In element 20, node 7 is at position 6
    !          In element 30, node 7 is at position 3
    !          In element 40, node 7 is at position 5

    ! Then nodes_to_elems_matrix(7, 1, 1) = 10
    !      nodes_to_elems_matrix(7, 1, 2) = 1
    !      nodes_to_elems_matrix(7, 2, 1) = 20
    !      nodes_to_elems_matrix(7, 2, 2) = 6
    !      nodes_to_elems_matrix(7, 3, 1) = 30
    !      nodes_to_elems_matrix(7, 3, 2) = 3
    !      nodes_to_elems_matrix(7, 4, 1) = 40
    !      nodes_to_elems_matrix(7, 4, 2) = 5
    !      nodes_to_elems_matrix(7, 5:8, 1:2) = 0

    integer :: nodes_to_elems_matrix(total_nodes, nmax_elems, 2) ! nmax_elems = 20

    integer :: num_elems_of_nodes_matrix(total_nodes) ! Number of elements that contain the node
    
    real(kind=dp) :: all_N_shape_IP_to_kNP(nnode, ninpt) ! (nnode, ninpt)
    real(kind=dp) :: all_N_shape_NP_to_kIP(ninpt, nnode) ! (ninpt, nnode)
    real(kind=dp) :: all_N_grad_NP_to_kIP_local(ninpt, ndim, nnode)  ! (ninpt, ndim, nnode)
    real(kind=dp) :: all_N_grad_NP_to_kNP_local(nnode, ndim, nnode)
  ! (nnode, ndim, nnode)

    ! This stores the determinant of Jacobian matrix of all nodes based on coordinates of the previous increment
    real(kind=dp) :: djac_all_elems_at_nodes(total_elems, nnode) ! (total_elems, nnode)

    ! This matrix keeps tract of all sig_H and eqplas at IPs for all elements as computed from UMAT
    real(kind=dp) :: sig_H_all_elems_at_inpts(total_elems, ninpt) ! (total_elems, ninpt)
    real(kind=dp) :: eqplas_all_elems_at_inpts(total_elems, ninpt) ! (total_elems, ninpt)
    real(kind=dp) :: temp_all_elems_at_inpts(total_elems, ninpt) ! (total_elems, ninpt)

    ! This matrix keeps track of extrapolated sig_H and eqplas from IP onto nodal points for all elements
    real(kind=dp) :: sig_H_all_elems_at_nodes(total_elems, nnode) ! (total_elems, nnode)
    real(kind=dp) :: eqplas_all_elems_at_nodes(total_elems, nnode) ! (total_elems, nnode)
    real(kind=dp) :: temp_all_elems_at_nodes(total_elems, nnode) ! (total_elems, nnode)

    ! This matrix keeps track of the gradient of sig_H and eqplas from IP onto nodal points for all elements
    ! Gradient of sig_H is needed for hydrogen diffusion model
    ! Gradient of eqplas is needed for strain gradient plasticity model

    real(kind=dp) :: sig_H_grad_all_elems_at_inpts(total_elems, ninpt, ndim) ! (total_elems, ninpt, ndim)
    real(kind=dp) :: eqplas_grad_all_elems_at_inpts(total_elems, ninpt, ndim) ! (total_elems, ninpt, ndim)
    real(kind=dp) :: temp_grad_all_elems_at_inpts(total_elems, ninpt, ndim) ! (total_elems, ninpt, ndim)

    ! Finally, this matrix keeps track of the average sig_H and eqplas at each node from the elements
    ! that contain the node. The average is weighted based on change of volume 
    ! (determinant of Jacobian matrix)

    real(kind=dp) :: sig_H_at_nodes(total_nodes) ! (total_nodes)
    real(kind=dp) :: eqplas_at_nodes(total_nodes) ! (total_nodes, ndim)
    real(kind=dp) :: temp_at_nodes(total_nodes) ! (total_nodes)

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
    real(kind=dp), parameter :: weight(8) = [1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0]
    
    ! Interpolating coordinates (nodal to int)
    ! Isoparametric coordinates for nodal points in hexahedral 3D element
    real(kind=dp), parameter :: xi_nodal_inter(8)   = [ -coord_inter,  coord_inter,  coord_inter, -coord_inter, &
                                                         -coord_inter,  coord_inter,  coord_inter, -coord_inter ]
    real(kind=dp), parameter :: eta_nodal_inter(8)  = [ -coord_inter, -coord_inter,  coord_inter,  coord_inter, &
                                                         -coord_inter, -coord_inter,  coord_inter,  coord_inter ]
    real(kind=dp), parameter :: zeta_nodal_inter(8) = [ -coord_inter, -coord_inter, -coord_inter, -coord_inter, &
                                                          coord_inter,  coord_inter,  coord_inter,  coord_inter ]

    ! Isoparametric coordinates for integration points in hexahedral 3D element
    real(kind=dp), parameter :: xi_int_inter(8)   = [ -int_inter,  int_inter, -int_inter,  int_inter, &
                                                       -int_inter,  int_inter, -int_inter,  int_inter ]
    real(kind=dp), parameter :: eta_int_inter(8)  = [ -int_inter, -int_inter,  int_inter,  int_inter, &
                                                       -int_inter, -int_inter,  int_inter,  int_inter ]
    real(kind=dp), parameter :: zeta_int_inter(8) = [ -int_inter, -int_inter, -int_inter, -int_inter, &
                                                        int_inter,  int_inter,  int_inter,  int_inter ]

    ! Extrapolating coordinates (int to nodal)
    real(kind=dp), parameter :: xi_nodal_extra(8)   = [ -coord_extra,  coord_extra,  coord_extra, -coord_extra, &
                                                         -coord_extra,  coord_extra,  coord_extra, -coord_extra ]
    real(kind=dp), parameter :: eta_nodal_extra(8)  = [ -coord_extra, -coord_extra,  coord_extra,  coord_extra, &
                                                         -coord_extra, -coord_extra,  coord_extra,  coord_extra ]
    real(kind=dp), parameter :: zeta_nodal_extra(8) = [ -coord_extra, -coord_extra, -coord_extra, -coord_extra, &
                                                          coord_extra,  coord_extra,  coord_extra,  coord_extra ]

    real(kind=dp), parameter :: xi_int_extra(8)   = [ -int_extra,  int_extra, -int_extra,  int_extra, &
                                                       -int_extra,  int_extra, -int_extra,  int_extra ]
    real(kind=dp), parameter :: eta_int_extra(8)  = [ -int_extra, -int_extra,  int_extra,  int_extra, &
                                                       -int_extra, -int_extra,  int_extra,  int_extra ]
    real(kind=dp), parameter :: zeta_int_extra(8) = [ -int_extra, -int_extra, -int_extra, -int_extra, &
                                                        int_extra,  int_extra,  int_extra,  int_extra ]

end module iso_module


subroutine calc_N_shape_IP_to_kNP(xi_node, eta_node, zeta_node, N_shape_IP_to_kNP)
    ! Calculate the shape function at the nodal points
    ! xi_node, eta_node, zeta_node: Isoparametric coordinates of the nodal points

    use precision
    real(kind=dp), dimension(8) :: N_shape_IP_to_kNP ! ninpt
    real(kind=dp) :: xi_node, eta_node, zeta_node

    !   shape functions
    N_shape_IP_to_kNP(1) = 0.125d0 * (1.0d0 - xi_node) * (1.0d0 - eta_node) * (1.0d0 - zeta_node)
    N_shape_IP_to_kNP(2) = 0.125d0 * (1.0d0 + xi_node) * (1.0d0 - eta_node) * (1.0d0 - zeta_node)
    N_shape_IP_to_kNP(3) = 0.125d0 * (1.0d0 - xi_node) * (1.0d0 + eta_node) * (1.0d0 - zeta_node)
    N_shape_IP_to_kNP(4) = 0.125d0 * (1.0d0 + xi_node) * (1.0d0 + eta_node) * (1.0d0 - zeta_node)
    N_shape_IP_to_kNP(5) = 0.125d0 * (1.0d0 - xi_node) * (1.0d0 - eta_node) * (1.0d0 + zeta_node)
    N_shape_IP_to_kNP(6) = 0.125d0 * (1.0d0 + xi_node) * (1.0d0 - eta_node) * (1.0d0 + zeta_node)
    N_shape_IP_to_kNP(7) = 0.125d0 * (1.0d0 - xi_node) * (1.0d0 + eta_node) * (1.0d0 + zeta_node)
    N_shape_IP_to_kNP(8) = 0.125d0 * (1.0d0 + xi_node) * (1.0d0 + eta_node) * (1.0d0 + zeta_node)

return
end

subroutine calc_N_shape_NP_to_kIP(xi_int, eta_int, zeta_int, N_shape_NP_to_kIP)
    ! Calculate the shape function at the integration points
    ! xi_int, eta_int, zeta_int: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(8) :: N_shape_NP_to_kIP ! nnode
    real(kind=dp) :: xi_int, eta_int, zeta_int

    !   shape functions
    N_shape_NP_to_kIP(1)=0.125d0 * (1.0d0 - xi_int) * (1.0d0 - eta_int) * (1.0d0 - zeta_int)
    N_shape_NP_to_kIP(2)=0.125d0 * (1.0d0 + xi_int) * (1.0d0 - eta_int) * (1.0d0 - zeta_int)
    N_shape_NP_to_kIP(3)=0.125d0 * (1.0d0 + xi_int) * (1.0d0 + eta_int) * (1.0d0 - zeta_int)
    N_shape_NP_to_kIP(4)=0.125d0 * (1.0d0 - xi_int) * (1.0d0 + eta_int) * (1.0d0 - zeta_int)
    N_shape_NP_to_kIP(5)=0.125d0 * (1.0d0 - xi_int) * (1.0d0 - eta_int) * (1.0d0 + zeta_int)
    N_shape_NP_to_kIP(6)=0.125d0 * (1.0d0 + xi_int) * (1.0d0 - eta_int) * (1.0d0 + zeta_int)
    N_shape_NP_to_kIP(7)=0.125d0 * (1.0d0 + xi_int) * (1.0d0 + eta_int) * (1.0d0 + zeta_int)
    N_shape_NP_to_kIP(8)=0.125d0 * (1.0d0 - xi_int) * (1.0d0 + eta_int) * (1.0d0 + zeta_int)

return
end

subroutine calc_N_grad_NP_to_kIP_local(xi_int, eta_int, zeta_int, N_grad_NP_to_kIP_local)
    ! Calculate the shape function derivative at the integration points
    ! Basically derivatives of calc_N_shape_NP_to_kIP
    ! N_grad_NP_to_kIP_local: (ninpt, ndim, nnode)
    ! xi_int, eta_int, zeta_int: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(3, 8) :: N_grad_NP_to_kIP_local ! (ndim, nnode)
    real(kind=dp) :: xi_int, eta_int, zeta_int

    !   derivative d(Ni)/d(xi_int)
    N_grad_NP_to_kIP_local(1, 1) = -0.125d0 * (1.0d0 - eta_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(1, 2) =  0.125d0 * (1.0d0 - eta_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(1, 3) =  0.125d0 * (1.0d0 + eta_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(1, 4) = -0.125d0 * (1.0d0 + eta_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(1, 5) = -0.125d0 * (1.0d0 - eta_int) * (1.0d0 + zeta_int)
    N_grad_NP_to_kIP_local(1, 6) =  0.125d0 * (1.0d0 - eta_int) * (1.0d0 + zeta_int)
    N_grad_NP_to_kIP_local(1, 7) =  0.125d0 * (1.0d0 + eta_int) * (1.0d0 + zeta_int)
    N_grad_NP_to_kIP_local(1, 8) = -0.125d0 * (1.0d0 + eta_int) * (1.0d0 + zeta_int)

    !     derivative d(Ni)/d(eta_int)
    N_grad_NP_to_kIP_local(2, 1) = -0.125d0 * (1.0d0 - xi_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(2, 2) = -0.125d0 * (1.0d0 + xi_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(2, 3) =  0.125d0 * (1.0d0 + xi_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(2, 4) =  0.125d0 * (1.0d0 - xi_int) * (1.0d0 - zeta_int)
    N_grad_NP_to_kIP_local(2, 5) = -0.125d0 * (1.0d0 - xi_int) * (1.0d0 + zeta_int)
    N_grad_NP_to_kIP_local(2, 6) = -0.125d0 * (1.0d0 + xi_int) * (1.0d0 + zeta_int)
    N_grad_NP_to_kIP_local(2, 7) =  0.125d0 * (1.0d0 + xi_int) * (1.0d0 + zeta_int)
    N_grad_NP_to_kIP_local(2, 8) =  0.125d0 * (1.0d0 - xi_int) * (1.0d0 + zeta_int)

    !     derivative d(Ni)/d(zeta_int)
    N_grad_NP_to_kIP_local(3, 1) = -0.125d0 * (1.0d0 - xi_int) * (1.0d0 - eta_int)
    N_grad_NP_to_kIP_local(3, 2) = -0.125d0 * (1.0d0 + xi_int) * (1.0d0 - eta_int)
    N_grad_NP_to_kIP_local(3, 3) = -0.125d0 * (1.0d0 + xi_int) * (1.0d0 + eta_int)
    N_grad_NP_to_kIP_local(3, 4) = -0.125d0 * (1.0d0 - xi_int) * (1.0d0 + eta_int)
    N_grad_NP_to_kIP_local(3, 5) =  0.125d0 * (1.0d0 - xi_int) * (1.0d0 - eta_int)
    N_grad_NP_to_kIP_local(3, 6) =  0.125d0 * (1.0d0 + xi_int) * (1.0d0 - eta_int)
    N_grad_NP_to_kIP_local(3, 7) =  0.125d0 * (1.0d0 + xi_int) * (1.0d0 + eta_int)
    N_grad_NP_to_kIP_local(3, 8) =  0.125d0 * (1.0d0 - xi_int) * (1.0d0 + eta_int)

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
    
    real(kind=dp), dimension(ninpt) :: N_shape_IP_to_kNP
    real(kind=dp), dimension(nnode) :: N_shape_NP_to_kIP
    real(kind=dp), dimension(ndim, nnode) :: N_grad_NP_to_kIP_local


    ! LOP=0 indicates that the subroutine is being called at the start of the analysis.
    if (lop == 0) then 
        call mutexInit(1)

        call mutexLock(1)
        
        do inode = 1, nnode
            xi_node = xi_nodal_extra(inode)
            eta_node = eta_nodal_extra(inode)
            zeta_node = zeta_nodal_extra(inode)

            call calc_N_shape_IP_to_kNP(xi_node, eta_node, zeta_node, N_shape_IP_to_kNP)
            all_N_shape_IP_to_kNP(inode, 1:ninpt) = N_shape_IP_to_kNP

        end do      

        do kinpt = 1, ninpt

        !   determine (g,h,r)
            xi_int = xi_int_inter(kinpt)
            eta_int = eta_int_inter(kinpt)
            zeta_int = zeta_int_inter(kinpt)

            call calc_N_shape_NP_to_kIP(xi_int, eta_int, zeta_int, N_shape_NP_to_kIP)
            all_N_shape_NP_to_kIP(kinpt, 1:nnode) = N_shape_NP_to_kIP(1:nnode)

            call calc_N_grad_NP_to_kIP_local(xi_int, eta_int, zeta_int, N_grad_NP_to_kIP_local)
            all_N_grad_NP_to_kIP_local(kinpt,1:ndim,1:nnode) = N_grad_NP_to_kIP_local(1:ndim,1:nnode)

        end do

        ! 
        call mutexUnlock(1)
        
    end if

return
end

! Bbar technique

subroutine kbmatrix_full(N_grad_NP_to_kIP_global,ntens,nnode,ndim,Bu_kIP)
    !   Full strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_to_kIP_global
    real(kind=dp), dimension(ntens, ndim * nnode) :: Bu_kIP
    integer :: current_node_idx
    
    Bu_kIP = 0.0d0
    
    do knode=1,nnode
        current_node_idx = ndim * knode - ndim
        ! Normal components
        Bu_kIP(1,current_node_idx+1) = N_grad_NP_to_kIP_global(1,knode)
        Bu_kIP(2,current_node_idx+2) = N_grad_NP_to_kIP_global(2,knode)
        Bu_kIP(3,current_node_idx+3) = N_grad_NP_to_kIP_global(3,knode)
        ! Shear components
        Bu_kIP(4,current_node_idx+1) = N_grad_NP_to_kIP_global(2,knode)
        Bu_kIP(4,current_node_idx+2) = N_grad_NP_to_kIP_global(1,knode)
        Bu_kIP(5,current_node_idx+1) = N_grad_NP_to_kIP_global(3,knode)
        Bu_kIP(5,current_node_idx+3) = N_grad_NP_to_kIP_global(1,knode)
        Bu_kIP(6,current_node_idx+2) = N_grad_NP_to_kIP_global(3,knode)
        Bu_kIP(6,current_node_idx+3) = N_grad_NP_to_kIP_global(2,knode)
        
    end do

return
end


subroutine kbmatrix_vol(N_grad_NP_to_kIP_global,ntens,nnode,ndim,Bu_vol_kIP)

    !   Volumetric strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_to_kIP_global
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_vol_kIP
    integer :: current_node_idx
    
    Bu_vol_kIP = 0.0d0
    
    ! Loop through each node
    do knode = 1, nnode
        ! Normal strain components in e11, e22, e33
        current_node_idx = ndim * knode - ndim
        Bu_vol_kIP(1,current_node_idx+1) = N_grad_NP_to_kIP_global(1, knode)
        Bu_vol_kIP(1,current_node_idx+2) = N_grad_NP_to_kIP_global(2, knode)
        Bu_vol_kIP(1,current_node_idx+3) = N_grad_NP_to_kIP_global(3, knode)
        Bu_vol_kIP(2,current_node_idx+1) = N_grad_NP_to_kIP_global(1, knode)
        Bu_vol_kIP(2,current_node_idx+2) = N_grad_NP_to_kIP_global(2, knode)
        Bu_vol_kIP(2,current_node_idx+3) = N_grad_NP_to_kIP_global(3, knode)
        Bu_vol_kIP(3,current_node_idx+1) = N_grad_NP_to_kIP_global(1, knode)
        Bu_vol_kIP(3,current_node_idx+2) = N_grad_NP_to_kIP_global(2, knode)
        Bu_vol_kIP(3,current_node_idx+3) = N_grad_NP_to_kIP_global(3, knode)
        
        ! Shear strain components in e12, e13, e23
        ! No contribution, all are zero
    end do
    
    Bu_vol_kIP = Bu_vol_kIP / 3.0d0

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
subroutine UMAT_isotropic_von_Mises(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp,dtemp,predef,dpred, &
    cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    ! Input: props, nprops, stress, dstran, ntens, ndi, nshr, statev
    ! Output: ddsdde, stress, statev (eelas, eplas, eqplas, deqplas, sig_vonMises, sig_H)
    
    use precision
    use common_block
    include 'aba_param.inc'
      
    character*8 cmname
    dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens), &
        ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens), &
        time(2),predef(*),dpred(*),props(nprops),coords(3),drot(3,3), &
        dfgrd0(3,3),dfgrd1(3,3),jstep(4)

    real(kind=dp), dimension(ntens) :: eelas, eplas, flow, olds, oldpl
    real(kind=dp), dimension(3) :: hard

    real(kind=dp) :: E, nu, lambda, mu, eqplas, deqplas, syield, syiel0, sig_vonMises, sig_H, rhs 
    real(kind=dp) :: effective_mu, effective_lambda, effective_hard    
    real(kind=dp), parameter :: toler = 1.0d-6
    integer :: UMAT_model, k_newton, start_flow_props_UMAT_idx
    integer, parameter :: newton = 100

    ! material properties
    
    UMAT_model = props(1)
    E = props(2)           ! Young's modulus 
    nu = props(3)          ! Poisson's ratio 

    ! Lame's parameters
    mu = E/(2.0d0 * (1.0 + nu))  ! Shear modulus
    lambda = E*nu/((1.0 + nu) * (1.0 - 2.0 * nu)) ! Lame's first constant

    eelas = statev(eelas_start_idx:eelas_end_idx)
    eplas = statev(eplas_start_idx:eplas_end_idx)
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
    sig_vonMises = sqrt(sig_vonMises * 0.5d0) ! Unit is Pa
    
    ! get yield stress from the specified hardening curve
    ! nvalue equal to number of points on the hardening curve
    
    nvalue = (end_flow_props_idx - start_flow_props_idx + 1) / 2
    start_flow_props_UMAT_idx = start_flow_props_idx - start_mech_props_idx + 1
    !print *, 'nvalue = ', nvalue ! 100
    
    call UHARD_von_Mises(syiel0, hard, eqplas, &
                                statev, nvalue, props(start_flow_props_idx))
    
    ! Determine if active yielding

    if (sig_vonMises > (1.0d0 + toler) * syiel0) then

        ! actively yielding
        ! separate the hydrostatic from the deviatoric stress
        ! calculate the flow direction

        sig_H = 1.0d0/3.0d0 * (stress(1) + stress(2) + stress(3))
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
                                statev, nvalue, props(start_flow_props_idx))
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
        effective_lambda = (E/(1.0d0 - 2.d0 * nu) - 2.d0 * effective_mu) * 1.0d0/3.0d0

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
    
    sig_vonMises = (stress(1) - stress(2))**2.0d0 + &
                   (stress(2) - stress(3))**2.0d0 + &
                   (stress(3) - stress(1))**2.0d0
    
    do i = ndi + 1, ntens
        sig_vonMises = sig_vonMises + 6.d0 * stress(i)**2
    end do
    sig_vonMises = sqrt(sig_vonMises * 0.5d0) ! Unit is Pa

    ! Recalculate hydrostatic stress
    sig_H = 1.0d0/3.0d0 * (stress(1) + stress(2) + stress(3))

    ! update state variables
    statev(eelas_start_idx : eelas_end_idx) = eelas
    statev(eplas_start_idx : eplas_end_idx) = eplas
    statev(eqplas_idx) = eqplas
    statev(deqplas_idx) = deqplas
    statev(sig_vonMises_idx) = sig_vonMises
    statev(sig_H_idx) = sig_H
    statev(triax_idx) = 0.0 ! Lazy to calculate
    statev(lode_idx) = 0.0
return
end

! This is isotropic elastic model

subroutine UMAT_elastic(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp,dtemp,predef,dpred, &
    cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    ! Input: props, nprops, stress, dstran, ntens, ndi, nshr, statev
    ! Output: ddsdde, stress, statev (eelas, eplas, eqplas, deqplas, sig_vonMises, sig_H)
    
    use precision
    use common_block
    include 'aba_param.inc'

    character*8 cmname
    dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens), &
        ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens), &
        time(2),predef(*),dpred(*),props(nprops),coords(3),drot(3,3), &
        dfgrd0(3,3),dfgrd1(3,3),jstep(4)

    real(kind=dp), dimension(ntens) :: eelas, eplas, flow, olds, oldpl
    real(kind=dp), dimension(3) :: hard

    real(kind=dp) :: E, nu, lambda, mu, eqplas, deqplas, syield, syiel0, sig_vonMises, sig_H, rhs 
    real(kind=dp) :: effective_mu, effective_lambda, effective_hard    

    real(kind=dp), parameter :: toler = 1.0d-6
    integer :: UMAT_model
    integer :: newton = 100
    integer :: k_newton

    ! material properties
    
    UMAT_model = props(1)
    
    E = props(2)           ! Young's modulus 
    nu = props(3)          ! Poisson's ratio 

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
    sig_vonMises = sqrt(sig_vonMises * 0.5d0) ! Unit is Pa

    ! Recalculate hydrostatic stress
    sig_H = 1.0d0/3.0d0 * (stress(1) + stress(2) + stress(3))

    ! update state variables
    statev(eelas_start_idx : eelas_end_idx) = eelas
    statev(eplas_start_idx : eplas_end_idx) = eplas
    statev(eqplas_idx) = eqplas
    statev(deqplas_idx) = deqplas
    statev(sig_vonMises_idx) = sig_vonMises
    statev(sig_H_idx) = sig_H
    statev(triax_idx) = 0.0 ! Lazy to calculate
    statev(lode_idx) = 0.0
    

return
end


!***********************************************************************

subroutine UHARD_von_Mises(syield, hard, eqplas, statev, nvalue, table)

    include 'aba_param.inc'

    character*80 cmname
    dimension hard(3),statev(*),table(2, nvalue)
    
    ! set yield stress to last value of table, hardening to zero
    
    syield = table(1, nvalue)

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

subroutine UMATHT_heat_transfer(u,dudt,dudg,flux,dfdt,dfdg, &
    statev,temp,dtemp,dtemdx,time,dtime,predef,dpred, &
    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
    noel,npt,layer,kspt,kstep,kinc)

    use precision
    use common_block
    inCLude 'aba_param.inc'

    character(len=80) :: cmname
    dimension dudg(ntgrd),flux(ntgrd),dfdt(ntgrd), &
      dfdg(ntgrd,ntgrd),statev(nstatv),dtemdx(ntgrd), &
      time(2),predef(*),dpred(*),props(nprops),coords(3)

    rho_heat = props(1)
    cp_heat = props(2)
    conductivity = props(3)

    ! print *, 'rho_heat = ', rho_heat
    ! print *, 'cp_heat = ', cp_heat
    ! print *, 'conductivity = ', conductivity

    dudt = cp_heat
    u = u + dudt * dtemp
    
    dudg = 0.0d0
    dfdg = 0.0d0

    do kdim=1,ntgrd
        flux(kdim) = - conductivity * dtemdx(kdim)
        dfdt(kdim) = 0.0d0
        dfdg(kdim,kdim) = - conductivity
    end do

    statev(temp_idx) = temp + dtemp

end


subroutine calc_u_grad(u_grad, u_values, N_grad_NP_to_kIP_global, ndim, nnode)
    
    use precision
    real(kind=dp), dimension(ndim, ndim) :: u_grad  ! Gradient of displacement tensor
    real(kind=dp), dimension(ndim, nnode) :: N_grad_NP_to_kIP_global  ! Shape function derivatives (global)
    real(kind=dp), dimension(ndim, nnode) :: u_values  ! Displacement vector (e.g., ux_tm1 or dux)
    
    integer :: idim, jdim, knode
    integer :: u_index

    ! Initialize the displacement gradient tensor to zero
    u_grad = 0.0d0

    ! Compute the displacement gradient (u_grad)
    do knode = 1, nnode
        do idim = 1, ndim 
            do jdim = 1, ndim
                u_grad(idim, jdim) = u_grad(idim, jdim) + N_grad_NP_to_kIP_global(jdim, knode) * u_values(idim, knode)
            end do
        end do
    end do

return
end


! *****************************************************************
! UFIELD reads current nodal coordinates for all NPs
! *****************************************************************

subroutine UFIELD(field, kfield, nsecpt, kstep, kinc, time, node, &
                  coords, temp, dtemp, nfield)
    use precision
    use common_block
    include 'aba_param.inc'
   
    dimension field(nsecpt,nfield), time(2), coords(3), &
              temp(nsecpt), dtemp(nsecpt)

    ! print *, 'UFIELD: node = ', node, 'coords = ', coords

    ! IMPORTANT: coords in this subroutine is NP coordinates, not IP coordinates
    ! like the one in UMAT and UMATHT

    call mutexInit(3)
    call mutexLock(3)

    ! Assign the current nodal coordinates to coords_all_nodes

    coords_all_nodes(node, 1) = coords(1)
    coords_all_nodes(node, 2) = coords(2)
    coords_all_nodes(node, 3) = coords(3)

    ! Unlock Mutex #5
    call mutexUnlock(3)

return
end

! UEL official documenation
! https://help.3ds.com/2025/english/dssimulia_established/SIMACAESUBRefMap/simasub-c-uel.htm?contextscope=all
! nnode parameter of UEL is changed to numnode to avoid naming conflict with the global parameter nnode

!***********************************************************************

subroutine UEL(rhs,amatrx,svars,energy,ndofel,nrhs,nsvars, &
    props,nprops,coords,mcrd,numnode,u,du,v,a,jtype,time,dtime, &
    kstep,kinc,jelem,params,ndload,jdltyp,adlmag,predef,npredf, &
    lflags,mlvarx,ddlmag,mdload,pnewdt,jprops,njpro,period)

    use precision
    use common_block
    use iso_module
    include 'aba_param.inc' !implicit real(a-h o-z)
      
    dimension rhs(mlvarx,*),amatrx(ndofel,ndofel),props(*),svars(*), &
        energy(8),coords(mcrd,numnode),u(ndofel),du(mlvarx,*),v(ndofel), &
        a(ndofel),time(2),params(*),jdltyp(mdload,*),adlmag(mdload,*), &
        ddlmag(mdload,*),predef(2,npredf,numnode),lflags(*),jprops(*)

    integer, parameter :: ntens = ntens_UMAT ! Number of stress-strain components
    integer, parameter :: ndi = ndi_UMAT ! Number of direct stress-strain components
    integer, parameter :: nshr = nshr_UMAT ! Number of shear stress-strain components

    
    ! The parameter nsvars in UEL is equal to ninpt * nsvint
    ! nsvint is the same as nstatev, it is just named differently to avouid conflicts with the native UMAT nstatv

    integer :: start_ux_idx, end_ux_idx, start_temp_idx, end_temp_idx, start_conc_idx, end_conc_idx, start_phi_idx, end_phi_idx
    integer :: UMAT_model, mech_field_flag, temp_field_flag, conc_field_flag, damage_field_flag

    ! ==============================================================
    ! TENSORS COMMON TO ALL FIELDS (DEFORMATION, DIFFUSION, DAMAGE)
    ! ==============================================================

    ! Note: coords in UEL is always fixed, which is the initial coordinates of the element jelem
    real(kind=dp), dimension(ndim,nnode) :: coords_kelem_NPs_t, coords_kelem_NPs_tm1, coords_kelem_NPs_0
    real(kind=dp), dimension(ndim,ninpt) :: coords_kelem_IPs_t, coords_kelem_IPs_tm1, coords_kelem_IPs_0
    real(kind=dp), dimension(ndim) :: coords_kelem_kIP_t, coords_kelem_kIP_tm1
    real(kind=dp), dimension(ndim,ndim) :: xjac_t, xjac_inv_t, xjac_tm1, xjac_inv_tm1
    ! Local state variables of the current element jelem for integration points
    real(kind=dp), dimension(nsvint) :: statev                      
    real(kind=dp), dimension(ndim,ndim) :: identity   
    ! Shape function that interpolates from nodal points to integration points
    real(kind=dp), dimension(nnode) :: N_shape_NP_to_kIP    
    ! Shape function that extrapolates from integration points to nodal points
    real(kind=dp), dimension(ninpt) :: N_shape_IP_to_kNP         
    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_to_kIP_local          
    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_to_kIP_global_t
    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_to_kIP_global_tm1          
    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_bar_global_t
    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_bar_global_tm1
    ! Predefined fields 
    real(kind=dp), dimension(ninpt,npredf) :: predef_IPs_t, predef_IPs_tm1, dpred_IPs
    real(kind=dp), dimension(npredf) :: predef_kIP_t, predef_kIP_tm1, dpred_kIP 

    ! =====================================================
    ! TENSORS DEFINED FOR THE DEFORMATION FIELD: UX, UY, UZ
    ! =====================================================

    real(kind=dp), dimension(ndim,nnode) :: ux_t, dux, ux_tm1
    real(kind=dp), dimension(ndim*nnode) :: ux_flat_t, dux_flat, ux_flat_tm1
    
    ! Displacement gradient u
    real(kind=dp), dimension(ndim,ndim) :: ux_grad_t, ux_grad_tm1, dux_grad          

    ! Strain-displacement matrix (B matrix)            
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_kIP_t, Bu_kIP_tm1    
    ! Volumetric strain-displacement matrix (B matrix)     
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_vol_kIP_t, Bu_vol_kIP_tm1          
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_bar_t, Bu_bar_tm1
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_bar_vol_t, Bu_bar_vol_tm1

    ! Deformation gradient F
    real(kind=dp), dimension(ndim,ndim) :: F_grad_t, F_grad_tm1, dF_grad, F_grad_inv_tm1      
    real(kind=dp), dimension(ndim,ndim) :: F_grad_bar_t, F_grad_bar_tm1, F_grad_bar_inv_tm1, dF_grad_bar    
    
    ! Right Cauchy-Green tensor C
    real(kind=dp), dimension(ndim,ndim) :: C_Cauchy_t, C_Cauchy_tm1, dC_Cauchy, C_Cauchy_inv_tm1, &
                                           log_C_Cauchy_t, log_C_Cauchy_tm1, dlog_C_Cauchy
    ! Left Cauchy-Green tensor B                
    real(kind=dp), dimension(ndim,ndim) :: B_Cauchy_t, B_Cauchy_tm1, dB_Cauchy, B_Cauchy_inv_tm1, &
                                            log_B_Cauchy_t, log_B_Cauchy_tm1, dlog_B_Cauchy
    ! Right stretch tensor U
    real(kind=dp), dimension(ndim,ndim) :: U_stretch_t, U_stretch_tm1, dU_stretch, &
                                        U_stretch_inv_t, U_stretch_inv_tm1, dU_stretch_inv
    ! Left stretch tensor V
    real(kind=dp), dimension(ndim,ndim) :: V_stretch_t, V_stretch_tm1, dV_stretch, &
                                        V_stretch_inv_t, V_stretch_inv_tm1, dV_stretch_inv              
    real(kind=dp), dimension(ndim,ndim) :: R_right_rot_t, R_right_rot_tm1, R_right_rot_inv_tm1
    real(kind=dp), dimension(ndim,ndim) :: dR_right_rot, dR_right_rot_inv                 ! Rotation tensor R
    real(kind=dp), dimension(ndim,ndim) :: R_left_rot_t, R_left_rot_tm1, R_left_rot_inv_tm1
    real(kind=dp), dimension(ndim,ndim) :: dR_left_rot, dR_left_rot_inv                 ! Rotation tensor R 
    
    ! Logarithmic strain tensor eps_log
    real(kind=dp), dimension(ndim,ndim) :: eps_log_t, eps_log_tm1, deps_log, eps_log_t_rotated         
    real(kind=dp), dimension(ntens) :: stress, ddsddt, drplde                       
    real(kind=dp), dimension(ntens,ntens) :: ddsdde                 ! Tangent stiffness matrix 

    real(kind=dp), dimension(ndim, ndim) :: stran_tensor_tm1, dstran_tensor
    real(kind=dp), dimension(ntens) :: stran_t, stran_tm1, dstran
    real(kind=dp), dimension(ntens) :: eelas                        ! Elastic strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: eplas                        ! Plastic strain vector of the current element jelem

    ! ==================================================!
    ! TENSORS DEFINED FOR THE HEAT TRASNFER FIELD: temp !
    ! ==================================================!

    ! Defined at nodal points
    real(kind=dp), dimension(nnode) :: temp_NPs_t, dtemp_NPs, temp_NPs_tm1

    ! Defined at each integration point
    real(kind=dp) :: temp_kIP_t, dtemp_kIP, temp_kIP_tm1
    real(kind=dp), dimension(ndim) :: temp_grad_kIP_t

    real(kind=dp) :: u_heat_kIP_t, u_heat_kIP_tm1, dudt_heat_kIP_t, du_heat_kIP, ru_heat_kIP
    real(kind=dp), dimension(ndim) :: dudg_heat_kIP_t, flux_heat_kIP, flux_heat_kIP_t, flux_heat_kIP_tm1, dfdt_heat_kIP_t
    real(kind=dp), dimension(ndim,ndim) :: dfdg_heat_kIP_t

    real(kind=dp), dimension(nnode,nnode)  :: M_heat_capacity_kIP_t, K_heat_conductivity_kIP_t
    real(kind=dp), dimension(nnode,nnode) :: M_dudt_heat_term_kIP_t, M_dudg_heat_term_kIP_t, K_dfdt_heat_term_kIP_t, K_dfdg_heat_term_kIP_t
    real(kind=dp), dimension(nnode) :: F_heat_rhs_kIP_kIP_t, F_ru_heat_term_kIP, F_dudt_heat_term_kIP_t, F_flux_heat_term_kIP_t

    ! ==================================================================================== !
    ! TENSORS DEFINED FOR THE MASS DIFFUSION FIELD: CL_mol (Lattice hydrogen concentration !
    ! ==================================================================================== !

    ! Defined at nodal points
    real(kind=dp), dimension(nnode) :: CL_mol_NPs_t, dCL_mol_NPs, CL_mol_NPs_tm1

    ! Defined at each integration point
    real(kind=dp) :: CL_mol_kIP_t, dCL_mol_kIP, CL_mol_kIP_tm1
    real(kind=dp), dimension(ndim) :: CL_mol_grad_kIP_t

    real(kind=dp) :: u_mass_t, u_mass_tm1, dudt_mass, du_mass, dr_mass
    real(kind=dp), dimension(ndim) :: dudg_mass, flux_mass, dfdt_mass
    real(kind=dp), dimension(ndim,ndim) :: dfdg_mass

    real(kind=dp), dimension(nnode,nnode)  :: M_mass_capacity, K_mass_diffusitivity
    real(kind=dp), dimension(nnode,nnode) :: dudt_mass_term, dudg_mass_term, dfdt_mass_term, dfdg_mass_term
    real(kind=dp), dimension(nnode) :: f_node_mass, dr_mass_term, flux_mass_term

    ! Notation: 
    ! _t refers to at the end of increment
    ! _tm1 refers to at the beginning of increment
    ! _0 refers to at the beginning of analysis

    ! Degree of freedom order for 
    ! u (total values of DOFs at the end of the current increment)
    ! du (incremental values of DOFs of the current increment) 
    ! v (velocity of DOFs at the end of the current increment)
    ! a (acceleration of DOFs at the end of the current increment)

    ! Displacement field: ux_node1, uy_node1, uz_node1, ..., ux_nnode, uy_nnode, uz_nnode
    ! Temperature field: temp_node1, temp_node2, ..., temp_nnode, 
    ! Concentration field: C_node1, C_node2, ..., C_nnode, 
    ! Damage phase field: phi_node1, phi_node2, ..., phi_nnode

    ! it is noted that temperature and concentration field are solved with exactly the same equations
    ! Thanks to the analogy between heat transfer and mass diffusion (Fourier's law v.s Fick's law)

    start_ux_idx = 1
    end_ux_idx = ndim * nnode
    start_temp_idx = ndim * nnode + 1
    end_temp_idx = (ndim + 1) * nnode
    start_conc_idx = (ndim + 1) * nnode + 1
    end_conc_idx = (ndim + 2) * nnode
    start_phi_idx = (ndim + 2) * nnode + 1
    end_phi_idx = (ndim + 3) * nnode

    do k1=1,ndofel
        rhs(k1,1)=0.0d0
    end do
    amatrx = 0.0d0

    identity = 0.0d0
    do kdim=1,ndim
        identity(kdim,kdim)=1.0d0
    end do

    mech_field_flag = props(start_field_flag_idx + 0)
    temp_field_flag = props(start_field_flag_idx + 1)
    conc_field_flag = props(start_field_flag_idx + 2)
    damage_field_flag = props(start_field_flag_idx + 3)

    ! Extract from the variable u and du
    do kdim=1,ndim
        do knode=1,nnode
            disp_index = ndim * knode - ndim + kdim
            ux_t(kdim,knode) = u(disp_index)
            dux(kdim,knode) = du(disp_index, 1)
            ux_tm1(kdim,knode) = ux_t(kdim,knode) - dux(kdim,knode)
        end do
    end do

    ! Extracting displacement dofs ux_t, dux and ux_tm1 from u and du
    ux_flat_t(1:ndim*nnode) = u(start_ux_idx:end_ux_idx)
    dux_flat(1:ndim*nnode) = du(start_ux_idx:end_ux_idx, 1)
    ux_flat_tm1(1:ndim*nnode) = ux_flat_t - dux_flat

    ! Extracting temperature dofs temp_NPs_t, dtemp_NPs and temp_NPs_tm1 from u and du
    temp_NPs_t(1:nnode) = u(start_temp_idx:end_temp_idx)
    dtemp_NPs(1:nnode) = du(start_temp_idx:end_temp_idx, 1)
    temp_NPs_tm1(1:nnode) = temp_NPs_t - dtemp_NPs

    ! write(7,*) 'temp_NPs_t', temp_NPs_t(1:nnode)
    ! write(7,*) 'dtemp_NPs', dtemp_NPs(1:nnode)

    ! if (kinc == 2) then
    !     print *, 'ux_flat_t', ux_flat_t(1:ndim*nnode)
    !     print *, 'dux_flat', dux_flat(1:ndim*nnode)
    !     print *, 'ux_flat_tm1', ux_flat_tm1(1:ndim*nnode)

    !     print *, 'temp_NPs_t', temp_NPs_t(1:nnode)
    !     print *, 'dtemp_NPs', dtemp_NPs(1:nnode)
    !     print *, 'temp_NPs_tm1', temp_NPs_tm1(1:nnode)

    !     call pause(1800)
    ! end if

    ! Current coordinates of the element jelem
    ! It will be used to calculate N_grad_NP_to_kIP_global_t for updated Lagrangian formulation
    coords_kelem_NPs_0 = coords

    if (lflags(2) == 0) then ! NLGEOM off
        ! Use original coordinates for total Lagrangian formulation
        coords_kelem_NPs_tm1 = coords_kelem_NPs_0
        coords_kelem_NPs_t = coords_kelem_NPs_0
    else if (lflags(2) == 1) then ! NLGEOM on
        ! Use updated coordinates for updated Lagrangian formulation
        coords_kelem_NPs_tm1 = coords_kelem_NPs_0 + ux_tm1
        coords_kelem_NPs_t = coords_kelem_NPs_0 + ux_t
    end if

    ! Calculate coordinates at all IPs

    do kinpt = 1, ninpt
        N_shape_NP_to_kIP(1:nnode) = all_N_shape_NP_to_kIP(kinpt,1:nnode)

        do kdim = 1, ndim
            coords_kelem_IPs_t(kdim, kinpt) = dot_product(N_shape_NP_to_kIP, &
                                                          coords_kelem_NPs_t(kdim, 1:nnode))
            coords_kelem_IPs_tm1(kdim, kinpt) = dot_product(N_shape_NP_to_kIP, &
                                                            coords_kelem_NPs_tm1(kdim, 1:nnode))
            coords_kelem_IPs_0(kdim, kinpt) = dot_product(N_shape_NP_to_kIP, &
                                                          coords_kelem_NPs_0(kdim, 1:nnode))
        end do
    end do

    ! Calculate predefined field variables at all IPs
    ! In UEL

    ! PREDEF(1,K2,K3)	Values of the variables at the end of the current increment of the K2th predefined field variable at the K3th node of the element.
    ! PREDEF(2,K2,K3)	Incremental values corresponding to the current time increment of the K2th predefined field variable at the K3th node of the element.

    do kinpt = 1, ninpt
        do kpredf = 1, npredf 
            N_shape_NP_to_kIP(1:nnode) = all_N_shape_NP_to_kIP(kinpt,1:nnode)
            predef_IPs_t(kinpt, 1:npredf) = dot_product(N_shape_NP_to_kIP, &
                                                        predef(1,kpredf,1:nnode))
            dpred_IPs(kinpt, 1:npredf) = dot_product(N_shape_NP_to_kIP, &
                                                        predef(2,kpredf,1:nnode))
            predef_IPs_tm1(kinpt, 1:npredf) = dot_product(N_shape_NP_to_kIP, &
                                                        predef(1,kpredf,1:nnode)-predef(2,kpredf,1:nnode))
        end do
    end do

    ! call pause(1800)

    ! ================================================================== !
    !                                                                    !
    !                    COMPUTING THE GRADIENT OF SDVs                  !
    !                                                                    !
    ! ================================================================== !

    ! ================================================================== !
    !                                                                    !
    !                    SOLVING THE DEFORMATION FIELD                   !
    !                                                                    !
    ! ================================================================== !
        
    N_grad_NP_bar_global_t(1:ndim,1:nnode) = 0.0d0
    N_grad_NP_bar_global_tm1(1:ndim,1:nnode) = 0.0d0
    djac_bar_t = 0.0d0
    djac_bar_tm1 = 0.0d0
    elem_vol_t = 0.0d0
    elem_vol_tm1 = 0.0d0

    do kinpt=1, ninpt

        N_grad_NP_to_kIP_local(1:ndim,1:nnode) = all_N_grad_NP_to_kIP_local(kinpt,1:ndim,1:nnode) 

        xjac_tm1 = matmul(N_grad_NP_to_kIP_local, transpose(coords_kelem_NPs_tm1))
        call calc_matrix_inv(xjac_tm1, xjac_inv_tm1, djac_tm1, ndim)

        dvol_tm1 = weight(kinpt) * djac_tm1
        N_grad_NP_to_kIP_global_tm1 = matmul(xjac_inv_tm1,N_grad_NP_to_kIP_local)
        N_grad_NP_bar_global_tm1 = N_grad_NP_bar_global_tm1 + N_grad_NP_to_kIP_global_tm1 * dvol_tm1
        djac_bar_tm1 = djac_bar_tm1 + djac_tm1 * dvol_tm1
        elem_vol_tm1 = elem_vol_tm1 + dvol_tm1

        xjac_t = matmul(N_grad_NP_to_kIP_local, transpose(coords_kelem_NPs_t))
        call calc_matrix_inv(xjac_t, xjac_inv_t, djac_t, ndim)

        dvol_t = weight(kinpt) * djac_t
        N_grad_NP_to_kIP_global_t = matmul(xjac_inv_t,N_grad_NP_to_kIP_local)
        N_grad_NP_bar_global_t = N_grad_NP_bar_global_t + N_grad_NP_to_kIP_global_t * dvol_t
        djac_bar_t = djac_bar_t + djac_t * dvol_t
        elem_vol_t = elem_vol_t + dvol_t

    end do

    N_grad_NP_bar_global_tm1 = N_grad_NP_bar_global_tm1 / elem_vol_tm1
    djac_bar_tm1 = djac_bar_tm1 / elem_vol_tm1
    N_grad_NP_bar_global_t = N_grad_NP_bar_global_t / elem_vol_t
    djac_bar_t = djac_bar_t / elem_vol_t

    do kinpt=1,ninpt

        ! Extracting coordinates of the current integration point
        coords_kelem_kIP_t = coords_kelem_IPs_t(1:ndim,kinpt)

        ! Extracting the predefined fields
        predef_kIP_t = predef_IPs_t(kinpt,1:npredf)
        predef_kIP_tm1 = predef_IPs_tm1(kinpt,1:npredf)
        dpred_kIP = dpred_IPs(kinpt,1:npredf)

        !   Transfer statev from UEL svars to statev for current integration point
        call kstatevar(kinpt,nsvint,svars,statev,1)

        !   Compute N_shape_NP_to_kIP and N_grad_NP_to_kIP_local
        N_shape_NP_to_kIP(1:nnode) = all_N_shape_NP_to_kIP(kinpt,1:nnode)
        N_grad_NP_to_kIP_local(1:ndim,1:nnode) = all_N_grad_NP_to_kIP_local(kinpt,1:ndim,1:nnode) 

        xjac_t = matmul(N_grad_NP_to_kIP_local, transpose(coords_kelem_NPs_t))
        call calc_matrix_inv(xjac_t, xjac_inv_t, djac_t, ndim)

        dvol_t = weight(kinpt) * djac_t
        N_grad_NP_to_kIP_global_t = matmul(xjac_inv_t,N_grad_NP_to_kIP_local)

        !   Calculate strain displacement B-matrix
        call kbmatrix_full(N_grad_NP_to_kIP_global_t,ntens,nnode,ndim,Bu_kIP_t)  
        call kbmatrix_vol(N_grad_NP_to_kIP_global_t,ntens,nnode,ndim,Bu_vol_kIP_t)
        call kbmatrix_vol(N_grad_NP_bar_global_t,ntens,nnode,ndim,Bu_bar_vol_t)

        Bu_bar_t = Bu_kIP_t - Bu_vol_kIP_t + Bu_bar_vol_t

        xjac_tm1 = matmul(N_grad_NP_to_kIP_local, transpose(coords_kelem_NPs_tm1))
        call calc_matrix_inv(xjac_tm1, xjac_inv_tm1, djac_tm1, ndim)

        dvol_tm1 = weight(kinpt) * djac_tm1
        N_grad_NP_to_kIP_global_tm1 = matmul(xjac_inv_tm1,N_grad_NP_to_kIP_local)

        !   Calculate strain displacement B-matrix
        call kbmatrix_full(N_grad_NP_to_kIP_global_tm1,ntens,nnode,ndim,Bu_kIP_tm1)
        call kbmatrix_vol(N_grad_NP_to_kIP_global_tm1,ntens,nnode,ndim,Bu_vol_kIP_tm1)
        call kbmatrix_vol(N_grad_NP_bar_global_tm1,ntens,nnode,ndim,Bu_bar_vol_tm1)

        Bu_bar_tm1 = Bu_kIP_tm1 - Bu_vol_kIP_tm1 + Bu_bar_vol_tm1

        if (lflags(2) == 0) then 

            ! Engineering/infinitesimal strain (nlgeom=off)
            ! =======================================

            dstran = matmul(Bu_bar_t, dux_flat)

            ! In linear geometry, displacement is considered very small, thus deformation gradient is identity
            F_grad_bar_tm1 = identity
            F_grad_bar_t = identity
            
        else if (lflags(2) == 1) then

            ! Large-displacement analysis (nlgeom=on)
            ! =======================================

            call calc_u_grad(ux_grad_t, ux_t, N_grad_NP_to_kIP_global_t, ndim, nnode)
            call calc_u_grad(ux_grad_tm1, ux_tm1, N_grad_NP_to_kIP_global_tm1, ndim, nnode)
            call calc_u_grad(dux_grad, dux, N_grad_NP_to_kIP_global_tm1, ndim, nnode)
            
            F_grad_t = identity + ux_grad_t
            F_grad_tm1 = identity + ux_grad_tm1
            dF_grad = identity + dux_grad

            F_grad_bar_t = F_grad_t * (djac_bar_t / djac_t) ** (1.0d0/3.0d0)
            F_grad_bar_tm1 = F_grad_tm1 * (djac_bar_tm1 / djac_tm1) ** (1.0d0/3.0d0)
            dF_grad_bar = dF_grad * (djac_bar_t / djac_t) ** (1.0d0/3.0d0)
            
            call calc_matrix_inv(F_grad_bar_tm1, F_grad_bar_inv_tm1, determinant, ndim)
            
            ! Perform polar decomposition to separate rotation and stretch ===
            dB_Cauchy = matmul(dF_grad_bar, transpose(dF_grad_bar))

            ! Compute incremental stretch tensor (rotation-free)
            call calc_matrix_sqrt(dB_Cauchy, dV_stretch, ndim)

            ! Compute incremental rotation tensor explicitly
            call calc_matrix_inv(dV_stretch, dV_stretch_inv, determinant, ndim)
            dR_left_rot = matmul(dV_stretch_inv, dF_grad_bar)

            ! Compute rotation-free incremental logarithmic strain
            call calc_matrix_log(dV_stretch, deps_log, ndim)

            dstran(1) = deps_log(1,1)
            dstran(2) = deps_log(2,2)
            dstran(3) = deps_log(3,3)
            dstran(4) = deps_log(1,2) * 2.0d0
            dstran(5) = deps_log(1,3) * 2.0d0
            dstran(6) = deps_log(2,3) * 2.0d0

        end if

        !   ====================================================
        !   Calculate deformation field (stress and strain, etc)
        !   ====================================================
                
        stress = statev(sig_start_idx:sig_end_idx) ! stress at tm1
        stran_tm1 = statev(stran_start_idx:stran_end_idx) ! stran at tm1
        stran_t = stran_tm1 + dstran
        
        UMAT_model = props(start_mech_props_idx)
        
        nprops_UMAT = end_flow_props_idx - start_mech_props_idx + 1

        ! UMAT official documentations
        ! https://help.3ds.com/2025/english/dssimulia_established/simacaesubrefmap/simasub-c-umat.htm?contextscope=all

        if (UMAT_model == 1) then
            call UMAT_elastic(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
                            drplde,drpldt,stran_tm1,dstran,time,dtime,temp,dtemp, &
                            predef_kIP_tm1,dpred_kIP,cmname,ndi,nshr,ntens,nsvint, &
                            props(start_mech_props_idx:end_flow_props_idx), &
                            nprops_UMAT,coords_kelem_kIP_t,dR_left_rot,pnewdt,celent, &
                            F_grad_bar_tm1,F_grad_bar_t,jelem,kinpt,layer,kspt,kstep,kinc)

        else if (UMAT_model == 2) then
            call UMAT_isotropic_von_Mises(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
                            drplde,drpldt,stran_tm1,dstran,time,dtime,temp,dtemp, &
                            predef_kIP_tm1,dpred_kIP,cmname,ndi,nshr,ntens,nsvint, &
                            props(start_mech_props_idx:end_flow_props_idx), &
                            nprops_UMAT,coords_kelem_kIP_t,dR_left_rot,pnewdt,celent, &
                            F_grad_bar_tm1,F_grad_bar_t,jelem,kinpt,layer,kspt,kstep,kinc)

        end if

        ! UMAT_isotropic_von_Mises(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
        !     drplde,drpldt,stran,dstran,time,dtime,temp,dtemp,predef,dpred, &
        !     cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
        !     celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

        ! Update the state variables
        ! All other mechanical properties are already updated in statev in UMAT_von_Mises
        
        statev(sig_start_idx : sig_end_idx) = stress ! stress at t
        statev(stran_start_idx : stran_end_idx) = stran_t

        ! ********************************************!
        ! DISPLACEMENT CONTRIBUTION TO amatrx AND rhs !
        ! ********************************************!

        ! 8 nodes x 3 displacement dofs ux, uy, uz = 24

        amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) = &
            amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) + dvol_t * &
                               (matmul(matmul(transpose(Bu_bar_t),ddsdde),Bu_bar_t))
            
        rhs(start_ux_idx:end_ux_idx,1) = rhs(start_ux_idx:end_ux_idx,1) - &
            dvol_t * (matmul(transpose(Bu_bar_t),stress))        

        ! ================================================================== !
        !                                                                    !
        !                    SOLVING THE DIFFUSION FIELD                     !
        !                                                                    !
        ! ================================================================== !
        
        ! Variables to be defined
        ! u_heat_kIP: Internal thermal energy per unit mass, U, at the end of increment. 
        !         This variable is passed in as the value at the start of the increment (u_heat_kIP_tm1)
        !         and must be updated to its value at the end of the increment (u_heat_kIP_t).
        ! dudt_heat_kIP_t: Variation of internal thermal energy per unit mass with respect to temperature, 
        !         ∂U/∂θ, evaluated at the end of the increment.
        ! dudg_heat_kIP_t(ndim): Variation of internal thermal energy per unit mass with respect to the 
        !           spatial gradients of temperature, ∂U/∂(∂θ/∂x), evaluated at the end of the increment.
        !           The size of this array depends on ndim and it is typically zero in classical heat transfer analysis.
        ! flux_heat_kIP(ndim): Heat flux vector at the end of the increment. 
        !            This variable is passed in with the values at the beginning of the increment (flux_heat_kIP_tm1) and 
        !            must be updated to the values at the end of the increment (flux_heat_kIP_t).
        ! dfdt_heat_kIP_t(ndim): Variation of the heat flux vector with respect to temperature, 
        !        ∂q/∂θ, evaluated at the end of the increment.
        ! dfdg_heat_kIP_t(ndim,ndim): Variation of the heat flux vector with respect to the spatial gradients of temperature,
        !        ∂f/∂(∂θ/∂x), evaluated at the end of the increment.

        ! Variables passed in for Information
        ! temp_kIP_tm1: Temperature at the start of the increment.
        ! dtemp_kIP: Increment of temperature.
        ! temp_grad_kIP_t: Current values of the spatial gradients of temperature, ∂θ/∂x.
        ! u_heat_kIP_tm1 is at the beginning of the increment

        ! temp_kIP_tm1, dtemp_kIP, temp_grad_kIP_t, u_heat_kIP are all defined at integration points

        temp_kIP_tm1 = dot_product(N_shape_NP_to_kIP, temp_NPs_tm1)
        temp_kIP_t = dot_product(N_shape_NP_to_kIP, temp_NPs_t)
        dtemp_kIP = dot_product(N_shape_NP_to_kIP, dtemp_NPs)
        temp_grad_kIP_t = matmul(N_grad_NP_to_kIP_global_t, temp_NPs_t)
        
        rho_heat = props(start_temp_props_idx)
        
        ! print *, 'temp_kIP_tm1 = ', temp_kIP_tm1
        ! print *, 'temp_kIP_t = ', temp_kIP_t
        ! print *, 'dtemp_kIP = ', dtemp_kIP
        ! print *, 'temp_grad_kIP_t = ', temp_grad_kIP_t
        ! print *, 'rho_heat = ', rho_heat

        ! The internal energy per unit mass
        u_heat_kIP = statev(u_heat_idx) 
        u_heat_kIP_tm1 = u_heat_kIP ! u_heat_kIP at tm1
        
        flux_heat_kIP(1) = statev(flux_heat_X_idx)
        flux_heat_kIP(2) = statev(flux_heat_Y_idx)
        flux_heat_kIP(3) = statev(flux_heat_Z_idx)
        flux_heat_kIP_tm1 = flux_heat_kIP ! flux_heat_kIP at tm1

        nprops_UMATHT_heat_transfer = end_temp_props_idx - start_temp_props_idx + 1

        ! UMATHT official documentation
        ! https://help.3ds.com/2025/english/dssimulia_established/SIMACAESUBRefMap/simasub-c-umatht.htm?contextscope=all

        call UMATHT_heat_transfer(u_heat_kIP,dudt_heat_kIP_t,dudg_heat_kIP_t, &
                                  flux_heat_kIP,dfdt_heat_kIP_t,dfdg_heat_kIP_t, &
                                  statev,temp_kIP_tm1,dtemp_kIP,temp_grad_kIP_t,time,dtime, &
                                  predef_kIP_tm1,dpred_kIP,cmname,ndim,nsvint, &
                                  props(start_temp_props_idx:end_temp_props_idx), &
                                  nprops_UMATHT_heat_transfer,coords_kelem_kIP_t, &
                                  pnewdt,jelem,kinpt,layer,kspt,kstep,kinc)

        ! In our equation, we have du_heat_kIP = u_heat_kIP_t - u_heat_kIP_tm1
        ! Then we also have the remaining value, which is ru_heat_kIP = du_heat_kIP - dudt_heat_kIP_t
        
        u_heat_kIP_t = u_heat_kIP ! u_heat_kIP is updated as u_heat_kIP_t
        statev(u_heat_idx) = u_heat_kIP

        ! flux_heat_kIP is updated as flux_heat_kIP_t
        flux_heat_kIP_t(1) = flux_heat_kIP(1)
        flux_heat_kIP_t(2) = flux_heat_kIP(2)
        flux_heat_kIP_t(3) = flux_heat_kIP(3)
        statev(flux_heat_X_idx) = flux_heat_kIP_t(1)
        statev(flux_heat_Y_idx) = flux_heat_kIP_t(2)
        statev(flux_heat_Z_idx) = flux_heat_kIP_t(3)

        if (kinc == 1) then
            print *, 'u_heat_kIP_t = ', u_heat_kIP_t
            print *, 'u_heat_kIP_tm1 = ', u_heat_kIP_tm1
            print *, 'dudt_heat_kIP_t = ', dudt_heat_kIP_t
            print *, 'dudg_heat_kIP_t = ', dudg_heat_kIP_t
            print *, 'dfdt_heat_kIP_t = ', dfdt_heat_kIP_t
            print *, 'dfdg_heat_kIP_t = ', dfdg_heat_kIP_t
            print *, 'flux_heat_kIP_t = ', flux_heat_kIP_t
        end if

        du_heat_kIP = u_heat_kIP_t - u_heat_kIP_tm1
        ru_heat_kIP = du_heat_kIP - dudt_heat_kIP_t * dtemp_kIP

        ! Matrix multiplication is associative 
        
        ! These terms dfdt and dfdg are for the K_heat_conductivity_kIP_t matrix

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, 1) @ (1, nnode)
        K_dfdt_heat_term_kIP_t    = - matmul( &
                                        transpose(N_grad_NP_to_kIP_global_t), & 
                                        matmul(reshape(dfdt_heat_kIP_t, [ndim, 1]), & 
                                        reshape(N_shape_NP_to_kIP, [1, nnode])) &
                                        )

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, ndim) @ (ndim, nnode)
        K_dfdg_heat_term_kIP_t    = - matmul(transpose(N_grad_NP_to_kIP_global_t), matmul(dfdg_heat_kIP_t, N_grad_NP_to_kIP_global_t))
        
        K_heat_conductivity_kIP_t = K_dfdt_heat_term_kIP_t + K_dfdg_heat_term_kIP_t

        ! These terms dudt and dudg are for the M_heat_capacity_kIP_t matrix

        ! (nnode, nnode) = (nnode, 1) @ (1, nnode)
        M_dudt_heat_term_kIP_t    = + matmul( &
                                        reshape(N_shape_NP_to_kIP, [nnode, 1]) * rho_heat * dudt_heat_kIP_t, &
                                        reshape(N_shape_NP_to_kIP, [1, nnode]) &
                                        ) 
        
        ! (nnode, nnode) = (nnode, 1) @ (1, ndim) @ (ndim, nnode)
        M_dudg_heat_term_kIP_t    = + matmul( &
                                        reshape(N_shape_NP_to_kIP, [nnode, 1]), &
                                        matmul(reshape(rho_heat * dudg_heat_kIP_t, [1, ndim]), &
                                               N_grad_NP_to_kIP_global_t))
        
        M_heat_capacity_kIP_t = M_dudt_heat_term_kIP_t + M_dudg_heat_term_kIP_t

        ! (nnode) = (nnode) * scalar * scalar
        F_dudt_heat_term_kIP_t = - N_shape_NP_to_kIP * rho_heat * dudt_heat_kIP_t * (dtemp_kIP/dtime)
        
        ! (nnode) = (nnode) * scalar 
        F_ru_heat_term_kIP   = - N_shape_NP_to_kIP * rho_heat * ru_heat_kIP
        
        ! (nnode) = (nnode, ndim) @ (ndim)
        F_flux_heat_term_kIP_t      = + matmul(transpose(N_grad_NP_to_kIP_global_t), flux_heat_kIP_t)
        
        F_heat_rhs_kIP_kIP_t = F_dudt_heat_term_kIP_t + F_ru_heat_term_kIP + F_flux_heat_term_kIP_t

        ! *****************************************!
        ! DIFFUSION CONTRIBUTION TO amatrx AND rhs !
        ! *****************************************!

        ! 3D case
        ! 8 nodes x 1 heat concentration dof = 8

        amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) = &
            amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) &
            + dvol_t * (K_heat_conductivity_kIP + M_heat_capacity_kIP_t/dtime)
            
        rhs(start_temp_idx:end_temp_idx,1) = rhs(start_temp_idx:end_temp_idx,1) &
            + dvol_t * F_heat_rhs_kIP_kIP_t
        
        ! ================================================================== !
        !                                                                    !
        !                    TRANSFERRING DATA STAGE                         !
        !                                                                    !
        ! ================================================================== !

        !   Transfer data from statev to svars
        !   This stage basically updates the state variables for the current element in UEL
        
        call kstatevar(kinpt,nsvint,svars,statev,0)
        
        !   Transfer data from statev to dummy mesh for visualization
        
        user_vars(jelem,1:nsvint,kinpt) = statev(1:nsvint)
        
    end do       ! end loop on material integration points

return
end
    

!***********************************************************************
! This is only a dummy subroutine to transfer data from UEL element into the dummy C3D8 element
! It does not contribute any stress or stiffness at all
!***********************************************************************

subroutine UMAT(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp,dtemp,predef,dpred, &
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

! ==============================================================
! Subroutine for checking damage criterion and stop the analysis
! ==============================================================

subroutine URDFIL(lstop,lovrwrt,kstep,kinc,dtime,time)
    use precision
    use common_block
    include 'aba_param.inc'

    dimension array(513),jrray(nprecd,513),time(2)
    ! equivalence (array(1),jrray(1,1))

    ! user coding to read the results file

return
end


!***********************************************************************
! Dummy UMATHT that exists only for the dummy element. It does nothing
!***********************************************************************

subroutine UMATHT(u,dudt,dudg,flux,dfdt,dfdg, &
    statev,temp,dtemp,dtemdx,time,dtime,predef,dpred, &
    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
    noel,npt,layer,kspt,kstep,kinc)

    use precision
    use common_block
    inCLude 'aba_param.inc'

    character(len=80) :: cmname
    dimension dudg(ntgrd),flux(ntgrd),dfdt(ntgrd), &
      dfdg(ntgrd,ntgrd),statev(nstatv),dtemdx(ntgrd), &
      time(2),predef(*),dpred(*),props(nprops),coords(3)

    u = 0.0d0
    dudt = 0.0d0
    dudg = 0.0d0
    flux = 0.0d0
    dfdt = 0.0d0
    dfdt = 0.0d0

return
end

