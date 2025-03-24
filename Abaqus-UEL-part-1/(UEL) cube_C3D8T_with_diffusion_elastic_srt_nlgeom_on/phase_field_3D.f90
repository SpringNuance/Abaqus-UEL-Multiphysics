!====================================================================
!          Program for phase field damage coupled with 
!          mechanical loading and hydrogen diffusion 
!          Mechanical model: standard Hooke's law elasticity 
!                            isotropic Von Mises plasticity
!          Hydrogen diffusion model: Fick's second law
!          Damage model: phase field damage model
!          by Nguyen Xuan Binh
!          binh.nguyen@aalto.fi
!          July 2024, Abaqus 2023
!          Model extended from the work of Emilio Martinez-Paneda
!          Paper: A phase field formulation for hydrogen assisted cracking
!          Computer Methods in Applied Mechanics and Engineering 342: 742-761 
!          (2018) doi: 10.1016/j.cma.2018.07.021
!          DO NOT DISTRIBUTE WITHOUT AUTHOR'S PERMISSION
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

    ! "31, AR18_phi, AR18_phi   ",
    ! "32, AR19_history, AR19_history   ",
    ! "33, AR20_Gc, AR20_Gc   ",
    
    ! "34, AR22_C_mol, AR22_C_mol   ",	
    ! "35, AR23_CL_mol, AR23_CL_mol   ", 
    ! "36, AR24_CT_mol, AR24_CT_mol   ", 

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

    integer, parameter :: total_elems = 35545 ! Storing the actual number of elements
    integer, parameter :: total_nodes = 44285 ! Storing the actual number of nodes

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
    integer, parameter :: before_phase_props_idx = 8 ! Index of the first phase field property in props
    integer, parameter :: before_hydro_props_idx = 16 ! Index of the first hydrogen diffusion property in props
    integer, parameter :: before_flow_props_idx = 40 ! Index of the first flow curve data in props
    
    integer, parameter :: eqplas_idx = 25 ! Index of the equivalent plastic strain in statev
    integer, parameter :: deqplas_idx = 26 ! Index of the increment of the equivalent plastic strain in statev
    integer, parameter :: sig_H_idx = 27 ! Index of the hydrogen concentration in statev
    integer, parameter :: sig_vonMises_idx = 28 ! Index of the equivalent von Mises stress in statev
    integer, parameter :: triax_idx = 29 ! Index of the triaxiality in statev
    integer, parameter :: lode_idx = 30 ! Index of the Lode parameter in statev
    integer, parameter :: phi_idx = 31 ! Index of the phase field parameter in statev
    integer, parameter :: history_idx = 32 ! Index of the history variable in statev
    integer, parameter :: Gc_idx = 33 ! Index of the fracture energy in statev
    ! integer, parameter :: theta_coverage_idx = 21 ! Index of the hydrogen coverage in statev
    integer, parameter :: C_mol_idx = 34 ! Index of the hydrogen concentration in the matrix in statev
    integer, parameter :: CL_mol_idx = 35 ! Index of the hydrogen concentration in the lattice in statev
    integer, parameter :: CT_mol_idx = 36 ! Index of the hydrogen concentration in the trap in statev
    
    ! First dim: maximum number of elements to accomodate varying number of elements when remeshed
    ! Second dim: number of solution state dependent variables (nsvars in UEL and nstatev in UMAT)
    ! Third dim: number of integration points

    real(kind=dp) :: user_vars(100000, 36, 8)
    
    ! First dim: maximum number of nodes to accomodate varying number of nodes when remeshed
    ! Second dim: maximum number of elements that contains the node in the first dim
    ! Example: Lets say element 10, 20, .., 80 contains node 1
    ! Then node_to_elem_matrix(1, 1:8) = (/10, 20, .., 80/)
    ! Not all nodes will have maximum 8 elements, and it will be padded with -1 (meaning no element)
    ! Example, node 2 is only in element 10 and 20
    ! Then node_to_elem_matrix(2, 1:8) = (/10, 20, -1, -1, -1, -1, -1, -1/)
    integer :: node_to_elem_matrix(120000, 8) !
    
    ! First dim: maximum number of elements to accomodate varying number of elements when remeshed
    ! Second dim: number of nodes in the element
    ! Since all elements must have 8 nodes, it does not need to be padded
    ! The nodes are also in their correct order as well from inode to 1 to 8
    integer :: elem_to_node_matrix(100000, 8) !

    real(kind=dp) :: all_shape_int_to_node(8, 8) ! (nnode, ninpt)
    real(kind=dp) :: all_shape_node_to_int(8, 8) ! (ninpt, nnode)
    real(kind=dp) :: all_B_deriv_local(8, 3, 8) ! (ninpt, ndim, nnode)

    real(kind=dp) :: sig_H_all_elem_at_nodes(total_elems, 8) ! (total_elems, nnode)
    real(kind=dp) :: sig_H_at_nodes(total_nodes) ! (total_nodes)
    
    save
    ! The save command is very important. 
    ! It allows the values to be stored and shared between subroutines 
    ! without resetting them to zero every time the subroutine is called

end module

!***********************************************************************

! subroutine calc_sig_H_at_nodes(total_elems, total_nodes)
    
!     use precision
!     use common_block
!     include 'aba_param.inc'

!     ! Variable declarations
!     integer :: inode, n, i, ielement, nodeofel, j
!     real(kind=8) :: sumpj, sumj, adetj, sumel

!     integer, parameter :: ninpt = 8

!     ! Loop over all nodes
!     do inode = 1, total_nodes
!         n = node_to_elem_matrix(inode, 1, 1)

!         ! Check if the node belongs to any elements
!         if (n /= 0) then
!             sumpj = 0.0d0
!             sumj = 0.0d0

!             ! Loop over elements that contain the current node
!             do i = 2, 1 + n
!                 ielement = node_to_elem_matrix(inode, i, 1)   ! Element label
!                 nodeofel = node_to_elem_matrix(inode, i, 2)   ! Local node number in the element
!                 adetj = adetjel(ielement, nodeofel) ! detJ for this element-node

!                 sumel = 0.0d0
!                 ! Loop over Gauss points in the element and calculate average element pressure
!                 do j = 1, ninpt
!                     sumel = sumel + pelem(ielement, j)
!                 end do
!                 sumel = sumel / real(ninpt, kind=dp)

!                 ! Accumulate weighted pressures for the node
!                 sumpj = sumpj + sumel * adetj
!                 sumj = sumj + adetj
!             end do

!             ! Calculate average nodal pressure
!             sig_H_at_nodes(inode) = sumpj / sumj
!         end if
!     end do

! end subroutine calc_sig_H_at_nodes

!***********************************************************************

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

!***********************************************************************

