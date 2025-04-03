!***********************************************************************

	! State variables  
	! *Depvar       
	!   23,      
	! 1, AR1_eqplas, AR1_eqplas
	! 2, AR2_deqplas, AR2_deqplas
	! 3, AR3_sig_H, AR3_sig_H
	! 4, AR4_sig_H_grad_X, AR4_sig_H_grad_X
	! 5, AR5_sig_H_grad_Y, AR5_sig_H_grad_Y
	! 6, AR6_sig_H_grad_Z, AR6_sig_H_grad_Z
	! 7, AR7_sig_trial, AR7_sig_trial
	! 8, AR8_sig_Hill48, AR8_sig_Hill48
	! 9, AR9_sig_Tresca, AR9_sig_Tresca
	! 10, AR10_sig_P1, AR10_sig_P1
	! 11, AR11_triaxiality, AR11_triaxiality
	! 12, AR12_lode_norm, AR12_lode_norm
	! 13, AR13_C_mol, AR13_C_mol
	! 14, AR14_CL_mol, AR14_CL_mol
	! 15, AR15_CT_mol, AR15_CT_mol
	! 16, AR16_C_wtppm, AR16_C_wtppm
	! 17, AR17_CL_wtppm, AR17_CL_wtppm
	! 18, AR18_CT_wtppm, AR18_CT_wtppm
	! 19, AR19_thetaL, AR19_thetaL
	! 20, AR20_thetaT_dis, AR20_thetaT_dis
	! 21, AR21_mu, AR21_mu
	! 22, AR22_theta_coverage, AR22_theta_coverage
	! 23, AR23_k_HEHE, AR23_k_HEHE

module userinputs
	use precision
	implicit none
	! THESE TWO VALUES ARE HARD-CODED
	! YOU MUST CHANGE IT TO THE ACTUAL NUMBER OF ELEMENTS AND NODES IN .INP FILE
	! YOU CAN USE PYTHON SCRIPTING TO CHANGE VALUES AS WELL

	integer, parameter :: total_elems = 60550 ! Storing the actual number of elements
	integer, parameter :: total_nodes = 69029 ! Storing the actual number of nodes

	! Subset of SDVs indices that you want to output 
	integer, parameter :: uvar_indices(9) = (/1, 3, 8, 10, 11, 12, 13, 14, 15/)

	! Index of statev in UMAT and UMATHT
	integer, parameter :: eqplas_idx = 1 ! Index of the eqplas in statev
	integer, parameter :: deqplas_idx = 2 ! Index of the deqplas in statev
	integer, parameter :: sig_H_idx = 3 ! Index of the sig_H in statev
	integer, parameter :: sig_H_grad_X_idx = 4 ! Index of the sig_H_grad_X in statev
	integer, parameter :: sig_H_grad_Y_idx = 5 ! Index of the sig_H_grad_Y in statev
	integer, parameter :: sig_H_grad_Z_idx = 6 ! Index of the sig_H_grad_Z in statev
	integer, parameter :: sig_trial_idx = 7 ! Index of the sig_trial in statev
	integer, parameter :: sig_Hill48_idx = 8 ! Index of the sig_Hill48 in statev
	integer, parameter :: sig_Tresca_idx = 9 ! Index of the sig_Tresca in statev
	integer, parameter :: sig_P1_idx = 10 ! Index of the sig_P1 in statev
	integer, parameter :: triaxiality_idx = 11 ! Index of the triaxiality in statev
	integer, parameter :: lode_norm_idx = 12 ! Index of the lode_norm in statev
	integer, parameter :: C_mol_idx = 13 ! Index of the C_mol in statev
	integer, parameter :: CL_mol_idx = 14 ! Index of the CL_mol in statev
	integer, parameter :: CT_mol_idx = 15 ! Index of the CT_mol in statev
	integer, parameter :: C_wtppm_idx = 16 ! Index of the C_wtppm in statev
	integer, parameter :: CL_wtppm_idx = 17 ! Index of the CL_wtppm in statev
	integer, parameter :: CT_wtppm_idx = 18 ! Index of the CT_wtppm in statev
	integer, parameter :: thetaL_idx = 19 ! Index of the thetaL in statev
	integer, parameter :: thetaT_dis_idx = 20 ! Index of the thetaT_dis in statev
	integer, parameter :: mu_idx = 21 ! Index of the mu in statev
	integer, parameter :: theta_coverage_idx = 22 ! Index of the theta_coverage in statev
	integer, parameter :: k_HEHE_idx = 23 ! Index of the k_HEHE in statev

	! Path to the element file
	character(len=256), parameter :: element_file_path = "/processing_input_enHill48/elements.inc"

	integer, parameter :: before_flow_props_idx = 8 ! Index of the first flow curve data in props in UMAT

	! Element information
	character(len=256), parameter :: element_name = "C3D8" ! Element type
	integer, parameter :: ndim = 3 ! Number of spatial dimensions
	integer, parameter :: ninpt = 8 ! Number of integration points in the element
	integer, parameter :: nnode = 8 ! Number of nodes in the element
	integer, parameter :: ntensor = 6 ! Number of Voigt notation stress/strain components
	integer, parameter :: nmax_elems = 20 ! Maximum number of elements a node can belong to

end module
