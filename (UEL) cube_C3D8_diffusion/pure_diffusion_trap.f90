module precision
    use iso_fortran_env
    integer, parameter :: dp = real64
end module precision

!***********************************************************************

subroutine UMATHT(u,dudt,dudg,flux,dfdt,dfdg, &
    statev,temp,dtemp,dtemdx,time,dtime,predef,dpred, &
    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
    noel,npt,layer,kspt,kstep,kinc)

    use precision
    inCLude 'aba_param.inc'

    character(len=80) :: cmname
    dimension dudg(ntgrd),flux(ntgrd),dfdt(ntgrd), &
      dfdg(ntgrd,ntgrd),statev(nstatv),dtemdx(ntgrd), &
      time(2),predef(1),dpred(1),props(nprops),coords(3)
    
    ! This subroutine requires us to update u, dudt, dudg, flux, dfdt, dfdg, and possibly statev, pnewdt
    
    
    ! Define all real for all variables used 
    real(kind=dp) :: mode, mode_tol, crystal_structure, crystal_tol, R, T, VH, DL 
    real(kind=dp) :: avogadro, NL, alpha_dis, alpha_gb, alpha_carb, NT_dis, NT_gb, NT_carb
    real(kind=dp) :: WB_dis, WB_gb, WB_carb, beta_BCC, beta_FCC, a_lattice_BCC, a_lattice_FCC
    real(kind=dp) :: gamma, rho_d0, density_metal, volume, molar_mass_H, molar_mass_Fe
    real(kind=dp) :: CLprev_mol, dCL_mol, CL_mol, CL, K_dis, K_gb, K_carb
    real(kind=dp) :: burgers_vector, inverse_burgers_vector, beta, NL_mol
    real(kind=dp) :: thetaL, temp_dis, thetaT_dis, temp_gb, thetaT_gb, temp_carb, thetaT_carb
    real(kind=dp) :: eqplas, rho_d, NT_dis_mol, CT_dis, CT_dis_mol
    real(kind=dp) :: part_C_mol_part_NT_dis_mol, dNT_dis_deqplas
    real(kind=dp) :: part_CT_dis_mol_part_CL_mol, part_CT_gb_mol_part_CL_mol, part_CT_carb_mol_part_CL_mol
    real(kind=dp) :: total_part_CT_mol_part_CL_mol, part_C_mol_part_CL_mol, deqplas
    real(kind=dp) :: C_mol, CT_mol, CT_gb, CT_gb_mol, CT_carb, CT_carb_mol

    mode     = props(1) ! Mode of the traps
    mode_tol = 1.0e-6
    ! mode_tol is only for checking the equality since mode is a real instead of an integer
    ! mode = 1: CT = 0 (no trap hydrogen)
    ! mode = 2: Kumnick, Krom et al. (1999) Hydrogen transport near a blunting crack tip
    ! mode = 3: Sofronis, Dadfarnia et al. (2011) Hydrogen interaction with multiple traps: Can it be used to mitigate embrittlement
    
    crystal_structure = props(2) ! Crystal structure (1 - BCC, 2 - FCC)
    crystal_tol = 1.0e-3 ! same for above reason

    R               = props(3) ! Universal gas constant (8.31446 J/(mol K))
    T               = props(4) ! Temperature (300 K)
    VH              = props(5) ! Partial molar volume of hydrogen (2e-06 m^3/mol), 
    DL              = props(6) ! Diffusion coefficient for lattice hydrogen in the steel (m^2/s), from e-10 to e-15
                               ! This parameter varies widely for different steels and different conditions
    avogadro        = props(7) ! Avogadro's constant (6.022e23 1/mol)
    ! NL = Avogadro (NA) * (density of metal rho_M) / (atomic weight MM) 
    ! NL = 6.02214 × 10e23 [atom/mol] * 7900 [kg/m**3] / (55.85 * 10e-3 [kg/mol]) = 8.518e28 [atom/m**3]
    NL              = props(8) ! Number of solvent metal atoms per unit volume (8.518e28 1/m^3)
    alpha_dis       = props(9) ! Number of interstitial sites per trap site (dislocations) (1.0 dimless)
    alpha_gb        = props(10) ! Number of interstitial sites per trap site (grain boundaries) (1.0 dimless)
    alpha_carb      = props(11) ! Number of interstitial sites per trap site (carbides) (1.0 dimless)
    NT_dis          = props(12) ! Number of trap type of dislocations (1/m^3) (0 - instead defined by Dadfarnia et al. 2016)
    NT_gb           = props(13) ! Number of trap type of grain boundaries (1/m^3) (8.464e22)
    NT_carb         = props(14) ! Number of trap type of carbides (1/m^3) (8.464e26)
    WB_dis          = props(15) ! Binding energy of hydrogen to dislocations (- 20.2e3) (J/mol)
    WB_gb           = props(16) ! Binding energy of hydrogen to grain boundaries (- 58.6e3) (J/mol)
    WB_carb         = props(17) ! Binding energy of hydrogen to carbides (- 11.5e3) (J/mol)
    beta_BCC        = props(18) ! Number of number of hydrogen atoms that can reside in each lattice site (6.0 dimless)
    beta_FCC        = props(19) ! Number of number of hydrogen atoms that can reside in each lattice site (1.0 dimless)
    ! References for lattice parameter
    a_lattice_BCC   = props(20) ! Lattice parameter (2.866 Angstrom or 2.866e-10 m)
    a_lattice_FCC   = props(21) ! Lattice parameter (3.571 Angstrom or 3.571e-10 m)
    gamma           = props(22) ! gamma fitting parameter in Dadfarnia et al. (2.0e16 1/m^2)
    rho_d0          = props(23) ! Dislocation density for the annealed material in Dadfarnia et al. (1.0e10 1/m^2)
    density_metal   = props(24) ! Density of the metal (7900 kg/m^3)
    volume          = props(25) ! Volume of the tensile specimen (6000e-11 m^3)
    molar_mass_H    = props(26) ! Molar mass of hydrogen (1.00784 g/mol)
    molar_mass_Fe   = props(27) ! Molar mass of iron (55.845 g/mol)
    
    
    logging = 0 ! 0: No logging, 1: Logging
    kinc_print = 10.0 ! The increment to print the logging
    noel_print = 1608 ! The element number to print the logging

    ! Hydrogen concentration in this subroutine is in mol/m^3 unit
    ! However, the same logic also applies to mol/m^3. So you should either uses consistent wppm or mol/m^3

    ! As a result, for unit like mole fraction or wt.ppm, they would be computed in UVARM subroutine
    
    ! THE DEGREE OF FREEDOM FOR HYDROGEN CONCENTRATION IS mol/m^3
    ! It is marked by the suffix _mol in the variable name
    ! We can convert it to 1/m^3 by multiplying with Avogadro's number, which does not have any suffix
    ! Example: CL_mol = CL / avogadro or CL (1/m^3) = CL_mol (mol/m^3) * avogadro (1/mol)

    CLprev_mol = temp ! (mol/m^3)
    dCL_mol = dtemp ! (mol/m^3)
    CL_mol = CLprev_mol + dCL_mol ! (mol/m^3)

    CL = CL_mol * avogadro ! (1/m^3)

    ! Arhenius reaction rate constant for trap types 
    K_dis = dexp( -WB_dis / (R * T)) ! constant, dimless
    ! (dimless) = exp( - (J/mol) / (J/(mol K) * K))
    K_gb = dexp( -WB_gb / (R * T)) ! constant, dimless
    K_carb = dexp( -WB_carb / (R * T)) ! constant, dimless

    if (logging == 1 .and. kinc == kinc_print .and. noel == noel_print) then
        print *, 'CLprev_mol: ', CLprev_mol
        print *, 'dCL_mol: ', dCL_mol
        print *, 'CL_mol: ', CL_mol
        print *, 'CL: ', CL
        print *, 'K_dis: ', K_dis
        print *, 'K_gb: ', K_gb
        print *, 'K_carb: ', K_carb
    end if

    ! Finding theta_trap based on Oriani equilibrium theory
    ! which results in a Fermi-Dirac relation

    ! slip occurs along the plane of the shortest Burgers vector
    if (abs(crystal_structure - 1.0d0) <= crystal_tol) then ! BCC crystal structure
        beta = beta_BCC ! beta is taken to be 6 for BCC as indirect
                        ! evidence indicates tetrahedral site occupancy rather than 
                        ! octahedral site occupancy at room temperature in alpha-iron
        ! slip is assumed to occur along the {110} plane and ⟨111⟩ direction
        burgers_vector = (dsqrt(3.0d0)/2.0d0) * a_lattice_BCC ! (m) 
        inverse_burgers_vector = 1.0d0/burgers_vector ! (1/m)
    elseif (abs(crystal_structure - 2.0d0) <= crystal_tol) then ! FCC crystal structure
        beta = beta_FCC ! beta is taken to be 1 for FCC, resulting from the more favourable 
                        ! octahedral site occupancy (beta = 2 for tetrahedral)
        ! slip occurs along the closed packed plane {111} and slip direction ⟨110⟩
        burgers_vector = (dsqrt(2.0d0)/2.0d0) * a_lattice_FCC ! (m)
        inverse_burgers_vector = 1.0d0/burgers_vector ! (1/m)
    end if

    if (logging == 1 .and. kinc == kinc_print .and. noel == noel_print) then
        print *, 'beta: ', beta
        print *, 'burgers_vector: ', burgers_vector
        print *, 'inverse_burgers_vector: ', inverse_burgers_vector
    end if
    
    ! Finding NL_mol
    NL_mol = NL / avogadro ! (mol/m^3) = (1/m^3) / (1/mol)

    ! Finding thetaL 
    thetaL = CL / (beta * NL) ! = (1/m^3) / (dimless * 1/m^3) = dimless

    ! thetaT / (1 - thetaT) = K * thetaL / (1 - thetaL)
    ! However if thetaL << 1  then 
    ! thetaT / (1 - thetaT) = K * thetaL

    temp_dis = K_dis * thetaL / (1.0d0 - thetaL) ! (dimless)
    thetaT_dis = temp_dis / (1.0d0 + temp_dis) ! (dimless)
    temp_gb = K_gb * thetaL / (1.0d0 - thetaL) ! (dimless)
    thetaT_gb = temp_gb / (1.0d0 + temp_gb) ! (dimless)
    temp_carb = K_carb * thetaL / (1.0d0 - thetaL) ! (dimless)
    thetaT_carb = temp_carb / (1.0d0 + temp_carb) ! (dimless)

    if (logging == 1 .and. kinc == kinc_print .and. noel == noel_print) then
        print *, 'thetaL: ', thetaL
        print *, 'thetaT_dis: ', thetaT_dis
        print *, 'thetaT_gb: ', thetaT_gb
        print *, 'thetaT_carb: ', thetaT_carb
    end if

    eqplas = statev(1) ! (dimless) equivalent plastic strain

    if (abs(mode - 1) <= mode_tol) then ! Lattice H only
        rho_d = 0.d0 ! (1/m^2)
        NT_dis = 0.d0 ! (1/m^3)
        NT_dis_mol = 0.d0 ! (mol/m^3)
        CT_dis = 0.d0 ! (1/m^3)
        CT_dis_mol = 0.d0 ! (mol/m^3)
        NT_gb = 0.d0 ! (1/m^3)
        NT_carb = 0.d0 ! (1/m^3)
        part_C_mol_part_NT_dis_mol = 0.d0 ! (1/m^3) / (1/m^3) = (dimless)
        dNT_dis_deqplas = 0.d0 ! (1/m^3) / (dimless) = (1/m^3)	
        
    elseif (abs(mode - 2) <= mode_tol) then ! Krom et al. (in sites/m^3), developed from Kumnick & Johnson 
        rho_d = 0.d0
        NT_dis = 10.d0 ** (23.26d0 - 2.33d0 * dexp(-5.5d0 * eqplas))
        NT_dis_mol = NT_dis / avogadro
        CT_dis = alpha_dis * thetaT_dis * NT_dis
        CT_dis_mol = CT_dis / avogadro
        part_C_mol_part_NT_dis_mol = (K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol)
        dNT_dis_mol_deqplas = (29.5d0 * dexp(-5.5d0 * eqplas) * NT_dis ) / avogadro
    
    elseif (abs(mode - 3) <= mode_tol) then ! Dadfarnia et al.
        if (eqplas < 0.5) then
            rho_d = rho_d0 + eqplas * gamma ! rho_d unit is 1/m^2 = 1/m^2 + dimless * 1/m^2
            NT_dis = inverse_burgers_vector * rho_d ! NT_dis unit is 1/m^3 = 1/m * 1/m^2
            NT_dis_mol = NT_dis / avogadro ! NT_dis_mol unit is mol/m^3 = 1/m^3 / 1/mol
            CT_dis = alpha_dis * thetaT_dis * NT_dis ! CT_dis unit is 1/m^3 = dimless * dimless * 1/m^3
            CT_dis_mol = CT_dis / avogadro ! = (1/m^3) / (1/mol) = (mol/m^3)

            ! part_C_part_NT_dis = (K_dis * CL)/(K_dis * CL + beta * NL) ! dimless = dimless * 1/m^3 / (dimless * 1/m^3 + dimless * 1/m^3)
            part_C_mol_part_NT_dis_mol = (K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol) ! dimless = dimless * mol/m^3 / (dimless * mol/m^3 + dimless * mol/m^3)
            ! dNT_dis_deqplas = inverse_burgers_vector * gamma ! 1/m^3 = 1/m * 1/m^2
            dNT_dis_mol_deqplas = (inverse_burgers_vector * gamma) / avogadro ! mol/m^3 = (1/m * 1/m^2) / (1/mol)
            ! du2 in emilio is part_C_mol_part_NT_dis_mol * dNT_dis_mol_deqplas * deqplas     
        elseif (eqplas >= 0.5) then
            rho_d = 1.0d16 ! (1/m^2)
            NT_dis = inverse_burgers_vector * rho_d ! (1/m^3)
            NT_dis_mol = NT_dis / avogadro ! (mol/m^3)
            CT_dis = alpha_dis * thetaT_dis * NT_dis ! (1/m^3)
            CT_dis_mol = CT_dis / avogadro ! (mol/m^3)
            ! part_C_part_NT_dis = 0.d0
            part_C_mol_part_NT_dis_mol = (K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol) ! dimless = dimless * mol/m^3 / (dimless * mol/m^3 + dimless * mol/m^3)
            ! dNT_dis_deqplas = 0.d0
            dNT_dis_mol_deqplas = 0.d0
        endif
    end if
    
    ! part_CT_dis_part_CL = (NT_dis * K_dis * NL * beta)/((K_dis * CL + NL * beta)**2.d0) 
    ! ! (dimless) = (1/m^3 * dimless * 1/m^3 * dimless) / ((dimless * 1/m^3 + 1/m^3 * dimless)**2)
    ! part_CT_gb_part_CL = (NT_gb * K_gb * NL * beta)/((K_gb * CL + NL * beta)**2.d0)
    ! part_CT_carb_part_CL = (NT_carb * K_carb * NL * beta)/((K_carb * CL + NL * beta)**2.d0)

    NT_dis_mol = NT_dis / avogadro ! (mol/m^3)
    NT_gb_mol = NT_gb / avogadro ! (mol/m^3)
    NT_carb_mol = NT_carb / avogadro ! (mol/m^3)

    part_CT_dis_mol_part_CL_mol = (NT_dis_mol * K_dis * NL_mol * beta)/((K_dis * CL_mol + NL_mol * beta)**2.d0)
    part_CT_gb_mol_part_CL_mol = (NT_gb_mol * K_gb * NL_mol * beta)/((K_gb * CL_mol + NL_mol * beta)**2.d0)
    part_CT_carb_mol_part_CL_mol = (NT_carb_mol * K_carb * NL_mol * beta)/((K_carb * CL_mol + NL_mol * beta)**2.d0)
    ! (dimless) = (mol/m^3 * dimless * mol/m^3 * dimless) / ((dimless * mol/m^3 + mol/m^3 * dimless)**2)

    total_part_CT_mol_part_CL_mol = part_CT_dis_mol_part_CL_mol + &
                                  part_CT_gb_mol_part_CL_mol + &
                                  part_CT_carb_mol_part_CL_mol
    
    ! Finally, we update all the variables in UMATHT
    ! part_C_mol_part_CL_mol = part_CL_mol_part_CL_mol + part_CT_mol_part_CL_mol
    !                              = 1 + total_part_CT_mol_part_CL_mol

    part_C_mol_part_CL_mol = 1.d0 + total_part_CT_mol_part_CL_mol	
    dudt = part_C_mol_part_CL_mol
    
    deqplas = statev(2) 
 
    ! (mol/m^3) = (mol/m^3) + (dimless * mol/m^3) + (dimless * mol/m^3 * dimless)
    u = u + part_C_mol_part_CL_mol * dCL_mol &
          + part_C_mol_part_NT_dis_mol * dNT_dis_mol_deqplas * deqplas

    dfdg = 0.0

    do i = 1, ntgrd
        ! Update the flux
        grad_CL_i = dtemdx(i) ! = (mol/m^3) / m = (mol/m^4)
        flux(i) = - DL * grad_CL_i ! = (m^2/s) * (mol/m^4) = (mol/m^2)/s
        ! The flux gradient w.r.t Hydrogen is assumed to be 0
        dudg(i) = 0
        ! Update dfdt
        dfdt(i) = 0
        ! Update dudg
        dfdg(i,i) = -DL ! = - m^2/s
    end do

    if (logging == 1 .and. kinc == kinc_print .and. noel == noel_print) then
        print *, 'CL_mol: ', CL_mol
        print *, 'inverse_burgers_vector: ', inverse_burgers_vector
        print *, 'thetaL: ', thetaL
        print *, 'NT_dis: ', NT_dis
        print *, 'NT_dis_mol: ', NT_dis_mol
        print *, 'NT_gb: ', NT_gb
        print *, 'NT_gb_mol: ', NT_gb_mol
        print *, 'NT_carb: ', NT_carb
        print *, 'NT_carb_mol: ', NT_carb_mol
        print *, 'thetaT_dis: ', thetaT_dis
        print *, 'thetaT_gb: ', thetaT_gb
        print *, 'thetaT_carb: ', thetaT_carb
    end if

    ! store the concentration in each trap, in all traps and in traps and lattice
    
    CT_mol = 0.0d0
    
    ! CT_dis and CT_dis_mol is already calculated above
    ! CT_dis = alpha_dis * thetaT_dis * NT_dis ! (1/m^3)
    ! CT_dis_mol = CT_dis / avogadro ! (mol/m^3)
    ! CT_dis_mol = (NT_dis_mol * K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol)
    
    CT_gb = alpha_gb * thetaT_gb * NT_gb ! (1/m^3)
    CT_gb_mol = CT_gb / avogadro ! (mol/m^3)
    ! That is also equivalent to this (assuming alpha_gb = 1)
    ! CT_gb_mol = (NT_gb_mol * K_gb * CL_mol)/(K_gb * CL_mol + beta * NL_mol)
    
    CT_carb = alpha_carb * thetaT_carb * NT_carb ! (1/m^3)
    CT_carb_mol = CT_carb / avogadro ! (mol/m^3)
    ! That is also equivalent to this (assuming alpha_carb = 1)
    ! CT_carb_mol = (NT_carb_mol * K_carb * CL_mol)/(K_carb * CL_mol + beta * NL_mol)
    
    CT_mol = CT_dis_mol + CT_gb_mol + CT_carb_mol

    if (logging == 1 .and. kinc == kinc_print .and. noel == noel_print) then
        print *, 'CT_dis_mol: ', CT_dis_mol
        print *, 'CT_gb_mol: ', CT_gb_mol
        print *, 'CT_carb_mol: ', CT_carb_mol
        print *, 'CT_mol: ', CT_mol
    end if
    
    C_mol = CL_mol + CT_mol

    statev(3) = C_mol
    statev(4) = CL_mol
    statev(5) = CT_mol
    statev(6) = CT_dis_mol
    statev(7) = CT_gb_mol
    statev(8) = CT_carb_mol
    statev(9) = rho_d
    statev(10) = thetaL
    statev(11) = thetaT_dis
    statev(12) = thetaT_gb
    statev(13) = thetaT_carb

    return
    end