subroutine UEXTERNALDB(lop,lrestart,time,dtime,kstep,kinc)
    use precision
    use common_block
    use iso_module
    use iso_c_binding

    include 'aba_param.inc' 
    
    !DEC$ NOFREEFORM
    #include <SMAAspUserSubroutines.hdr>
    !DEC$ FREEFORM

    dimension time(2)
    
    logical :: added
    integer :: iostat, element_id, node_id, current_element_idx
    integer, dimension(9) :: values

    character(len=256) :: line, outdir, aelread, aelwrite, andread, andwrite, anelwrite
    
    integer, parameter :: nnode = 8 
    integer, parameter :: ninpt = 8
    integer, dimension(ninpt) :: shape_int_to_node 

    ! LOP=0 indicates that the subroutine is being called at the start of the analysis.
    if (lop == 0) then 

        ! Initialize the MUTEX
        do mutex_id = 1, 40
            call MutexInit(mutex_id)  
        end do

        call MutexLock(1)   ! lock Mutex #1

        user_vars = 0.0d0
        sig_H_all_elem_at_nodes = 0.0d0

        ! Create the connectivity matrix. 
        ! Initialize node_to_elem_matrix with -1 to indicate unused slots
        node_to_elem_matrix = -1    

        ! BEWARE: Make sure that the mesh txt file must not have any empty lines at the end
        ! Otherwise, the code will crash

        call getoutdir(outdir, lenoutdir)
        aelread = trim(outdir) // '/original_mesh'

        open(unit=10, file=aelread, status="old", action="read")
        
        ! Read the file line by line and populate the node_to_elem_matrix
        do elem_id = 1, total_elems
            read(10, '(A)', iostat=iostat) line

            ! Convert the line into integers
            read(line, *) values  ! Read the 9 values (element ID and 8 nodes)
            !print *, values(1)

            ! values(1) is element ID of C3D8 element
            ! values(2:9) are the 8 node ID of the C3D8 element
            
            ! Populating the node_to_elem_matrix

            do i = 2, 9 ! Looping over the 8 nodes
                element_id = values(1)
                node_id = values(i)
                
                ! Find the first empty slot in the matrix for this node
                do j = 1, 8
                    if (node_to_elem_matrix(node_id, j) == -1) then
                        node_to_elem_matrix(node_id, j) = element_id
                        exit  ! Exit once the element is added for this node
                    end if
                end do

            end do

            ! Populate the elem_to_node_matrix

            do i = 2, 9 ! Looping over the 8 nodes
                element_id = values(1)
                node_id = values(i)
                elem_to_node_matrix(element_id, i-1) = node_id

            end do

            ! print *, 'Element ID: ', values(1), 'Nodes: ', values(2:9)
        end do

        ! ! Close the file
        close(10)

        ! ! Optional: print part of the matrix to verify
        ! do i = 10000, 10050  ! Print first 10 nodes for checking
        !     print *, 'Node', i, ': ', node_to_elem_matrix(i, 1:8)
        ! end do

        ! ! Optional: print part of the matrix to verify
        ! do i = 10000, 10050  ! Print first 10 nodes for checking
        !     print *, 'Element', i, ': ', elem_to_node_matrix(i, 1:8)
        ! end do

        do inode = 1, nnode
            xi_node = xi_nodal_extra(inode)
            eta_node = eta_nodal_extra(inode)
            zeta_node = zeta_nodal_extra(inode)
           
            all_shape_int_to_node(inode, 1) = 0.125d0 * (1.d0 - xi_node) * (1.d0 - eta_node) * (1.d0 - zeta_node)
            all_shape_int_to_node(inode, 2) = 0.125d0 * (1.d0 + xi_node) * (1.d0 - eta_node) * (1.d0 - zeta_node)
            all_shape_int_to_node(inode, 3) = 0.125d0 * (1.d0 - xi_node) * (1.d0 + eta_node) * (1.d0 - zeta_node)
            all_shape_int_to_node(inode, 4) = 0.125d0 * (1.d0 + xi_node) * (1.d0 + eta_node) * (1.d0 - zeta_node)
            all_shape_int_to_node(inode, 5) = 0.125d0 * (1.d0 - xi_node) * (1.d0 - eta_node) * (1.d0 + zeta_node)
            all_shape_int_to_node(inode, 6) = 0.125d0 * (1.d0 + xi_node) * (1.d0 - eta_node) * (1.d0 + zeta_node)
            all_shape_int_to_node(inode, 7) = 0.125d0 * (1.d0 - xi_node) * (1.d0 + eta_node) * (1.d0 + zeta_node)
            all_shape_int_to_node(inode, 8) = 0.125d0 * (1.d0 + xi_node) * (1.d0 + eta_node) * (1.d0 + zeta_node)

        end do      

        !print *, "all_shape_int_to_node: ", all_shape_int_to_node

        do kintk = 1, ninpt

        !   determine (g,h,r)
            f = xi_int_inter(kintk)
            g = eta_int_inter(kintk)
            h = zeta_int_inter(kintk)

            !   shape functions
            all_shape_node_to_int(kintk,1)=0.125d0 * (1.d0-f) * (1.d0-g) * (1.d0-h)
            all_shape_node_to_int(kintk,2)=0.125d0 * (1.d0+f) * (1.d0-g) * (1.d0-h)
            all_shape_node_to_int(kintk,3)=0.125d0 * (1.d0+f) * (1.d0+g) * (1.d0-h)
            all_shape_node_to_int(kintk,4)=0.125d0 * (1.d0-f) * (1.d0+g) * (1.d0-h)
            all_shape_node_to_int(kintk,5)=0.125d0 * (1.d0-f) * (1.d0-g) * (1.d0+h)
            all_shape_node_to_int(kintk,6)=0.125d0 * (1.d0+f) * (1.d0-g) * (1.d0+h)
            all_shape_node_to_int(kintk,7)=0.125d0 * (1.d0+f) * (1.d0+g) * (1.d0+h)
            all_shape_node_to_int(kintk,8)=0.125d0 * (1.d0-f) * (1.d0+g) * (1.d0+h)

            !   derivative d(Ni)/d(f)
            all_B_deriv_local(kintk,1,1)=-0.125d0 * (1.d0-g) * (1.d0-h)
            all_B_deriv_local(kintk,1,2)= 0.125d0 * (1.d0-g) * (1.d0-h)
            all_B_deriv_local(kintk,1,3)= 0.125d0 * (1.d0+g) * (1.d0-h)
            all_B_deriv_local(kintk,1,4)=-0.125d0 * (1.d0+g) * (1.d0-h)
            all_B_deriv_local(kintk,1,5)=-0.125d0 * (1.d0-g) * (1.d0+h)
            all_B_deriv_local(kintk,1,6)= 0.125d0 * (1.d0-g) * (1.d0+h)
            all_B_deriv_local(kintk,1,7)= 0.125d0 * (1.d0+g) * (1.d0+h)
            all_B_deriv_local(kintk,1,8)=-0.125d0 * (1.d0+g) * (1.d0+h)

            !     derivative d(Ni)/d(g)
            all_B_deriv_local(kintk,2,1)=-0.125d0 * (1.d0-f) * (1.d0-h)
            all_B_deriv_local(kintk,2,2)=-0.125d0 * (1.d0+f) * (1.d0-h)
            all_B_deriv_local(kintk,2,3)= 0.125d0 * (1.d0+f) * (1.d0-h)
            all_B_deriv_local(kintk,2,4)= 0.125d0 * (1.d0-f) * (1.d0-h)
            all_B_deriv_local(kintk,2,5)=-0.125d0 * (1.d0-f) * (1.d0+h)
            all_B_deriv_local(kintk,2,6)=-0.125d0 * (1.d0+f) * (1.d0+h)
            all_B_deriv_local(kintk,2,7)= 0.125d0 * (1.d0+f) * (1.d0+h)
            all_B_deriv_local(kintk,2,8)= 0.125d0 * (1.d0-f) * (1.d0+h)

            !     derivative d(Ni)/d(h)
            all_B_deriv_local(kintk,3,1)=-0.125d0 * (1.d0-f) * (1.d0-g)
            all_B_deriv_local(kintk,3,2)=-0.125d0 * (1.d0+f) * (1.d0-g)
            all_B_deriv_local(kintk,3,3)=-0.125d0 * (1.d0+f) * (1.d0+g)
            all_B_deriv_local(kintk,3,4)=-0.125d0 * (1.d0-f) * (1.d0+g)
            all_B_deriv_local(kintk,3,5)= 0.125d0 * (1.d0-f) * (1.d0-g)
            all_B_deriv_local(kintk,3,6)= 0.125d0 * (1.d0+f) * (1.d0-g)
            all_B_deriv_local(kintk,3,7)= 0.125d0 * (1.d0+f) * (1.d0+g)
            all_B_deriv_local(kintk,3,8)= 0.125d0 * (1.d0-f) * (1.d0+g)
        end do

        call MutexUnlock(1) ! unlock Mutex #1
    end if

    ! print *, 'all_shape_node_to_int: ', all_shape_node_to_int
    ! print *, 'all_B_deriv_local: ', all_B_deriv_local

    !   user subroutine is being called at the end of the current analysis increment
    
    if (lop == 2) then 
        call MutexLock(2) ! lock Mutex #2
        sig_H_all_elem_at_nodes = 0.0d0
        do ielem = 1, total_elems
            do inode = 1, nnode
                shape_int_to_node(1:ninpt) = all_shape_int_to_node(inode, 1:ninpt)
                do kintk = 1, ninpt
                    sig_H_all_elem_at_nodes(ielem, inode) = sig_H_all_elem_at_nodes(ielem, inode) &
                        + shape_int_to_node(kintk) * user_vars(ielem, sig_H_idx, kintk)
                end do
            end do
        end do

        call MutexUnlock(2) ! unlock Mutex #2

    end if

return
end

!*****************************************************************
!  8-node     8---------------7
!  brick     /|              /|       zeta (positive)
!           / |  x 7   x 8  / |       
!          5---------------6  |       |     eta (positive)
!          |  | x 5   x 6  |  |       |   /
!          |  |            |  |       |  /
!          |  4------------|--3       | /
!          | /   x 3   x 4 | /        |/
!          |/   x 1   x 2  |/         O--------- xi (positive)
!          1---------------2           origin at cube center
!          
!          Outer number is nodal points
!         Inner number marked with x is intergration (int) points
!
!*****************************************************************

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
                xjac(jdim,idim)=xjac(jdim,idim)+ &
                    B_deriv_local(jdim,inode) * coords(idim,inode)
            end do
        end do
    end do

    djac = xjac(1,1) * xjac(2,2) * xjac(3,3)+xjac(2,1) * xjac(3,2) * xjac(1,3) &
            +xjac(3,1) * xjac(2,3) * xjac(1,2)-xjac(3,1) * xjac(2,2) * xjac(1,3) &
            -xjac(2,1) * xjac(1,2) * xjac(3,3)-xjac(1,1) * xjac(2,3) * xjac(3,2)
    
    inv_djac = 1.0d0 / djac
    
    !if (djac>0.d0) then ! jacobian is positive - o.k.
    xjaci(1,1)=(xjac(2,2) * xjac(3,3)-xjac(2,3) * xjac(3,2)) * inv_djac
    xjaci(1,2)=(xjac(1,3) * xjac(3,2)-xjac(1,2) * xjac(3,3)) * inv_djac
    xjaci(1,3)=(xjac(1,2) * xjac(2,3)-xjac(1,3) * xjac(2,2)) * inv_djac
    xjaci(2,1)=(xjac(2,3) * xjac(3,1)-xjac(2,1) * xjac(3,3)) * inv_djac
    xjaci(2,2)=(xjac(1,1) * xjac(3,3)-xjac(1,3) * xjac(3,1)) * inv_djac
    xjaci(2,3)=(xjac(1,3) * xjac(2,1)-xjac(1,1) * xjac(2,3)) * inv_djac
    xjaci(3,1)=(xjac(2,1) * xjac(3,2)-xjac(2,2) * xjac(3,1)) * inv_djac
    xjaci(3,2)=(xjac(1,2) * xjac(3,1)-xjac(1,1) * xjac(3,2)) * inv_djac
    xjaci(3,3)=(xjac(1,1) * xjac(2,2)-xjac(1,2) * xjac(2,1)) * inv_djac

    B_deriv_global = matmul(xjaci,B_deriv_local)

return
end

