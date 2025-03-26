module userinputs
    use precision
    implicit none
    ! THESE TWO VALUES ARE HARD-CODED
    ! YOU MUST CHANGE IT TO THE ACTUAL NUMBER OF ELEMENTS IN .INP FILE

    integer, parameter :: total_elems = 1 ! Storing the actual number of elements
    integer, parameter :: total_nodes = 8 ! Storing the actual number of nodes
    integer, parameter :: nsvint = 50 ! Number of state variables at integration points
    
    ! =========================================
    ! Start and end indices of each field props 
    ! =========================================

    integer, parameter :: start_field_flag_idx = 1     ! Index of the first field flag in UEL props
    integer, parameter :: end_field_flag_idx = 4       ! Index of the last field flag in UEL props
    integer, parameter :: start_mech_props_idx = 9     ! Index of the first mechanical property in UEL props
    integer, parameter :: end_mech_props_idx = 11      ! Index of the last mechanical property in UEL props
    integer, parameter :: start_flow_props_idx = 17    ! Index of the first flow curve data in UEL props
    integer, parameter :: end_flow_props_idx = 216     ! Index of the last flow curve data in UEL props
    integer, parameter :: start_temp_props_idx = 217   ! Index of the first temperature data in UEL props
    integer, parameter :: end_temp_props_idx = 219     ! Index of the last temperature data in UEL props
    integer, parameter :: start_conc_props_idx = 225   ! Index of the first mass diffusion in UEL props
    integer, parameter :: end_conc_props_idx = 265     ! Index of the last mass diffusion in UEL props
    integer, parameter :: start_damage_props_idx = 273 ! Index of the first damage property in UEL props
    integer, parameter :: end_damage_props_idx = 277   ! Index of the last damage property in UEL props

    ! ================================
    ! SDV indices of deformation field 
    ! ================================

    integer, parameter :: sig_start_idx = 1 ! Starting index of the stress component in statev
    integer, parameter :: sig_end_idx = 6 ! Ending index of the strain component in statev
    integer, parameter :: stran_start_idx = 7 ! Starting index of the total strain component in statev
    integer, parameter :: stran_end_idx = 12 ! Ending index of the total strain component in statev
    integer, parameter :: eelas_start_idx = 13 ! Starting index of the elastic strain component in statev
    integer, parameter :: eelas_end_idx = 18 ! Ending index of the elastic strain component in statev
    integer, parameter :: eplas_start_idx = 19 ! Starting index of the plastic strain component in statev
    integer, parameter :: eplas_end_idx = 24 ! Ending index of the plastic strain component in statev

    integer, parameter :: eqplas_idx = 25 ! Index of the equivalent plastic strain in state
    integer, parameter :: eqplas_grad_X_idx = 26 ! Index of the equivalent plastic strain gradient in X direction in statev
    integer, parameter :: eqplas_grad_Y_idx = 27 ! Index of the equivalent plastic strain gradient in Y direction in statev
    integer, parameter :: eqplas_grad_Z_idx = 28 ! Index of the equivalent plastic strain gradient in Z direction in statev
    integer, parameter :: deqplas_idx = 29 ! Index of the increment of the equivalent plastic strain in statev
    integer, parameter :: sig_H_idx = 30 ! Index of the hydrostatic stress in statev
    integer, parameter :: sig_H_grad_X_idx = 31 ! Index of the hydrostatic stress gradient in X direction in statev
    integer, parameter :: sig_H_grad_Y_idx = 32 ! Index of the hydrostatic stress gradient in Y direction in statev
    integer, parameter :: sig_H_grad_Z_idx = 33 ! Index of the hydrostatic stress gradient in Z direction in statev
    integer, parameter :: sig_vonMises_idx = 34 ! Index of the von Mises stress in statev
    integer, parameter :: triax_idx = 35 ! Index of the triaxiality in statev
    integer, parameter :: lode_idx = 36 ! Index of the Lode parameter in statev

    ! ==================================
    ! SDV indices of heat transfer field 
    ! ==================================
    
    integer, parameter :: u_heat_idx = 37 ! Index of the Internal thermal energy per unit mass in statev
    integer, parameter :: temp_idx = 38 ! Index of the temperature in statev
    integer, parameter :: flux_heat_X_idx = 39 ! Index of the temperature gradient in X direction in statev
    integer, parameter :: flux_heat_Y_idx = 40 ! Index of the temperature gradient in Y direction in statev
    integer, parameter :: flux_heat_Z_idx = 41 ! Index of the temperature gradient in Z direction in statev

    ! ===================================
    ! SDV indices of mass diffusion field 
    ! ===================================

    integer, parameter :: CL_mol_idx = 42 ! Index of the concentration of lattice hydrogen in statev
    integer, parameter :: CT_mol_idx = 43 ! Index of the concentration of trapped hydrogen in statev
    integer, parameter :: C_mol_idx = 44 ! Index of the concentration of total hydrogen in statev
    integer, parameter :: theta_L = 45 ! Index of the occupancy fraction of lattice hydrogen in statev
    integer, parameter :: theta_T_dis = 46 ! Index of the occupancy fraction of trapped hydrogen in statev
    integer, parameter :: theta_coverage = 47 ! Index of the hydrogen surface coverage in statev

    ! =================================
    ! SDV indices of phase field damage 
    ! =================================

    integer, parameter :: phi_damage_idx = 48 ! Index of the phase field damage in statev
    integer, parameter :: history_idx = 49 ! Index of the history variable in statev
    integer, parameter :: Gc_idx = 50 ! Index of the critical release energy rate in statev

    save

end module