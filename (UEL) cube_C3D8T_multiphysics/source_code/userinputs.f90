
!***********************************************************************

module userinputs
	use precision
	implicit none

	! TOTAL ELEMENTS AND NODES ARE HARD-CODED
	! YOU MUST CHANGE IT TO THE ACTUAL NUMBER OF ELEMENTS AND NODES IN .INP FILE
	! YOU CAN USE PYTHON SCRIPTING TO CHANGE VALUES AS WELL

	integer, parameter :: total_elems = 5086 ! Storing the actual number of elements
	integer, parameter :: max_elem_idx = 10172 ! Maximum element index for UEL and VISUAL elements
	integer, parameter :: total_nodes = 10354 ! Storing the actual number of nodes
	integer, parameter :: nstatev = 80 ! Number of state variables at integration points

	! Element information
	character(len=256), parameter :: element_file_path = "/processing_input_notched_plate/elements_UEL.inc" ! Path to the element file
	character(len=256), parameter :: element_name = 'C3D8' ! Element type
	integer, parameter :: nmax_elems = 20 ! Maximum number of elements a node can belong to
	integer, parameter :: ndim = 3 ! Number of spatial dimensions
	integer, parameter :: ninpt = 8 ! Number of integration points in the element
	integer, parameter :: nnode = 8 ! Number of nodes in the element
	integer, parameter :: ntensor = 6 ! Number of Voigt notation stress/strain components
	integer, parameter :: ndirect = 3 ! Number of direct stress/strain components
	integer, parameter :: nshear = 3 ! Number of shear stress/strain components

	! ========================================= 
	! Start and end indices of each field props 
	! ========================================= 

	integer, parameter :: start_field_flag_idx = 1     ! Index of the first field flag in UEL props
	integer, parameter :: end_field_flag_idx = 4       ! Index of the last field flag in UEL props
	integer, parameter :: start_mech_props_idx = 9     ! Index of the first mechanical property in UEL props
	integer, parameter :: end_mech_props_idx = 11      ! Index of the last mechanical property in UEL props
	integer, parameter :: start_flow_props_idx = 17    ! Index of the first flow curve data in UEL props
	integer, parameter :: end_flow_props_idx = 216     ! Index of the last flow curve data in UEL props
	integer, parameter :: start_CL_mol_props_idx = 217   ! Index of the first hydrogen diffusion in UEL props
	integer, parameter :: end_CL_mol_props_idx = 254     ! Index of the last hydrogen diffusion in UEL props
	integer, parameter :: start_temp_props_idx = 257   ! Index of the first temperature data in UEL props
	integer, parameter :: end_temp_props_idx = 259     ! Index of the last temperature data in UEL props
	integer, parameter :: start_damage_props_idx = 265 ! Index of the first damage property in UEL props
	integer, parameter :: end_damage_props_idx = 269   ! Index of the last damage property in UEL props

	! Output SDVs indices
	integer, parameter :: nuvarm = 48 ! Number of chosen SDVs for output
	integer, parameter :: uvarm_indices(48) = [25, 26, 27, 28, 29, 30, 31, 32, 33, 34, &
											   35, 36, 37, 38, 39, 40, 41, 42, 43, 44, &
											   45, 46, 47, 48, 49, 50, 59, 60, 61, 62, &
											   63, 64, 65, 66, 67, 68, 69, 70, 71, 72, &
											   73, 74, 75, 76, 77, 78, 79, 80]

	! SDV required for gradient calculation
	integer, parameter :: num_grad_SDVs = 3 ! Number of SDVs required for gradient calculation
	integer, parameter :: grad_SDV_indices(3) = [25, 31, 71]

	! ===============================
	! SDV indices of mechanical field
	! ===============================

	integer, parameter :: sig_start_idx = 1 ! Starting index of the stress component
	integer, parameter :: sig_end_idx = 6 ! Ending index of the stress component
	integer, parameter :: stran_start_idx = 7 ! Starting index of the total strain component
	integer, parameter :: stran_end_idx = 12 ! Ending index of the total strain component
	integer, parameter :: eelas_start_idx = 13 ! Starting index of the elastic strain component
	integer, parameter :: eelas_end_idx = 18 ! Ending index of the elastic strain component
	integer, parameter :: eplas_start_idx = 19 ! Starting index of the plastic strain component
	integer, parameter :: eplas_end_idx = 24 ! Ending index of the plastic strain component
	integer, parameter :: eqplas_idx = 25 ! SDV index of equivalent plastic strain (-)
	integer, parameter :: eqplas_grad_X_idx = 26 ! SDV index of equivalent plastic strain gradient in X direction (1/m)
	integer, parameter :: eqplas_grad_Y_idx = 27 ! SDV index of equivalent plastic strain gradient in Y direction (1/m)
	integer, parameter :: eqplas_grad_Z_idx = 28 ! SDV index of equivalent plastic strain gradient in Z direction (1/m)
	integer, parameter :: eqplas_rate_idx = 29 ! SDV index of equivalent plastic strain rate (1/s)
	integer, parameter :: deqplas_idx = 30 ! SDV index of equivalent plastic strain increment (1/s)
	integer, parameter :: sig_H_idx = 31 ! SDV index of hydrostatic stress (Pa)
	integer, parameter :: sig_H_grad_X_idx = 32 ! SDV index of hydrostatic stress gradient in X direction (Pa/m)
	integer, parameter :: sig_H_grad_Y_idx = 33 ! SDV index of hydrostatic stress gradient in Y direction (Pa/m)
	integer, parameter :: sig_H_grad_Z_idx = 34 ! SDV index of hydrostatic stress gradient in Z direction (Pa/m)
	integer, parameter :: sig_vonMises_idx = 35 ! SDV index of equivalent von Mises stress (Pa)
	integer, parameter :: sig_Tresca_idx = 36 ! SDV index of Tresca stress (Pa)
	integer, parameter :: sig_P1_idx = 37 ! SDV index of maximum principal stress (Pa)
	integer, parameter :: sig_P2_idx = 38 ! SDV index of middle principal stress (Pa)
	integer, parameter :: sig_P3_idx = 39 ! SDV index of minimum principal stress (Pa)
	integer, parameter :: triax_idx = 40 ! SDV index of stress triaxiality (-)
	integer, parameter :: lode_idx = 41 ! SDV index of normalized Lode angle (-)

	! =======================================
	! SDV indices of hydrogen diffusion field
	! =======================================

	integer, parameter :: C_pred_mol_idx = 42 ! SDV index of total hydrogen concentration in Taylor expansion prediction (mol/m^3)
	integer, parameter :: C_exact_mol_idx = 43 ! SDV index of total hydrogen concentration as exact sum of CL and CT (mol/m^3)
	integer, parameter :: CL_mol_idx = 44 ! SDV index of lattice hydrogen concentration (mol/m^3)
	integer, parameter :: CT_mol_idx = 45 ! SDV index of total trap hydrogen concentration (mol/m^3)
	integer, parameter :: NT_dis_mol_idx = 46 ! SDV index of dislocation trap density (mol/m^3)
	integer, parameter :: CT_dis_mol_idx = 47 ! SDV index of dislocation trap hydrogen concentration (mol/m^3)
	integer, parameter :: CT_gb_mol_idx = 48 ! SDV index of grain boundary trap hydrogen concentration (mol/m^3)
	integer, parameter :: CT_carb_mol_idx = 49 ! SDV index of carbide trap hydrogen concentration (mol/m^3)
	integer, parameter :: CT_void_mol_idx = 50 ! SDV index of vacancy/microvoid trap hydrogen concentration  (mol/m^3)
	integer, parameter :: C_pred_wtppm_idx = 51 ! SDV index of total hydrogen concentration in Taylor expansion prediction (wt.ppm)
	integer, parameter :: C_exact_wtppm_idx = 52 ! SDV index of total hydrogen concentration as exact sum of CL and CT (wt.ppm)
	integer, parameter :: CL_wtppm_idx = 53 ! SDV index of lattice hydrogen concentration (wt.ppm)
	integer, parameter :: CT_wtppm_idx = 54 ! SDV index of total trap hydrogen concentration (wt.ppm)
	integer, parameter :: CT_dis_wtppm_idx = 55 ! SDV index of dislocation trap hydrogen concentration (wt.ppm)
	integer, parameter :: CT_gb_wtppm_idx = 56 ! SDV index of grain boundary trap hydrogen concentration (wt.ppm)
	integer, parameter :: CT_carb_wtppm_idx = 57 ! SDV index of carbide trap hydrogen concentration (wt.ppm)
	integer, parameter :: CT_void_wtppm_idx = 58 ! SDV index of vacancy/microvoid trap hydrogen concentration  (wt.ppm)
	integer, parameter :: thetaL_idx = 59 ! SDV index of lattice site occupancy (-)
	integer, parameter :: thetaT_dis_idx = 60 ! SDV index of dislocation trap site occupancy (-)
	integer, parameter :: thetaT_gb_idx = 61 ! SDV index of grain boundaryn trap site occupancy (-)
	integer, parameter :: thetaT_carb_idx = 62 ! SDV index of carbide trap site occupancy (-)
	integer, parameter :: thetaT_void_idx = 63 ! SDV index of vacancy/microvoid trap site occupancy (-)
	integer, parameter :: theta_coverage_idx = 64 ! SDV index of hydrogen surface coverage (Langmuir-type adsorption) (-)
	integer, parameter :: k_HEDE_idx = 65 ! SDV index of factor decreasing cohesive strength (-)
	integer, parameter :: flux_hydro_X_idx = 66 ! SDV index of hydrogen flux in X direction (mol/(s*m^2))
	integer, parameter :: flux_hydro_Y_idx = 67 ! SDV index of hydrogen flux in Y direction (mol/(s*m^2))
	integer, parameter :: flux_hydro_Z_idx = 68 ! SDV index of hydrogen flux in Z direction (mol/(s*m^2))
	integer, parameter :: mu_potential_idx = 69 ! SDV index of hydrogen chemical potential (J/mol)

	! ==================================
	! SDV indices of heat transfer field
	! ==================================

	integer, parameter :: u_heat_idx = 70 ! SDV index of internal energy per unit mass (J/kg)
	integer, parameter :: temp_idx = 71 ! SDV index of temperature (K)
	integer, parameter :: temp_grad_X_idx = 72 ! SDV index of temperature gradient in X direction (K/m)
	integer, parameter :: temp_grad_Y_idx = 73 ! SDV index of temperature gradient in Y direction (K/m)
	integer, parameter :: temp_grad_Z_idx = 74 ! SDV index of temperature gradient in Z direction (K/m)
	integer, parameter :: flux_heat_X_idx = 75 ! SDV index of internal heat flux in X direction (J/(s*m^2))
	integer, parameter :: flux_heat_Y_idx = 76 ! SDV index of internal heat flux in Y direction (J/(s*m^2))
	integer, parameter :: flux_heat_Z_idx = 77 ! SDV index of internal heat flux in Z direction (J/(s*m^2))

	! =================================
	! SDV indices of phase field damage
	! =================================

	integer, parameter :: phi_idx = 78 ! SDV index of phase field damage variable (-)
	integer, parameter :: history_idx = 79 ! SDV index of history variable (-)
	integer, parameter :: Gc_idx = 80 ! SDV index of critical energy release rate (J/m^2)

	save
end module