subroutine kbmatrix(B_deriv_global,ntens,nnode,ndim,Bu_matrix)

    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    include 'aba_param.inc'

    dimension B_deriv_global(ndim,nnode),Bu_matrix(ntens,nnode * ndim)

    Bu_matrix=0.d0
    do inode=1,nnode
        Bu_matrix(1,ndim * inode-ndim+1) = B_deriv_global(1,inode)
        Bu_matrix(2,ndim * inode-ndim+2) = B_deriv_global(2,inode)
        Bu_matrix(4,ndim * inode-ndim+1) = B_deriv_global(2,inode)
        Bu_matrix(4,ndim * inode-ndim+2) = B_deriv_global(1,inode)
        if (ndim==3) then
            Bu_matrix(3,ndim * inode) = B_deriv_global(3,inode)
            Bu_matrix(5,ndim * inode-2) = B_deriv_global(3,inode)
            Bu_matrix(5,ndim * inode) = B_deriv_global(1,inode)
            Bu_matrix(6,ndim * inode-1) = B_deriv_global(3,inode)
            Bu_matrix(6,ndim * inode) = B_deriv_global(2,inode)
        endif
    end do

return
end

subroutine kstatevar(npt,nsvint,statev,statev_ip,icopy)

!   Transfer data to/from element-level state variable array from/to
!   material-point level state variable array.

    include 'aba_param.inc'

    dimension statev(*),statev_ip(*)

    isvinc=(npt-1) * nsvint     ! integration point increment

    if (icopy==1) then ! Prepare arrays for entry into umat
        do i=1,nsvint
            statev_ip(i)=statev(i+isvinc)
        enddo
    else ! Update element state variables upon return from umat
        do i=1,nsvint
            statev(i+isvinc)=statev_ip(i)
        enddo
    end if

return
end

    
subroutine UMAT_elastic(props,nprops,ddsdde,stress,sig_vonMises,syield, &
                        eelas,eplas,flow,hard_mod,eqplas,deqplas,dstran, &
                        ntens,ndi,nshr,statev)

    use precision
    use common_block
    include 'aba_param.inc'
      
!   Subroutine with the material model
      
    dimension props(*),ddsdde(ntens,ntens),stress(ntens),statev(*),dstran(ntens)
    dimension eelas(ntens), eplas(ntens), flow(ntens), hard(3)
    real(kind=dp) :: E, nu, mu, lambda
    
    E = props(before_mech_props_idx+1)           ! Young's modulus 
    nu = props(before_mech_props_idx+2)          ! Poisson's ratio 

    ! Lame's parameters
    mu = E/(2.0d0 * (1.0d0 + nu))  ! Shear modulus
    lambda = E * nu/((1.0d0 + nu) * (1.0d0 - 2.0d0 * nu)) ! Lame's first constant

    ! print *, 'UMAT_elastic: mu = ', mu
    ! print *, 'UMAT_elastic: lambda = ', lambda
    ! initialize as 0
    ddsdde = 0.0 ! Their unit is Pa
    
    do i = 1, ndi
        do j = 1, ndi
            ddsdde(j, i) = lambda
        end do 
        ddsdde(i,i) = lambda + 2.0d0 * mu
    end do 

    ! Shear contribution
    do i = ndi + 1, ntens
        ddsdde(i,i) = mu
    end do 

    ! Stress increment evaluation
    do i = 1, ntens
        do j = 1, ntens
            stress(j) = stress(j) + ddsdde(j, i) * dstran(i)
        end do
        eelas(i) = eelas(i) + dstran(i)
    end do

    ! Calculate equivalent von Mises stress
    
    sig_vonMises = (stress(1) - stress(2))**2 + &
                   (stress(2) - stress(3))**2 + &
                   (stress(3) - stress(1))**2
    
    do i = ndi + 1, ntens
        sig_vonMises = sig_vonMises + 6.d0 * stress(i)**2
    end do
    sig_vonMises = sqrt(sig_vonMises/2.d0) ! Unit is Pa

    eplas = 0.0d0
    flow = 0.0d0
    hard_mod = 0.0d0
    eqplas = 0.0d0
    deqplas = 0.0d0
    syield = 0.0d0
return
end

! This is isotropic von Mises plasticity model


subroutine UMAT_von_Mises(props,nprops,ddsdde,stress,sig_vonMises,syield, &
                        eelas,eplas,flow,hard_mod,eqplas,deqplas,dstran,psi_plas, &
                        ntens,ndi,nshr,statev)
    
    use precision
    use common_block
    include 'aba_param.inc'
      
    dimension props(*),ddsdde(ntens,ntens),stress(ntens),statev(*), dstran(ntens)

    real(kind=dp) :: E, nu, lambda, mu, eqplas, deqplas, syield, syiel0, sig_vonMises, shydro, rhs 
    real(kind=dp) :: effective_mu, effective_lambda, effective_hard    

    dimension eelas(ntens), eplas(ntens), flow(ntens), hard(3), olds(ntens), oldpl(ntens)

    real(kind=8), parameter :: toler = 1e-12
    real(kind=8), parameter :: newton = 100
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
    
    ! props(1:8) is for mechanical properties
    ! props(9:16) is for phase field properties
    ! props(17:40) is for hydrogen diffusion properties

    ! Lame's parameters
    mu = E/(2.0d0 * (1.0 + nu))  ! Shear modulus
    lambda = E*nu/((1.0 + nu) * (1.0 - 2.0 * nu)) ! Lame's first constant

    eelas(1:ntens)=statev((2*ntens+1):3*ntens)
    eplas(1:ntens)=statev((3*ntens+1):4*ntens)
    eqplas=statev(1+4*ntens)
    deqpl=statev(5+4*ntens)
    olds=stress
    oldpl=eplas

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

    !    Calculate predictor stress and elastic strain
    stress=stress+matmul(ddsdde,dstran)
    eelas=eelas+dstran

    ! Calculate equivalent von Mises stress
    
    sig_vonMises = (stress(1) - stress(2))**2 + &
                   (stress(2) - stress(3))**2 + &
                   (stress(3) - stress(1))**2
    
    do i = ndi + 1, ntens
        sig_vonMises = sig_vonMises + 6.d0 * stress(i)**2
    end do
    sig_vonMises = sqrt(sig_vonMises/2.d0) ! Unit is Pa
    
    ! get yield stress from the specified hardening curve
    ! nvalue equal to number of points on the hardening curve
    
    nvalue = (nprops - before_flow_props_idx) / 2

    ! print *, 'nvalue = ', nvalue ! 100
    ! print *, 'before_flow_props_idx = ', before_flow_props_idx ! 40
    
    call UHARD_von_Mises(syiel0, hard, eqplas, &
                                statev, nvalue, props(before_flow_props_idx + 1))
    

    ! Determine if active yielding

    if (sig_vonMises > (1.d0 + toler) * syiel0) then

        ! actively yielding
        ! separate the hydrostatic from the deviatoric stress
        ! calculate the flow direction

        shydro = (stress(1) + stress(2) + stress(3))/3.d0
        flow(1:ndi) = (stress(1:ndi) - shydro)/sig_vonMises
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
 
        stress(1:ndi) = flow(1:ndi) * syield + shydro
        eplas(1:ndi) = eplas(1:ndi) + 3.d0/2.d0 * flow(1:ndi) * deqplas
        eelas(1:ndi) = eelas(1:ndi) - 3.d0/2.d0 * flow(1:ndi) * deqplas
        
        stress(ndi + 1:ntens) = flow(ndi + 1:ntens) * syield
        eplas(ndi + 1:ntens) = eplas(ndi + 1:ntens) + 3.d0 * flow(ndi + 1:ntens) * deqplas
        eelas(ndi + 1:ntens) = eelas(ndi + 1:ntens) - 3.d0 * flow(ndi + 1:ntens) * deqplas

        ! Finally, we update the equivalent plastic strain
        eqplas = eqplas + deqplas

        ! Calculate the plastic strain energy density
        ! psi_plas = deqplas * (syiel0 + syield) / 2.d0

        do i=1,ntens
            psi_plas=psi_plas+(stress(i)+olds(i))*(eplas(i)-oldpl(i))/2.d0
        end do

        ! Formulate the jacobian (material tangent)   

        ! effective shear modulus
        effective_mu = mu * syield / sig_vonMises 

        ! effective Lame's constant
        effective_lambda = (E/(1.d0 - 2.d0 * nu) - 2.d0 * effective_mu)/3.d0 

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

        hard_mod = hard(1)
    else
        syield = 0.0d0
        eqplas = 0.0d0
        deqplas = 0.0d0
        eplas = 0.0d0
        flow = 0.0d0
        hard_mod = 0.0d0
    endif

    
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

                deqpl = eqpl1 - eqpl0
                syiel0 = table(1, k1)
                syiel1 = table(1, k1 + 1)
                dsyiel = syiel1 - syiel0
                hard(1) = dsyiel/deqpl
                syield = syiel0 + (eqplas - eqpl0) * hard(1)
                exit
            endif
        end do
    endif

return
end


!***********************************************************************

