! This is isotropic von Mises plasticity model

subroutine UMAT(stress,statev,ddsdde,sse,spd,scd, &
    rpl,ddsddt,drplde,drpldt, &
    stran,dstran,time,dtime,temp,dtemp,predef,dpred,cmname, &
    ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    include 'aba_param.inc'

    character*80 cmname
    dimension stress(ntens),statev(nstatv), &
       ddsdde(ntens,ntens), ddsddt(ntens),drplde(ntens), &
       stran(ntens),dstran(ntens),time(2),predef(1),dpred(1), &
       props(nprops),coords(3),drot(3,3),dfgrd0(3,3),dfgrd1(3,3), jstep(4)

    real(kind=8) :: E, nu, lambda, mu, eqplas, deqpl, syield, syiel0, sMises, shydro, rhs 
    real(kind=8) :: effective_mu, effective_lambda, effective_hard    

    dimension eelas(ntens), eplas(ntens), flow(ntens), hard(3)

    real(kind=8), parameter :: toler = 1e-12
    real(kind=8), parameter :: newton = 100
    integer :: nvalue, start_UHARD_index, k_newton

    ! LOCAL ARRAYS
    ! ----------------------------------------------------------------
    ! EELAS - ELASTIC STRAINS
    ! EPLAS - PLASTIC STRAINS
    ! FLOW - DIRECTION OF PLASTIC FLOW
    ! ----------------------------------------------------------------
    
    ! ----------------------------------------------------------------
    ! UMAT FOR ISOTROPIC ELASTICITY AND ISOTROPIC MISES PLASTICITY
    ! CANNOT BE USED FOR PLANE STRESS
    ! ----------------------------------------------------------------
    ! PROPS(1) - E
    ! PROPS(2) - NU
    ! PROPS(3:nprops) - SYIELD AN HARDENING DATA
    ! props(3) - syiel0, props(4) - eqpl0, props(5) - syiel1, props(6) - eqpl1, ...
    ! and props(nprops-1) - SYIELD_N, props(nprops) - EQPLAS_N
    ! CALLS UHARD FOR CURVE OF YIELD STRESS VS. PLASTIC STRAIN
    ! ----------------------------------------------------------------

    ! material properties

    E = props(1)           ! Young's modulus (210e9 Pa)
    nu = props(2)          ! Poisson's ratio (0.3)
    
    before_UHARD_index = 8

    ! Lame's parameters
    mu = E/(2.0d0 * (1.0 + nu))  ! Shear modulus
    lambda = E*nu/((1.0 + nu) * (1.0 - 2.0 * nu)) ! Lame's first constant

    ! initialize as 0
    ddsdde = 0.0 ! Their unit is Pa
    
    do i = 1, ndi
        do j = 1, ndi
            ddsdde(j, i) = lambda
        end do 
        ddsdde(i,i) = lambda + 2.0 * mu
    end do 

    ! Shear contribution
    do i = ndi + 1, ntens
        ddsdde(i,i) = mu
    end do 

    ! print hello here
    ! write(7,*) 'Hello from UMAT'
    ! recover elastic and plastic strains and rotate forward
    ! also recover equivalent plastic strain

    ! call rotsig(statev(      1), drot, eelas, 2, ndi, nshr)
    ! call rotsig(statev(ntens+1), drot, eplas, 2, ndi, nshr)
    
    eelas = statev(1:6)      ! Elastic strain
    eplas = statev(7:12)     ! Plastic strain
    eqplas = statev(1+2*ntens)      ! Equivalent plastic strain

    ! calculate predictor stress and elastic strain

    do i = 1, ntens
        do j = 1, ntens
            stress(j) = stress(j) + ddsdde(j, i) * dstran(i)
        end do
        eelas(i) = eelas(i) + dstran(i)
    end do

    ! Calculate equivalent von Mises stress
    
    sMises = (stress(1) - stress(2))**2 + &
             (stress(2) - stress(3))**2 + &
             (stress(3) - stress(1))**2
    
    do i = ndi + 1, ntens
        sMises = sMises + 6.d0 * stress(i)**2
    end do
    sMises = sqrt(sMises/2.d0) ! Unit is Pa
    
    ! get yield stress from the specified hardening curve
    ! nvalue equal to number of points on the hardening curve
    
    nvalue = (nprops - before_UHARD_index) / 2
    
    call UHARD(syiel0, hard, eqplas, eqplasrt, time, dtime, temp, &
              dtemp, noel, npt, layer, kspt, kstep, kinc, cmname, nstatv, &
              statev, numfieldv, predef, dpred, nvalue, props(before_UHARD_index + 1))
    
    ! Determine if active yielding

    if (sMises > (1.d0 + toler) * syiel0) then

        ! actively yielding
        ! separate the hydrostatic from the deviatoric stress
        ! calculate the flow direction

        shydro = (stress(1) + stress(2) + stress(3))/3.d0
        do i=1,ndi
            flow(i) = (stress(i) - shydro)/sMises
        end do
        do i=ndi+1,ntens
            flow(i) = stress(i)/sMises
        end do
        
        ! solve for equivalent von Mises stress and equivalent plastic strain increment 
        ! using Newton-Raphson iteration

        syield = syiel0
        deqpl = 0.d0
        do k_newton = 1, newton
            rhs = sMises - (3.d0 * mu * deqpl) - syield
            deqpl = deqpl + rhs / ((3.d0 * mu) + hard(1))

            call UHARD(syield, hard, eqplas + deqpl, eqplasrt, time, dtime, temp, &
                dtemp, noel, npt, layer, kspt, kstep, kinc, cmname, nstatv, &
                statev, numfieldv, predef, dpred, nvalue, props(before_UHARD_index + 1))
            if (abs(rhs) < toler * syiel0) exit
        end do

        if (k_newton == newton) write(7,*) 'WARNING: plasticity loop failed'

        ! Update stresses, elastic and plastic strains
        do i = 1, ndi
            stress(i) = flow(i) * syield + shydro
            eplas(i) = eplas(i) + 3.d0/2.d0 * flow(i) * deqpl
            eelas(i) = eelas(i) - 3.d0/2.d0 * flow(i) * deqpl
        end do
        
        do i = ndi + 1, ntens
            stress(i) = flow(i) * syield
            eplas(i) = eplas(i) + 3.d0 * flow(i) * deqpl
            eelas(i) = eelas(i) - 3.d0 * flow(i) * deqpl
        end do

        ! Finally, we update the equivalent plastic strain
        eqplas = eqplas + deqpl

        ! Calculate the plastic strain energy density
        spd = deqpl * (syiel0 + syield) / 2.d0
       
        ! Formulate the jacobian (material tangent)   

        ! effective shear modulus
        effective_mu = mu * syield / sMises 

        ! effective Lame's constant
        effective_lambda = (E/(1.d0 - 2.d0 * nu) - 2.d0 * effective_mu)/3.d0 

        ! effective hardening modulus
        effective_hard = 3.d0 * mu * hard(1)/(3.d0 * mu + hard(1)) - 3.d0 * effective_mu 

        do i = 1, ndi
            do j = 1, ndi
                ddsdde(j,i) = effective_lambda
            end do
            ddsdde(i,i) = 2.d0 * effective_mu + effective_lambda
        end do

        do i = ndi + 1, ntens
            ddsdde(i,i) = effective_mu
        end do

        do i = 1, ntens
            do j = 1, ntens
                ddsdde(j,i) = ddsdde(j,i) + effective_hard * flow(j) * flow(i)
            end do
        end do
    endif

    ! Updating the state dependent variables
    ! Store strains in state variable array (ntens = 6 in our case)

    statev(1:6) = eelas           
    statev(7:12) = eplas       
    statev(13) = eqplas
    ! statev(13:18) = eelas + eplas   
    ! statev(19) = eqplas                    
    ! statev(20) = deqpl                               
    ! statev(21) = (stress(1) + stress(2) + stress(3))/3.d0 ! Hydrostatic stress
    
return
end


subroutine UHARD(syield, hard, eqplas, eqplasrt, time, dtime, temp, &
                dtemp, noel, npt, layer, kspt, kstep, kinc, cmname, nstatv, &
                statev, numfieldv, predef, dpred, nvalue, table)

    include 'aba_param.inc'

    character*80 cmname
    dimension hard(3),statev(nstatv),time(*), &
          predef(numfieldv),dpred(*)
    
    ! Variables to be defined
    ! syield: Yield stress for isotropic plasticity. Yield surface size for combined hardening.
    ! hard(1): Variation of SYIELD with respect to the equivalent plastic strain
    ! hard(2): Variation of SYIELD with respect to the equivalent plastic strain rate
    ! hard(3): Variation of SYIELD with respect to the temperature (only in coupled thermal-mechanical analysis)
    ! statev(nstatv): State variables
     
    ! Variables passed in for information
    ! eqplas: Equivalent plastic strain
    ! nvalue: Number of hardening properties entered for this user-defined hardening definition.
    ! table: Hardening properties entered for this user-defined hardening definition.
    
    ! Note: Fortran srt params are passed by reference, not by values
    ! nvalue here refer to the number of properties entered for the hardening definition
    ! table(N) is the address of the first element of the array of hardening properties
    
    ! table in UMAT is 1D array, and now we view it as a 2D array
    ! UHARD interpret every pair of elements in table as a column pair of (yield stress, eqplas)

    dimension table(2, nvalue)
    
    ! set yield stress to last value of table, hardening to zero
    
    syield = table(1, nvalue)
    hard(1) = 0.d0
    
    ! we print the first values of the table to see if it is correct
    ! print *, 'table(1, 1): ', table(1, 1)
    ! print *, 'table(2, 1): ', table(2, 1)
    ! print *, 'table(1, 2): ', table(1, 2)
    ! print *, 'table(2, 2): ', table(2, 2)


    ! Now print the last
    ! print *, 'table(1, nvalue): ', table(1, nvalue)
    ! print *, 'table(2, nvalue): ', table(2, nvalue)

    ! if more than one entry, search table
    
    if (nvalue > 1) then
        do k1 = 1, nvalue - 1
            eqpl1 = table(2, k1 + 1)
            if (eqplas < eqpl1) then
                eqpl0 = table(2, k1)
                if (eqpl1 <= eqpl0) then
                    write(7,*) 'error - plastic strain must be entered in ascending order'
                end if

                ! current yield stress and hardening

                deqpl = eqpl1 - eqpl0
                syiel0 = table(1, k1)
                syiel1 = table(1, k1 + 1)
                dsyiel = syiel1 - syiel0
                hard(1) = dsyiel/deqpl
                syield = syiel0 + (eqplas - eqpl0) * hard(1)
                exit
            endif
        end do
    endif

return
end




