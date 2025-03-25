
! C3D8/C3D8T element

!*****************************************************************
!  8 nodal points, 8 integration points 3D hexahedral element
!
!             8---------------7
!            /|              /|       zeta (positive)
!           / |  x 7   x 8  / |       
!          5---------------6  |       |     eta (positive)
!          |  | x 5   x 6  |  |       |   /
!          |  |            |  |       |  /
!          |  4------------|--3       | /
!          | /   x 3   x 4 | /        |/
!          |/   x 1   x 2  |/         O--------- xi (positive)
!          1---------------2           origin at hexahedral's center
!          
!         Outer number is nodal points
!         Inner number marked with x is integration points
!
!*****************************************************************

module iso_module_C3D8

    use precision
    use common_block

    ! 0.57735d0 = 1.0d0 / sqrt(3.0d0)
    ! 1.73205d0 = sqrt(3.0d0)
    
    ! Interpolating coordinates (NPs into other local coordinates, such as IPs)
    
    ! Isoparametric coordinates of NPs. Shape (nnode)

    real(kind=dp), parameter :: xi_node_inter_C3D8(8)    = (/ -1.0d0,  1.0d0,  1.0d0, -1.0d0, &
                                                              -1.0d0,  1.0d0,  1.0d0, -1.0d0 /)
    real(kind=dp), parameter :: eta_node_inter_C3D8(8)   = (/ -1.0d0, -1.0d0,  1.0d0,  1.0d0, &
                                                              -1.0d0, -1.0d0,  1.0d0,  1.0d0 /)
    real(kind=dp), parameter :: zeta_node_inter_C3D8(8)  = (/ -1.0d0, -1.0d0, -1.0d0, -1.0d0, &
                                                               1.0d0,  1.0d0,  1.0d0,  1.0d0 /)

    ! Isoparametric coordinates of IPs. Shape (ninpt)
    
    real(kind=dp), parameter :: xi_inpt_inter_C3D8(8)    = (/ -0.57735d0,  0.57735d0, -0.57735d0,  0.57735d0, &
                                                              -0.57735d0,  0.57735d0, -0.57735d0,  0.57735d0 /)
    real(kind=dp), parameter :: eta_inpt_inter_C3D8(8)   = (/ -0.57735d0, -0.57735d0,  0.57735d0,  0.57735d0, &
                                                              -0.57735d0, -0.57735d0,  0.57735d0,  0.57735d0 /)
    real(kind=dp), parameter :: zeta_inpt_inter_C3D8(8)  = (/ -0.57735d0, -0.57735d0, -0.57735d0, -0.57735d0, &
                                                               0.57735d0,  0.57735d0,  0.57735d0,  0.57735d0 /)

    ! Extrapolating coordinates (IPs out to other local coordinates, such as NPs)

    ! Isoparametric coordinates of NPs. Shape (nnode)

    real(kind=dp), parameter :: xi_node_extra_C3D8(8)    = (/ -1.73205d0,  1.73205d0,  1.73205d0, -1.73205d0, &
                                                              -1.73205d0,  1.73205d0,  1.73205d0, -1.73205d0 /)
    real(kind=dp), parameter :: eta_node_extra_C3D8(8)   = (/ -1.73205d0, -1.73205d0,  1.73205d0,  1.73205d0, &
                                                              -1.73205d0, -1.73205d0,  1.73205d0,  1.73205d0 /)
    real(kind=dp), parameter :: zeta_node_extra_C3D8(8)  = (/ -1.73205d0, -1.73205d0, -1.73205d0, -1.73205d0, &
                                                               1.73205d0,  1.73205d0,  1.73205d0,  1.73205d0 /)

    ! Isoparametric coordinates of IPs. Shape (ninpt)

    real(kind=dp), parameter :: xi_inpt_extra_C3D8(8)   = (/ -1.0d0,  1.0d0, -1.0d0,  1.0d0, &
                                                            -1.0d0,  1.0d0, -1.0d0,  1.0d0 /)
    real(kind=dp), parameter :: eta_inpt_extra_C3D8(8)  = (/ -1.0d0, -1.0d0,  1.0d0,  1.0d0, &
                                                            -1.0d0, -1.0d0,  1.0d0,  1.0d0 /)
    real(kind=dp), parameter :: zeta_inpt_extra_C3D8(8) = (/ -1.0d0, -1.0d0, -1.0d0, -1.0d0, &
                                                             1.0d0,  1.0d0,  1.0d0,  1.0d0 /)

end module iso_module_C3D8

