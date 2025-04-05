subroutine UMATHT_hydro_Oriani(C_pred_mol, dC_mol_dCL_mol, dC_mol_dgrad_CL_mol, &
    flux_hydro, dflux_hydro_dCL_mol, dflux_hydro_dgrad_CL_mol, ddC_mol_dCL_mol, &
    statev, CL_mol_tm1, dCL_mol, CL_mol_grad, time, dtime, predef, dpred, &
    cmname, ntgrd, nstatv, props, nprops, coords, pnewdt, &
    noel, npt, layer, kspt, kstep, kinc)

    use precision
    use common_block
    inCLude 'aba_param.inc'

    character(len=80) :: cmname
    dimension dC_mol_dgrad_CL_mol(ntgrd),flux_hydro(ntgrd),dflux_hydro_dCL_mol(ntgrd), &
      dflux_hydro_dgrad_CL_mol(ntgrd,ntgrd),statev(nstatv),CL_mol_grad(ntgrd), &
      time(2),predef(1),dpred(1),props(nprops),coords(3)
    real(kind=dp), dimension(ndim) :: sig_H_grad
    
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
    real(kind=dp) :: R, temp, VH, DL, DL0, WB_L, sfd
    real(kind=dp) :: avogadro, NL, alpha_dis, alpha_gb, alpha_carb, NT_dis, NT_gb, NT_carb
    real(kind=dp) :: WB_dis, WB_gb, WB_carb, beta_BCC, beta_FCC, a_lattice_BCC, a_lattice_FCC
    real(kind=dp) :: gamma, rho_d0, theta_coverage, k_HEDE
    real(kind=dp) :: CL_mol_tm1, dCL_mol, CL_mol_t, CL, K_dis, K_gb, K_carb
    real(kind=dp) :: burgers_vector, inverse_burgers_vector, beta, NL_mol
    real(kind=dp) :: thetaL, temp_dis, thetaT_dis, temp_gb, thetaT_gb, temp_carb, thetaT_carb
    real(kind=dp) :: eqplas, rho_d, NT_dis_mol, CT_dis, CT_dis_mol, C0_mol, mu0, mu_stress, mu
    real(kind=dp) :: dC_mol_dNT_dis_mol, dNT_dis_deqplas, dCT_mol_deqplas
    real(kind=dp) :: dCT_dis_mol_dCL_mol, dCT_gb_mol_dCL_mol, dCT_carb_mol_dCL_mol
    real(kind=dp) :: dCT_mol_dCL_mol, dC_mol_dCL_mol, deqplas
    real(kind=dp) :: C_pred_mol, C_exact_mol, CT_mol, CT_gb, CT_gb_mol, CT_carb, CT_carb_mol
    integer :: UMATHT_hydro_model, crystal_structure, equilibrium_equation, temp_mode, DL_formula, dis_trap_mode
    integer :: dis_trap_active, gb_trap_active, carb_trap_active, void_trap_active
    
    UMATHT_hydro_model = props(1) ! (1 - Oriani's equation | 2 - McNabb-Foster’s equation)
    sfd = props(2) ! Scaling factor to prevent "zero heat flux" numerical issues. Default is 1.0d0
    crystal_structure = props(3)  ! (1 - BCC, 2 - FCC)
    a_lattice_BCC = props(4)  ! Lattice parameter for BCC (m)
    a_lattice_FCC = props(5)  ! Lattice parameter for FCC (m)
    beta_BCC = props(6)  ! Number of hydrogen atoms in each BCC lattice site (dimless)
    beta_FCC = props(7)  ! Number of hydrogen atoms in each FCC lattice site (dimless)
    R = props(8)  ! Universal gas constant (N*m)/(mol*K)
    temp_mode = props(9)  ! (1 - constant | 2 - predefined field | 3 - heat transfer)
    temp = props(10)  ! Constant temperature for mode 1 (K)
    VH = props(11)  ! Partial molar volume (m^3/mol)
    DL_formula = props(12)  ! (1 - using DL directly | 2 - using DL = DL0 * exp(-WB_L/RT))
    DL = props(13)  ! Diffusitivity coefficient (m^2/s)
    DL0 = props(14)  ! Pre-exponentiation factor for diffusion coefficient (m^2/s)
    WB_L = props(15)  ! Activation energy for jumping between lattice sites (N*m/mol)
    NL = props(16)  ! Number of solvent metal atoms per unit volume (1/m^3)
    avogadro = props(17)  ! Avogadro’s constant (1/mol)
    delta_g_b0 = props(18)  ! Gibbs free energy difference (N*m/mol)
    C0_mol = props(19)  ! Initial hydrogen concentration (mol/m^3)
    mu_potential_0 = props(20)  ! Initial chemical potential (N*m/mol)
    dis_trap_active = props(21)  ! (0 - inactive | 1 - active)
    gb_trap_active = props(22)  ! (0 - inactive | 1 - active)
    carb_trap_active = props(23)  ! (0 - inactive | 1 - active)
    void_trap_active = props(24)  ! (0 - inactive | 1 - active)
    dis_trap_mode = props(25)  ! (1 - Kumnick & Krom | 2 - Sofronis & Dadfarnia)
    gamma = props(26)  ! Fitting parameter in Dadfarnia et al. (1/m^2)
    rho_d0 = props(27)  ! Dislocation density for annealed material (1/m^2)
    alpha_dis = props(28)  ! Number of interstitial sites per trap site (dislocations)
    WB_dis = props(29)  ! Binding energy of hydrogen to dislocations (N*m/mol)
    alpha_gb = props(30)  ! Number of interstitial sites per trap site (grain boundaries)
    NT_gb = props(31)  ! Trap density for grain boundaries (1/m^3)
    WB_gb = props(32)  ! Binding energy of hydrogen to grain boundaries (N*m/mol)
    alpha_carb = props(33)  ! Number of interstitial sites per trap site (carbides)
    NT_carb = props(34)  ! Trap density for carbides (1/m^3)
    WB_carb = props(35)  ! Binding energy of hydrogen to carbides (N*m/mol)
    alpha_void = props(36)  ! Number of interstitial sites per trap site (voids)
    NT_void = props(37)  ! Trap density for voids (1/m^3)
    WB_void = props(38)  ! Binding energy of hydrogen to voids (N*m/mol)

    ! Casting all flags to integer
    crystal_structure = int(crystal_structure)
    temp_mode = int(temp_mode)
    DL_formula = int(DL_formula)
    equilibrium_equation = int(equilibrium_equation)
    dis_trap_mode = int(dis_trap_mode)

    dis_trap_active = int(dis_trap_active)
    gb_trap_active = int(gb_trap_active)
    carb_trap_active = int(carb_trap_active)
    void_trap_active = int(void_trap_active)

    ! THE UNIT FOR HYDROGEN CONCENTRATION is mol/m^3
    ! It is marked by the suffix _mol in the variable name
    ! We can convert it to 1/m^3 by multiplying with Avogadro's number, which does not have any suffix
    ! Example: CL_mol = CL / avogadro or CL (1/m^3) = CL_mol (mol/m^3) * avogadro (1/mol)

    CL_mol = CL_mol_tm1 + dCL_mol ! (mol/m^3) ! C_mol_t at the end of increment

    CL = CL_mol * avogadro ! (1/m^3)

    if (temp_mode == 2) then
        temp = predef(1) + dpred(1)	 ! using predefined field for temperature
    else if (temp_mode == 3) then
        temp = statev(temp_idx) ! using heat transfer for temperature
    end if

    ! Using the Arrhenius equation for the diffusion coefficient
    if (DL_formula == 2) then
        DL = DL0 * dexp(-WB_L / (R * temp))
    end if

    ! slip occurs along the plane of the shortest Burgers vector
    if (crystal_structure == 1) then ! BCC crystal structure
        beta = beta_BCC ! beta is taken to be 6 for BCC as indirect
                        ! evidence indicates tetrahedral site occupancy rather than 
                        ! octahedral site occupancy at room temperature in alpha-iron
        ! slip is assumed to occur along the {110} plane and ⟨111⟩ direction
        burgers_vector = (dsqrt(3.0d0)/2.0d0) * a_lattice_BCC ! (m) 
    elseif (crystal_structure == 2) then ! FCC crystal structure
        beta = beta_FCC ! beta is taken to be 1 for FCC, resulting from the more favourable 
                        ! octahedral site occupancy (beta = 2 for tetrahedral)
        ! slip occurs along the closed packed plane {111} and slip direction ⟨110⟩
        burgers_vector = (dsqrt(2.0d0)/2.0d0) * a_lattice_FCC ! (m)
    end if

    NL_mol = NL / avogadro ! (mol/m^3) = (1/m^3) / (1/mol)
    thetaL = CL / (beta * NL) ! dimless = (1/m^3) / (dimless * 1/m^3)

    ! ============================================!
    ! Calculate K and thetaT for all trap types   !
    ! ============================================!

    ! For each trap type, we extract alpha, NT, and WB. Then we calculate K and thetaT
    ! thetaT / (1 - thetaT) = K * thetaL / (1 - thetaL)
    ! However if thetaL << 1  then 
    ! thetaT / (1 - thetaT) = K * thetaL (assumed in this subroutine to simplify the equation)

    ! Arrhenius reaction rate constant for trap type
    K_dis =  dexp(-WB_dis / (R * temp))
    K_gb =  dexp(-WB_gb / (R * temp)) 
    K_carb =  dexp(-WB_carb / (R * temp)) 
    K_void =  dexp(-WB_void / (R * temp))  

    ! They are all in balance with lattice hydrogen according to Oriani's theory

    thetaT_dis = (K_dis * thetaL) / (1.0d0 + K_dis * thetaL) ! (dimless)
    thetaT_gb = (K_gb * thetaL) / (1.0d0 + K_gb * thetaL) ! (dimless)
    thetaT_carb = (K_carb * thetaL) / (1.0d0 + K_carb * thetaL) ! (dimless)
    thetaT_void = (K_void * thetaL) / (1.0d0 + K_void * thetaL) ! (dimless)

    eqplas = statev(eqplas_idx) ! (dimless) equivalent plastic strain
    deqplas = statev(deqplas_idx) ! (dimless) equivalent plastic strain increment

    ! ====================================================================================  !
    ! Calculate CT_i, CT_i_mol, dCT_i_mol_dNT_i_mol, dCT_i_mol_dCL_mol for all trap types   !
    ! ====================================================================================  !

    ! In principle, we are tring to compute dC_mol for integration
    ! C_pred_mol_t = C_pred_mol_tm1 + dC_mol, where dC_mol = dC_mol_dtime
    ! By some derivation, we arrive at:
    ! dC_mol_dtime = dCL_mol_dtime + dCT_mol_dtime
    ! Applying the chain rule for dCT_mol_dtime, we have:
    !    dC_mol_dtime =   dCL_mol_dtime + (dCT_mol_dCL_mol * dCL_mol_dtime + dCT_mol_dNT_mol * dNT_mol_dtime)
    ! => dC_mol_dtime =   dCL_mol_dtime + (sum_i { dCT_i_mol_dCL_mol } * dCL_mol_dtime   + sum_i { dCT_i_mol_dNT_i_mol } * dNT_i_mol_dtime)
    ! => dC_mol_dtime = [ dCL_mol_dtime +  sum_i { dCT_i_mol_dCL_mol } * dCL_mol_dtime ] + sum_i { dCT_i_mol_dNT_i_mol } * dNT_i_mol_dtime
    ! => dC_mol_dtime = [ ( 1.0d0 ) +  sum_i { dCT_i_mol_dCL_mol }) * dCL_mol_dtime ] + sum_i { dCT_i_mol_dNT_i_mol } * dNT_i_mol_dtime
    ! Using notations in this subroutine, we have:
    ! => dC_mol       = ( 1.0d0 + sum_i { dCT_i_mol_dCL_mol }) * dCL_mol_dtime + sum_i { dCT_i_mol_dNT_i_mol } * dNT_i_mol_dtime
    ! => dC_mol       =     ( dC_mol_dCL_mol)                  * dCL_mol_dtime + sum_i { dCT_i_mol_dNT_i_mol } * dNT_i_mol_deqplas * deqplas ! Chain rule
    
    if (dis_trap_active == 1) then
        if (dis_trap_mode == 1) then ! Krom et al. (in sites/m^3), developed from Kumnick & Johnson 
            NT_dis = 10.0d0 ** (23.26d0 - 2.33d0 * dexp(-5.5d0 * eqplas))
            NT_dis_mol = NT_dis / avogadro ! (mol/m^3) = (1/m^3) / (1/mol)
            dNT_dis_mol_deqplas = (29.5d0 * dexp(-5.5d0 * eqplas) * NT_dis_mol ) 
            dNT_dis_mol_dtime = dNT_dis_mol_deqplas * deqplas
            
        else if (dis_trap_mode == 2) then ! Dadfarnia et al.
            
            if (eqplas < 0.5d0) then
                rho_d = rho_d0 + eqplas * gamma ! rho_d unit is 1/m^2 = 1/m^2 + dimless * 1/m^2
                NT_dis = 1.0d0/burgers_vector * rho_d ! (1/m^3)
                NT_dis_mol = NT_dis / avogadro ! (mol/m^3) = (1/m^3) / (1/mol)
                dNT_dis_mol_deqplas = (1.0d0/burgers_vector * gamma) / avogadro ! mol/m^3 = (1/m * 1/m^2) / (1/mol)
                dNT_dis_mol_dtime = dNT_dis_mol_deqplas * deqplas 

            else if (eqplas >= 0.5) then
                rho_d = 1.0d16 ! (1/m^2)
                NT_dis = 1.0d0/burgers_vector * rho_d ! (1/m^3)
                dNT_dis_mol_deqplas = 0.0d0
                dNT_dis_mol_dtime = 0.0d0 
            end if
        end if

        dCT_dis_mol_dNT_dis_mol = (alpha_dis * K_dis * CL_mol)/(K_dis * CL_mol + beta * NL_mol) 
        dCT_dis_mol_dtime_via_NT_dis_mol = dCT_dis_mol_dNT_dis_mol * dNT_dis_mol_dtime 
        
        CT_dis = alpha_dis * thetaT_dis * NT_dis ! (1/m^3)
        CT_dis_mol = CT_dis / avogadro ! (mol/m^3)
        ! dimless = dimless * mol/m^3 / (dimless * mol/m^3 + dimless * mol/m^3)
        dCT_dis_mol_dCL_mol = (alpha_dis * NT_dis_mol * K_dis * NL_mol * beta)/ &
                                    ((K_dis * CL_mol + NL_mol * beta)**2.0d0)

    end if

    if (gb_trap_active == 1) then
        dCT_gb_mol_dtime_via_NT_gb_mol = 0.0d0 
        CT_gb = alpha_gb * thetaT_gb * NT_gb ! (1/m^3)
        CT_gb_mol = CT_gb / avogadro ! (mol/m^3)
        dCT_gb_mol_dCL_mol =  (alpha_gb * NT_gb_mol * K_gb * NL_mol * beta)/ &
                                    ((K_gb * CL_mol + NL_mol * beta)**2.0d0)
    end if

    if (carb_trap_active == 1) then

        dNT_carb_mol_dtime_via_NT_carb_mol = 0.0d0
        CT_carb = alpha_carb * thetaT_carb * NT_carb ! (1/m^3)
        CT_carb_mol = CT_carb / avogadro ! (mol/m^3)
        dCT_carb_mol_dCL_mol = (alpha_carb * NT_carb_mol * K_carb * NL_mol * beta)/ &
                                    ((K_carb * CL_mol + NL_mol * beta)**2.0d0)
    end if

    if (void_trap_active == 1) then
        dNT_void_mol_dtime_via_NT_void_mol = 0.0d0
        CT_void = alpha_void * thetaT_void * NT_void ! (1/m^3)
        CT_void_mol = CT_void / avogadro ! (mol/m^3)
        dCT_void_mol_dCL_mol = (alpha_void * NT_void_mol * K_void * NL_mol * beta)/ &
                                    ((K_void * CL_mol + NL_mol * beta)**2.0d0)  
    end if

    ! Summing up CT_mol and dCT_mol_dCL_mol for all trap types

    CT_mol = 0.0d0
    
    if (dis_trap_active == 1) then
        CT_mol = CT_mol + CT_dis_mol
    end if

    if (gb_trap_active == 1) then
        CT_mol = CT_mol + CT_gb_mol
    end if

    if (carb_trap_active == 1) then
        CT_mol = CT_mol + CT_carb_mol
    end if

    if (void_trap_active == 1) then
        CT_mol = CT_mol + CT_void_mol
    end if

    dCT_mol_dCL_mol = 0.0d0
    
    if (dis_trap_mode == 1) then
        dCT_mol_dCL_mol = dCT_mol_dCL_mol + dCT_dis_mol_dCL_mol
    end if
    
    if (gb_trap_active == 1) then
        dCT_mol_dCL_mol = dCT_mol_dCL_mol + dCT_gb_mol_dCL_mol
    end if
    
    if (carb_trap_active == 1) then
        dCT_mol_dCL_mol = dCT_mol_dCL_mol + dCT_carb_mol_dCL_mol
    end if
    
    if (void_trap_active == 1) then
        dCT_mol_dCL_mol = dCT_mol_dCL_mol + dCT_void_mol_dCL_mol
    end if

    ! dC_mol_dCL_mol = dCL_mol_dCL_mol + dCT_mol_dCL_mol
    !                              = 1 + dCT_mol_dCL_mol

    dC_mol_dCL_mol = 1.0d0 + dCT_mol_dCL_mol	
    
    ! ===================   !
    ! Updating C_pred_mol   !
    ! ====================  !

    ! (mol/m^3) = (mol/m^3) + (dimless * mol/m^3) + (dimless * mol/m^3 * dimless)

    dC_mol = dC_mol_dCL_mol * dCL_mol

    if (dis_trap_active == 1) then
        dC_mol = dC_mol + dCT_dis_mol_dtime_via_NT_dis_mol
    end if

    if (gb_trap_active == 1) then
        dC_mol = dC_mol + dCT_gb_mol_dtime_via_NT_gb_mol
    end if

    if (carb_trap_active == 1) then
        dC_mol = dC_mol + dCT_carb_mol_dtime_via_NT_carb_mol
    end if

    if (void_trap_active == 1) then
        dC_mol = dC_mol + dCT_void_mol_dtime_via_NT_void_mol
    end if

    C_pred_mol = C_pred_mol + dC_mol
    C_exact_mol = CL_mol + CT_mol

    ! =======================================================================  !
    ! Computing ddC_mol_dCL_mol: partial derivative of dC_mol w.r.t to CL_mol  !
    ! =======================================================================  !

    dC_mol_dCL_mol_dCL_mol = 0.0d0

    if (dis_trap_active == 1) then
        dC_mol_dCL_mol_dCL_mol = dC_mol_dCL_mol_dCL_mol + -2.0d0 * (alpha_dis * NT_dis * beta * K_dis ** 2.0d0 * NL_mol) / &
                                                          ((K_dis * CL_mol + NL_mol * beta)**3.0d0) 
    end if

    if (gb_trap_active == 1) then
        dC_mol_dCL_mol_dCL_mol = dC_mol_dCL_mol_dCL_mol + -2.0d0 * (alpha_gb * NT_gb * beta * K_gb ** 2.0d0 * NL_mol) / &
                                                          ((K_gb * CL_mol + NL_mol * beta)**3.0d0) 
    end if

    if (carb_trap_active == 1) then
        dC_mol_dCL_mol_dCL_mol = dC_mol_dCL_mol_dCL_mol + -2.0d0 * (alpha_carb * NT_carb * beta * K_carb ** 2.0d0 * NL_mol) / &
                                                          ((K_carb * CL_mol + NL_mol * beta)**3.0d0) 
    end if

    if (void_trap_active == 1) then
        dC_mol_dCL_mol_dCL_mol = dC_mol_dCL_mol_dCL_mol + -2.0d0 * (alpha_void * NT_void * beta * K_void ** 2.0d0 * NL_mol) / &
                                                          ((K_void * CL_mol + NL_mol * beta)**3.0d0) 
    end if

    dC_mol_dCL_mol_dCL_mol = dC_mol_dCL_mol_dCL_mol * dCL_mol


    dCT_mol_dNT_mol_dCL_mol = 0.0d0

    if (dis_trap_active == 1) then
        dCT_mol_dNT_mol_dCL_mol = dCT_mol_dNT_mol_dCL_mol + (alpha_dis * beta * NL_mol * K_dis)/ &
                                                            (K_dis * CL_mol + beta * NL_mol)**2.0d0 &
                                                            * dNT_dis_mol_deqplas * deqplas
    end if

    if (gb_trap_active == 1) then
        dCT_mol_dNT_mol_dCL_mol = dCT_mol_dNT_mol_dCL_mol + 0.0d0 ! Because dCT_gb_mol_dtime_via_NT_gb_mol = 0.0d0
    end if

    if (carb_trap_active == 1) then
        dCT_mol_dNT_mol_dCL_mol = dCT_mol_dNT_mol_dCL_mol + 0.0d0 ! Because dCT_carb_mol_dtime_via_NT_carb_mol = 0.0d0
    end if

    if (void_trap_active == 1) then
        dCT_mol_dNT_mol_dCL_mol = dCT_mol_dNT_mol_dCL_mol + 0.0d0 ! Because dCT_void_mol_dtime_via_NT_void_mol = 0.0d0
    end if

    ddC_mol_dCL_mol = dC_mol_dCL_mol_dCL_mol + dCT_mol_dNT_mol_dCL_mol

    ! ======================  !
    ! Updating the rest terms !
    ! ======================  !

    dC_mol_dgrad_CL_mol = 0.0d0
    dflux_hydro_dgrad_CL_mol = 0.0d0 

    sig_H_grad = statev_grad_all_elems_at_IPs(sig_H_idx, noel, npt, 1:ndim)

    do kdim = 1, ntgrd

        flux_hydro(kdim) = CL_mol * DL * (VH/(R*temp)) * sig_H_grad(kdim) - DL * CL_mol_grad(kdim)

        dflux_hydro_dCL_mol(kdim) = DL * (VH/(R*temp)) * sig_H_grad(kdim)

        dflux_hydro_dgrad_CL_mol(kdim,kdim) = - DL 

    end do

    ! Some unit conversion
    C_molfrac = C_exact_mol * conversion_mol_to_molfrac

    C_pred_wtppm = C_pred_mol * conversion_mol_to_wtppm ! (wtppm)
    C_exact_wtppm = C_exact_mol * conversion_mol_to_wtppm ! (wtppm)
    CL_wtppm = CL_mol * conversion_mol_to_wtppm ! (wtppm)
    CT_wtppm = CT_mol * conversion_mol_to_wtppm ! (wtppm)
    CT_dis_wtppm = CT_dis_mol * conversion_mol_to_wtppm ! (wtppm)
    CT_gb_wtppm = CT_gb_mol * conversion_mol_to_wtppm ! (wtppm)
    CT_carb_wtppm = CT_carb_mol * conversion_mol_to_wtppm ! (wtppm)
    CT_void_wtppm = CT_void_mol * conversion_mol_to_wtppm ! (wtppm)

    ! Hydrogen coverage factor (dimless - used in CZM model)
    theta_coverage = C_molfrac / (C_molfrac + exp(-delta_g_b0 /(R * temp))) 

    ! Factor decreasing cohesive strength, based on HEDE mechanism (dimless - used in CZM model)
    k_HEDE = 1.0d0 - 1.0467d0 * theta_coverage + 0.1687d0 * theta_coverage ** 2.0d0

    ! Calculate chemical potential mu
    sig_H = statev(sig_H_idx) ! (Pa)
    mu_potential_stress = - sig_H * VH ! (J/mol)
    mu_potential = mu_potential_0 + R * temp * dlog(C_exact_mol / C0_mol) + mu_potential_stress ! (J/mol)
    
    statev(C_pred_mol_idx) = C_pred_mol
    statev(C_exact_mol_idx) = C_exact_mol
    statev(CL_mol_idx) = CL_mol
    statev(CT_mol_idx) = CT_mol
    statev(thetaL_idx) = thetaL

    statev(C_pred_wtppm_idx) = C_pred_wtppm
    statev(C_exact_wtppm_idx) = C_exact_wtppm
    statev(CL_wtppm_idx) = CL_wtppm
    statev(CT_wtppm_idx) = CT_wtppm

    if (dis_trap_active == 1) then
        statev(NT_dis_mol_idx) = NT_dis_mol
        statev(CT_dis_mol_idx) = CT_dis_mol
        statev(CT_dis_wtppm_idx) = CT_dis_wtppm
        statev(thetaT_dis_idx) = thetaT_dis

    end if

    if (gb_trap_active == 1) then
        statev(CT_gb_mol_idx) = CT_gb_mol
        statev(CT_gb_wtppm_idx) = CT_gb_wtppm
        statev(thetaT_gb_idx) = thetaT_gb
    end if

    if (carb_trap_active == 1) then
        statev(CT_carb_mol_idx) = CT_carb_mol
        statev(CT_carb_wtppm_idx) = CT_carb_wtppm
        statev(thetaT_carb_idx) = thetaT_carb
    end if

    if (void_trap_active == 1) then
        statev(CT_void_mol_idx) = CT_void_mol
        statev(CT_void_wtppm_idx) = CT_void_wtppm
        statev(thetaT_void_idx) = thetaT_void
    end if

    statev(theta_coverage_idx) = theta_coverage
    statev(k_HEHE_idx) = k_HEDE
    statev(mu_potential_idx) = mu_potential

return
end