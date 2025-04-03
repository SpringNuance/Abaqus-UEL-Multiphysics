! =========================================================================
! 8 subroutines to query the coordinates of NPs and IPs in 3D and 2D cases
! get_coords_node_inter_3D(knode, xi_coord, eta_coord, zeta_coord)
! get_coords_node_inter_2D(knode, xi_coord, eta_coord)
! get_coords_node_extra_3D(knode, xi_coord, eta_coord, zeta_coord)
! get_coords_node_extra_2D(knode, xi_coord, eta_coord)
! get_coords_inpt_inter_3D(kinpt, xi_coord, eta_coord, zeta_coord)
! get_coords_inpt_inter_2D(kinpt, xi_coord, eta_coord)
! get_coords_inpt_extra_3D(kinpt, xi_coord, eta_coord, zeta_coord)
! get_coords_inpt_extra_2D(kinpt, xi_coord, eta_coord)
! =========================================================================

subroutine get_coords_node_inter_3D(knode, xi_coord, eta_coord, zeta_coord)

    use precision
    use common_block
    use iso_module_C3D8
    use iso_module_C3D8R

    include 'aba_param.inc'

    integer :: knode
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    select case (trim(element_name))
        case ("C3D8")
            xi_coord = xi_node_inter_C3D8(knode)
            eta_coord = eta_node_inter_C3D8(knode)
            zeta_coord = zeta_node_inter_C3D8(knode)
        case ("C3D8R")
            xi_coord = xi_node_inter_C3D8R(knode)
            eta_coord = eta_node_inter_C3D8R(knode)
            zeta_coord = zeta_node_inter_C3D8R(knode)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end


subroutine get_coords_node_inter_2D(knode, xi_coord, eta_coord)

    use precision
    use common_block    
    use iso_module_CPE4
    use iso_module_CPE4R

    include 'aba_param.inc'

    integer :: knode    
    real(kind=dp) :: xi_coord, eta_coord

    select case (trim(element_name))
        case ("CPE4")
            xi_coord = xi_node_inter_CPE4(knode)
            eta_coord = eta_node_inter_CPE4(knode)
        case ("CPE4R")
            xi_coord = xi_node_inter_CPE4R(knode)
            eta_coord = eta_node_inter_CPE4R(knode)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine get_coords_node_extra_3D(knode, xi_coord, eta_coord, zeta_coord)

    use precision   
    use common_block
    use iso_module_C3D8
    use iso_module_C3D8R

    include 'aba_param.inc'

    integer :: knode
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    select case (trim(element_name))
        case ("C3D8")
            xi_coord = xi_node_extra_C3D8(knode)
            eta_coord = eta_node_extra_C3D8(knode)
            zeta_coord = zeta_node_extra_C3D8(knode)
        case ("C3D8R")
            xi_coord = xi_node_extra_C3D8R(knode)
            eta_coord = eta_node_extra_C3D8R(knode)
            zeta_coord = zeta_node_extra_C3D8R(knode)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
return
end

