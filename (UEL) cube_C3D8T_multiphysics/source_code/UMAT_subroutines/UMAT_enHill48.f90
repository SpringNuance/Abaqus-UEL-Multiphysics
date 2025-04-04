!====================================================================
!          Program for 3D anisotropic hardening 
!          Anisotropic Hill48 yield function
!          Anisotropic hardening & r-value evolution
!          by Xuan Binh, Junhe Lian
!          binh.nguyen@aalto.fi
!          junhe.lian@iehk.rwth-aachen.de
!          July 2024 
!          Abaqus 2023
!
!          !DO NOT DISTRIBUTE WITHOUT AUTHOR'S PERMISSION!
!====================================================================

! Since enHill48 is a non-associated flow rule
! It means that the trial stress to determine active yielding is not the same as the flow stress
! In the code below, sig_trial is the trial stress and sig_Hill48 is the flow stress

! This subroutine calculates the anisotropic parameters in Hill48 yield function
! It divides all parameters by half from original paper
subroutine calc_anisotropic_yield_params(F, G, H, N, L, M, &
          sigmayield0, sigmayield45, sigmayield90, sigmayieldEB)
    use precision
    implicit none
    ! Inputs
    real(kind=dp), intent(in) :: sigmayield0, sigmayield45, sigmayield90, sigmayieldEB
    ! Outputs
    real(kind=dp), intent(out) :: F, G, H, N, L, M

    ! Calculate anisotropic parameters
    F = ((sigmayield0**2) / (sigmayield90**2) - 1.0d0 + (sigmayield0**2 / sigmayieldEB**2)) / 2.0d0
    G = (1.0d0 - (sigmayield0**2 / sigmayield90**2) + (sigmayield0**2 / sigmayieldEB**2)) / 2.0d0
    H = (1.0d0 + (sigmayield0**2 / sigmayield90**2) - (sigmayield0**2 / sigmayieldEB**2)) / 2.0d0
    N = ((4.0d0 * sigmayield0**2 / sigmayield45**2) - (sigmayield0**2 / sigmayieldEB**2)) / 2.0d0
    L = 1.5d0
    M = 1.5d0

end subroutine calc_anisotropic_yield_params

! This subroutine calculates the anisotropic parameters in Hill48 flow potential
! It divides all parameters by half from original paper
subroutine calc_anisotropic_flow_params(F_r, G_r, H_r, N_r, L_r, M_r, &
        rvalue0, rvalue45, rvalue90)
    use precision
    implicit none
    ! Inputs
    real(kind=dp), intent(in) :: rvalue0, rvalue45, rvalue90
    ! Outputs
    real(kind=dp), intent(out) :: F_r, G_r, H_r, N_r, L_r, M_r 

    ! Calculate anisotropic parameters based on r-values
    F_r = rvalue0 / (rvalue90 * (1.0d0 + rvalue0))
    G_r = 1.0d0 / (1.0d0 + rvalue0)
    H_r = rvalue0 / (1.0d0 + rvalue0)
    N_r = (rvalue0 + rvalue90) * (1.0d0 + 2.0d0 * rvalue45) / (2.0d0 * rvalue90 * (1.0d0 + rvalue0))
    L_r = 1.5d0
    M_r = 1.5d0

end subroutine calc_anisotropic_flow_params

! This subroutine calculates the trial Hill48 equivalent stress
subroutine calc_sig_trial(sig_trial, stress_temp, F, G, H, N, L, M, tol)
    use precision
    implicit none 
    real(kind=dp), intent(in) :: stress_temp(6)
    real(kind=dp), intent(in) :: F, G, H, N, L, M, tol
    real(kind=dp), intent(out) :: sig_trial
    real(kind=dp) :: subsig_trial

    ! Calculate subvalue of the trial Hill48 equivalent stress
    subsig_trial = F * (stress_temp(2) - stress_temp(3))**2 + &
                  G * (stress_temp(3) - stress_temp(1))**2 + &
                  H * (stress_temp(1) - stress_temp(2))**2 + &
                  2.0d0 * N * stress_temp(4)**2 + &
                  2.0d0 * L * stress_temp(5)**2 + &
                  2.0d0 * M * stress_temp(6)**2

    ! To prevent subsig_trial = 0
    if (subsig_trial < tol) then
        subsig_trial = tol
    end if

    ! Calculate the trial Hill48 equivalent stress
    sig_trial = sqrt(subsig_trial)

    ! To prevent sig_trial = 0
    if (sig_trial < tol) then
        sig_trial = tol
    elseif (sig_trial > (0.0d0 - tol) .AND. sig_trial <= 0.0d0) then
        sig_trial = 0.0d0 - tol
    end if

