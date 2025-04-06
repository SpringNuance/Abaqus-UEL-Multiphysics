! ========================================================
! Populating sig_H_all_elems_at_nodes(total_elems, nnode)
!        and eqplas_all_elems_at_nodes(total_elems, nnode)
! by using N_inpt_to_local_knode to extrapolate from IPs to nodes
! ========================================================

subroutine calc_scalar_all_elems_at_NPs()
    
    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(ninpt) :: N_shape_IP_extra_to_kNP_extra

    do kstatev = 1, num_grad_SDVs
        statev_idx = grad_SDV_indices(kstatev)

        ! Loop over each element
        do element_ID = 1, total_elems
            ! Loop over each node in the current element
            do knode = 1, nnode
                N_shape_IP_extra_to_kNP_extra = all_N_shape_IP_extra_to_kNP_extra(knode, 1:ninpt)

                ! Compute the statev at the NPs by extrapolating from the IPs

                statev_all_elems_at_NPs(statev_idx, element_ID, knode) = dot_product( &
                    N_shape_IP_extra_to_kNP_extra, &
                    statev_all_elems_at_IPs(statev_idx, element_ID, 1:ninpt) &
                )
            end do
        end do
    end do
end
    

! ========================================================
! Populating djac_all_elems_at_NPs(total_elems, nnode)
! ========================================================

subroutine calc_djac_all_elems_at_NPs()
    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,ndim) :: xjac, xjac_inv
    real(kind=dp), dimension(ndim, nnode) :: N_grad_NP_inter_to_kNP_inter_local
    real(kind=dp), dimension(nnode, ndim) :: coords_kelem_all_NPs
    real(kind=dp) :: djac

    do element_ID = 1, total_elems
        
        do knode = 1,nnode
            !   Retrieve the node_ID of the current node in this element
            node_ID = elems_to_NPs_matrix(element_ID,knode)
            coords_kelem_all_NPs(knode, 1:ndim) = coords_all_NPs(node_ID,1:ndim)
        end do

        ! Loop over each node in the current element
        do knode = 1, nnode

            N_grad_NP_inter_to_kNP_inter_local = all_N_grad_NP_inter_to_kNP_inter_local(knode,1:ndim,1:nnode)
            ! Calculate Jacobian matrix xjac at the current node
            xjac = matmul(N_grad_NP_inter_to_kNP_inter_local, coords_kelem_all_NPs)
            call calc_matrix_inv(xjac, xjac_inv, djac, ndim)
            ! Store djac for the current node in the element
            djac_all_elems_at_NPs(element_ID, knode) = djac

        end do
    end do

end

! ========================================================
! Populating statev_at_NPs(total_nodes)
! Weighted average based on determinant of Jacobian
! ========================================================

subroutine calc_scalar_at_NPs()

    use precision
    use common_block
    include 'aba_param.inc'

    do kstatev = 1, num_grad_SDVs
        
        statev_idx = grad_SDV_indices(kstatev)

        statev_at_NPs(statev_idx, 1:total_nodes) = 0.0d0
    
        ! Loop over all nodes in the mesh
        do node_ID = 1, total_nodes
            nelems_of_kNP = nelems_of_NPs_matrix(node_ID)

            ! print *, 'Node ID: ', node_ID, 'Number of elements: ', nelems_of_kNP
            !print *, 'Node ID: ', node_ID, 'Number of elements: ', nelems_of_kNP
            ! Initialize temporary variables for summing sig_H and djac
            
            sum_djac = 0.0d0
            sum_statev_djac = 0.0d0

            ! Loop over all elements that contain the current node
            do kelem = 1, nelems_of_kNP
                ! Get the element ID and local node number for this node
                element_ID = NPs_to_elems_matrix(node_ID, kelem, 1)
                local_knode = NPs_to_elems_matrix(node_ID, kelem, 2)

                ! Retrieve statev for the current element and node
                statev_kNP = statev_all_elems_at_NPs(statev_idx, element_ID, local_knode)

                ! Retrieve djac for the current element and node
                djac_kNP = djac_all_elems_at_NPs(element_ID, local_knode)

                ! Accumulate the weighted sum of statev and the sum of djac
                sum_statev_djac = sum_statev_djac + statev_kNP * djac_kNP
                sum_djac = sum_djac + djac_kNP
            end do

            ! if (statev_idx == sig_H_idx) then
            !     print *, 'sum_statev_djac = ', sum_statev_djac
            !     print *, 'sum_djac = ', sum_djac
            !     print *, 'sum_statev_djac / sum_djac = ', sum_statev_djac / sum_djac
            ! end if

            ! Compute the weighted average of sig_H and eqplas for the current node
            if (sum_djac > 0.0d0) then
                statev_at_NPs(statev_idx, node_ID) = sum_statev_djac / sum_djac
            else
                statev_at_NPs(statev_idx, node_ID) = 0.0d0
            end if

        end do
    end do
end


subroutine calc_scalar_grad_kelem_at_kIP(kelem, kinpt)

    use precision
    use common_block

    integer :: kelem, knode, kinpt, node_ID, idim, jdim
    real(kind=dp), dimension(nnode) :: statev_kelem_all_NPs
    real(kind=dp), dimension(ndim,nnode) :: N_grad_NP_inter_to_kIP_inter_local, N_grad_NP_inter_to_kIP_inter_global
    real(kind=dp), dimension(ndim) :: statev_grad_kelem_at_kIP
    real(kind=dp), dimension(nnode, ndim) :: coords_kelem_all_NPs
    real(kind=dp), dimension(ndim,ndim) :: xjac, xjac_inv

    do kstatev = 1, num_grad_SDVs
        statev_idx = grad_SDV_indices(kstatev)

        ! Professor Aravas approach
        do knode = 1, nnode
            node_ID = elems_to_NPs_matrix(kelem, knode)
            statev_kelem_all_NPs(knode) = statev_at_NPs(statev_idx, node_ID)
        end do
                
        N_grad_NP_inter_to_kIP_inter_local = all_N_grad_NP_inter_to_kIP_inter_local(kinpt, 1:ndim, 1:nnode)

        do knode = 1,nnode
            node_ID = elems_to_NPs_matrix(kelem,knode)
            coords_kelem_all_NPs(knode,1:ndim) = coords_all_NPs(node_ID,1:ndim)
        end do

        xjac = matmul(N_grad_NP_inter_to_kIP_inter_local, coords_kelem_all_NPs)

        call calc_matrix_inv(xjac, xjac_inv, djac, ndim)

    !   Compute the derivatives of shape functions with respect to global coordinates
        N_grad_NP_inter_to_kIP_inter_global = matmul(xjac_inv, N_grad_NP_inter_to_kIP_inter_local)

        statev_grad_kelem_at_kIP = matmul(N_grad_NP_inter_to_kIP_inter_global, statev_kelem_all_NPs) 

        statev_grad_all_elems_at_IPs(statev_idx, kelem, kinpt, 1:ndim) = statev_grad_kelem_at_kIP
    end do

end