! ========================================================
! Populating sig_H_all_elems_at_nodes(total_elems, nnode)
!        and eqplas_all_elems_at_nodes(total_elems, nnode)
! by using N_inpt_to_local_knode to extrapolate from IPs to nodes
! ========================================================

subroutine calc_scalar_all_elems_at_nodes()
    
    use precision
    use common_block
    include 'aba_param.inc'

    ! Loop over each element
    do element_ID = 1, total_elems
        ! Loop over each node in the current element
        do knode = 1, nnode
            ! Initialize hydrostatic stress for the current node to zero
            sig_H_all_elems_at_nodes(element_ID, knode) = 0.0d0
            eqplas_all_elems_at_nodes(element_ID, knode) = 0.0d0

            ! Compute the hydrostatic stress at the nodal point by summing the products
            do kinpt = 1, ninpt
                sig_H_all_elems_at_nodes(element_ID, knode) = sig_H_all_elems_at_nodes(element_ID, knode) &
                    + all_N_inpt_to_local_knode(knode, kinpt) * sig_H_all_elems_at_inpts(element_ID, kinpt)

                eqplas_all_elems_at_nodes(element_ID, knode) = eqplas_all_elems_at_nodes(element_ID, knode) & 
                    + all_N_inpt_to_local_knode(knode, kinpt) * eqplas_all_elems_at_inpts(element_ID, kinpt)
            end do
        end do
    end do
return
end subroutine calc_scalar_all_elems_at_nodes
    

! ========================================================
! Populating djac_all_elems_at_nodes(total_elems, nnode)
! ========================================================

subroutine calc_djac_all_elems_at_nodes()
    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,ndim) :: xjac, xjac_inv
    real(kind=dp), dimension(nnode) :: x_nodes_current_elem, y_nodes_current_elem, z_nodes_current_elem
    real(kind=dp), dimension(ndim, nnode) :: N_grad_node_to_local_knode
    real(kind=dp) :: djac

    do element_ID = 1, total_elems
        
        do knode = 1,nnode
            !   Retrieve the node_ID of the current node in this element
            node_ID = elems_to_nodes_matrix(element_ID,knode)
            if (ndim == 3) then
                x_nodes_current_elem(knode) = coords_all_nodes(node_ID,1)
                y_nodes_current_elem(knode) = coords_all_nodes(node_ID,2)
                z_nodes_current_elem(knode) = coords_all_nodes(node_ID,3)
            else if (ndim == 2) then
                x_nodes_current_elem(knode) = coords_all_nodes(node_ID,1)
                y_nodes_current_elem(knode) = coords_all_nodes(node_ID,2)
            end if
        end do

        ! Loop over each node in the current element
        do knode = 1, nnode

            N_grad_node_to_local_knode = all_N_grad_node_to_local_knode(knode,1:ndim,1:nnode)

            ! Initialize Jacobian matrix xjac to zero
            xjac = 0.0d0

            if (ndim == 3) then
                ! Calculate Jacobian matrix xjac at the current node
                do knode_inner = 1, nnode
                    xjac(1, 1) = xjac(1, 1) + N_grad_node_to_local_knode(1, knode_inner) * x_nodes_current_elem(knode_inner)
                    xjac(1, 2) = xjac(1, 2) + N_grad_node_to_local_knode(1, knode_inner) * y_nodes_current_elem(knode_inner)
                    xjac(1, 3) = xjac(1, 3) + N_grad_node_to_local_knode(1, knode_inner) * z_nodes_current_elem(knode_inner)
                    xjac(2, 1) = xjac(2, 1) + N_grad_node_to_local_knode(2, knode_inner) * x_nodes_current_elem(knode_inner)
                    xjac(2, 2) = xjac(2, 2) + N_grad_node_to_local_knode(2, knode_inner) * y_nodes_current_elem(knode_inner)
                    xjac(2, 3) = xjac(2, 3) + N_grad_node_to_local_knode(2, knode_inner) * z_nodes_current_elem(knode_inner)
                    xjac(3, 1) = xjac(3, 1) + N_grad_node_to_local_knode(3, knode_inner) * x_nodes_current_elem(knode_inner)
                    xjac(3, 2) = xjac(3, 2) + N_grad_node_to_local_knode(3, knode_inner) * y_nodes_current_elem(knode_inner)
                    xjac(3, 3) = xjac(3, 3) + N_grad_node_to_local_knode(3, knode_inner) * z_nodes_current_elem(knode_inner)
                end do
            else if (ndim == 2) then
                ! Calculate Jacobian matrix xjac at the current node
                do knode_inner = 1, nnode
                    xjac(1, 1) = xjac(1, 1) + N_grad_node_to_local_knode(1, knode_inner) * x_nodes_current_elem(knode_inner)
                    xjac(1, 2) = xjac(1, 2) + N_grad_node_to_local_knode(1, knode_inner) * y_nodes_current_elem(knode_inner)
                    xjac(2, 1) = xjac(2, 1) + N_grad_node_to_local_knode(2, knode_inner) * x_nodes_current_elem(knode_inner)
                    xjac(2, 2) = xjac(2, 2) + N_grad_node_to_local_knode(2, knode_inner) * y_nodes_current_elem(knode_inner)
                end do
            end if

            ! Calculate determinant of Jacobian matrix xjac at the current node

            call calc_matrix_inv(xjac, xjac_inv, djac, ndim)

            ! Store djac for the current node in the element
            djac_all_elems_at_nodes(element_ID, knode) = djac

        end do
    end do