end subroutine calc_sig_trial

! This subroutine calculates the Hill48 flow stress
subroutine calc_sig_Hill48(sig_Hill48, stress_temp, rvalue0, rvalue45, rvalue90, &
                            F_r, G_r, H_r, N_r, L_r, M_r, tol)
    use precision
    implicit none
    real(kind=dp), intent(in) :: stress_temp(6), rvalue0, rvalue45, rvalue90, &
                                    F_r, G_r, H_r, N_r, L_r, M_r, tol
    real(kind=dp), intent(out) :: sig_Hill48
    real(kind=dp) :: subsig_Hill48

    ! calculate subvalue of the trial hill48 flow potential
    subsig_Hill48 = F_r * (stress_temp(2) - stress_temp(3))**2 + &
                 G_r * (stress_temp(3) - stress_temp(1))**2 + &
                 H_r * (stress_temp(1) - stress_temp(2))**2 + &
                 2.0d0 * N_r * stress_temp(4)**2 + &
                 2.0d0 * L_r * stress_temp(5)**2 + &
                 2.0d0 * M_r * stress_temp(6)**2

    ! to prevent subsig_Hill48 = 0
    if (subsig_Hill48 < tol) then
        subsig_Hill48 = tol
    end if

    ! calculate the trial hill48 flow potential
    sig_Hill48 = sqrt(subsig_Hill48)

    ! to prevent sig_Hill48 = 0
    if (sig_Hill48 < tol) then
        sig_Hill48 = tol
    elseif (sig_Hill48 > (0.0d0 - tol) .and. sig_Hill48 <= 0.0d0) then
        sig_Hill48 = 0.0d0 - tol
    end if

end subroutine calc_sig_Hill48

subroutine UMAT_enHill48_3D(stress,statev,ddsdde,sse,spd,scd, &
    rpl,ddsddt,drplde,drpldt, &
    stran,dstran,time,dtime,temp,dtemp,predef,dpred,cmname, &
    ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)
!
    use precision
    use common_block
    include 'aba_param.inc'
