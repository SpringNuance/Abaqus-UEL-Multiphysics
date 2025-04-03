! This is isotropic von Mises plasticity model
! Note: flow curve in the props should appear at the end of props. 
! If there is any non flow curve props behind the flow curve, you must move
! it before_flow_props_idx index in the props array.

!***********************************************************************

subroutine UMAT_isotropic_vonMises(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp2,dtemp,predef,dpred, &
    cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    use precision
    use common_block
    !use ieee_arithmetic
    include 'aba_param.inc' 

    character*8 cmname
    dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens), &
        ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens), &
        time(2),predef(1),dpred(1),props(nprops),coords(3),drot(3,3), &
        dfgrd0(3,3),dfgrd1(3,3),jstep(4)
    
    real(kind=dp) :: E, nu, lambda, mu, eqplas, deqplas, rhs 
    real(kind=dp) :: syield, syiel0, sig_vonMises, sig_H, sig_P1, sig_P2, sig_P3, sig_Tresca
    real(kind=dp) :: effective_mu, effective_lambda, effective_hard    

    real(kind=dp) :: eelas(ntens), eplas(ntens), flow(ntens), stress_copy(ntens)
    real(kind=dp) :: hard(3), old_stress(ntens), old_eplas(ntens)
    real(kind=dp) :: sig_principal_unsorted(ndim), sig_principal_sorted(ndim)
    real(kind=dp) :: sig_principal_dir(ndim, ndim)
    real(kind=dp) :: invariant_p, invariant_q, invariant_r, triaxiality, lode_norm
    real(kind=dp) :: sig_principal_1, sig_principal_2, sig_principal_3
    real(kind=dp), parameter :: toler = 1e-12
    real(kind=dp), parameter :: newton = 100
    integer :: k_newton

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
    ! PROPS(before_mech_props_idx+1) - E
    ! PROPS(before_mech_props_idx+2) - NU
    ! PROPS(before_flow_props_idx+1:nprops) - SYIELD AN HARDENING DATA
    ! props(before_flow_props_idx+1) - syiel0, 
    ! props(before_flow_props_idx+2) - eqpl0, 
    ! props(before_flow_props_idx+3) - syiel1, 
    ! props(before_flow_props_idx+4) - eqpl1, ...
    ! and props(nprops-1) - syield_N, props(nprops) - eqplas_N
    ! CALLS UHARD FOR CURVE OF YIELD STRESS VS. PLASTIC STRAIN
    ! ----------------------------------------------------------------

    ! material properties

    ! print *, 'UMAT: noel = ', noel, 'npt = ', npt, 'kinc = ', kinc
    UMAT_model = props(1)  ! UMAT model number
    E = props(2)           ! Young's modulus 
    nu = props(3)          ! Poisson's ratio 
    
    ! print *, 'E = ', E
    ! print *, 'nu = ', nu
    !eelas(1:ntens) = statev(eelas_start_idx:eelas_end_idx)
    !eplas(1:ntens) = statev(eplas_start_idx:eplas_end_idx)
    eqplas = statev(eqplas_idx)
    deqplas = 0.0d0
    old_stress = stress
    old_eplas = eplas

    call rotsig(statev(eelas_start_idx), drot, eelas, 2, ndi, nshr)
    call rotsig(statev(eplas_start_idx), drot, eplas, 2, ndi, nshr)

    ! Lame's parameters
    mu = E/(2.0d0 * (1.0d0 + nu))  ! Shear modulus
    lambda = E*nu/((1.0d0 + nu) * (1.0d0 - 2.0d0 * nu)) ! Lame's first constant


    ! initialize as 0
    ddsdde = 0.0d0 ! Their unit is Pa
    
    do i = 1, ndi
        do j = 1, ndi
            ddsdde(j, i) = lambda
        end do 
        ddsdde(i,i) = lambda + 2.0d0 * mu
    end do 

    ! Shear contribution
    do i = ndi + 1, ntens
        ddsdde(i,i) = mu
    end do 

    !    Calculate predictor stress and elastic strain
    stress = stress + matmul(ddsdde,dstran)

    eelas = eelas + dstran

    ! Calculate equivalent von Mises stress
    
    sig_vonMises = (stress(1) - stress(2))**2.0d0 + &
                   (stress(2) - stress(3))**2.0d0 + &
                   (stress(3) - stress(1))**2.0d0 + &
                    6.0d0 * (stress(4)**2.0d0 + stress(5)**2.0d0 + stress(6)**2.0d0)

    sig_vonMises = sqrt(sig_vonMises/2.0d0)
    
    ! get yield stress from the specified hardening curve
    ! nvalue equal to number of points on the hardening curve
    
    nvalue = (nprops - before_flow_props_idx) / 2

    ! print *, 'nvalue = ', nvalue ! 100
    ! print *, 'before_flow_props_idx = ', before_flow_props_idx ! 40
    
    call UHARD_vonMises(syiel0, hard, eqplas, &
                                statev, nvalue, props(before_flow_props_idx + 1))
    

    ! Determine if active yielding

    if (sig_vonMises > (1.0d0 + toler) * syiel0) then

        ! actively yielding
        ! separate the hydrostatic from the deviatoric stress
        ! calculate the flow direction

        sig_H = (stress(1) + stress(2) + stress(3))/3.0d0
        flow(1:ndi) = (stress(1:ndi) - sig_H)/sig_vonMises
        flow(ndi+1:ntens) = stress(ndi+1:ntens)/sig_vonMises
        
        ! solve for equivalent von Mises stress and equivalent plastic strain increment 
        ! using Newton-Raphson iteration

        syield = syiel0
        deqplas = 0.0d0
        do k_newton = 1, newton
            rhs = sig_vonMises - (3.0d0 * mu * deqplas) - syield
            deqplas = deqplas + rhs / ((3.0d0 * mu) + hard(1))

            call UHARD_vonMises(syield, hard, eqplas + deqplas, &
                        statev, nvalue, props(before_flow_props_idx + 1))
                                
            if (abs(rhs) < toler * syiel0) exit
        end do

        if (k_newton == newton) write(7,*) 'WARNING: plasticity loop failed'

        ! Update stresses, elastic and plastic strains
 
        stress(1:ndi) = flow(1:ndi) * syield + sig_H
        eplas(1:ndi) = eplas(1:ndi) + 3.0d0/2.0d0 * flow(1:ndi) * deqplas
        eelas(1:ndi) = eelas(1:ndi) - 3.0d0/2.0d0 * flow(1:ndi) * deqplas
        
        stress(ndi + 1:ntens) = flow(ndi + 1:ntens) * syield
        eplas(ndi + 1:ntens) = eplas(ndi + 1:ntens) + 3.0d0 * flow(ndi + 1:ntens) * deqplas
        eelas(ndi + 1:ntens) = eelas(ndi + 1:ntens) - 3.0d0 * flow(ndi + 1:ntens) * deqplas

        ! Finally, we update the equivalent plastic strain
        eqplas = eqplas + deqplas

        ! Calculate the plastic strain energy density
        ! psi_plas = deqplas * (syiel0 + syield) / 2.d0

        do i=1,ntens
            spd = spd + (stress(i)+old_stress(i)) * (eplas(i) - old_eplas(i))/2.0d0
        end do

        ! Formulate the jacobian (material tangent)   

        ! effective shear modulus
        effective_mu = mu * syield / sig_vonMises 

        ! effective Lame's constant
        effective_lambda = (E/(1.0d0 - 2.0d0 * nu) - 2.0d0 * effective_mu)/3.0d0 

        ! effective hardening modulus
        effective_hard = 3.0d0 * mu * hard(1)/(3.0d0 * mu + hard(1)) - 3.0d0 * effective_mu 

        do i = 1, ndi
            do j = 1, ndi
                ddsdde(j,i) = effective_lambda
            end do
            ddsdde(i,i) = 2.0d0 * effective_mu + effective_lambda
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

    ! Recalculate the stress
    sig_vonMises = (stress(1) - stress(2))**2.0d0 + &
                   (stress(2) - stress(3))**2.0d0 + &
                   (stress(3) - stress(1))**2.0d0 + &
                    6.0d0 * (stress(4)**2.0d0 + stress(5)**2.0d0 + stress(6)**2.0d0)

    sig_vonMises = sqrt(sig_vonMises/2.0d0)

    sig_H = (stress(1) + stress(2) + stress(3))/3.0d0

    call calc_stress_invariants(stress, ntens, invariant_p, invariant_q, invariant_r)
    call calc_triaxiality(invariant_p, invariant_q, triaxiality)
    call calc_normalized_lode(invariant_r, invariant_q, lode_norm)
    
    ! Abaqus library function to calculate principal stresses

    call sprind(stress,sig_principal_unsorted,sig_principal_dir,1,ndi,nshr)
    call sort_descending(sig_principal_unsorted, sig_principal_sorted, ndim)

    sig_P1 = sig_principal_sorted(1)
    sig_P2 = sig_principal_sorted(2)
    sig_P3 = sig_principal_sorted(3)

    sig_Tresca = (sig_P1 - sig_P3)/2.0d0

    ! Update coords at integration points

    coords_all_inpts(noel, npt, 1) = coords(1)
    coords_all_inpts(noel, npt, 2) = coords(2)
    coords_all_inpts(noel, npt, 3) = coords(3)

    ! update state variables
    
    statev(sig_start_idx:sig_end_idx) = stress(1:ntens)
    statev(stran_start_idx:stran_end_idx) = stran(1:ntens)
    statev(eqplas_idx) = eqplas
    statev(sig_H_idx) = sig_H
    statev(sig_H_grad_X_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 1)
    statev(sig_H_grad_Y_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 2)
    statev(sig_H_grad_Z_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 3)
    statev(sig_vonMises_idx) = sig_vonMises
    statev(sig_Tresca_idx) = sig_Tresca
    statev(sig_P1_idx) = sig_P1
    statev(sig_P2_idx) = sig_P2
    statev(sig_P3_idx) = sig_P3
    statev(triax_idx) = triaxiality
    statev(lode_idx) = lode_norm

    ! Update the sig_H_all_elems_at_inpts (VERY IMPORTANT)
    sig_H_all_elems_at_inpts(noel, npt) = sig_H

    ! ! Now, we update the coupling terms between umat and umatht
    ! dCT_mol_dCL_mol = statev(dCT_dCL_idx)
    ! dCT_mol_deqplas = statev(dCT_deqplas_idx)

    ! ! Only in a fully coupled thermal-stress or a coupled thermal-electrical-structural analysis
    ! ! RPL
    ! ! Volumetric heat generation per unit time at the end of the increment caused by mechanical working of the material.
    ! rpl = 0.0d0

    ! ! DDSDDT(NTENS)
    ! ! Variation of the stress increments with respect to the temperature.
    ! ddsddt = 0.0d0 ! Currently the model is still uncoupled
    ! ! Hydrogen does not affect the stress field

    ! ! DRPLDE(NTENS)
    ! ! Variation of RPL with respect to the strain increments.
    ! drplde = - dCT_mol_dCL_mol/dtime

    ! ! DRPLDT
    ! ! Variation of RPL with respect to the temperature.
    ! drplde = - dCT_mol_deqplas/dtime

    ! ! Finally, we multiply them by sfd
    ! rpl = rpl * sfd
    ! ddsddt = ddsddt * sfd
    ! drplde = drplde * sfd
    ! drpldt = drpldt * sfd

return
end


!***********************************************************************

subroutine UHARD_vonMises(syield, hard, eqplas, statev, nvalue, table)

    use precision
    include 'aba_param.inc'

    character*80 cmname
    dimension hard(3),statev(*),table(2, nvalue)
    
    ! set yield stress to last value of table, hardening to zero
    
    syield = table(1, nvalue)
    hard(1) = 0.d0

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