subroutine UMATHT_McNabb_Foster(u,dudt,dudg,flux,dfdt,dfdg, &
    statev,temp,dtemp,dtemdx,time,dtime,predef,dpred, &
    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
    noel,npt,layer,kspt,kstep,kinc)

    use precision
    use common_block
    inCLude 'aba_param.inc'

    character(len=80) :: cmname
    dimension dudg(ntgrd),flux(ntgrd),dfdt(ntgrd), &
      dfdg(ntgrd,ntgrd),statev(nstatv),dtemdx(ntgrd), &
      time(2),predef(1),dpred(1),props(nprops),coords(3)
    
    ! This subroutine requires us to update u, dudt, dudg, flux, dfdt, dfdg, and possibly statev, pnewdt
    
    real(kind=dp), parameter :: molar_mass_H = 1.00784d0 ! g/mol
    real(kind=dp), parameter :: molar_mass_Fe = 55.845d0 ! g/mol
    real(kind=dp), parameter :: ratio_molar_mass_Fe_H = 55.415d0
    real(kind=dp), parameter :: density_metal = 7900.0d0 ! kg/m^3
    ! CL_wtppm = (CL_mol * molar_mass_H) / (density_metal * 1.d-03)
    real(kind=dp), parameter :: conversion_mol_to_wtppm = 0.127574683544d0 ! wtppm
    ! CL_molfrac = (CL_wtppm * 1.d-6) * (ratio_molar_mass_Fe_H)
    real(kind=dp), parameter :: conversion_wtppm_to_molfrac = 55.4105d-6 ! molfrac 
    ! Inverse of conversion_wtppm_to_mol
    real(kind=dp), parameter :: conversion_wtppm_to_mol = 7.838545801d0 ! mol
    real(kind=dp), parameter :: conversion_mol_to_molfrac = 7.068977d-6 ! molfrac
    
    ! Define all real for all variables used 
    real(kind=dp) :: R, T, VH, DL, DL0, WB_L, sfd_hydro
    real(kind=dp) :: avogadro, NL, alpha_dis, alpha_gb, alpha_carb, NT_dis, NT_gb, NT_carb
    real(kind=dp) :: WB_dis, WB_gb, WB_carb, beta_BCC, beta_FCC, a_lattice_BCC, a_lattice_FCC
    real(kind=dp) :: gamma, rho_d0, theta_coverage, k_HEDE
    real(kind=dp) :: CL_mol_old, dCL_mol, CL_mol, CL, K_dis, K_gb, K_carb
    real(kind=dp) :: burgers_vector, inverse_burgers_vector, beta, NL_mol
    real(kind=dp) :: thetaL, temp_dis, thetaT_dis, temp_gb, thetaT_gb, temp_carb, thetaT_carb
    real(kind=dp) :: eqplas, rho_d, NT_dis_mol, CT_dis, CT_dis_mol, C0_mol, mu0, mu_stress, mu
    real(kind=dp) :: dC_mol_dNT_dis_mol, dNT_dis_deqplas, dCT_mol_deqplas
    real(kind=dp) :: dCT_dis_mol_dCL_mol, dCT_gb_mol_dCL_mol, dCT_carb_mol_dCL_mol
    real(kind=dp) :: total_dCT_mol_dCL_mol, dC_mol_dCL_mol, deqplas
    real(kind=dp) :: C_mol, CT_mol, CT_gb, CT_gb_mol, CT_carb, CT_carb_mol
    real(kind=dp), allocatable :: alpha_array(:), NT_array(:), WB_T_array(:), K_array(:), thetaT_array(:)
    integer :: ntrap, equilibrium_equation, dis_trap_mode, temperature_mode, coefficient_formula, crystal_structure
    
    UMATHT_model = props(1) ! (1 - Oriani's equation | 2 - McNabb-Foster’s equation)
    sfd_hydro = props(2) ! Scaling factor to prevent "zero heat flux" numerical issues. Default is 1.0d0
    crystal_structure = props(3)  ! (1 - BCC, 2 - FCC)
    a_lattice_BCC = props(4)  ! Lattice parameter for BCC (m)
    a_lattice_FCC = props(5)  ! Lattice parameter for FCC (m)
    beta_BCC = props(6)  ! Number of hydrogen atoms in each BCC lattice site (dimless)
    beta_FCC = props(7)  ! Number of hydrogen atoms in each FCC lattice site (dimless)
    R = props(8)  ! Universal gas constant (N*m)/(mol*K)
    temperature_mode = props(9)  ! (1 - constant | 2 - predefined field)
    T = props(10)  ! Temperature (K)
    VH = props(11)  ! Partial molar volume (m^3/mol)
    coefficient_formula = props(12)  ! (1 - using DL directly | 2 - using DL = DL0 * exp(-WB_L/RT))
    DL = props(13)  ! Diffusion coefficient (m^2/s)
    DL0 = props(14)  ! Pre-exponentiation factor for diffusion coefficient (m^2/s)
    WB_L = props(15)  ! Activation energy for jumping between lattice sites (N*m/mol)
    NL = props(16)  ! Number of solvent metal atoms per unit volume (1/m^3)
    avogadro = props(17)  ! Avogadro’s constant (1/mol)
    delta_g_b0 = props(18)  ! Gibbs free energy difference (N*m/mol)
    C0_mol = props(19)  ! Initial hydrogen concentration (mol/m^3)
    mu0 = props(20)  ! Initial chemical potential (N*m/mol)
    ntrap = props(21)  ! Number of trap types (0 - no traps, 1 - dislocation, 2 - 5 for additional trap types)
                    ! You can have as many traps as you want by defining alpha, NT and WB at the end of the UMATHT props
    dis_trap_mode = props(22)  ! (1 - Kumnick & Krom | 2 - Sofronis & Dadfarnia)
    gamma = props(23)  ! Fitting parameter in Dadfarnia et al. (1/m^2)
    rho_d0 = props(24)  ! Dislocation density for annealed material (1/m^2)
    alpha_dis = props(25)  ! Number of interstitial sites per trap site (dislocations)
    WB_dis = props(26)  ! Binding energy of hydrogen to dislocations (N*m/mol)
    trap_start_idx = 27 ! Starting index for other trap parameters other than dislocation type

    ! Casting all flags to integer
    crystal_structure = int(crystal_structure)
    temperature_mode = int(temperature_mode)
    coefficient_formula = int(coefficient_formula)
    ntrap = int(ntrap)
    equilibrium_equation = int(equilibrium_equation)
    dis_trap_mode = int(dis_trap_mode)


    ! THE UNIT FOR HYDROGEN CONCENTRATION is mol/m^3
    ! It is marked by the suffix _mol in the variable name
    ! We can convert it to 1/m^3 by multiplying with Avogadro's number, which does not have any suffix
    ! Example: CL_mol = CL / avogadro or CL (1/m^3) = CL_mol (mol/m^3) * avogadro (1/mol)

    CL_mol_old = temp ! (mol/m^3)
    dCL_mol = dtemp ! (mol/m^3)
    CL_mol = CL_mol_old + dCL_mol ! (mol/m^3)

    CL = CL_mol * avogadro ! (1/m^3)

    ! using predefined field for temperature
    if (temperature_mode == 2) then
        T = predef(1) + dpred(1)	  
    end if	  

    ! using the Arrhenius equation for the diffusion coefficient
    if (coefficient_formula == 2) then
        DL = DL0 * dexp(-WB_L / (R * T))
    end if

    ! slip occurs along the plane of the shortest Burgers vector
    if (crystal_structure == 1) then ! BCC crystal structure
        beta = beta_BCC ! beta is taken to be 6 for BCC as indirect
                        ! evidence indicates tetrahedral site occupancy rather than 
                        ! octahedral site occupancy at room temperature in alpha-iron
        ! slip is assumed to occur along the {110} plane and ⟨111⟩ direction
        burgers_vector = (dsqrt(3.0d0)/2.0d0) * a_lattice_BCC ! (m) 
        inverse_burgers_vector = 1.0d0/burgers_vector ! (1/m)
    elseif (crystal_structure == 2) then ! FCC crystal structure
        beta = beta_FCC ! beta is taken to be 1 for FCC, resulting from the more favourable 
                        ! octahedral site occupancy (beta = 2 for tetrahedral)
        ! slip occurs along the closed packed plane {111} and slip direction ⟨110⟩
        burgers_vector = (dsqrt(2.0d0)/2.0d0) * a_lattice_FCC ! (m)
        inverse_burgers_vector = 1.0d0/burgers_vector ! (1/m)
    end if

    NL_mol = NL / avogadro ! (mol/m^3) = (1/m^3) / (1/mol)
    thetaL = CL / (beta * NL) ! dimless = (1/m^3) / (dimless * 1/m^3)
    
    ! If ntrap = 0, only lattice H is considered
    ! If ntrap = 1, dislocation trap is always prioritized, using either Kumnick & Krom or Sofronis & Dadfarnia
    ! Other trap types are only considered when ntrap >= 2

    ! For each trap type, we extract alpha, NT, and WB. Then we calculate K and thetaT
    ! thetaT / (1 - thetaT) = K * thetaL / (1 - thetaL)
    ! However if thetaL << 1  then 
    ! thetaT / (1 - thetaT) = K * thetaL

    ! Now handling the trapping parameters as arrays
    allocate(alpha_array(ntrap-1), NT_array(ntrap-1), WB_T_array(ntrap-1), K_array(ntrap-1), thetaT_array(ntrap-1))

    if (ntrap >= 1) then
        K_dis = dexp(-WB_dis / (R * T))  ! Arrhenius reaction rate constant for dislocation trap
        ! Finding theta_trap based on Oriani equilibrium theory
        ! which results in a Fermi-Dirac relation
        temp_dis = K_dis * thetaL / (1.0d0 - thetaL) ! (dimless)
        thetaT_dis = temp_dis / (1.0d0 + temp_dis) ! (dimless)
    end if

    if (ntrap >= 2) then
        ! Remember that fortran array count from 1
        do i = 1, ntrap - 1
            alpha_array(i) = props(trap_start_idx + (i-1) * 3) ! Alpha for trap type i
            NT_array(i) = props(trap_start_idx + (i-1) * 3 + 1)  ! Trap density for trap type i
            WB_T_array(i) = props(trap_start_idx + (i-1) * 3 + 2)  ! Binding energy of hydrogen for trap type i
            ! (dimless) = exp( - (J/mol) / (J/(mol K) * K))
            K_array(i) = dexp(-WB_T_array(i) / (R * T))  ! Arrhenius reaction rate constant for trap type i
            temp_trap = K_array(i) * thetaL / (1.0d0 - thetaL) ! (dimless)
            thetaT_array(i) = temp_trap / (1.0d0 + temp_trap) ! (dimless)
        end do
    end if

    eqplas = statev(eqplas_idx) ! (dimless) equivalent plastic strain
    dCT_mol_deqplas = 0.0d0

    if (ntrap >= 1) then
        if (dis_trap_mode == 1) then ! Krom et al. (in sites/m^3), developed from Kumnick & Johnson 
            NT_dis = 10.0d0 ** (23.26d0 - 2.33d0 * dexp(-5.5d0 * eqplas)) 
            dNT_dis_mol_deqplas = (29.5d0 * dexp(-5.5d0 * eqplas) * NT_dis ) / avogadro
            dCT_mol_deqplas = alpha_dis * thetaT_dis * dNT_dis_mol_deqplas
        
        else if (dis_trap_mode == 2) then ! Dadfarnia et al.
            
            if (eqplas < 0.5d0) then
                rho_d = rho_d0 + eqplas * gamma ! rho_d unit is 1/m^2 = 1/m^2 + dimless * 1/m^2
                NT_dis = inverse_burgers_vector * rho_d ! (1/m^3)
                dNT_dis_mol_deqplas = (inverse_burgers_vector * gamma) / avogadro ! mol/m^3 = (1/m * 1/m^2) / (1/mol)
                dCT_mol_deqplas = alpha_dis * thetaT_dis * dNT_dis_mol_deqplas

            else if (eqplas >= 0.5) then
                rho_d = 1.0d16 ! (1/m^2)
                NT_dis = inverse_burgers_vector * rho_d ! (1/m^3)
                dNT_dis_mol_deqplas = 0.0d0
                dCT_mol_deqplas = alpha_dis * thetaT_dis * dNT_dis_mol_deqplas
            end if
        end if

        CT_dis = alpha_dis * thetaT_dis * NT_dis ! (1/m^3)
        CT_dis_mol = CT_dis / avogadro ! (mol/m^3)
        ! dimless = dimless * mol/m^3 / (dimless * mol/m^3 + dimless * mol/m^3)
        dC_mol_dNT_dis_mol = (K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol) 
        ! du2 in emilio umatht is dC_mol_dNT_dis_mol * dNT_dis_mol_deqplas * deqplas
        
    end if
    
    total_dCT_mol_dCL_mol = 0.0d0
    
    if (ntrap >= 1) then
        NT_dis_mol = NT_dis / avogadro
        dCT_dis_mol_dCL_mol = (NT_dis_mol * K_dis * NL_mol * beta)/ &
                                ((K_dis * CL_mol + NL_mol * beta)**2.0d0)
        ! (dimless) = (mol/m^3 * dimless * mol/m^3 * dimless) / ((dimless * mol/m^3 + mol/m^3 * dimless)**2)
        total_dCT_mol_dCL_mol = total_dCT_mol_dCL_mol + &
                                        dCT_dis_mol_dCL_mol
    end if
    
    if (ntrap >= 2) then
        do i = 1, ntrap - 1
            NT_i_mol = NT_array(i) / avogadro
            K_i = K_array(i)
            dCT_i_mol_dCL_mol = (NT_i_mol * K_i * NL_mol * beta)/ &
                                        ((K_i * CL_mol + NL_mol * beta)**2.0d0)
            total_dCT_mol_dCL_mol = total_dCT_mol_dCL_mol + &
                                        dCT_i_mol_dCL_mol
        end do
    end if

    ! Finally, we update all the variables in UMATHT
    ! dC_mol_dCL_mol = dCL_mol_dCL_mol + dCT_mol_dCL_mol
    !                              = 1 + total_dCT_mol_dCL_mol

    dC_mol_dCL_mol = 1.0d0 + total_dCT_mol_dCL_mol	
    
    ! dC_mol_dCL_mol is dudt
    dudt = dC_mol_dCL_mol
    
    deqplas = statev(deqplas_idx) ! (dimless) equivalent plastic strain increment

    ! (mol/m^3) = (mol/m^3) + (dimless * mol/m^3) + (dimless * mol/m^3 * dimless)
    if (ntrap == 0) then
        u = u + dC_mol_dCL_mol * dCL_mol
    elseif (ntrap >= 1) then
        u = u + dC_mol_dCL_mol * dCL_mol &
            + dC_mol_dNT_dis_mol * dNT_dis_mol_deqplas * deqplas
    end if

    dfdg = 0.0d0

    do kdim = 1, ntgrd
        ! Update the flux
        ! J_m = DL * Cbar_L * grad sigma_H / (R * T) - DL * grad Cbar_L
        grad_CL_mol_kdim = dtemdx(kdim) ! = (mol/m^3) / m = (mol/m^4)

        flux(kdim) = DL * CL_mol * VH * sig_H_grad_all_elems_at_inpts(noel, npt, kdim) / (R * T) &
                - DL * grad_CL_mol_kdim
        
        ! dudg is partial (Cbar_total) / partial (grad Cbar L), which is supposed to be 0
        dudg(kdim) = 0.0d0

        ! partial J_m / partial (Cbar_L) = (DL * VH) / (R * T) * grad_sigma_H(i)
        dfdt(kdim) = (DL * VH * sig_H_grad_all_elems_at_inpts(noel, npt, kdim)) / (R * T) 
        
        ! Update dudg
        dfdg(kdim,kdim) = -DL ! = - m^2/s
    end do

    ! store the concentration in each trap, in all traps and in traps and lattice

    CT_mol = 0.0d0
    
    if (ntrap >= 1) then
        CT_mol = CT_mol + CT_dis_mol
    end if

    if (ntrap >= 2) then
        do i = 1, ntrap - 1
            CT_i = alpha_array(i) * thetaT_array(i) * NT_array(i) ! (1/m^3)
            CT_i_mol = CT_i / avogadro ! (mol/m^3)
            CT_mol = CT_mol + CT_i_mol
        end do
    end if
    
    ! Total hydrogen concentration
    C_mol = CL_mol + CT_mol

    ! Some unit conversion
    C_molfrac = C_mol * conversion_mol_to_molfrac
    C_wtppm = C_mol * conversion_mol_to_wtppm
    CL_wtppm = CL_mol * conversion_mol_to_wtppm
    CT_wtppm = CT_mol * conversion_mol_to_wtppm

    ! Hydrogen coverage factor (dimless - used in CZM model)
    theta_coverage = C_molfrac / (C_molfrac + exp(-delta_g_b0 /(R * T))) 

    ! Factor decreasing cohesive strength, based on HEDE mechanism (dimless - used in CZM model)
    k_HEDE = 1.0d0 - 1.0467d0 * theta_coverage + 0.1687d0 * theta_coverage ** 2.0d0

    ! Calculate chemical potential mu
    sig_H = statev(sig_H_idx) ! (Pa)
    mu_stress = - sig_H * VH ! (J/mol)
    mu = mu0 + R * T * dlog(C_mol / C0_mol) + mu_stress ! (J/mol)
    
    statev(C_mol_idx) = C_mol
    statev(CL_mol_idx) = CL_mol
    statev(CT_mol_idx) = CT_mol
    statev(C_wtppm_idx) = C_wtppm
    statev(CL_wtppm_idx) = CL_wtppm
    statev(CT_wtppm_idx) = CT_wtppm
    statev(thetaL_idx) = thetaL
    statev(thetaT_dis_idx) = thetaT_dis
    statev(mu_idx) = mu
    statev(theta_coverage_idx) = theta_coverage
    statev(k_HEHE_idx) = k_HEDE

return
end