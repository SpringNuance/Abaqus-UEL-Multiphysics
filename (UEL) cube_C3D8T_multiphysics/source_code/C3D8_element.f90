
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
    real(kind=dp), parameter :: NP_inter = 1.0d0
    real(kind=dp), parameter :: IP_inter = 1.0d0 / sqrt(3.0d0)
    real(kind=dp), parameter :: NP_extra = sqrt(3.0d0)
    real(kind=dp), parameter :: IP_extra = 1.0d0
    
    ! weight_kIP is the integration point weight for their shape function contribution
    real(kind=dp), parameter :: weight_kIP(8) = [1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0]

    ! Isoparametric coordinates for NP for interpolation from NP to IP
    real(kind=dp), parameter :: xi_NP_inter(8)   = [ -NP_inter,  NP_inter,  NP_inter, -NP_inter, &
                                                     -NP_inter,  NP_inter,  NP_inter, -NP_inter ]
    real(kind=dp), parameter :: eta_NP_inter(8)  = [ -NP_inter, -NP_inter,  NP_inter,  NP_inter, &
                                                     -NP_inter, -NP_inter,  NP_inter,  NP_inter ]
    real(kind=dp), parameter :: zeta_NP_inter(8) = [ -NP_inter, -NP_inter, -NP_inter, -NP_inter, &
                                                      NP_inter,  NP_inter,  NP_inter,  NP_inter ]

    ! Isoparametric coordinates for IP for interpolation from NP to IP
    real(kind=dp), parameter :: xi_IP_inter(8)   = [ -IP_inter,  IP_inter, -IP_inter,  IP_inter, &
                                                     -IP_inter,  IP_inter, -IP_inter,  IP_inter ]
    real(kind=dp), parameter :: eta_IP_inter(8)  = [ -IP_inter, -IP_inter,  IP_inter,  IP_inter, &
                                                     -IP_inter, -IP_inter,  IP_inter,  IP_inter ]
    real(kind=dp), parameter :: zeta_IP_inter(8) = [ -IP_inter, -IP_inter, -IP_inter, -IP_inter, &
                                                      IP_inter,  IP_inter,  IP_inter,  IP_inter ]

    ! Isoparametric coordinates for NP for extrapolation from IP to NP
    real(kind=dp), parameter :: xi_NP_extra(8)   = [ -NP_extra,  NP_extra,  NP_extra, -NP_extra, &
                                                     -NP_extra,  NP_extra,  NP_extra, -NP_extra ]
    real(kind=dp), parameter :: eta_NP_extra(8)  = [ -NP_extra, -NP_extra,  NP_extra,  NP_extra, &
                                                     -NP_extra, -NP_extra,  NP_extra,  NP_extra ]
    real(kind=dp), parameter :: zeta_NP_extra(8) = [ -NP_extra, -NP_extra, -NP_extra, -NP_extra, &
                                                      NP_extra,  NP_extra,  NP_extra,  NP_extra ]
    ! Isoparametric coordinates for IP for extrapolation from IP to NP
    real(kind=dp), parameter :: xi_IP_extra(8)   = [ -IP_extra,  IP_extra, -IP_extra,  IP_extra, &
                                                     -IP_extra,  IP_extra, -IP_extra,  IP_extra ]
    real(kind=dp), parameter :: eta_IP_extra(8)  = [ -IP_extra, -IP_extra,  IP_extra,  IP_extra, &
                                                     -IP_extra, -IP_extra,  IP_extra,  IP_extra ]
    real(kind=dp), parameter :: zeta_IP_extra(8) = [ -IP_extra, -IP_extra, -IP_extra, -IP_extra, &
                                                      IP_extra,  IP_extra,  IP_extra,  IP_extra ]

end module iso_module


subroutine calc_N_shape_NP_inter_to_coords(xi_coords, eta_coords, zeta_coords, &
                                        N_shape_NP_inter_to_coords)
    ! Calculate the shape function at the integration points
    ! xi_coords, eta_coords, zeta_coords: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(8) :: N_shape_NP_inter_to_coords ! nnode
    real(kind=dp) :: xi_coords, eta_coords, zeta_coords
    real(kind=dp), parameter :: NP_inter = 1.0d0

    !   shape functions
    N_shape_NP_inter_to_coords(1)=0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_shape_NP_inter_to_coords(2)=0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_shape_NP_inter_to_coords(3)=0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_shape_NP_inter_to_coords(4)=0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_shape_NP_inter_to_coords(5)=0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_shape_NP_inter_to_coords(6)=0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_shape_NP_inter_to_coords(7)=0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_shape_NP_inter_to_coords(8)=0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)

end

