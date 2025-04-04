! =========================================== !
! Mode III displacement (Out-of-plane shear)  !
! =========================================== !

subroutine DISP_MODE_III(u, kstep, kinc, time, node, noel, jdof, coords)
    
    use precision
    use common_block
    include 'aba_param.inc'

    ! Inputs
    integer :: kstep, kinc, node, noel, jdof
    real(kind=dp) :: time(2), coords(3)

    ! Outputs
    real(kind=dp) :: u(3)

    ! Local variables
    real(kind=dp) :: xk, mu, pi
    real(kind=dp) :: r, theta, uz

    ! Material + geometry
    xk  = 15.0d0 * sqrt(1000.0d0) * time(2)  ! Mode III intensity factor
    mu  = 201880.0d0 / (2.0d0 * (1.0d0 + 0.3d0))  ! Shear modulus (G = E / 2(1+ν))
    pi  = 3.141592653589793d0

    ! 3D coords: crack lies in x–y plane, crack front is along z-axis
    r     = sqrt(coords(1)**2 + coords(2)**2)
    theta = atan2(coords(2), coords(1))

    ! Mode III shear displacement (out-of-plane)
    uz = (xk / mu) * sqrt(r / (2.0d0 * pi)) * cos(theta / 2.0d0)

    ! Assign displacement to correct degree of freedom
    select case (jdof)
    case (1)
        u(1) = 0.0d0
    case (2)
        u(1) = 0.0d0
    case (3)
        u(1) = uz
    case default
        u(1) = 0.0d0
    end select

    ! Set remaining DOFs to zero
    u(2) = 0.0d0  
    u(3) = 0.0d0

end