subroutine UMATHT_diffusion(eqplas, deqplas, &
    C_mol, CL_mol, new_CL_mol, dCL_mol, &
    CT_mol, CT_dis_mol, CT_gb_mol, CT_carb_mol, &
    thetaL, thetaT_dis, thetaT_gb, thetaT_carb, &
    statev, props, nprops)

    !  intent in: eqplas, deqplas, statev, props, CL_mol
    !  intent out: the rest 

    use precision
    use common_block
    inCLude 'aba_param.inc'

    dimension statev(*),props(nprops)
    
    !***********************************************************************
    
    ! Define all real for all variables used 
    real(kind=dp) :: mode, mode_tol, crystal_structure, crystal_tol, R, T, VH, DL 
    real(kind=dp) :: avogadro, inv_avogadro, NL, alpha_dis, alpha_gb, alpha_carb, NT_dis, NT_gb, NT_carb
    real(kind=dp) :: WB_dis, WB_gb, WB_carb, beta_BCC, beta_FCC, a_lattice_BCC, a_lattice_FCC
    real(kind=dp) :: gamma, rho_d0
    real(kind=dp) :: CLprev_mol, dCL_mol, CL_mol, new_CL_mol, CL, K_dis, K_gb, K_carb
    real(kind=dp) :: burgers_vector, inverse_burgers_vector, beta, NL_mol
    real(kind=dp) :: thetaL, temp_dis, thetaT_dis, temp_gb, thetaT_gb, temp_carb, thetaT_carb
    real(kind=dp) :: eqplas, rho_d, NT_dis_mol, CT_dis, CT_dis_mol
    real(kind=dp) :: part_C_mol_part_NT_dis_mol, dNT_dis_deqplas
    real(kind=dp) :: part_CT_dis_mol_part_CL_mol, part_CT_gb_mol_part_CL_mol, part_CT_carb_mol_part_CL_mol
    real(kind=dp) :: total_part_CT_mol_part_CL_mol, part_C_mol_part_CL_mol, deqplas
    real(kind=dp) :: C_mol, CT_mol, CT_gb, CT_gb_mol, CT_carb, CT_carb_mol

    R               = props(before_hydro_props_idx+1) ! Universal gas constant (8.31446 J/(mol K))
    T               = props(before_hydro_props_idx+2) ! Temperature (300 K)
    VH              = props(before_hydro_props_idx+3) ! Partial molar volume of hydrogen (2e-06 m^3/mol), 
    DL              = props(before_hydro_props_idx+4) ! Diffusion coefficient for lattice hydrogen in the steel (m^2/s), from e-10 to e-15
                               ! This parameter varies widely for different steels and different conditions
    mode            = props(before_hydro_props_idx+5) ! Mode of the traps
    mode_tol        = 1.0e-3
    ! mode_tol is only for checking the equality since mode is a real instead of an integer
    ! mode = 1: CT = 0 (no trap hydrogen)
    ! mode = 2: Kumnick, Krom et al. (1999) Hydrogen transport near a blunting crack tip
    ! mode = 3: Sofronis, Dadfarnia et al. (2011) Hydrogen interaction with multiple traps: Can it be used to mitigate embrittlement
    
    crystal_structure = props(before_hydro_props_idx+6) ! Crystal structure (1 - BCC, 2 - FCC)
    crystal_tol     = 1.0e-3 ! same for above reason

    avogadro        = props(before_hydro_props_idx+7) ! Avogadro's constant (6.022e23 1/mol)
    ! NL = Avogadro (NA) * (density of metal rho_metal) / (atomic weight of metal atom) 
    ! NL = 6.02214e23 [atom/mol] * 7900 [kg/m**3] / (55.85e-3 [kg/mol]) = 8.518e28 [atom/m**3]
    NL              = props(before_hydro_props_idx+8) ! Number of solvent metal atoms per unit volume (8.518e28 1/m^3)
    alpha_dis       = props(before_hydro_props_idx+9) ! Number of interstitial sites per trap site (dislocations) (1.0 dimless)
    alpha_gb        = props(before_hydro_props_idx+10) ! Number of interstitial sites per trap site (grain boundaries) (1.0 dimless)
    alpha_carb      = props(before_hydro_props_idx+11) ! Number of interstitial sites per trap site (carbides) (1.0 dimless)
    NT_dis          = props(before_hydro_props_idx+12) ! Number of trap type of dislocations (1/m^3) (0 - instead defined by Dadfarnia et al. 2016)
    NT_gb           = props(before_hydro_props_idx+13) ! Number of trap type of grain boundaries (1/m^3) (8.464e22)
    NT_carb         = props(before_hydro_props_idx+14) ! Number of trap type of carbides (1/m^3) (8.464e26)
    WB_dis          = props(before_hydro_props_idx+15) ! Binding energy of hydrogen to dislocations (- 20.2e3) (J/mol)
    WB_gb           = props(before_hydro_props_idx+16) ! Binding energy of hydrogen to grain boundaries (- 58.6e3) (J/mol)
    WB_carb         = props(before_hydro_props_idx+17) ! Binding energy of hydrogen to carbides (- 11.5e3) (J/mol)
    beta_BCC        = props(before_hydro_props_idx+18) ! Number of number of hydrogen atoms that can reside in each lattice site (6.0 dimless)
    beta_FCC        = props(before_hydro_props_idx+19) ! Number of number of hydrogen atoms that can reside in each lattice site (1.0 dimless)
    ! References for lattice parameter
    a_lattice_BCC   = props(before_hydro_props_idx+20) ! Lattice parameter (2.866 Angstrom or 2.866e-10 m)
    a_lattice_FCC   = props(before_hydro_props_idx+21) ! Lattice parameter (3.571 Angstrom or 3.571e-10 m)
    gamma           = props(before_hydro_props_idx+22) ! gamma fitting parameter in Dadfarnia et al. (2.0e16 1/m^2)
    rho_d0          = props(before_hydro_props_idx+23) ! Dislocation density for the annealed material in Dadfarnia et al. (1.0e10 1/m^2)

    ! print *, 'mode = ', mode
    ! print *, 'crystal_structure = ', crystal_structure
    ! print *, 'R = ', R
    ! print *, 'T = ', T
    ! print *, 'VH = ', VH
    ! print *, 'DL = ', DL
    ! print *, 'avogadro = ', avogadro
    ! print *, 'NL = ', NL
    ! print *, 'alpha_dis = ', alpha_dis
    ! print *, 'alpha_gb = ', alpha_gb
    ! print *, 'alpha_carb = ', alpha_carb
    ! print *, 'NT_dis = ', NT_dis
    ! print *, 'NT_gb = ', NT_gb
    ! print *, 'NT_carb = ', NT_carb
    ! print *, 'WB_dis = ', WB_dis
    ! print *, 'WB_gb = ', WB_gb
    ! print *, 'WB_carb = ', WB_carb
    ! print *, 'beta_BCC = ', beta_BCC
    ! print *, 'beta_FCC = ', beta_FCC
    ! print *, 'a_lattice_BCC = ', a_lattice_BCC
    ! print *, 'a_lattice_FCC = ', a_lattice_FCC
    ! print *, 'gamma = ', gamma
    ! print *, 'rho_d0 = ', rho_d0

    ! Hydrogen concentration in this subroutine is in mol/m^3 unit
    ! However, the same logic also applies to wtppm/m^3. So you should either uses consistent wtppm or mol/m^3
    
    ! THE DEGREE OF FREEDOM FOR HYDROGEN CONCENTRATION IS lattice hydrogen CL_mol in mol/m^3
    ! It is marked by the suffix _mol in the variable name
    ! We can convert it to 1/m^3 by multiplying with Avogadro's number, which does not have any suffix
    ! Example: CL_mol = CL * inv_avogadro or CL (1/m^3) = CL_mol (mol/m^3) * avogadro (1/mol)

    CL = CL_mol * avogadro ! (1/m^3)

    ! Arhenius reaction rate constant for trap types 
    K_dis = dexp( -WB_dis / (R * T)) ! constant, dimless
    ! (dimless) = exp( - (J/mol) / (J/(mol K) * K))
    K_gb = dexp( -WB_gb / (R * T)) ! constant, dimless
    K_carb = dexp( -WB_carb / (R * T)) ! constant, dimless

    ! slip occurs along the plane of the shortest Burgers vector
    if (abs(crystal_structure - 1.0d0) <= crystal_tol) then ! BCC crystal structure
        beta = beta_BCC ! beta is taken to be 6 for BCC as indirect
                        ! evidence indicates tetrahedral site occupancy rather than 
                        ! octahedral site occupancy at room temperature in alpha-iron
        ! slip is assumed to occur along the {110} plane and ⟨111⟩ direction
        burgers_vector = (dsqrt(3.0d0)/2.0d0) * a_lattice_BCC ! (m) 
        inverse_burgers_vector = 1.0d0/burgers_vector ! (1/m)
    elseif (abs(crystal_structure - 2.0d0) <= crystal_tol) then ! FCC crystal structure
        beta = beta_FCC ! beta is taken to be 1 for FCC, resulting from the more favourable 
                        ! octahedral site occupancy (beta = 2 for tetrahedral)
        ! slip occurs along the closed packed plane {111} and slip direction ⟨110⟩
        burgers_vector = (dsqrt(2.0d0)/2.0d0) * a_lattice_FCC ! (m)
        inverse_burgers_vector = 1.0d0/burgers_vector ! (1/m)
    end if
    
    inv_avogadro = 1.0d0 / avogadro ! (1/mol)

    ! Finding NL_mol
    NL_mol = NL * inv_avogadro ! (mol/m^3) = (1/m^3) / (1/mol)

    ! Finding thetaL 
    thetaL = CL / (beta * NL) ! = (1/m^3) / (dimless * 1/m^3) = dimless

    ! Finding thetaT based on Oriani equilibrium theory
    ! which results in a Fermi-Dirac relation

    ! thetaT / (1 - thetaT) = K * thetaL / (1 - thetaL)
    ! However if thetaL << 1  then 
    ! thetaT / (1 - thetaT) = K * thetaL

    temp_dis = K_dis * thetaL / (1.0d0 - thetaL) ! (dimless)
    thetaT_dis = temp_dis / (1.0d0 + temp_dis) ! (dimless)
    temp_gb = K_gb * thetaL / (1.0d0 - thetaL) ! (dimless)
    thetaT_gb = temp_gb / (1.0d0 + temp_gb) ! (dimless)
    temp_carb = K_carb * thetaL / (1.0d0 - thetaL) ! (dimless)
    thetaT_carb = temp_carb / (1.0d0 + temp_carb) ! (dimless)

    if (abs(mode - 1) <= mode_tol) then ! Lattice H only
        rho_d = 0.d0 ! (1/m^2)
        NT_dis = 0.d0 ! (1/m^3)
        NT_dis_mol = 0.d0 ! (mol/m^3)
        CT_dis = 0.d0 ! (1/m^3)
        CT_dis_mol = 0.d0 ! (mol/m^3)
        NT_gb = 0.d0 ! (1/m^3)
        NT_carb = 0.d0 ! (1/m^3)
        part_C_mol_part_NT_dis_mol = 0.d0 ! (1/m^3) / (1/m^3) = (dimless)
        dNT_dis_deqplas = 0.d0 ! (1/m^3) / (dimless) = (1/m^3)	
        
    elseif (abs(mode - 2) <= mode_tol) then ! Krom et al. (in sites/m^3), developed from Kumnick & Johnson 
        rho_d = 0.d0
        NT_dis = 10.d0 ** (23.26d0 - 2.33d0 * dexp(-5.5d0 * eqplas))
        NT_dis_mol = NT_dis * inv_avogadro
        CT_dis = alpha_dis * thetaT_dis * NT_dis
        CT_dis_mol = CT_dis * inv_avogadro
        part_C_mol_part_NT_dis_mol = (K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol)
        dNT_dis_mol_deqplas = (29.5d0 * dexp(-5.5d0 * eqplas) * NT_dis ) * inv_avogadro
    
    elseif (abs(mode - 3) <= mode_tol) then ! Dadfarnia et al.
        if (eqplas < 0.5) then
            rho_d = rho_d0 + eqplas * gamma ! rho_d unit is 1/m^2 = 1/m^2 + dimless * 1/m^2
            NT_dis = inverse_burgers_vector * rho_d ! NT_dis unit is 1/m^3 = 1/m * 1/m^2
            NT_dis_mol = NT_dis * inv_avogadro ! NT_dis_mol unit is mol/m^3 = 1/m^3 / 1/mol
            CT_dis = alpha_dis * thetaT_dis * NT_dis ! CT_dis unit is 1/m^3 = dimless * dimless * 1/m^3
            CT_dis_mol = CT_dis * inv_avogadro ! = (1/m^3) / (1/mol) = (mol/m^3)

            ! part_C_part_NT_dis = (K_dis * CL)/(K_dis * CL + beta * NL) ! dimless = dimless * 1/m^3 / (dimless * 1/m^3 + dimless * 1/m^3)
            part_C_mol_part_NT_dis_mol = (K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol) ! dimless = dimless * mol/m^3 / (dimless * mol/m^3 + dimless * mol/m^3)
            ! dNT_dis_deqplas = inverse_burgers_vector * gamma ! 1/m^3 = 1/m * 1/m^2
            dNT_dis_mol_deqplas = (inverse_burgers_vector * gamma) * inv_avogadro ! mol/m^3 = (1/m * 1/m^2) / (1/mol)
            ! du2 in emilio is part_C_mol_part_NT_dis_mol * dNT_dis_mol_deqplas * deqplas     
        elseif (eqplas >= 0.5) then
            rho_d = 1.0d16 ! (1/m^2)
            NT_dis = inverse_burgers_vector * rho_d ! (1/m^3)
            NT_dis_mol = NT_dis * inv_avogadro ! (mol/m^3)
            CT_dis = alpha_dis * thetaT_dis * NT_dis ! (1/m^3)
            CT_dis_mol = CT_dis * inv_avogadro ! (mol/m^3)
            ! part_C_part_NT_dis = 0.d0
            part_C_mol_part_NT_dis_mol = (K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol) ! dimless = dimless * mol/m^3 / (dimless * mol/m^3 + dimless * mol/m^3)
            ! dNT_dis_deqplas = 0.d0
            dNT_dis_mol_deqplas = 0.d0
        endif
    end if
    
    NT_dis_mol = NT_dis * inv_avogadro ! (mol/m^3)
    NT_gb_mol = NT_gb * inv_avogadro ! (mol/m^3)
    NT_carb_mol = NT_carb * inv_avogadro ! (mol/m^3)

    part_CT_dis_mol_part_CL_mol = (NT_dis_mol * K_dis * NL_mol * beta)/((K_dis * CL_mol + NL_mol * beta)**2.d0)
    part_CT_gb_mol_part_CL_mol = (NT_gb_mol * K_gb * NL_mol * beta)/((K_gb * CL_mol + NL_mol * beta)**2.d0)
    part_CT_carb_mol_part_CL_mol = (NT_carb_mol * K_carb * NL_mol * beta)/((K_carb * CL_mol + NL_mol * beta)**2.d0)
    ! (dimless) = (mol/m^3 * dimless * mol/m^3 * dimless) / ((dimless * mol/m^3 + mol/m^3 * dimless)**2)

    total_part_CT_mol_part_CL_mol = part_CT_dis_mol_part_CL_mol + &
                                  part_CT_gb_mol_part_CL_mol + &
                                  part_CT_carb_mol_part_CL_mol

    part_C_mol_part_CL_mol = 1.d0 + total_part_CT_mol_part_CL_mol	
     
    ! (mol/m^3) = (mol/m^3) + (dimless * mol/m^3) + (dimless * mol/m^3 * dimless)
    new_CL_mol = CL_mol + part_C_mol_part_CL_mol * dCL_mol &
               + part_C_mol_part_NT_dis_mol * dNT_dis_mol_deqplas * deqplas

    ! store the concentration in all traps and lattice
    
    ! CT_dis and CT_dis_mol is already calculated above
    ! CT_dis = alpha_dis * thetaT_dis * NT_dis ! (1/m^3)
    ! CT_dis_mol = CT_dis * inv_avogadro ! (mol/m^3)
    ! CT_dis_mol = (NT_dis_mol * K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol)
    
    CT_gb = alpha_gb * thetaT_gb * NT_gb ! (1/m^3)
    CT_gb_mol = CT_gb * inv_avogadro ! (mol/m^3)
    ! That is also equivalent to this (assuming alpha_gb = 1)
    ! CT_gb_mol = (NT_gb_mol * K_gb * CL_mol)/(K_gb * CL_mol + beta * NL_mol)
    
    CT_carb = alpha_carb * thetaT_carb * NT_carb ! (1/m^3)
    CT_carb_mol = CT_carb * inv_avogadro ! (mol/m^3)
    ! That is also equivalent to this (assuming alpha_carb = 1)
    ! CT_carb_mol = (NT_carb_mol * K_carb * CL_mol)/(K_carb * CL_mol + beta * NL_mol)
    
    CT_mol = CT_dis_mol + CT_gb_mol + CT_carb_mol

    ! print *, 'CT_dis_mol = ', CT_dis_mol
    ! print *, 'CT_gb_mol = ', CT_gb_mol
    ! print *, 'CT_carb_mol = ', CT_carb_mol

    C_mol = CL_mol + CT_mol

