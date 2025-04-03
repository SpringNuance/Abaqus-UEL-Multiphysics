!***********************************************************************

module common_block
    use precision
    use userinputs
    implicit none

    ! First dim: maximum number of elements to accomodate varying number of elements when remeshed
    ! Second dim: number of state dependent variables (nstatev in UMAT/UMATHT)
    ! Third dim: number of integration points

    real(kind=dp) :: user_vars(max_elem_idx, nstatev, ninpt)

    ! This stores the IP coordinates at previous increment
    real(kind=dp) :: coords_all_IPs(total_elems, ninpt, ndim)

    ! This stores the nodal coordinates at previous increment
    real(kind=dp) :: coords_all_NPs(total_nodes, ndim)

    ! First dim: number of elements in the mesh
    ! Second dim: number of nodes in the element
    ! Since all elements must have 8 nodes, it does not need to be padded
    ! The nodes are also in their correct order as well from knode to 1 to 8
    
    integer :: elems_to_NPs_matrix(total_elems, nnode)

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

    ! Then NPs_to_elems_matrix(7, 1, 1) = 10
    !      NPs_to_elems_matrix(7, 1, 2) = 1
    !      NPs_to_elems_matrix(7, 2, 1) = 20
    !      NPs_to_elems_matrix(7, 2, 2) = 6
    !      NPs_to_elems_matrix(7, 3, 1) = 30
    !      NPs_to_elems_matrix(7, 3, 2) = 3
    !      NPs_to_elems_matrix(7, 4, 1) = 40
    !      NPs_to_elems_matrix(7, 4, 2) = 5
    !      NPs_to_elems_matrix(7, 5:8, 1:2) = 0

    integer :: NPs_to_elems_matrix(total_nodes, nmax_elems, 2)

    integer :: nelems_of_NPs_matrix(total_nodes) ! Number of elements that contain the node
    
    real(kind=dp) :: all_N_shape_IP_extra_to_kNP_extra(nnode, ninpt)
    real(kind=dp) :: all_N_shape_IP_inter_to_kIP_extra(ninpt, ninpt)
    real(kind=dp) :: all_N_shape_IP_extra_to_kIP_inter(ninpt, ninpt)
    real(kind=dp) :: all_N_shape_NP_inter_to_kIP_inter(ninpt, nnode) 
    real(kind=dp) :: all_N_shape_NP_inter_to_kIP_extra(ninpt, nnode) 
    
    real(kind=dp) :: all_N_grad_NP_inter_to_kIP_inter_local(ninpt, ndim, nnode) 
    real(kind=dp) :: all_N_grad_NP_inter_to_kNP_inter_local(nnode, ndim, nnode)
    real(kind=dp) :: all_N_grad_NP_inter_to_kIP_extra_local(ninpt, ndim, nnode)
  ! (nnode, ndim, nnode)

    ! This stores the determinant of Jacobian matrix of all nodes based on coordinates of the previous increment
    real(kind=dp) :: djac_all_elems_at_NPs(total_elems, nnode) 
    
    ! The matrices below are used for computation of gradient of some statev
    ! Currently, only 3 variables are needed to compute the gradient
    ! sig_H_grad_X, sig_H_grad_Y, sig_H_grad_Z for hydrogen diffusion model
    ! eqplas_grad_X, eqplas_grad_Y, eqplas_grad_Z for strain gradient plasticity model
    ! temp_grad_X, temp_grad_Y, temp_grad_Z for some thermal or diffusion model

    ! This matrix keeps tract of statev for all elements at all integration points
    real(kind=dp) :: statev_all_elems_at_IPs(nstatev, total_elems, ninpt) 

    ! This matrix keeps track of extrapolated statev from IPs onto NPs for all elements
    real(kind=dp) :: statev_all_elems_at_NPs(nstatev, total_elems, nnode)

    ! This matrix keeps track of the average SDVs at each node from the elements
    ! that contain the node. The average is weighted based on change of volume 
    ! (determinant of Jacobian matrix)

    real(kind=dp) :: statev_at_NPs(nstatev, total_nodes) 

    ! This matrix keeps track of the gradient of SDVs at all IPs for all elements
    ! Beware, this matrix could get large if total_elems is large

    ! Example
    !   100 (nstatev)
    ! × 100,000 (total_elems)
    ! × 8 (integration points)
    ! × 3 (ndim)
    ! = 240,000,000 total values, then x 8 bytes = 1.92 GB in RAM

    real(kind=dp) :: statev_grad_all_elems_at_IPs(nstatev, total_elems, ninpt, ndim) 

    save
    ! The save command is very important. 
    ! It allows the values to be stored and shared between subroutines 
    ! without resetting them to zero every time the subroutine is called

end module