subroutine get_coords_node_extra_2D(knode, xi_coord, eta_coord)

    use precision
    use common_block
    use iso_module_CPE4
    use iso_module_CPE4R

    include 'aba_param.inc'

    integer :: knode
    real(kind=dp) :: xi_coord, eta_coord

    select case (trim(element_name))
        case ("CPE4")
            xi_coord = xi_node_extra_CPE4(knode)
            eta_coord = eta_node_extra_CPE4(knode)
        case ("CPE4R")
            xi_coord = xi_node_extra_CPE4R(knode)
            eta_coord = eta_node_extra_CPE4R(knode)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine get_coords_inpt_inter_3D(kinpt, xi_coord, eta_coord, zeta_coord)

    use precision   
    use common_block
    use iso_module_C3D8
    use iso_module_C3D8R

    include 'aba_param.inc'

    integer :: kinpt
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    select case (trim(element_name))
        case ("C3D8")
            xi_coord = xi_inpt_inter_C3D8(kinpt)
            eta_coord = eta_inpt_inter_C3D8(kinpt)
            zeta_coord = zeta_inpt_inter_C3D8(kinpt)
        case ("C3D8R")
            xi_coord = xi_inpt_inter_C3D8R(kinpt)
            eta_coord = eta_inpt_inter_C3D8R(kinpt)
            zeta_coord = zeta_inpt_inter_C3D8R(kinpt)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine get_coords_inpt_inter_2D(kinpt, xi_coord, eta_coord)

    use precision
    use common_block
    use iso_module_CPE4
    use iso_module_CPE4R

    include 'aba_param.inc'

    integer :: kinpt
    real(kind=dp) :: xi_coord, eta_coord

    select case (trim(element_name))
        case ("CPE4")
            xi_coord = xi_inpt_inter_CPE4(kinpt)
            eta_coord = eta_inpt_inter_CPE4(kinpt)
        case ("CPE4R")
            xi_coord = xi_inpt_inter_CPE4R(kinpt)
            eta_coord = eta_inpt_inter_CPE4R(kinpt)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine get_coords_inpt_extra_3D(kinpt, xi_coord, eta_coord, zeta_coord)

    use precision
    use common_block
    use iso_module_C3D8
    use iso_module_C3D8R
    
    include 'aba_param.inc'

    integer :: kinpt
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    select case (trim(element_name))
        case ("C3D8")
            xi_coord = xi_inpt_extra_C3D8(kinpt)
            eta_coord = eta_inpt_extra_C3D8(kinpt)
            zeta_coord = zeta_inpt_extra_C3D8(kinpt)
        case ("C3D8R")
            xi_coord = xi_inpt_extra_C3D8R(kinpt)
            eta_coord = eta_inpt_extra_C3D8R(kinpt)
            zeta_coord = zeta_inpt_extra_C3D8R(kinpt)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine get_coords_inpt_extra_2D(kinpt, xi_coord, eta_coord)

    use precision
    use common_block
    use iso_module_CPE4
    use iso_module_CPE4R

    include 'aba_param.inc'

    integer :: kinpt
    real(kind=dp) :: xi_coord, eta_coord

    select case (trim(element_name))
        case ("CPE4")
            xi_coord = xi_inpt_extra_CPE4(kinpt)
            eta_coord = eta_inpt_extra_CPE4(kinpt)
        case ("CPE4R")
            xi_coord = xi_inpt_extra_CPE4R(kinpt)
            eta_coord = eta_inpt_extra_CPE4R(kinpt)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."   
    end select    
end

! =============================================================
! 6 functions to calculate the shape functions and the gradient 
! of the shape functions in 3D and 2D cases
! calc_N_inpt_to_local_coords_3D
! calc_N_inpt_to_local_coords_2D
! calc_N_node_to_local_coords_3D
! calc_N_node_to_local_coords_2D
! calc_N_grad_node_to_local_coords_3D
! calc_N_grad_node_to_local_coords_2D
! ==============================================================

subroutine calc_N_inpt_to_local_coords_3D(xi_coord, eta_coord, zeta_coord, N_inpt_to_local_coords)

    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(ninpt) :: N_inpt_to_local_coords
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    select case (trim(element_name))
        case ("C3D8")
            call calc_N_inpt_to_local_coords_C3D8(xi_coord, eta_coord, zeta_coord, N_inpt_to_local_coords)
        case ("C3D8R")
            call calc_N_inpt_to_local_coords_C3D8R(xi_coord, eta_coord, zeta_coord, N_inpt_to_local_coords)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine calc_N_inpt_to_local_coords_2D(xi_coord, eta_coord, N_inpt_to_local_coords)

    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(ninpt) :: N_inpt_to_local_coords
    real(kind=dp) :: xi_coord, eta_coord

    select case (trim(element_name))
        case ("CPE4")
            call calc_N_inpt_to_local_coords_CPE4(xi_coord, eta_coord, N_inpt_to_local_coords)
        case ("CPE4R")
            call calc_N_inpt_to_local_coords_CPE4R(xi_coord, eta_coord, N_inpt_to_local_coords)
        case default    
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine calc_N_node_to_local_coords_3D(xi_coord, eta_coord, zeta_coord, N_node_to_local_coords)

    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(nnode) :: N_node_to_local_coords
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    select case (trim(element_name))
        case ("C3D8")
            call calc_N_node_to_local_coords_C3D8(xi_coord, eta_coord, zeta_coord, N_node_to_local_coords)
        case ("C3D8R")
            call calc_N_node_to_local_coords_C3D8R(xi_coord, eta_coord, zeta_coord, N_node_to_local_coords)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine calc_N_node_to_local_coords_2D(xi_coord, eta_coord, N_node_to_local_coords)

    use precision    
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(nnode) :: N_node_to_local_coords
    real(kind=dp) :: xi_coord, eta_coord

    select case (trim(element_name))
        case ("CPE4")       
            call calc_N_node_to_local_coords_CPE4(xi_coord, eta_coord, N_node_to_local_coords)
        case ("CPE4R")
            call calc_N_node_to_local_coords_CPE4R(xi_coord, eta_coord, N_node_to_local_coords)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end