return
end

! ***********************************************************************

subroutine calc_sig_H_node(sig_H_node, jelem, ninpt, nnode, nsvint)

    use precision
    use iso_module
    use common_block

    include 'aba_param.inc' !implicit real(a-h o-z)

    integer :: max_num_elems_per_node = 8
    real(kind=dp), dimension(nnode,1) :: sig_H_node 
    integer, dimension(nnode) :: jelem_nodes
    integer, dimension(8) :: elems_containing_current_node
    real, dimension(ninpt) :: shape_int_to_node
    integer :: count_elem
    ! count_elem is from 1 to 8 (number of elements that contain current node)

    ! node_to_elem_matrix(120000, 8) ! 8 is max number of elements
    ! elem_to_node_matrix(100000, 8) ! 8 is nnode
    ! user_vars(100000, 24, 8) ! 8 is ninpt

!   compute the hydrostatic stress
    jelem_nodes = elem_to_node_matrix(jelem, 1:nnode)
    
    do inode = 1,nnode
        
        current_node_ID = jelem_nodes(inode)        
        elems_containing_current_node = node_to_elem_matrix(current_node_ID, 1: max_num_elems_per_node)
        
        !  shape_int_to_node = all_shape_int_to_node(inode, 1: ninpt)

        count_elem = 0
        total_sig_H_current_node = 0.d0

        do ielem = 1, max_num_elems_per_node
            if (elems_containing_current_node(ielem) /= -1) then
                count_elem = count_elem + 1
                current_elem_ID = elems_containing_current_node(ielem)
                
                inode_current_node_in_current_elem = -1
                do inode_check = 1, nnode
                    if (elem_to_node_matrix(current_elem_ID, inode_check) == current_node_ID) then
                        inode_current_node_in_current_elem = inode_check
                        exit
                    end if
                end do
                
                sig_H_current_node_current_elem = sig_H_all_elem_at_nodes(current_elem_ID, inode_current_node_in_current_elem)
                total_sig_H_current_node = total_sig_H_current_node + sig_H_current_node_current_elem
            end if
        end do

        sig_H_node(inode,1) = total_sig_H_current_node / real(count_elem, kind=dp)
        !print *, count_elem
    end do      

return
end

! This is the damage parameter based on extended Bai Wierzbicki fracture criteria
! df stands for ductile fracture
! HELP is hydrogen enhanced localized plasticity
! HEDE is hydrogen enhanced decohesion