return

end subroutine calc_djac_all_elems_at_nodes

! ========================================================
! Populating sig_H_at_nodes(total_nodes)
!        and eqplas_at_nodes(total_nodes, ndim)
! Weighted average based on determinant of Jacobian
! ========================================================

subroutine calc_scalar_at_nodes()

    use precision
    use common_block
    include 'aba_param.inc'

    ! Initialize sig_H_at_nodes and eqplas_at_nodes to zero
    sig_H_at_nodes = 0.0d0
    eqplas_at_nodes = 0.0d0

    ! Loop over all nodes in the mesh
    do node_ID = 1, total_nodes
        num_elems_containing_node = num_elems_of_nodes_matrix(node_ID)

        !print *, 'Node ID: ', node_ID, 'Number of elements: ', num_elems_containing_node
        ! Initialize temporary variables for summing sig_H and djac
        
        sum_sig_H_djac = 0.0d0
        sum_eqplas_djac = 0.0d0
        sum_djac = 0.0d0

        ! Loop over all elements that contain the current node
        do kelem = 1, num_elems_containing_node
            ! Get the element ID and local node number for this node
            element_ID = nodes_to_elems_matrix(node_ID, kelem, 1)
            local_knode = nodes_to_elems_matrix(node_ID, kelem, 2)

            ! Retrieve sig_H and eqplas for the current element and node
            sig_H_knode = sig_H_all_elems_at_nodes(element_ID, local_knode)
            eqplas_knode = eqplas_all_elems_at_nodes(element_ID, local_knode)

            ! Retrieve djac for the current element and node
            djac_knode = djac_all_elems_at_nodes(element_ID, local_knode)

            ! Accumulate the weighted sum of sig_H, eqplas and the sum of djac
            sum_sig_H_djac = sum_sig_H_djac + sig_H_knode * djac_knode
            sum_eqplas_djac = sum_eqplas_djac + eqplas_knode * djac_knode
            sum_djac = sum_djac + djac_knode
        end do

        ! print *, 'sum_sig_H_djac = ', sum_sig_H_djac
        ! print *, 'sum_djac = ', sum_djac

        ! Compute the weighted average of sig_H and eqplas for the current node
        if (sum_djac > 0.0d0) then
            sig_H_at_nodes(node_ID) = sum_sig_H_djac / sum_djac
            eqplas_at_nodes(node_ID) = sum_eqplas_djac / sum_djac
        else
            sig_H_at_nodes(node_ID) = 0.0d0
            eqplas_at_nodes(node_ID) = 0.0d0
        end if

    end do
end


subroutine calc_scalar_grad_all_elems_at_inpts(noel, kinpt)

    use precision
    use common_block

    integer :: noel, knode, kinpt, node_ID, idim, jdim
    real(kind=dp), dimension(nnode) :: N_node_to_local_kinpt, sig_H_noel_at_nodes, eqplas_noel_at_nodes
    real(kind=dp), dimension(ndim,nnode) :: N_grad_node_to_local_kinpt, N_grad_node_to_global_kinpt
    real(kind=dp), dimension(ndim) :: sig_H_grad_noel_at_kinpt, eqplas_grad_noel_at_kinpt
    real(kind=dp), dimension(ndim,ndim) :: xjac, xjac_inv

    ! Extract the hydrostatic stress at nodal points
    ! which is extrapolated from the integration points in UEXTERNALDB

    ! Professor Aravas approach
    do knode = 1, nnode
        node_ID = elems_to_nodes_matrix(noel, knode)
        sig_H_noel_at_nodes(knode) = sig_H_at_nodes(node_ID)
        eqplas_noel_at_nodes(knode) = eqplas_at_nodes(node_ID)
    end do
            
    N_node_to_local_kinpt = all_N_node_to_local_kinpt(kinpt, 1:nnode)

    N_grad_node_to_local_kinpt = all_N_grad_node_to_local_kinpt(kinpt, 1:ndim, 1:nnode)

    xjac = 0.d0

!   Compute the Jacobian matrix (xjac)
    do knode = 1, nnode
        do idim = 1, ndim
            do jdim = 1, ndim
                node_ID = elems_to_nodes_matrix(noel, knode)
                xjac(jdim, idim) = xjac(jdim, idim) + &
                    N_grad_node_to_local_kinpt(jdim, knode) * &
                        coords_all_nodes(node_ID, idim)
            end do  
        end do
    end do

    call calc_matrix_inv(xjac, xjac_inv, djac, ndim)

!   Compute the derivatives of shape functions with respect to global coordinates
    N_grad_node_to_global_kinpt = matmul(xjac_inv, N_grad_node_to_local_kinpt)

    sig_H_grad_noel_at_kinpt = matmul(N_grad_node_to_global_kinpt, sig_H_noel_at_nodes) ! shape (3, 8) * shape (8) = shape (3) in C3D8 for example
    eqplas_grad_noel_at_kinpt = matmul(N_grad_node_to_global_kinpt, eqplas_noel_at_nodes)

    sig_H_grad_all_elems_at_inpts(noel, kinpt, :) = sig_H_grad_noel_at_kinpt
    eqplas_grad_all_elems_at_inpts(noel, kinpt, :) = eqplas_grad_noel_at_kinpt

return
end