subroutine calc_N_shape_IP_inter_to_coords(xi_coords, eta_coords, zeta_coords, &
                                           N_shape_IP_inter_to_coords)

    use precision
    real(kind=dp), intent(out) :: N_shape_IP_inter_to_coords(8)
    real(kind=dp), intent(in)  :: xi_coords, eta_coords, zeta_coords
    
    real(kind=dp), parameter :: IP_inter = 1.0d0 / sqrt(3.0d0)

    ! Shape functions for a C3D8 element at the given xi/eta/zeta
    N_shape_IP_inter_to_coords(1) = 0.125d0 * (1.0d0 - IP_inter * xi_coords) * (1.0d0 - IP_inter * eta_coords) * (1.0d0 - IP_inter * zeta_coords)
    N_shape_IP_inter_to_coords(2) = 0.125d0 * (1.0d0 + IP_inter * xi_coords) * (1.0d0 - IP_inter * eta_coords) * (1.0d0 - IP_inter * zeta_coords)
    N_shape_IP_inter_to_coords(3) = 0.125d0 * (1.0d0 + IP_inter * xi_coords) * (1.0d0 + IP_inter * eta_coords) * (1.0d0 - IP_inter * zeta_coords)
    N_shape_IP_inter_to_coords(4) = 0.125d0 * (1.0d0 - IP_inter * xi_coords) * (1.0d0 + IP_inter * eta_coords) * (1.0d0 - IP_inter * zeta_coords)
    N_shape_IP_inter_to_coords(5) = 0.125d0 * (1.0d0 - IP_inter * xi_coords) * (1.0d0 - IP_inter * eta_coords) * (1.0d0 + IP_inter * zeta_coords)
    N_shape_IP_inter_to_coords(6) = 0.125d0 * (1.0d0 + IP_inter * xi_coords) * (1.0d0 - IP_inter * eta_coords) * (1.0d0 + IP_inter * zeta_coords)
    N_shape_IP_inter_to_coords(7) = 0.125d0 * (1.0d0 + IP_inter * xi_coords) * (1.0d0 + IP_inter * eta_coords) * (1.0d0 + IP_inter * zeta_coords)
    N_shape_IP_inter_to_coords(8) = 0.125d0 * (1.0d0 - IP_inter * xi_coords) * (1.0d0 + IP_inter * eta_coords) * (1.0d0 + IP_inter * zeta_coords)

end




subroutine calc_N_shape_IP_extra_to_coords(xi_coords, eta_coords, zeta_coords, &
                                            N_shape_IP_extra_to_coords)
    ! Calculate the shape function at the nodal points
    ! xi_coords, eta_coords, zeta_coords: Isoparametric coordinates of the nodal points

    use precision
    real(kind=dp), dimension(8) :: N_shape_IP_extra_to_coords ! ninpt
    real(kind=dp) :: xi_coords, eta_coords, zeta_coords
    real(kind=dp), parameter :: IP_extra = 1.0d0
    
    !   shape functions
    N_shape_IP_extra_to_coords(1) = 0.125d0 * (1.0d0 - IP_extra * xi_coords) * (1.0d0 - IP_extra * eta_coords) * (1.0d0 - IP_extra * zeta_coords)
    N_shape_IP_extra_to_coords(2) = 0.125d0 * (1.0d0 + IP_extra * xi_coords) * (1.0d0 - IP_extra * eta_coords) * (1.0d0 - IP_extra * zeta_coords)
    N_shape_IP_extra_to_coords(3) = 0.125d0 * (1.0d0 - IP_extra * xi_coords) * (1.0d0 + IP_extra * eta_coords) * (1.0d0 - IP_extra * zeta_coords)
    N_shape_IP_extra_to_coords(4) = 0.125d0 * (1.0d0 + IP_extra * xi_coords) * (1.0d0 + IP_extra * eta_coords) * (1.0d0 - IP_extra * zeta_coords)
    N_shape_IP_extra_to_coords(5) = 0.125d0 * (1.0d0 - IP_extra * xi_coords) * (1.0d0 - IP_extra * eta_coords) * (1.0d0 + IP_extra * zeta_coords)
    N_shape_IP_extra_to_coords(6) = 0.125d0 * (1.0d0 + IP_extra * xi_coords) * (1.0d0 - IP_extra * eta_coords) * (1.0d0 + IP_extra * zeta_coords)
    N_shape_IP_extra_to_coords(7) = 0.125d0 * (1.0d0 - IP_extra * xi_coords) * (1.0d0 + IP_extra * eta_coords) * (1.0d0 + IP_extra * zeta_coords)
    N_shape_IP_extra_to_coords(8) = 0.125d0 * (1.0d0 + IP_extra * xi_coords) * (1.0d0 + IP_extra * eta_coords) * (1.0d0 + IP_extra * zeta_coords)

end


subroutine calc_N_grad_NP_inter_to_coords_local(xi_coords, eta_coords, zeta_coords, N_grad_NP_inter_to_kIP_inter_local)
    ! Calculate the shape function derivative at the integration points
    ! Basically derivatives of calc_N_shape_NP_inter_to_coords
    ! N_grad_NP_inter_to_kIP_inter_local: (ninpt, ndim, nnode)
    ! xi_coords, eta_coords, zeta_coords: Isoparametric coordinates of the integration points

    use precision
    real(kind=dp), dimension(3, 8) :: N_grad_NP_inter_to_kIP_inter_local ! (ndim, nnode)
    real(kind=dp) :: xi_coords, eta_coords, zeta_coords
    real(kind=dp), parameter :: NP_inter = 1.0d0

    !   derivative d(Ni)/d(xi_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 1) = -0.125d0 * (1.0d0 - NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 2) =  0.125d0 * (1.0d0 - NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 3) =  0.125d0 * (1.0d0 + NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 4) = -0.125d0 * (1.0d0 + NP_inter * eta_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 5) = -0.125d0 * (1.0d0 - NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 6) =  0.125d0 * (1.0d0 - NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 7) =  0.125d0 * (1.0d0 + NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(1, 8) = -0.125d0 * (1.0d0 + NP_inter * eta_coords) * (1.0d0 + NP_inter * zeta_coords)

    !     derivative d(Ni)/d(eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 1) = -0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 2) = -0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 3) =  0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 4) =  0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 - NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 5) = -0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 6) = -0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 7) =  0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 + NP_inter * zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(2, 8) =  0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 + NP_inter * zeta_coords)

    !     derivative d(Ni)/d(zeta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 1) = -0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 2) = -0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 3) = -0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 4) = -0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 5) =  0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 6) =  0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 - NP_inter * eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 7) =  0.125d0 * (1.0d0 + NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords)
    N_grad_NP_inter_to_kIP_inter_local(3, 8) =  0.125d0 * (1.0d0 - NP_inter * xi_coords) * (1.0d0 + NP_inter * eta_coords)

end