! Strain based uncoupled damage criterion - HELP
subroutine strain_damage_criterion_HELP(strain_criterion, fdf_C_mol, eqplas_f)
    if (eqplas_f >= fdf_C_mol) then
        strain_criterion = 1.0d0
    else
        strain_criterion = 0.0d0
    end if
return
end

! Stress based uncoupled damage criterion - HEDE
subroutine stress_damage_criterion_HEDE(stress_criterion, sig_I_C_mol, &
                                    sig_principal1, sig_principal2, sig_principal3)
    max_sig_principal = max(max(sig_principal1, sig_principal2), sig_principal3)
    if (max_sig_principal >= sig_I_C_mol) then
        stress_criterion = 1.0d0
    else
        stress_criterion = 0.0d0
    end if
return
end

subroutine calc_sig_I_C_mol(sig_I_C_mol, C_mol)
    sig_I_C_mol = 2108.0d0 * C_mol ** (-0.23d0)
return
end


subroutine calc_phi_BW(phi_BW, sig_vonMises, damage, sig_yield, &
                        f_triax, f_lode_norm, f_C_mol)
    phi_BW = sig_vonMises - (1 - damage) * sig_yield * f_triax * f_lode_norm * f_C_mol
return
end

! Implement this function
subroutine calc_f_C_mol(f_C_mol, dummy)
    f_C_mol = 0.0d0
return
end

! Damage depends on four factors: 
! equivalent plastic strain, triaxiality, normalized lode angle and hydrogen concentration

subroutine update_damage(damage, damage_critical, deqplas, eqplas_df)
    damage = damage + damage_cr * deqplas / eqplas_df
return
end

subroutine evolve_damage(damage, damage_critical, Iddi, Idf, triax)
    if (Iddi < 1.0d0 .and. triax > -1.0d0/3.0d0) then
        call update_Iddi(Iddi, deqplas, eqplas_ddi)
    elseif (Iddi >= 1.0d0 .and. triax > -1.0d0/3.0d0) then
        call update_Idf(Idf, deqplas, eqplas_df)
    elseif (Idf < 1.0d0 .and. triax > -1.0d0/3.0d0) then
        call update_damage(damage, damage_critical, deqplas, eqplas_df)
    elseif (Idf >= 1.0d0 .and. triax > -1.0d0/3.0d0) then
        damage = 1.0d0
    end if
return
end

subroutine calc_eqplas_ddi(eqplas_ddi, ddi1, ddi2, ddi3, ddi4, &
                        triax, lode_norm, fddi_C_mol)
    use precision
    real(kind=dp) :: eqplas_ddi, ddi1, ddi2, ddi3, ddi4, triax, lode_norm, fddi_C_mol
    eqplas_ddi = (ddi1 * dexp(-ddi2 * triax) - ddi3 * dexp(-ddi4 * triax)) * lode_norm &
                + ddi3 * dexp(-ddi4 * triax)
    eqplas_ddi = eqplas_ddi * fddi_C_mol
return
end

! Implement this function
subroutine calc_fddi_C_mol(fddi_C_mol, dummy)
    fddi_C_mol = 0.0
return
end

subroutine calc_eqplas_df(eqplas_df, df1, df2, df3, df4, &
                        triax, lode_norm, fdf_C_mol)
    use precision
    real(kind=dp) :: eqplas_df, df1, df2, df3, df4, triax, lode_norm, fdf_C_mol
    eqplas_df = (df1 * dexp(-df2 * triax) - df3 * dexp(-df4 * triax)) * lode_norm &
                + df3 * dexp(-df4 * triax)
    eqplas_df = eqplas_df * fdf_C_mol

return
end

subroutine calc_fdf_C_mol(fdf_C_mol, C_mol)
    fdf_C_mol = 1.7684d0 * dexp(-4.0d7 * C_mol)
return
end

! Update the initiation of ductile damage
subroutine update_Iddi(Iddi, deqplas, eqplas_ddi)
    Iddi = Iddi + deqplas / eqplas_ddi
return
end

! Update the initiation of ductile fracture
subroutine update_Idf(Idf, deqplas, eqplas_df)
    Idf = Idf + deqplas / eqplas_df
return
end

subroutine calc_degradation_func(degradation, current_value, critical_value, &
                                lower_bound, stop_amount)
    if (current_value < critical_value) then
        degradation = 1.0d0
    elseif (critical_value <= current_value < stop_amount + critical_value) then
        degradation = (1.0d0 - lower_bound) / (stop_amount * stop_amount) * \
                    (current_value - critical_value - stop_amount) * \
                    (current_value - critical_value - stop_amount) + lower_bound
    elseif (current_value >= stop_amount + critical_value) then
        degradation = lower_bound
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
    integer, parameter :: nsvint = 36 ! Number of state variables at integration points
    integer, parameter :: ndof = 5 ! Number of degrees of freedom per node (3 displacements + damage + hydrogen concentration)
    
    integer, parameter :: start_u_idx = 1
    integer, parameter :: end_u_idx = 24 ! = nnode * ndim
    integer, parameter :: start_phi_idx = 25
    integer, parameter :: end_phi_idx = 32
    integer, parameter :: start_CL_idx = 33
    integer, parameter :: end_CL_idx = 40

    ! We scale up amatrx and rhs to avoid numerical issues of very small numbers
    ! In other words, we avoid warnings of 
    ! There is zero force everywhere 
    ! There is zero flux everywhere
    ! There is zero moment everywhere
    ! and so on
    ! Example: The solution is the same between these two equations
    ! 5 * x = 7
    ! 5e-23 * x = 7e-23
    ! The solution is x = 7/5 = 1.4, but the second equation will give x = 0 due to
    ! very small rhs that Abaqus treats rhs as zero
    real(kind=dp), parameter :: scale_up = 1.0d6
    
    ! The following data is not part of UEL, defined by the user    
    real(kind=dp), dimension(ndim * nnode) :: u_prev, du_prev
    real(kind=dp), dimension(nnode) :: phi_prev, dphi_prev
    real(kind=dp), dimension(nnode) :: CL_prev, dCL_prev
    
    !real(kind=dp), dimension(ninpt) :: weight                      ! Weights for integration points
    real(kind=dp), dimension(1,nnode) :: shape_node_to_int    ! Shape function that interpolates from nodal points to integration points
                                                                    ! The extra 1 dimension is for matrix multiplication, otherwise it would be a vector
    real(kind=dp), dimension(ninpt) :: shape_int_to_node         ! Shape function that extrapolates from integration points to nodal points
    real(kind=dp), dimension(ndim,nnode) :: B_deriv_local           ! Derivatives of N_shape_nodal_to_int with respect to isoparametric coordinates
    real(kind=dp), dimension(ndim,nnode) :: B_deriv_global          ! Derivatives of N_shape_nodal_to_int with respect to global coordinates
                                                                    ! This is the collection of vectors with spatial derivatives of N_shape_nodal_to_int
                                                                    ! Each column is the vector B_i in Emilio et al. 
    real(kind=dp), dimension(ntens,nnode * ndim) :: Bu_matrix         ! Strain-displacement matrix (B matrix)
    real(kind=dp), dimension(nnode, nnode) :: BB                    ! B matrix transpose times B matrix
    real(kind=dp), dimension(ntens,ntens) :: ddsdde                 ! Tangent stiffness matrix 
    real(kind=dp), dimension(ntens) :: stress                       ! Stress vector of the current element jelem
    real(kind=dp), dimension(ntens) :: stran                        ! Strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: dstran                       ! Incremental strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: eelas                        ! Elastic strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: eplas                        ! Plastic strain vector of the current element jelem
    real(kind=dp), dimension(ntens) :: flow                         ! plastic flow direction for the von Mises plasticity model

    real(kind=dp), dimension(nnode,nnode)  :: M_conc_capacity       ! Concentration capacity matrix (for hydrogen diffusion)
    real(kind=dp), dimension(nnode,nnode) :: K_diffusitivity        ! Diffusitivity matrix (for hydrogen diffusion)
    real(kind=dp), dimension(nnode,1) :: sig_H_node                 ! Hydrostatic stress at each node
    real(kind=dp), dimension(nnode,1) :: softened_sig_H_node       ! Softened hydrostatic stress at each node
    real(kind=dp), dimension(nnode,nnode) :: softened_sig_H_int         ! Softened hydrostatic stress at each integration point
    real(kind=dp), dimension(ndim,nnode) :: softened_grad_sig_H_int        ! Softened hydrostatic stress gradient at each node
    real(kind=dp), dimension(nsvint) :: statev_element              ! Local state variables of the current element jelem
    real(kind=dp), dimension(ndim, ndim) :: jac, inv_jac            ! Jacobian and its inverse
    real(kind=dp), dimension(ntens, ntens) :: ddsdde_elas           ! Elastic stiffness matrix C0
    real(kind=dp), dimension(ntens) :: temp                 ! Temporary matrix for matrix multiplication
    ! Declaring all props as real(kind=dp) for consistency
    real(kind=dp) :: length_scale, Gc0, xkap, chi_DFT, delta_g_b0, R, T, VH, DL, KL
    real(kind=dp) :: eqplas, deqplas, CL_mol, CL_wtppm, CL_molfrac
    real(kind=dp) :: sig_vonMises, sig_hydrostatic, triaxility, lode_angle
    real(kind=dp) :: invariant_p, invariant_q, invariant_r

    ! Declare all variables for UMATHT_diffusion as real dp
    real(kind=dp) :: C_mol, new_CL_mol, dCL_mol, CT_mol, CT_dis_mol, CT_gb_mol, CT_carb_mol
    real(kind=dp) :: thetaL, thetaT_dis, thetaT_gb, thetaT_carb
    
    real(kind=dp) :: E, nu, lambda, mu, kappa, hard_mod, syield, psi, psi_plas

