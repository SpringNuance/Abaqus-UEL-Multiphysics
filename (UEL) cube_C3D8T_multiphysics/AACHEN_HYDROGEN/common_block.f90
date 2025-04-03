!***********************************************************************

module common_block
    use precision
    use userinputs
    implicit none

    ! This stores the IP coordinates at previous increment
    real(kind=dp) :: coords_all_inpts(total_elems, ninpt, ndim)

    ! This stores the nodal coordinates at previous increment
    real(kind=dp) :: coords_all_nodes(total_nodes, ndim)

    ! First dim: number of elements in the mesh
    ! Second dim: number of nodes in the element
    ! Since all elements must have 8 nodes, it does not need to be padded
    ! The nodes are also in their correct order as well from knode to 1 to 8
    
    integer :: elems_to_nodes_matrix(total_elems, nnode)

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

    integer :: nodes_to_elems_matrix(total_nodes, nmax_elems, 2) !

    integer :: num_elems_of_nodes_matrix(total_nodes) ! Number of elements that contain the node

    ! Shape function for all IP in the local isoparametric coordinate
    ! Given values at nodal points, this matrix will give the values at IP (interpolation)
    ! This is helpful for calculating values at IPs from the DoF values defined at nodal points 
    real(kind=dp) :: all_N_inpt_to_local_knode(nnode, ninpt)
    
    ! Shape function for all nodes in the local isoparametric coordinate
    ! Given values at IPs, this matrix will give the values at nodal points (extrapolation)
    ! This is helpful for calculating values at nodal points from values defined at IPs
    ! Such as hydrostatic stress gradient or for visualization
    real(kind=dp) :: all_N_node_to_local_kinpt(ninpt, nnode)
    
    ! Gradient of all_N_node_to_local_kinpt
    real(kind=dp) :: all_N_grad_node_to_local_kinpt(ninpt, ndim, nnode)

    ! Gradient necessary for computation of djac_all_elems_at_nodes
    real(kind=dp) :: all_N_grad_node_to_local_knode(nnode, ndim, nnode)
    
    ! This stores the determinant of Jacobian matrix of all nodes based on coordinates of the previous increment
    real(kind=dp) :: djac_all_elems_at_nodes(total_elems, nnode)

    ! This matrix keeps tract of all sig_H and eqplas at IPs for all elements as computed from UMAT
    real(kind=dp) :: sig_H_all_elems_at_inpts(total_elems, ninpt)
    real(kind=dp) :: eqplas_all_elems_at_inpts(total_elems, ninpt)

    ! This matrix keeps track of extrapolated sig_H and eqplas from IP onto nodal points for all elements
    real(kind=dp) :: sig_H_all_elems_at_nodes(total_elems, nnode)
    real(kind=dp) :: eqplas_all_elems_at_nodes(total_elems, nnode)

    ! This matrix keeps track of the gradient of sig_H and eqplas from IP onto nodal points for all elements
    ! Gradient of sig_H is needed for hydrogen diffusion model
    ! Gradient of eqplas is needed for strain gradient plasticity model

    real(kind=dp) :: sig_H_grad_all_elems_at_inpts(total_elems, ninpt, ndim)
    real(kind=dp) :: eqplas_grad_all_elems_at_inpts(total_elems, ninpt, ndim)

    ! Finally, this matrix keeps track of the average sig_H and eqplas at each node from the elements
    ! that contain the node. The average is weighted based on change of volume 
    ! (determinant of Jacobian matrix)

    real(kind=dp) :: sig_H_at_nodes(total_nodes) ! (total_nodes)
    real(kind=dp) :: eqplas_at_nodes(total_nodes) ! (total_nodes, ndim)



    save
    ! The save command is very important. 
    ! It allows the values to be stored and shared between subroutines 
    ! without resetting them to zero every time the subroutine is called

end module