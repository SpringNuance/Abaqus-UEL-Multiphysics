
! CPE4RRR/CPS4R/CPE4RRRT/CPS4RT element

!*****************************************************************
!  4 nodal points, 1 integration point 2D quadrilateral                     
!                                 
!                              eta (positive)
! 
!          3---------------3         |    
!          |               |         |   
!          |               |         |  
!          |      x 1      |         |
!          |               |         |
!          |               |         O--------- xi (positive)
!          1---------------2           origin at the quadrilateral's center
!          
!         Outer number is nodal points
!         Inner number marked with x is integration points
!
!*****************************************************************

module iso_module_CPE4R

    use precision
    use common_block

    ! 0.57735d0 = 1.0d0 / sqrt(3.0d0)
    ! 1.73205d0 = sqrt(3.0d0)
    
    ! Interpolating coordinates (NPs into other local coordinates, such as IPs)
    
    ! Isoparametric coordinates of NPs. Shape (nnode)

    real(kind=dp), parameter :: xi_node_inter_CPE4R(4)    = (/ -1.0d0,  1.0d0,  1.0d0, -1.0d0 /)
    real(kind=dp), parameter :: eta_node_inter_CPE4R(4)   = (/ -1.0d0, -1.0d0,  1.0d0,  1.0d0 /)

    ! Isoparametric coordinates of IPs. Shape (ninpt)
    
    real(kind=dp), parameter :: xi_inpt_inter_CPE4R(1)    = (/ 0.0d0 /)
    real(kind=dp), parameter :: eta_inpt_inter_CPE4R(1)   = (/ 0.0d0 /)

    ! Extrapolating coordinates (IPs out to other local coordinates, such as NPs)

    ! Isoparametric coordinates of NPs. Shape (nnode)

    real(kind=dp), parameter :: xi_node_extra_CPE4R(4)    = (/ -1.73205d0,  1.73205d0,  1.73205d0, -1.73205d0 /)
    real(kind=dp), parameter :: eta_node_extra_CPE4R(4)   = (/ -1.73205d0, -1.73205d0,  1.73205d0,  1.73205d0 /)

    ! Isoparametric coordinates of IPs. Shape (ninpt)

    real(kind=dp), parameter :: xi_inpt_extra_CPE4R(1)   = (/ 0.0d0 /)
    real(kind=dp), parameter :: eta_inpt_extra_CPE4R(1)  = (/ 0.0d0 /)


end module iso_module_CPE4R

subroutine calc_N_inpt_to_local_coords_CPE4R(xi_coord, eta_coord, N_inpt_to_local_coords)
    ! Calculate the shape function of integration points onto other coordinates
    ! xi_coord, eta_coord: Isoparametric coordinates of the point

    use precision
    use common_block

    real(kind=dp), dimension(4) :: N_inpt_to_local_coords ! Shape (ninpt)
    real(kind=dp) :: xi_coord, eta_coord

    N_inpt_to_local_coords(1) = 1.0d0

return
end

subroutine calc_N_node_to_local_coords_CPE4R(xi_coord, eta_coord, &
                                       N_node_to_local_coords)
    ! Calculate the shape function of nodal points onto other coordinates
    ! xi_coord, eta_coord, zeta_coord: Isoparametric coordinates of the point

    use precision
    use common_block    

    real(kind=dp), dimension(4) :: N_node_to_local_coords ! Shape (nnode)
    real(kind=dp) :: xi_coord, eta_coord

    ! Bilinear shape functions
    N_node_to_local_coords(1) = 0.25d0 * (1.0d0 - xi_coord) * (1.0d0 - eta_coord)
    N_node_to_local_coords(2) = 0.25d0 * (1.0d0 + xi_coord) * (1.0d0 - eta_coord)
    N_node_to_local_coords(3) = 0.25d0 * (1.0d0 + xi_coord) * (1.0d0 + eta_coord)
    N_node_to_local_coords(4) = 0.25d0 * (1.0d0 - xi_coord) * (1.0d0 + eta_coord)

return
end

subroutine calc_N_grad_node_to_local_coords_CPE4R(xi_coord, eta_coord, &
                                            N_grad_node_to_local_coords)

    ! Calculate the shape function derivative of nodal points onto other coordinates
    ! Basically derivatives of calc_N_node_to_local_coords
    ! N_grad_node_to_local_coords: (ndim, nnode)
    ! xi_coord, eta_coord: Isoparametric coordinates of the point

    use precision
    use common_block
    real(kind=dp), dimension(2, 4) :: N_grad_node_to_local_coords ! Shape (ndim, nnode)
    real(kind=dp) :: xi_coord, eta_coord

    ! Derivative d(Ni)/d(xi_coord) (ξ)
    N_grad_node_to_local_coords(1, 1) = -0.25d0 * (1.0d0 - eta_coord)
    N_grad_node_to_local_coords(1, 2) =  0.25d0 * (1.0d0 - eta_coord)
    N_grad_node_to_local_coords(1, 3) =  0.25d0 * (1.0d0 + eta_coord)
    N_grad_node_to_local_coords(1, 4) = -0.25d0 * (1.0d0 + eta_coord)

    ! Derivative d(Ni)/d(eta_coord) (η)
    N_grad_node_to_local_coords(2, 1) = -0.25d0 * (1.0d0 - xi_coord)
    N_grad_node_to_local_coords(2, 2) = -0.25d0 * (1.0d0 + xi_coord)
    N_grad_node_to_local_coords(2, 3) =  0.25d0 * (1.0d0 + xi_coord)
    N_grad_node_to_local_coords(2, 4) =  0.25d0 * (1.0d0 - xi_coord)

return
end