!   initialising
    do k1=1,ndofel
        rhs(k1,1)=0.d0
    end do
    amatrx=0.d0
    
!   find total number of elements and stored it to total_elems       
    ! if (dtime==0.d0) then
    !     if (jelem==1) then
    !         total_elems=jelem
    !     else
    !         if (jelem>total_elems) then
    !             total_elems=jelem 
    !         end if
    !     endif 
    ! endif     

    ! if (kinc==1) then
    !     print *, 'total_elems = ', total_elems
    ! endif 

    ! Extract from the variable u and du
    u_prev(1:ndim * nnode)  = u(start_u_idx:end_u_idx)
    phi_prev(1:nnode)       = u(start_phi_idx:end_phi_idx)
    CL_prev(1:nnode)        = u(start_CL_idx:end_CL_idx)

    du_prev(1:ndim * nnode) = du(start_u_idx:end_u_idx, 1)
    dphi_prev(1:nnode)      = du(start_phi_idx:end_phi_idx, 1)
    dCL_prev(1:nnode)       = du(start_CL_idx:end_CL_idx, 1)

!   reading parameters
    length_scale=props(before_phase_props_idx+1)
    Gc0 = props(before_phase_props_idx+2) ! Critical energy release rate in the absence of hydrogen
    xkap = props(before_phase_props_idx+3) ! Well-conditioning parameter
    chi_DFT = props(before_phase_props_idx+4) ! Fitting slope to the DFT data
    delta_g_b0 = props(before_phase_props_idx+5) ! Gibbs free energy difference between the decohering interface and the surrounding material
    
    E = props(before_mech_props_idx+1) ! Young's modulus E (Pa)
    nu = props(before_mech_props_idx+2) ! Poisson's ratio nu (dimless)

    R = props(before_hydro_props_idx+1) ! Universal gas constant R (N*m)/(mol*K))
    T = props(before_hydro_props_idx+2) ! Temperature (K)
    VH = props(before_hydro_props_idx+3) ! Molar volume of H (m^3/mol)
    DL = props(before_hydro_props_idx+4) ! Diffusion coefficient of lattice species hydrogen

    ! Calculate the hydrostatic stress
    sig_H_node = 0.d0    
    
    ! do inode = 1,nnode
    !     shape_int_to_node(1:ninpt) = all_shape_int_to_node(inode,1:ninpt)

    !     do kintk = 1, ninpt
    !         isvinc = (kintk-1) * nsvint
    !         sig_H_node(inode,1) = sig_H_node(inode,1) &
    !                             + shape_int_to_node(kintk) * svars(isvinc + sig_H_idx)
    !     end do
    ! end do     

    call calc_sig_H_node(sig_H_node, jelem, ninpt, nnode, nsvint)
      
    do kintk=1,ninpt
        !   Transfer data from svars to statev_element for current element
        call kstatevar(kintk,nsvint,svars,statev_element,1)

        !   Compute shape_node_to_int and B_deriv_local
        shape_node_to_int(1,1:nnode) = all_shape_node_to_int(kintk,1:nnode)
        B_deriv_local(1:ndim,1:nnode) = all_B_deriv_local(kintk,1:ndim,1:nnode) 

        !   Compute djac and B_deriv_global
        call kjacobian(jelem,ndim,nnode,coords,B_deriv_local,djac,B_deriv_global,mcrd)
        !   Calculate strain displacement B-matrix
        call kbmatrix(B_deriv_global,ntens,nnode,ndim,Bu_matrix)     
        !   Differential volume at the integration point
        dvol = weight(kintk) * djac        
       
        !   ====================================================
        !   Calculate phase field damage phi variable
        !   ====================================================

        !   Compute from nodal values
        phi = 0.d0     ! This value is defined at integration point
    
        do inode = 1,nnode
            phi = phi + shape_node_to_int(1,inode) * phi_prev(inode)
        end do   

        if (phi > 1.d0) then 
            phi = 1.d0
        else if (phi < 0.d0) then
            phi = 0.d0
        endif
        
        phi_n = statev_element(phi_idx)

        if (dtime == 0.d0) then
            phi_n = phi
        endif
        
        ! phi_plas = 
        !   ====================================================
        !   Calculate deformation field (stress and strain, etc)
        !   ====================================================

        !   compute the increment of strain
        dstran = matmul(Bu_matrix,du_prev)
        
        ! !     defining suitable functions       
        ! hphi=-2.d0*phi**3+3.d0*phi**2
        ! dhphi=-6.d0*phi**2+6.d0*phi
        ! ddhphi=-12.d0*phi+6.d0
        ! gphi=(1.d0-phi)*(1.d0-phi)*phi**2
        ! dgphi=2.d0*phi+4.d0*phi**3-6.d0*phi**2
        ! ddgphi=2.d0+12.d0*phi**2-12.d0*phi
       
        ! Extract stress, strain, phi, history from statev_element
        stress = statev_element(1:ntens)
        stran = statev_element((ntens+1):(2*ntens))
        eelas = statev_element((2*ntens+1):(3*ntens))
        eplas = statev_element((3*ntens+1):(4*ntens))

        history_n = statev_element(history_idx)
        
        psi = 0.0d0
        do k1 = 1,ntens
            ! psi = psi + stress(k1) * eelas(k1) * 0.5d0
            psi = psi + stress(k1) * stran(k1) * 0.5d0
        end do

        !   enforcing Karush-Kuhn-Tucker conditions
        if (psi > history_n) then
            history = psi
        else
            history = history_n
        endif

        !   call umat to obtain stresses and constitutive matrix 
        ! call UMAT_elastic(props,nprops,ddsdde,stress,dstran,ntens,ndi,nshr,statev_element)

        eqplas = statev_element(eqplas_idx)
        
        call UMAT_von_Mises(props,nprops,ddsdde,stress,sig_vonMises,syield, &
                            eelas,eplas,flow,hard_mod,eqplas,deqplas,dstran,psi_plas, &
                            ntens,ndi,nshr,statev_element)
        
        ! call UMAT_elastic(props,nprops,ddsdde,stress,sig_vonMises,syield, &
        !                     eelas,eplas,flow,hard_mod,eqplas,deqplas,dstran, &
        !                     ntens,ndi,nshr,statev_element)

        stran = stran + dstran

        ! if (kinc==3) then
        !     print *, 'eelas = ', eelas
        !     print *, 'eplas = ', eplas
        ! end if

        !   ====================================================
        !   Calculate hydrogen field (CL_mol, C_mol, CT_mol, Gc, theta_coverage etc)
        !   ====================================================
        
        !   compute from nodal values
        
        CL_mol = 0.d0
        dCL_mol = 0.d0
        
        do inode = 1,nnode
            CL_mol = CL_mol + shape_node_to_int(1,inode) * CL_prev(inode)
            dCL_mol = dCL_mol + shape_node_to_int(1,inode) * dCL_prev(inode)
        end do   
        
        call UMATHT_diffusion(eqplas, deqplas, &
            C_mol, CL_mol, new_CL_mol, dCL_mol, &
            CT_mol, CT_dis_mol, CT_gb_mol, CT_carb_mol, &
            thetaL, thetaT_dis, thetaT_gb, thetaT_carb, &
            statev_element, props, nprops)

        ! subroutine UMATHT_diffusion(eqplas, deqplas, &
        !     C_mol, CL_mol, new_CL_mol, dCL_mol, &
        !     CT_mol, CT_dis_mol, CT_gb_mol, CT_carb_mol, &
        !     thetaL, thetaT_dis, thetaT_gb, thetaT_carb, &
        !     statev, props, nprops)

        !   hydrogen contribution  
        KL = dexp(-delta_g_b0/(R * T))
        ! Convert CL from mol to wtppm
        ! CL_wtppm = CL_mol * conversion_mol_to_wtppm
        C_wtppm = C_mol * conversion_mol_to_wtppm

        ! Conversion formula, if CL is in mol/m^3 and Cbar_L is in wtppm
        ! CL (wtppm) = [ Cbar_L (mol/m^3) * molar_mass_H (g/mol) ] / [ density_metal (kg/m^3) * 1e-06 (1g/1000kg) * 1000 (g/kg) ]

        ! Convert CL from wtppm to molfrac
        ! CL_molfrac = CL_wtppm * conversion_wtppm_to_molfrac
        C_molfrac = C_wtppm * conversion_wtppm_to_molfrac

        ! theta_coverage = CL_molfrac/(CL_molfrac + KL)
        theta_coverage = C_molfrac/(C_molfrac + KL)
        Gc = Gc0 * (1.d0 - chi_DFT * theta_coverage)

        !======================================================
        ! Calculate three invariants of the stress tensor
        ! Calculate stress triaxility and normalized lode angle
        ! =====================================================
    
        ! Calculating the deviatoric stress tensor S
        sig_hydrostatic = third * ( stress(1) + stress(2) + stress(3))
        dev_S11 = stress(1) - sig_hydrostatic
        dev_S22 = stress(2) - sig_hydrostatic
        dev_S33 = stress(3) - sig_hydrostatic
        dev_S12 = stress(4)
        dev_S13 = stress(5)
        dev_S23 = stress(6)

        ! Calculating the magnitude of the deviatoric trial stress tensor
        sig_trial_dev = dsqrt( dev_S11 * dev_S11 + &
                              dev_S22 * dev_S22 + &
                              dev_S33 * dev_S33 + &
                            2.0d0 * dev_S12 * dev_S12 + &
                            2.0d0 * dev_S13 * dev_S13 + &
                            2.0d0 * dev_S23 * dev_S23 )

        ! Preventing a divide by zero whensig_trial_dev is zero. 
        ! When sig_trial_dev is zero, computation is still in the elastic zone
        if (sig_trial_dev < 1.0d-6 .and. sig_trial_dev >= 0.0d0) sig_trial_dev = 1.0d-6
        if (sig_trial_dev > -1.0d-6 .and. sig_trial_dev <= 0.0d0) sig_trial_dev = -1.0d-6

        !  Calculating the 1st invariant of the stress tensor
        invariant_p   = - sig_hydrostatic

        ! Calculating the 2nd invariant of the stress tensor
        invariant_q   = sqrt_three_half * sig_trial_dev

        ! Calculating the 3rd invariant of the stress tensor

        ! Beware of raising a real negative number to a fractional power
        ! It will produce NaN in Fortran, 
        ! So we use a trick of turning it into positive number
        ! cube_root(negative x) = - cube_root(positive x)
        ! example: cube_root(-8) = - cube_root(8) = -2
        ! Check it out here
        ! https://www.reddit.com/r/fortran/comments/740x2e/problem_finding_cube_root_of_negative_number/
        
        invariant_r =  nine_half * ( &
                      dev_S11 * (dev_S11 * dev_S11 + dev_S12 * dev_S12 + dev_S23 * dev_S23) &
                    + dev_S22 * (dev_S12 * dev_S12 + dev_S22 * dev_S22 + dev_S13 * dev_S13) &
                    + dev_S33 * (dev_S23 * dev_S23 + dev_S13 * dev_S13 + dev_S33 * dev_S33) &
            + 2.0d0 * dev_S12 * (dev_S11 * dev_S12 + dev_S22 * dev_S12 + dev_S23 * dev_S13) & 
            + 2.0d0 * dev_S23 * (dev_S11 * dev_S23 + dev_S12 * dev_S13 + dev_S33 * dev_S23) & 
            + 2.0d0 * dev_S13 * (dev_S12 * dev_S23 + dev_S22 * dev_S13 + dev_S33 * dev_S13) &
            )
            
        if (invariant_r < 0.0d0) then
            invariant_r = - (abs(invariant_r) ** third)
        else
            invariant_r = invariant_r ** third
        endif

        ! Calculating the stress triaxility
        triaxiality = - invariant_p / invariant_q
            
        ! Calculating the normalized Lode angle
        ratio_invariant_r_q = invariant_r / invariant_q
        cosine_3_lode = ratio_invariant_r_q * ratio_invariant_r_q * ratio_invariant_r_q
    
        !   Ensuring that -1 < cosine_3_lode < 1
        if (cosine_3_lode > 1.0d0) cosine_3_lode = 1.0d0
        if (cosine_3_lode < -1.0d0) cosine_3_lode = -1.0d0

        ! The unnormalized Lode angle is between -30 and 30 degrees (pi/6)
        lode_unnorm = third * acos(cosine_3_lode)

        !   Normalizing the Lode angle
        !   The Lode angle is normalized to the range of -1 to 1
        lode_norm = 1.0d0 - 6.0d0 * lode_unnorm * inv_pi

        ! Update the state variables
        statev_element(1:ntens) = stress(1:ntens)
        statev_element((ntens+1):(2*ntens)) = stran(1:ntens)
        statev_element((2*ntens+1):(3*ntens)) = eelas(1:ntens)
        statev_element((3*ntens+1):(4*ntens)) = eplas(1:ntens)

        statev_element(eqplas_idx) = eqplas
        statev_element(deqplas_idx) = deqplas
        statev_element(sig_H_idx) = sig_hydrostatic
        statev_element(sig_vonMises_idx) = sig_vonMises
        statev_element(triax_idx) = triaxiality
        statev_element(lode_idx) = lode_norm
        statev_element(phi_idx) = phi
        statev_element(history_idx) = history
        statev_element(Gc_idx) = Gc
        statev_element(C_mol_idx) = C_mol
        statev_element(CL_mol_idx) = CL_mol
        statev_element(CT_mol_idx) = CT_mol
        
        !   Transfer data from statev_element to svars
        !   This stage basically updates the state variables for the current elemennt in UEL
        call kstatevar(kintk,nsvint,svars,statev_element,0)
        
        ! softened_factor = (1.d0 - phi_n)**2 + xkap
        ! softened_factor = (2.d0*phi_n**3 - 3.d0*phi_n**2 + 1.d0) + xkap
        softened_factor = 1.0d0 - (1.d0 / (1.0d0 + dexp(-10.0d0 * (phi_n - 0.5d0)))) + xkap
        
        if (softened_factor > 1.d0) then
            softened_factor = 1.d0
        else if (softened_factor < 0.d0) then
            softened_factor = 0.d0
        endif

        ! ********************************************!
        ! DISPLACEMENT CONTRIBUTION TO amatrx AND rhs !
        ! ********************************************!

        ! 3D case
        ! 8 nodes x 3 displacement dofs ux, uy, uz = 24

        amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) = &
            amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) + dvol * (softened_factor &
                                * matmul(matmul(transpose(Bu_matrix),ddsdde),Bu_matrix))
            
        rhs(start_u_idx:end_u_idx,1) = rhs(start_u_idx:end_u_idx,1) - &
            dvol * (matmul(transpose(Bu_matrix),stress) * softened_factor)       

        ! *******************************************!
        ! PHASE FIELD CONTRIBUTION TO amatrx AND rhs !
        ! *******************************************!

        ! 3D case
        ! 8 nodes x 1 phase field dof = 8

        amatrx(start_phi_idx:end_phi_idx,start_phi_idx:end_phi_idx) = &
            amatrx(start_phi_idx:end_phi_idx,start_phi_idx:end_phi_idx) &
            + dvol * (matmul(transpose(B_deriv_global),B_deriv_global) * Gc * length_scale &
            + matmul(transpose(shape_node_to_int),shape_node_to_int) * (Gc/length_scale + 2.d0 * history))   

        rhs(start_phi_idx:end_phi_idx,1) = rhs(start_phi_idx:end_phi_idx,1) &
            - dvol * (matmul(transpose(B_deriv_global),matmul(B_deriv_global,phi_prev)) &
             * Gc * length_scale + shape_node_to_int(1,:) &
             * ((Gc/length_scale+2.d0 * history) * phi-2.d0 * history))
            
        ! **************************************************!
        ! HYDROGEN DIFFUSION CONTRIBUTION TO amatrx AND rhs !
        ! **************************************************!

        ! 3D case
        ! 8 nodes x 1 hydrogen concentration dof = 8

        M_conc_capacity = matmul(transpose(shape_node_to_int),shape_node_to_int)/DL
        BB = matmul(transpose(B_deriv_global),B_deriv_global)

        K_diffusitivity = BB - VH/(R*T) * matmul(BB,matmul((sig_H_node * softened_factor),shape_node_to_int))

        amatrx(start_CL_idx:end_CL_idx,start_CL_idx:end_CL_idx) = &
            amatrx(start_CL_idx:end_CL_idx,start_CL_idx:end_CL_idx) &
            +dvol * (M_conc_capacity/dtime+K_diffusitivity)
            
        rhs(start_CL_idx:end_CL_idx,1) = rhs(start_CL_idx:end_CL_idx,1) - &
            dvol * (matmul(K_diffusitivity,CL_prev)+ &
            matmul(M_conc_capacity,dCL_prev)/dtime)

        !   Transfer data from statev_element to dummy mesh for visualization
        ! Updating sig11, sig22, sig33, sig12, sig13, sig23
        user_vars(jelem,1:ntens,kintk) = statev_element(1:ntens) * softened_factor
        ! Updating stran11, stran22, stran33, stran12, stran13, stran23
        user_vars(jelem,ntens+1:ntens*2,kintk) = statev_element((ntens+1):(ntens*2))
        ! Updating eelas11, eelas22, eelas33, eelas12, eelas13, eelas23
        user_vars(jelem,ntens*2+1:ntens*3,kintk) = statev_element((ntens*2+1):(ntens*3))
        ! Updating eplas11, eplas22, eplas33, eplas12, eplas13, eplas23
        user_vars(jelem,ntens*3+1:ntens*4,kintk) = statev_element((ntens*3+1):(ntens*4))
        ! Updating the rest values
        user_vars(jelem,ntens*4+1:nsvint,kintk) = statev_element(ntens*4+1:nsvint)
        
    end do       ! end loop on material integration points
    
    ! **************************!
    ! Scaling up amatrx AND rhs !
    ! **************************!
    
    ! ! rhs(start_u_idx:end_u_idx,1) = rhs(start_u_idx:end_u_idx,1) * scale_up
    rhs(start_phi_idx:end_phi_idx,1) = rhs(start_phi_idx:end_phi_idx,1) * scale_up
    rhs(start_CL_idx:end_CL_idx,1) = rhs(start_CL_idx:end_CL_idx,1) * scale_up
    
    ! amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) = &
    !     amatrx(start_u_idx:end_u_idx,start_u_idx:end_u_idx) * scale_up
    amatrx(start_phi_idx:end_phi_idx,start_phi_idx:end_phi_idx) = &
        amatrx(start_phi_idx:end_phi_idx,start_phi_idx:end_phi_idx) * scale_up
    amatrx(start_CL_idx:end_CL_idx,start_CL_idx:end_CL_idx) = &
        amatrx(start_CL_idx:end_CL_idx,start_CL_idx:end_CL_idx) * scale_up

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