subroutine calc_N_inpt_to_local_coords_C3D8(xi_coord, eta_coord, zeta_coord, N_inpt_to_local_coords)
    ! Calculate the shape function of integration points onto other coordinates
    ! xi_coord, eta_coord, zeta_coord: Isoparametric coordinates of the point

    use precision
    use common_block

    real(kind=dp), dimension(8) :: N_inpt_to_local_coords ! Shape (ninpt)
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    !   shape functions
    N_inpt_to_local_coords(1) = 0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - eta_coord) * (1.0d0 - zeta_coord)
    N_inpt_to_local_coords(2) = 0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - eta_coord) * (1.0d0 - zeta_coord)
    N_inpt_to_local_coords(3) = 0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + eta_coord) * (1.0d0 - zeta_coord)
    N_inpt_to_local_coords(4) = 0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + eta_coord) * (1.0d0 - zeta_coord)
    N_inpt_to_local_coords(5) = 0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - eta_coord) * (1.0d0 + zeta_coord)
    N_inpt_to_local_coords(6) = 0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - eta_coord) * (1.0d0 + zeta_coord)
    N_inpt_to_local_coords(7) = 0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + eta_coord) * (1.0d0 + zeta_coord)
    N_inpt_to_local_coords(8) = 0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + eta_coord) * (1.0d0 + zeta_coord)

return
end

subroutine calc_N_node_to_local_coords_C3D8(xi_coord, eta_coord, zeta_coord, &
                                       N_node_to_local_coords)
    ! Calculate the shape function of nodal points onto other coordinates
    ! xi_coord, eta_coord, zeta_coord: Isoparametric coordinates of the point

    use precision
    use common_block    
    real(kind=dp), dimension(8) :: N_node_to_local_coords ! Shape (nnode)
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    !   shape functions
    N_node_to_local_coords(1)=0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - eta_coord) * (1.0d0 - zeta_coord)
    N_node_to_local_coords(2)=0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - eta_coord) * (1.0d0 - zeta_coord)
    N_node_to_local_coords(3)=0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + eta_coord) * (1.0d0 - zeta_coord)
    N_node_to_local_coords(4)=0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + eta_coord) * (1.0d0 - zeta_coord)
    N_node_to_local_coords(5)=0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - eta_coord) * (1.0d0 + zeta_coord)
    N_node_to_local_coords(6)=0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - eta_coord) * (1.0d0 + zeta_coord)
    N_node_to_local_coords(7)=0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + eta_coord) * (1.0d0 + zeta_coord)
    N_node_to_local_coords(8)=0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + eta_coord) * (1.0d0 + zeta_coord)

return
end

subroutine calc_N_grad_node_to_local_coords_C3D8(xi_coord, eta_coord, zeta_coord, &
                                            N_grad_node_to_local_coords)

    ! Calculate the shape function derivative of nodal points onto other coordinates
    ! Basically derivatives of calc_N_node_to_local_coords
    ! N_grad_node_to_local_coords: (ndim, nnode)
    ! xi_coord, eta_coord, zeta_coord: Isoparametric coordinates of the point

    use precision
    use common_block
    real(kind=dp), dimension(3, 8) :: N_grad_node_to_local_coords ! Shape (ndim, nnode)
    real(kind=dp) :: xi_coord, eta_coord, zeta_coord

    !   derivative d(Ni)/d(xi_coord)
    N_grad_node_to_local_coords(1, 1) = -0.125d0 * (1.0d0 - eta_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(1, 2) =  0.125d0 * (1.0d0 - eta_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(1, 3) =  0.125d0 * (1.0d0 + eta_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(1, 4) = -0.125d0 * (1.0d0 + eta_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(1, 5) = -0.125d0 * (1.0d0 - eta_coord) * (1.0d0 + zeta_coord)
    N_grad_node_to_local_coords(1, 6) =  0.125d0 * (1.0d0 - eta_coord) * (1.0d0 + zeta_coord)
    N_grad_node_to_local_coords(1, 7) =  0.125d0 * (1.0d0 + eta_coord) * (1.0d0 + zeta_coord)
    N_grad_node_to_local_coords(1, 8) = -0.125d0 * (1.0d0 + eta_coord) * (1.0d0 + zeta_coord)

    !     derivative d(Ni)/d(eta_coord)
    N_grad_node_to_local_coords(2, 1) = -0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(2, 2) = -0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(2, 3) =  0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(2, 4) =  0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - zeta_coord)
    N_grad_node_to_local_coords(2, 5) = -0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + zeta_coord)
    N_grad_node_to_local_coords(2, 6) = -0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + zeta_coord)
    N_grad_node_to_local_coords(2, 7) =  0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + zeta_coord)
    N_grad_node_to_local_coords(2, 8) =  0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + zeta_coord)

    !     derivative d(Ni)/d(zeta_coord)
    N_grad_node_to_local_coords(3, 1) = -0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - eta_coord)
    N_grad_node_to_local_coords(3, 2) = -0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - eta_coord)
    N_grad_node_to_local_coords(3, 3) = -0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + eta_coord)
    N_grad_node_to_local_coords(3, 4) = -0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + eta_coord)
    N_grad_node_to_local_coords(3, 5) =  0.125d0 * (1.0d0 - xi_coord) * (1.0d0 - eta_coord)
    N_grad_node_to_local_coords(3, 6) =  0.125d0 * (1.0d0 + xi_coord) * (1.0d0 - eta_coord)
    N_grad_node_to_local_coords(3, 7) =  0.125d0 * (1.0d0 + xi_coord) * (1.0d0 + eta_coord)
    N_grad_node_to_local_coords(3, 8) =  0.125d0 * (1.0d0 - xi_coord) * (1.0d0 + eta_coord)

return
end