subroutine calc_N_grad_node_to_local_coords_3D(xi_coord, eta_coord, zeta_coord, N_grad_node_to_local_coords)

    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim, nnode) :: N_grad_node_to_local_coords
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    select case (trim(element_name))
        case ("C3D8")
            call calc_N_grad_node_to_local_coords_C3D8(xi_coord, eta_coord, zeta_coord, N_grad_node_to_local_coords)
        case ("C3D8R")
            call calc_N_grad_node_to_local_coords_C3D8R(xi_coord, eta_coord, zeta_coord, N_grad_node_to_local_coords)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select

end

subroutine calc_N_grad_node_to_local_coords_2D(xi_coord, eta_coord, N_grad_node_to_local_coords)

    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim, nnode) :: N_grad_node_to_local_coords
    real(kind=dp) :: xi_coord, eta_coord

    select case (trim(element_name))
        case ("CPE4")
            call calc_N_grad_node_to_local_coords_CPE4(xi_coord, eta_coord, N_grad_node_to_local_coords)
        case ("CPE4R")
            call calc_N_grad_node_to_local_coords_CPE4R(xi_coord, eta_coord, N_grad_node_to_local_coords)
        case default
            write(7,*) "ERROR: Element ", trim(element_name), " not supported."
    end select
end


subroutine calc_shape_functions()

    use precision
    use common_block
    include 'aba_param.inc'

    real(kind=dp) :: knode, kinpt, xi_node, eta_node, zeta_node, xi_inpt, eta_inpt, zeta_inpt
    real(kind=dp), dimension(ninpt) :: N_inpt_to_local_knode
    real(kind=dp), dimension(nnode) :: N_node_to_local_kinpt
    real(kind=dp), dimension(ndim, nnode) :: N_grad_node_to_local_kinpt
    real(kind=dp), dimension(ndim, nnode) :: N_grad_node_to_local_knode

    do knode = 1, nnode
    
        if (ndim == 3) then
            call get_coords_node_extra_3D(knode, xi_node, eta_node, zeta_node)
            call calc_N_inpt_to_local_coords_3D(xi_node, eta_node, zeta_node, N_inpt_to_local_knode)
            all_N_inpt_to_local_knode(knode, 1:ninpt) = N_inpt_to_local_knode(1:ninpt)
        else if (ndim == 2) then
            call get_coords_node_extra_2D(knode, xi_node, eta_node)
            call calc_N_inpt_to_local_coords_2D(xi_node, eta_node, N_inpt_to_local_knode)
            all_N_inpt_to_local_knode(knode, 1:ninpt) = N_inpt_to_local_knode(1:ninpt)
        end if 
    end do      

    do kinpt = 1, ninpt
        if (ndim == 3) then
            call get_coords_inpt_inter_3D(kinpt, xi_inpt, eta_inpt, zeta_inpt)
            call calc_N_node_to_local_coords_3D(xi_int, eta_int, zeta_int, N_node_to_local_kinpt)
            all_N_node_to_local_kinpt(kinpt, 1:nnode) = N_node_to_local_kinpt(1:nnode)
            call calc_N_grad_node_to_local_coords_3D(xi_int, eta_int, zeta_int, N_grad_node_to_local_kinpt)
            all_N_grad_node_to_local_kinpt(kinpt,1:ndim,1:nnode) = N_grad_node_to_local_kinpt(1:ndim,1:nnode)
        else if (ndim == 2) then
            call get_coords_inpt_inter_2D(kinpt, xi_inpt, eta_inpt)
            call calc_N_node_to_local_coords_2D(xi_int, eta_int, N_node_to_local_kinpt)
            all_N_node_to_local_kinpt(kinpt, 1:nnode) = N_node_to_local_kinpt(1:nnode)
            call calc_N_grad_node_to_local_coords_2D(xi_int, eta_int, N_grad_node_to_local_kinpt)
            all_N_grad_node_to_local_kinpt(kinpt,1:ndim,1:nnode) = N_grad_node_to_local_kinpt(1:ndim,1:nnode)
        end if
    end do

    do knode = 1, nnode
        if (ndim == 3) then
            ! Natural coordinates at the current node
            call get_coords_node_inter_3D(knode, xi_node, eta_node, zeta_node)
            call calc_N_grad_node_to_local_coords_3D(xi_node, eta_node, zeta_node, &
                                                N_grad_node_to_local_knode)
            all_N_grad_node_to_local_knode(knode,1:ndim,1:nnode) = N_grad_node_to_local_knode(1:ndim,1:nnode)

        else if (ndim == 2) then
            ! Natural coordinates at the current node
            call get_coords_node_inter_2D(knode, xi_node, eta_node)
            call calc_N_grad_node_to_local_coords_2D(xi_node, eta_node, &
                                                N_grad_node_to_local_knode)
            all_N_grad_node_to_local_knode(knode,1:ndim,1:nnode) = N_grad_node_to_local_knode(1:ndim,1:nnode)
        end if
    end do

end