!
    character*80 cmname
    dimension stress(ntens),statev(nstatv), &
            ddsdde(ntens,ntens),ddsddt(ntens),drplde(ntens), &
            stran(ntens),dstran(ntens),time(2),predef(1),dpred(1), &
            props(nprops),coords(3),drot(3,3),dfgrd0(3,3),dfgrd1(3,3), jstep(4)

    ! Defining numerical constants
    real(kind=dp), parameter :: tol = 1
    real(kind=dp) :: E, nu, mu, lambda
    real(kind=dp), dimension(ndim) :: sig_principal_unsorted, sig_principal_sorted, sig_principal_dir
    integer, parameter :: k_newton = 200
    logical :: continue_loop
    real(kind=dp) :: rvalue0,rvalue45,rvalue90, &
        F,G,H,L,M,N,F_r,G_r,H_r,L_r,M_r,N_r, &
        sigtrial, sigHill, xf, dsdgamma, Xdeltagamma, xddgamma, &
        dgamma, eqplas, eqplas_old, deqplas,&
        invariant_p, invariant_q, invariant_r, triaxiality, lode_norm
    integer :: nvalue,iflag,k1,k2

    ! User defined tensors
    dimension eelas(ntens), eplas(ntens), flow(ntens), stress_temp(ntens), ddsdde_effective(ntens, ntens), numerator(ntens, ntens)
    dimension dfds(ntens), dgds(ntens), Ydirection(ntens), dstran_elas(ntens), dstran_plas(ntens), De_dfds(ntens), De_dgds(ntens)

    ! Define material properties constants
    ! ELASTIC properties
    UMAT_model = props(1)  ! UMAT model number
    E = props(2)
    nu  = props(3)

    ! before_flow_props_idx is the index in props before where the 8 columns of PEEQ, 
    ! sigmayield0, sigmayield45, sigmayield90, sigmayieldEB, 
    ! rvalue0, rvalue45, rvalue90 starts   
  
    ! Number of points on flow curve and r-value input table
    nvalue = (nprops - before_flow_props_idx)/8	   
    ! print *, 'nvalue = ', nvalue 
    ! call pause(180)
    
    !==========================!
    ! ELASTIC STIFFNESS TENSOR !
    !==========================!

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

    ! Update stress using matmul
    stress_temp = stress + matmul(ddsdde, dstran)
    
    eqplas = statev(eqplas_idx)

    ! Calculate anisotropic parameters in Hill48 based on flow stresses	          
    ! Fetching yield stress from flow curve
    
    ! Obtain sigmayield0, sigmayield45, sigmayield90, sigmayieldEB, 
    ! rvalue0, rvalue45, rvalue90
    call UHARD_enHill48(hard0, sigmayield0, sigmayield45,sigmayield90,sigmayieldEB, &
                rvalue0,rvalue45,rvalue90,eqplas,props(before_flow_props_idx + 1),nvalue)	

    ! Calculate F, G, H, N, L, M based on
    ! sigmayield0, sigmayield45, sigmayield90, sigmayieldEB
    call calc_anisotropic_yield_params(F, G, H, N, L, M, &
                sigmayield0, sigmayield45, sigmayield90, sigmayieldEB)

    ! Calculate sig_trial
    call calc_sig_trial(sig_trial, stress_temp, F, G, H, N, L, M, tol)

    ! Calculate F_r, G_r, H_r, L_r, M_r, N_r based on 
    ! rvalue0, rvalue45, rvalue90
    call calc_anisotropic_flow_params(F_r, G_r, H_r,  N_r, L_r, M_r, &
                rvalue0, rvalue45, rvalue90)

    ! Calculate sig_Hill48
    call calc_sig_Hill48(sig_Hill48, stress_temp, rvalue0, rvalue45, rvalue90, &
                        F_r, G_r, H_r, N_r, L_r, M_r, tol)

    ! Check yielding. In enHill48, yielding stress is the first stress along RD (0 degree)

    ! If active yielding
    if (sig_trial - sigmayield0 > 0.0d0) then       
        dgamma = 0.0d0
        iflag = 0

        continue_loop = .true.

        ! Plastic corrector and begin iterations
        do while (continue_loop)
            ! Increment the flag
            iflag = iflag + 1
            
            ! Obtain hard0, sigmayield0, sigmayield45, sigmayield90, sigmayieldEB, 
            ! rvalue0, rvalue45, rvalue90
            call UHARD_enHill48(hard0, sigmayield0,sigmayield45,sigmayield90,sigmayieldEB, &
                        rvalue0,rvalue45,rvalue90,eqplas,props(before_flow_props_idx + 1),nvalue)	   

            ! Calculate F, G, H, N, L, M based on 
            ! sigmayield0, sigmayield45, sigmayield90, sigmayieldEB
            call calc_anisotropic_yield_params(F, G, H, N, L, M, &
                        sigmayield0, sigmayield45, sigmayield90, sigmayieldEB)
            
            ! Calculate sig_trial
            call calc_sig_trial(sig_trial, stress_temp, F, G, H, N, L, M, tol)

            ! Calculate F_r, G_r, H_r, L_r, M_r, N_r based on 
            ! rvalue0, rvalue45, rvalue90
            call calc_anisotropic_flow_params(F_r, G_r, H_r, N_r, L_r, M_r, &
                        rvalue0, rvalue45, rvalue90)

            ! Calculate sig_Hill48
            call calc_sig_Hill48(sig_Hill48, stress_temp, rvalue0, rvalue45, rvalue90, &
                            F_r, G_r, H_r, N_r, L_r, M_r, tol)

            ! Update parameters with Non-AFR and calculate sigmayield and sig_Hill48 at every iteration 

            ! Calculate the flow direction vector based on Flow potential
            dgds(1) = (H_r * (stress_temp(1) - stress_temp(2)) - G_r * (stress_temp(3) - stress_temp(1)))/sig_Hill48
            dgds(2) = (F_r * (stress_temp(2) - stress_temp(3)) - H_r * (stress_temp(1) - stress_temp(2)))/sig_Hill48
            dgds(3) = (G_r * (stress_temp(3) - stress_temp(1)) - F_r * (stress_temp(2) - stress_temp(3)))/sig_Hill48
            dgds(4) = (2.0d0 * N_r * stress_temp(4))/sig_Hill48
            dgds(5) = (2.0d0 * L_r * stress_temp(5))/sig_Hill48
            dgds(6) = (2.0d0 * M_r * stress_temp(6))/sig_Hill48

            ! Calculate the flow direction vector based on Yield function 
            dfds(1) = (H * (stress_temp(1) - stress_temp(2)) - G * (stress_temp(3) - stress_temp(1)))/sig_trial
            dfds(2) = (F * (stress_temp(2) - stress_temp(3)) - H * (stress_temp(1) - stress_temp(2)))/sig_trial
            dfds(3) = (G * (stress_temp(3) - stress_temp(1)) - F * (stress_temp(2) - stress_temp(3)))/sig_trial
            dfds(4) = (2.0d0 * N * stress_temp(4))/sig_trial
            dfds(5) = (2.0d0 * L * stress_temp(5))/sig_trial
            dfds(6) = (2.0d0 * M * stress_temp(6))/sig_trial

            ! Compute Ydirection = D^{el} : n_{\Psi} using matmul
            Ydirection = matmul(ddsdde, dgds)

            ! Compute dsdgamma = n_{\Phi} : Ydirection
            dsdgamma = dot_product(dfds, Ydirection)

            ! Corresponding flow direction

            call UHARD_enHill48(hard0, sigmayield0,sigmayield45,sigmayield90,sigmayieldEB, &
                        rvalue0,rvalue45,rvalue90,eqplas,props(before_flow_props_idx + 1),nvalue)
            
            xddgamma = (sig_trial - sigmayield0)/(dsdgamma + hard0)
            dgamma = dgamma + xddgamma
            
            ! Update trial stress with new dgamma
            do k1 = 1, ntens
                stress_temp(k1) = stress(k1) + &
                                ddsdde(k1, 1) * (dstran(1) - dgamma * dgds(1)) + &
                                ddsdde(k1, 2) * (dstran(2) - dgamma * dgds(2)) + &
                                ddsdde(k1, 3) * (dstran(3) - dgamma * dgds(3)) + &
                                ddsdde(k1, 4) * (dstran(4) - dgamma * dgds(4)) + &
                                ddsdde(k1, 5) * (dstran(5) - dgamma * dgds(5)) + &
                                ddsdde(k1, 6) * (dstran(6) - dgamma * dgds(6))
            end do	  

            ! Update the equivalent plastic strain	  
            deqplas = dgamma * (sig_Hill48/sig_trial)
            eqplas = statev(eqplas_idx) + deqplas
            
            ! Update anisotropic parameters in Hill48 based on flow stresses
            ! Fetching yield stress from flow curve
            call UHARD_enHill48(hard0, sigmayield0,sigmayield45,sigmayield90,sigmayieldEB, &
                        rvalue0,rvalue45,rvalue90,eqplas,props(before_flow_props_idx + 1),nvalue)	  
            
            ! Calculate F, G, H, N, L, M based on
            ! sigmayield0, sigmayield45, sigmayield90, sigmayieldEB
            call calc_anisotropic_yield_params(F, G, H, N, L, M, &
                        sigmayield0, sigmayield45, sigmayield90, sigmayieldEB)

            ! Calculate sig_trial
            call calc_sig_trial(sig_trial, stress_temp, F, G, H, N, L, M, tol)
  
            ! Check if the stress state is located on the updated yield loci
            if ((iflag > k_newton) .or. (abs(sig_trial - sigmayield0) <= tol)) then
                continue_loop = .false.
            end if
            
        end do

    end if

    ! ddsdde = ddsdde_effective
    stress = stress_temp

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
    
    statev(eqplas_idx) = eqplas
    statev(deqplas_idx) = deqplas
    statev(sig_H_idx) = sig_H
    statev(sig_H_grad_X_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 1)
    statev(sig_H_grad_Y_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 2)
    statev(sig_H_grad_Z_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 3)
    statev(sig_trial_idx) = sig_trial
    statev(sig_Hill48_idx) = sig_Hill48
    statev(sig_Tresca_idx) = sig_Tresca
    statev(sig_P1_idx) = sig_P1
    statev(triaxiality_idx) = triaxiality
    statev(lode_norm_idx) = lode_norm

    ! Update the sig_H_all_elems_at_inpts (VERY IMPORTANT)
    sig_H_all_elems_at_inpts(noel, npt) = sig_H
    eqplas_all_elems_at_inpts(noel, npt) = eqplas

