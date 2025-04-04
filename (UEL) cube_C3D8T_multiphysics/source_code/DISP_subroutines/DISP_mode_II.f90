! ====================================== !
! Mode II displacement (In-plane shear)  !
! ====================================== !

subroutine DISP_MODE_II(u, kstep, kinc, time, node, noel, jdof, coords)
    
    use precision
    use common_block
    include 'aba_param.inc'

    ! Inputs
    integer :: kstep, kinc, node, noel, jdof
    real(kind=dp) :: time(2), coords(3)

    ! Outputs
    real(kind=dp) :: u(3)

    ! Local variables
    real(kind=dp) :: xk, e, xnu, pi
    real(kind=dp) :: r, theta, ux, uy

    ! Material + geometry
    xk  = 20.0d0 * sqrt(1000.0d0) * time(2)  ! Mode II intensity factor
    e   = 201880.0d0                         ! Young's modulus (MPa)
    xnu = 0.3d0                              ! Poisson’s ratio
    pi  = 3.141592653589793d0

    ! 3D coords: crack lies in x–y plane, crack front is along z-axis
    r     = sqrt(coords(1)**2 + coords(2)**2)
    theta = atan2(coords(2), coords(1))

    ! Mode II shear displacement in plane
    ux = -(1.0d0 + xnu) * (xk / e) * sqrt(r / (2.0d0 * pi)) * &
          (3.0d0 - 4.0d0 * xnu - cos(theta)) * sin(theta / 2.0d0)

    uy = +(1.0d0 + xnu) * (xk / e) * sqrt(r / (2.0d0 * pi)) * &
          (3.0d0 - 4.0d0 * xnu - cos(theta)) * cos(theta / 2.0d0)

    ! Assign displacement to correct degree of freedom
    select case (jdof)
    case (1)
        u(1) = ux
    case (2)
        u(1) = uy
    case (3)
        u(1) = 0.0d0  ! No out-of-plane displacement
    case default
        u(1) = 0.0d0
    end select

    ! Set remaining DOFs to zero
    u(2) = 0.0d0  
    u(3) = 0.0d0

end