return
end

subroutine UHARD_enHill48(hard0,sigmayield0,sigmayield45,sigmayield90,sigmayieldEB, &
                rvalue0,rvalue45,rvalue90,eqplas,table,nvalue)
!
    include 'aba_param.inc'
    dimension table(8,nvalue)
!
!     Set yield stress to second value of table, hardening to zero
    sigmayield0 = table(2,nvalue)
    hard0 = 0.0d0
    sigmayield45 = table(3,nvalue)
    hard45 = 0.0d0
    sigmayield90 = table(4,nvalue)
    hard90 = 0.0d0
    sigmayieldEB = table(5,nvalue)
    hardEB = 0.0d0
    rvalue0 = table(6,nvalue)
    hardr0 = 0.0d0
    rvalue45 = table(7,nvalue)
    hardr45 = 0.0d0
    rvalue90 = table(8,nvalue)
    hardr90 = 0.0d0
!
!    If more than one entry, search table
    if (nvalue > 1) then
        do k1 = 1,nvalue - 1
            eqpl1 = table(1,k1 + 1)
            if (eqplas < eqpl1) then
                eqpl0 = table(1,k1)
                if (eqpl1 <= eqpl0) then
                    write(6, *) '***ERROR - PLASTIC STRAIN MUST BE ENTERED IN ASCENDING ORDER'
                end if

            deqpl = eqpl1 - eqpl0
            
            ! Obtain sigmayield0 and hard0
            dsigmayield0 = table(2,k1 + 1) - table(2,k1)
            hard0 = dsigmayield0/deqpl
            sigmayield0 = table(2,k1) + (eqplas - eqpl0) * hard0
            
            ! Obtain sigmayield45
            dsigmayield45 = table(3,k1 + 1) - table(3,k1)
            hard45 = dsigmayield45/deqpl
            sigmayield45 = table(3,k1) + (eqplas - eqpl0) * hard45

            ! Obtain sigmayield90
            dsigmayield90 = table(4,k1 + 1) - table(4,k1)
            hard90 = dsigmayield90/deqpl
            sigmayield90 = table(4,k1) + (eqplas - eqpl0) * hard90

            ! Obtain sigmayieldEB
            dsigmayieldEB = table(5,k1 + 1) - table(5,k1)
            hardEB = dsigmayieldEB/deqpl
            sigmayieldEB = table(5,k1) + (eqplas - eqpl0) * hardEB

            ! Obtain rvalue0
            drvalue0 = table(6,k1 + 1) - table(6,k1)
            hardr0 = drvalue0/deqpl
            rvalue0 = table(6,k1) + (eqplas - eqpl0) * hardr0

            ! Obtain rvalue45
            drvalue45 = table(7,k1 + 1) - table(7,k1)
            hardr45 = drvalue45/deqpl
            rvalue45 = table(7,k1) + (eqplas - eqpl0) * hardr45

            ! Obtain rvalue90
            drvalue90 = table(8,k1 + 1) - table(8,k1)
            hardr90 = drvalue90/deqpl
            rvalue90 = table(8,k1) + (eqplas - eqpl0) * hardr90		
            
            exit
            
            end if
        end do

        ! Linear extrapolation 
        if (eqplas > table(1,nvalue)) then
            hard0 = (table(2,nvalue) - table(2,nvalue - 1)) &
                   /(table(1,nvalue) - table(1,nvalue - 1))

            sigmayield0 = table(2,nvalue) + (eqplas - table(1,nvalue)) * hard0

            hard45 = (table(3,nvalue) - table(3,nvalue - 1))  &
                /(table(1,nvalue) - table(1,nvalue - 1)) 

            sigmayield45 = table(3,nvalue) + (eqplas - table(1,nvalue)) * hard45

            hard90 = (table(4,nvalue) - table(4,nvalue - 1))  &
                /(table(1,nvalue) - table(1,nvalue - 1))

            sigmayield90 = table(4,nvalue) + (eqplas - table(1,nvalue)) * hard90

            hardEB = (table(5,nvalue) - table(5,nvalue - 1))  &
                /(table(1,nvalue) - table(1,nvalue - 1))

            sigmayieldEB = table(5,nvalue) + (eqplas - table(1,nvalue)) * hardEB

            hardr0 = (table(6,nvalue) - table(6,nvalue - 1)) &
                /(table(1,nvalue) - table(1,nvalue - 1))

            rvalue0 = table(6,nvalue) + (eqplas - table(1,nvalue)) * hardr0

            hardr45 = (table(7,nvalue) - table(7,nvalue - 1)) &
                /(table(1,nvalue) - table(1,nvalue - 1)) 

            rvalue45 = table(7,nvalue) + (eqplas - table(1,nvalue)) * hardr45

            hardr90 = (table(8,nvalue) - table(8,nvalue - 1)) &
                /(table(1,nvalue) - table(1,nvalue - 1))

            rvalue90 = table(8,nvalue) + (eqplas - table(1,nvalue)) * hardr90	  
        end if
    end if
return
end