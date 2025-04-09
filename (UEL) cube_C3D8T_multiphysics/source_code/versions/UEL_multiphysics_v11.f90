!===========================================================================
!   UEL-Multiphysics: A user element for generalized coupled field problems
!
!   Author:        Nguyen Xuan Binh
!   Affiliation:   Aalto University
!   Contact:       binh.nguyen@aalto.fi
!   Date:          July 2024
!
!   Description:
!   This program simulates advanced multiphysics problems involving:
!
!   ▸ Mechanical field:
!       - Hookean elasticity
!       - Isotropic von Mises plasticity
!
!   ▸ Thermal field:
!       - Transient Fourier's law heat conduction
!       - Steady-state Fourier's law heat conduction
!
!   ▸ Mass diffusion field (hydrogen):
!       - Transient Fick's second law hydrogen diffusion with Oriani's equilibrium theory
!       - Its steady state version (usually of no major interest to research)
!
!   ▸ Damage field:
!       - Phase-field damage model based on Griffith's thermodynamics (attributed to Emilio's code)
!
!   Structure:
!       Each field is implemented independently but solved in a monolithic
!       framework for weak coupling multiphysics interaction.
!
!   Inspiration: Emilio Martinez and Abaqus's documentations
!
!===========================================================================


module precision
    use iso_fortran_env
    integer, parameter :: dp = real64
end module precision

include 'userinputs.f90'
include 'utilities.f90'
include 'common_block.f90'
include 'C3D8_element.f90'
include 'mesh_connectivity.f90'
include 'scalar_gradient.f90'

!***********************************************************************

subroutine UEXTERNALDB(lop,lrestart,time,dtime,kstep,kinc)
    use precision
    use common_block
    use iso_module

    include 'aba_param.inc' 

    dimension time(2)
    
    integer :: iostat, element_id, node_id, current_element_idx
    integer, dimension(9) :: values

    character(len=256) :: line, outdir, aelread, aelwrite, andread, andwrite, anelwrite
    
    real(kind=dp), dimension(ninpt) :: N_shape_IP_extra_to_kNP_extra
    real(kind=dp), dimension(nnode) :: N_shape_NP_inter_to_kIP_inter
    real(kind=dp), dimension(ninpt) :: N_shape_IP_extra_to_kIP_inter
    real(kind=dp), dimension(nnode) :: N_shape_NP_inter_to_kIP_extra ! Only for capacitance matrix in heat transfer
    real(kind=dp), dimension(nnode, ndim) :: N_grad_NP_inter_to_kIP_inter_local
    real(kind=dp), dimension(nnode, ndim) :: N_grad_NP_inter_to_kNP_inter_local
    real(kind=dp), dimension(nnode, ndim) :: N_grad_NP_inter_to_kIP_extra_local

    ! lop = 0 indicates that UEXTERNALDB is called at the start of the analysis
    ! lop = 4 indicates that UEXTERNALDB is called at the start of the restart analysis

    if (lop == 0 .or. lop == 4) then 

        call mutexInit(1)
        call mutexLock(1)
    
        ! Ensuring that only one thread is accessing the shared memory
    
        ! ========================================================
        ! Initialize all common matrixes as zeros
        ! ========================================================

        statev_all_elems_at_IPs = 0.0d0
        statev_all_elems_at_NPs = 0.0d0
        statev_at_NPs = 0.0d0
        statev_grad_all_elems_at_IPs = 0.0d0
        
        coords_all_IPs= 0.0d0
        coords_all_NPs = 0.0d0
        djac_all_elems_at_NPs = 0.0d0

        ! ========================================================
        ! BUILDING THE CONNECTIVITY MATRIX
        ! elems_to_NPs_matrix: (total_elems, nnode)
        ! NPs_to_elems_matrix: (total_nodes, nmax_elems, 2)
        ! nelems_of_NPs_matrix: (nnode)
        ! ========================================================

        call build_elems_to_NPs_matrix() ! for elems_to_NPs_matrix
        call build_NPs_to_elems_matrix() ! for NPs_to_elems_matrix and nelems_of_NPs_matrix

        ! print *, 'elems_to_NPs_matrix = '
        ! do ielem = 1, 10
        !     print *, elems_to_NPs_matrix(ielem, :)
        ! end do
        ! print *, 'NPs_to_elems_matrix = '
        ! do inode = 1, 10
        !     print *, NPs_to_elems_matrix (inode, :, :)
        ! end do
        ! print *, 'nelems_of_NPs_matrix = '
        ! do inode = 1, 10
        !     print *, nelems_of_NPs_matrix(inode)
        ! end do

        ! call pause(180)

        ! ========================================================
        ! CALCULATING SHAPE FUNCTIONS AND THE SHAPE FUNCTION GRADIENT
        ! W.R.T LOCAL COORDINATES. THESE VALUES NEVER CHANGE DURING THE ANALYSIS
        ! ========================================================

        do knode = 1, nnode
            xi_NP_inter_coord = xi_NP_inter(knode)
            eta_NP_inter_coord = eta_NP_inter(knode)
            zeta_NP_inter_coord = zeta_NP_inter(knode)

            xi_NP_extra_coord = xi_NP_extra(knode)
            eta_NP_extra_coord = eta_NP_extra(knode)
            zeta_NP_extra_coord = zeta_NP_extra(knode)

            call calc_N_shape_IP_extra_to_coords(xi_NP_extra_coord, eta_NP_extra_coord, zeta_NP_extra_coord, &
                                                N_shape_IP_extra_to_kNP_extra)
            all_N_shape_IP_extra_to_kNP_extra(knode, 1:ninpt) = N_shape_IP_extra_to_kNP_extra

            call calc_N_grad_NP_inter_to_coords_local(xi_NP_inter_coord, eta_NP_inter_coord, zeta_NP_inter_coord, &
                                                N_grad_NP_inter_to_kNP_inter_local)

            all_N_grad_NP_inter_to_kNP_inter_local(knode,1:nnode,1:ndim) = N_grad_NP_inter_to_kNP_inter_local

        end do

        do kinpt = 1, ninpt

            xi_IP_inter_coord = xi_IP_inter(kinpt)
            eta_IP_inter_coord = eta_IP_inter(kinpt)
            zeta_IP_inter_coord = zeta_IP_inter(kinpt)

            xi_IP_extra_coord = xi_IP_extra(kinpt)
            eta_IP_extra_coord = eta_IP_extra(kinpt)
            zeta_IP_extra_coord = zeta_IP_extra(kinpt)

            call calc_N_shape_NP_inter_to_coords(xi_IP_inter_coord, eta_IP_inter_coord, zeta_IP_inter_coord, &
                                                    N_shape_NP_inter_to_kIP_inter)
            all_N_shape_NP_inter_to_kIP_inter(kinpt, 1:nnode) = N_shape_NP_inter_to_kIP_inter(1:nnode)

            call calc_N_shape_NP_inter_to_coords(xi_IP_extra_coord, eta_IP_extra_coord, zeta_IP_extra_coord, &
                                                    N_shape_NP_inter_to_kIP_extra)
            all_N_shape_NP_inter_to_kIP_extra(kinpt, 1:nnode) = N_shape_NP_inter_to_kIP_extra(1:nnode)
            
            call calc_N_grad_NP_inter_to_coords_local(xi_IP_inter_coord, eta_IP_inter_coord, zeta_IP_inter_coord, &
                                                    N_grad_NP_inter_to_kIP_inter_local)
            all_N_grad_NP_inter_to_kIP_inter_local(kinpt,1:nnode,1:ndim) = N_grad_NP_inter_to_kIP_inter_local(1:nnode,1:ndim)

            call calc_N_grad_NP_inter_to_coords_local(xi_IP_extra_coord, eta_IP_extra_coord, zeta_IP_extra_coord, &
                                                    N_grad_NP_inter_to_kIP_extra_local)
            all_N_grad_NP_inter_to_kIP_extra_local(kinpt,1:nnode,1:ndim) = N_grad_NP_inter_to_kIP_extra_local(1:nnode,1:ndim)
        
            call calc_N_shape_IP_extra_to_coords(xi_IP_inter_coord, eta_IP_inter_coord, zeta_IP_inter_coord, &
                                                    N_shape_IP_extra_to_kIP_inter)
            all_N_shape_IP_extra_to_kIP_inter(kinpt, 1:ninpt) = N_shape_IP_extra_to_kIP_inter

        end do

        ! 
        call mutexUnlock(1)
        
    end if

    ! lop = 2 indicates that UEXTERNALDB is called at the end of the current analysis increment
    
    if (lop == 2) then 

        call mutexInit(1)
        call mutexLock(1)
        
        ! ========================================================
        ! Populating statev_all_elems_at_NPs(total_elems, nnode)
        ! by using N_shape_IP_extra_to_kNP_extra to extrapolate from IPs to NPs
        ! ========================================================

        call calc_scalar_all_elems_at_NPs()

        ! if (kinc == 2) then
        !     print *, 'sig_H_all_elems_at_NPs = '
        !     print *, statev_all_elems_at_NPs(sig_H_idx, 1:10, 1:nnode)
        !     print *, 'suceeeded calc_scalar_all_elems_at_nodes'
        !     call pause(180)
        ! end if


    
        ! ========================================================
        ! Populating djac_all_elems_at_nodes(total_elems, nnode)
        ! ========================================================

        call calc_djac_all_elems_at_NPs()

        ! if (kinc == 2) then
        !     print *, 'djac_all_elems_at_NPs = '
        !     print *, djac_all_elems_at_NPs(1:10, 1:nnode)
        !     print *, 'suceeeded calc_djac_all_elems_at_nodes'
        !     call pause(180)
        ! end if

        

        ! ========================================================
        ! Populating statev_at_NPs(nstatev, total_nodes)
        ! Weighted average based on determinant of Jacobian
        ! ========================================================

        call calc_scalar_at_NPs()

        ! if (kinc == 2) then
        !     print *, 'sig_H_at_NPs = '
        !     print *, statev_at_NPs(sig_H_idx, 1:100)

        !     call pause(180)

        !     print *, 'suceeeded calc_scalar_at_nodes'
        ! end if
        
        call mutexUnlock(1)
        
    end if

end

! Bbar technique

subroutine kbmatrix_full(N_grad_NP_inter_to_kIP_inter_global,ntens,nnode,ndim,Bu_kIP_inter)
    !   Full strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(nnode, ndim) :: N_grad_NP_inter_to_kIP_inter_global
    real(kind=dp), dimension(ntens, ndim * nnode) :: Bu_kIP_inter
    integer :: dof_dim_idx
    
    Bu_kIP_inter = 0.0d0
    
    do knode=1,nnode
        dof_dim_idx = ndim * knode - ndim
        ! Normal components
        Bu_kIP_inter(1,dof_dim_idx+1) = N_grad_NP_inter_to_kIP_inter_global(knode,1)
        Bu_kIP_inter(2,dof_dim_idx+2) = N_grad_NP_inter_to_kIP_inter_global(knode,2)
        Bu_kIP_inter(3,dof_dim_idx+3) = N_grad_NP_inter_to_kIP_inter_global(knode,3)
        ! Shear components
        Bu_kIP_inter(4,dof_dim_idx+1) = N_grad_NP_inter_to_kIP_inter_global(knode,2)
        Bu_kIP_inter(4,dof_dim_idx+2) = N_grad_NP_inter_to_kIP_inter_global(knode,1)
        Bu_kIP_inter(5,dof_dim_idx+1) = N_grad_NP_inter_to_kIP_inter_global(knode,3)
        Bu_kIP_inter(5,dof_dim_idx+3) = N_grad_NP_inter_to_kIP_inter_global(knode,1)
        Bu_kIP_inter(6,dof_dim_idx+2) = N_grad_NP_inter_to_kIP_inter_global(knode,3)
        Bu_kIP_inter(6,dof_dim_idx+3) = N_grad_NP_inter_to_kIP_inter_global(knode,2)
        
    end do

end


subroutine kbmatrix_vol(N_grad_NP_inter_to_kIP_inter_global,ntens,nnode,ndim,Bu_vol_kIP_inter)

    !   Volumetric strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(nnode, ndim) :: N_grad_NP_inter_to_kIP_inter_global
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_vol_kIP_inter
    integer :: dof_dim_idx
    
    Bu_vol_kIP_inter = 0.0d0
    
    ! Loop through each node
    do knode = 1, nnode
        ! Normal strain components in e11, e22, e33
        dof_dim_idx = ndim * knode - ndim
        Bu_vol_kIP_inter(1,dof_dim_idx+1) = N_grad_NP_inter_to_kIP_inter_global(knode,1)
        Bu_vol_kIP_inter(1,dof_dim_idx+2) = N_grad_NP_inter_to_kIP_inter_global(knode,2)
        Bu_vol_kIP_inter(1,dof_dim_idx+3) = N_grad_NP_inter_to_kIP_inter_global(knode,3)
        Bu_vol_kIP_inter(2,dof_dim_idx+1) = N_grad_NP_inter_to_kIP_inter_global(knode,1)
        Bu_vol_kIP_inter(2,dof_dim_idx+2) = N_grad_NP_inter_to_kIP_inter_global(knode,2)
        Bu_vol_kIP_inter(2,dof_dim_idx+3) = N_grad_NP_inter_to_kIP_inter_global(knode,3)
        Bu_vol_kIP_inter(3,dof_dim_idx+1) = N_grad_NP_inter_to_kIP_inter_global(knode,1)
        Bu_vol_kIP_inter(3,dof_dim_idx+2) = N_grad_NP_inter_to_kIP_inter_global(knode,2)
        Bu_vol_kIP_inter(3,dof_dim_idx+3) = N_grad_NP_inter_to_kIP_inter_global(knode,3)
        
        ! Shear strain components in e12, e13, e23
        ! No contribution, all are zero
    end do
    
    Bu_vol_kIP_inter = Bu_vol_kIP_inter / 3.0d0

end


subroutine move_between_statev_and_svars(kinpt,statev,nstatev,svars,nsvars,icopy)

!   Transfer data to/from element-level state variable array from/to
!   material-point level state variable array.

    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(nsvars) :: svars
    real(kind=dp), dimension(nstatev) :: statev

    isvinc = (kinpt-1) * nstatev     ! integration point increment

    if (icopy == 1) then ! Prepare arrays for entry into umat
        do kstatev=1, nstatev
            statev(kstatev) = svars(kstatev+isvinc)
        end do
    else ! Update element state variables upon return from umat
        do kstatev = 1, nstatev
            svars(kstatev+isvinc) = statev(kstatev)
        end do
    end if
end


include "UMAT_subroutines/UMAT_elastic.f90"
include "UMAT_subroutines/UMAT_vonMises.f90"
include "UMATHT_subroutines/UMATHT_heat_transfer.f90"
include "HETVAL_subroutines/HETVAL_heat_transfer.f90"
include "UMATHT_subroutines/UMATHT_hydrogen_Oriani.f90"
include "HETVAL_subroutines/HETVAL_hydrogen_Oriani.f90"
! include "UMATHT_subroutines/UMATHT_hydrogen_McNabb_Foster.f90"

! *****************************************************************
! UFIELD reads current nodal coordinates for all NPs
! *****************************************************************

subroutine UFIELD(field, kfield, nsecpt, kstep, kinc, time, node, &
                  coords, temp, dtemp, nfield)
    use precision
    use common_block
    include 'aba_param.inc'
   
    dimension field(nsecpt,nfield), time(2), coords(3), &
              temp(nsecpt), dtemp(nsecpt)

    ! IMPORTANT: coords in this subroutine is NP coordinates, not IP coordinates
    ! like the one in UMAT and UMATHT

    call mutexInit(1)
    call mutexLock(1)

    ! Assign the current nodal coordinates to coords_all_NPs

    coords_all_NPs(node, 1:ndim) = coords(1:ndim)

    call mutexUnlock(1)

return
end

! UEL official documenation
! https://help.3ds.com/2025/english/dssimulia_established/SIMACAESUBRefMap/simasub-c-uel.htm?contextscope=all
! nnode parameter of UEL is changed to numnode to avoid naming conflict with the global parameter nnode

!***********************************************************************

subroutine UEL(rhs,amatrx,svars,energy,ndofel,nrhs,nsvars, &
    props,nprops,coords,mcrd,numnode,u,du,v,a,jtype,time,dtime, &
    kstep,kinc,jelem,params,ndload,jdltyp,adlmag,predef,npredf, &
    lflags,mlvarx,ddlmag,mdload,pnewdt,jprops,njpro,period)

    use precision
    use common_block
    use iso_module

    include 'aba_param.inc' 
      
    dimension rhs(mlvarx,*),amatrx(ndofel,ndofel),props(*),svars(*), &
        energy(8),coords(mcrd,numnode),u(ndofel),du(mlvarx,*),v(ndofel), &
        a(ndofel),time(2),params(*),jdltyp(mdload,*),adlmag(mdload,*), &
        ddlmag(mdload,*),predef(2,npredf,numnode),lflags(*),jprops(*)

    real(kind=dp) :: time, dtime

    ! rhs: dimension is ndofel x 1 in most cases and ndofel x 2 for linear perturbation
    ! amatrx: stiffness matrix of dim (ndofel x ndofel)
    ! svars in UEL is statev(1:nstatev) for first IP, statev(nstatev+1:2*nstatev) for second IP and so on
    ! Therefore, the parameter nsvars in UEL is equal to ninpt * nstatev

    integer :: start_ux_idx, end_ux_idx, start_temp_idx, end_temp_idx, start_CL_mol_idx, end_CL_mol_idx, start_phi_idx, end_phi_idx
    integer :: UMAT_model, UMATHT_hydro_model, mech_field_flag, temp_field_flag, hydro_field_flag, damage_field_flag

    ! ==============================================================
    ! TENSORS COMMON TO ALL FIELDS (DEFORMATION, DIFFUSION, DAMAGE)
    ! ==============================================================

    ! Note: coords in UEL is always fixed, which is the initial coordinates of the element jelem
    real(kind=dp), dimension(ndim,nnode) :: coords_kelem_NPs_t, coords_kelem_NPs_tm1, coords_kelem_NPs_0, coords_kelem_NPs_center
    real(kind=dp), dimension(ndim,ninpt) :: coords_kelem_IPs_t, coords_kelem_IPs_tm1, coords_kelem_IPs_0
    real(kind=dp), dimension(ndim) :: coords_kelem_kIP_t, coords_kelem_kIP_tm1
    real(kind=dp), dimension(ndim,ndim) :: xjac_inter_t, xjac_inv_inter_t
    real(kind=dp), dimension(ndim,ndim) :: xjac_inter_tm1, xjac_inv_inter_tm1
    real(kind=dp), dimension(ndim,ndim) :: xjac_inter_center, xjac_inv_inter_center
    real(kind=dp), dimension(ndim,ndim) :: xjac_extra_t, xjac_inv_extra_t
    ! Local state variables of the current element jelem for integration points
    real(kind=dp), dimension(nstatev) :: statev                      
    real(kind=dp), dimension(ndim,ndim) :: identity   
    ! Shape function that interpolates from nodal points to integration points
    real(kind=dp), dimension(nnode) :: N_shape_NP_inter_to_kIP_inter
    real(kind=dp), dimension(ninpt) :: N_shape_IP_inter_to_kIP_extra
    real(kind=dp), dimension(ninpt) :: N_shape_IP_extra_to_kIP_inter
    ! Shape function that extrapolates from integration points to nodal points
    
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_to_kIP_inter_local          
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_to_kIP_inter_global_t
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_to_kIP_inter_global_tm1  
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_to_KIP_inter_global_center       
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_bar_global_t
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_bar_global_tm1
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_bar_global_center
    real(kind=dp), dimension(nnode) :: N_shape_NP_inter_to_kIP_extra 
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_to_kIP_extra_local
    real(kind=dp), dimension(nnode,ndim) :: N_grad_NP_inter_to_kIP_extra_global_t
    ! Predefined fields 
    real(kind=dp), dimension(ninpt,npredf) :: predef_IPs_t, predef_IPs_tm1, dpred_IPs
    real(kind=dp), dimension(npredf) :: predef_kIP_t, predef_kIP_tm1, dpred_kIP 
    real(kind=dp), dimension(nnode,nnode) :: test_nnode_by_nnode

    ! =====================================================
    ! TENSORS DEFINED FOR THE DEFORMATION FIELD: UX, UY, UZ
    ! =====================================================

    real(kind=dp), dimension(ndim,nnode) :: ux_t, dux, ux_tm1, ux_center, vx_t, ax_t
    real(kind=dp), dimension(ndim*nnode) :: ux_flat_t, dux_flat, ux_flat_tm1, ux_flat_center, vx_flat_t, ax_flat_t
    
    ! Displacement gradient u
    real(kind=dp), dimension(ndim,ndim) :: ux_grad_t, ux_grad_tm1, dux_grad, ux_grad_center
    real(kind=dp), dimension(ndim,ndim) :: dux_grad_bar_center, dux_grad_center_kIP, dux_grad_center_sym_kIP

    ! Strain-displacement matrix (B matrix)            
    real(kind=dp), dimension(ntensor,ndim*nnode) :: Bu_kIP_inter_t, Bu_kIP_inter_tm1, Bu_kIP_inter_center
    ! Volumetric strain-displacement matrix (B matrix)     
    real(kind=dp), dimension(ntensor,ndim*nnode) :: Bu_vol_kIP_inter_t, Bu_vol_kIP_inter_tm1, Bu_vol_kIP_inter_center   
    real(kind=dp), dimension(ntensor,ndim*nnode) :: Bu_bar_t, Bu_bar_tm1, Bu_bar_center
    real(kind=dp), dimension(ntensor,ndim*nnode) :: Bu_bar_vol_t, Bu_bar_vol_tm1, Bu_bar_vol_center

    real(kind=dp), dimension(ndim*nnode,ndim*nnode) :: K_material, K_geometry, K_spin

    ! Deformation gradient F
    real(kind=dp), dimension(ndim,ndim) :: F_grad_t, F_grad_tm1, dF_grad, F_grad_inv_tm1      
    real(kind=dp), dimension(ndim,ndim) :: F_grad_bar_t, F_grad_bar_tm1, F_grad_bar_inv_tm1, dF_grad_bar    
    
    ! Right Cauchy-Green tensor C
    real(kind=dp), dimension(ndim,ndim) :: C_Cauchy_t, C_Cauchy_tm1, dC_Cauchy, C_Cauchy_inv_tm1, &
                                           log_C_Cauchy_t, log_C_Cauchy_tm1, dlog_C_Cauchy
    ! Left Cauchy-Green tensor B                
    real(kind=dp), dimension(ndim,ndim) :: B_Cauchy_t, B_Cauchy_tm1, dB_Cauchy, B_Cauchy_inv_tm1, &
                                            log_B_Cauchy_t, log_B_Cauchy_tm1, dlog_B_Cauchy
    ! Right stretch tensor U
    real(kind=dp), dimension(ndim,ndim) :: U_stretch_t, U_stretch_tm1, dU_stretch, &
                                        U_stretch_inv_t, U_stretch_inv_tm1, dU_stretch_inv
    ! Left stretch tensor V
    real(kind=dp), dimension(ndim,ndim) :: V_stretch_t, V_stretch_tm1, dV_stretch, &
                                        V_stretch_inv_t, V_stretch_inv_tm1, dV_stretch_inv              
    real(kind=dp), dimension(ndim,ndim) :: R_right_rot_t, R_right_rot_tm1, R_right_rot_inv_tm1
    real(kind=dp), dimension(ndim,ndim) :: dR_right_rot, dR_right_rot_inv            
    real(kind=dp), dimension(ndim,ndim) :: R_left_rot_t, R_left_rot_tm1, R_left_rot_inv_tm1
    real(kind=dp), dimension(ndim,ndim) :: dR_left_rot, dR_left_rot_inv     
    real(kind=dp), dimension(ndim,ndim) :: dR_rotation, dR_rotation_term_1, dR_rotation_term_1_inv, dR_rotation_term_2

    real(kind=dp), dimension(ndim,ndim) :: dW_spin
    
    real(kind=dp), dimension(ndim,ndim) :: eps_log_t, eps_log_tm1, deps_log, eps_log_t_rotated         
    
    real(kind=dp), dimension(ntensor) :: stress, stress_t, stress_tm1, rotated_stress_tm1, rotated_stress_t
    real(kind=dp), dimension(ndim, ndim) :: stress_tensor, stress_tensor_t, rotated_stress_tensor_t, stress_tensor_tm1, rotated_stress_tensor_tm1
    real(kind=dp), dimension(ntensor,ntensor) :: ddsdde, ddsddt, drplde                 ! Tangent stiffness matrix 

    real(kind=dp), dimension(ntensor) :: stran, stran_t, stran_tm1, dstran, rotated_stran_tm1, rotated_stran_t
    real(kind=dp), dimension(ndim, ndim) :: stran_tensor, stran_tensor_t, stran_tensor_tm1, dstran_tensor, rotated_stran_tensor_tm1
    
    real(kind=dp), dimension(ntensor) :: eelas                        ! Elastic strain vector of the current element jelem
    real(kind=dp), dimension(ntensor) :: eplas                        ! Plastic strain vector of the current element jelem

    ! ===================================================================================== !
    ! TENSORS DEFINED FOR THE MASS DIFFUSION FIELD: CL_mol (Lattice hydrogen concentration) !
    ! ===================================================================================== !

    real(kind=dp), dimension(nnode) :: CL_mol_NPs_t, dCL_mol_NPs, CL_mol_NPs_tm1

    real(kind=dp) :: CL_mol_kIP_t, dCL_mol_kIP, CL_mol_kIP_tm1
    real(kind=dp), dimension(ndim) :: CL_mol_grad_kIP_t

    real(kind=dp) :: C_pred_mol_kIP_tm1, dC_mol_dCL_mol_kIP_t, dC_mol_kIP, r_hydro_kIP_t, drdt_hydro_kIP
    real(kind=dp), dimension(ndim) :: dC_mol_dgrad_CL_mol_kIP_t, dudg_hydro_kIP_inter_t, dudg_hydro_kIP_extra_t
    real(kind=dp), dimension(ndim) :: flux_hydro_kIP, flux_hydro_kIP_t, flux_hydro_kIP_tm1, dflux_hydro_dCL_mol_kIP_t
    real(kind=dp), dimension(ndim,ndim) :: dflux_hydro_dgrad_CL_mol_kIP_t

    real(kind=dp), dimension(nnode,nnode)  :: K_hydro_kIP_t, K_hydro_dfdCL_kIP_t, K_hydro_dfdgCL_kIP_t, K_hydro_ddCdCL_kIP_t, K_hydro_drdCL_kIP_t
    real(kind=dp), dimension(nnode,nnode) :: M_hydro_kIP_t, M_hydro_dCdCL_kIP_t, M_hydro_dCdgCL_kIP_t
    real(kind=dp), dimension(nnode) :: F_hydro_kIP_t, F_hydro_dC_kIP_t, F_hydro_flux_kIP_t, F_hydro_r_kIP_t

    ! ==================================================!
    ! TENSORS DEFINED FOR THE HEAT TRASNFER FIELD: temp !
    ! ==================================================!

    real(kind=dp), dimension(nnode) :: temp_NPs_t, dtemp_NPs, temp_NPs_tm1

    real(kind=dp) :: temp_kIP_t, dtemp_kIP, temp_kIP_tm1
    real(kind=dp), dimension(ndim) :: temp_grad_kIP_t

    real(kind=dp) :: u_heat_kIP_t, u_heat_kIP_tm1, dudt_heat_kIP_t, du_heat_kIP, r_heat_kIP_t, drdt_heat_kIP
    real(kind=dp), dimension(ndim) :: dudg_heat_kIP_t, dudg_heat_kIP_inter_t, dudg_heat_kIP_extra_t
    real(kind=dp), dimension(ndim) :: flux_heat_kIP, flux_heat_kIP_t, flux_heat_kIP_tm1, dfdt_heat_kIP_t
    real(kind=dp), dimension(ndim,ndim) :: dfdg_heat_kIP_t

    real(kind=dp), dimension(nnode,nnode)  :: K_heat_kIP_t, K_heat_dfdt_kIP_t, K_heat_dfdg_kIP_t, K_heat_drdt_kIP_t
    real(kind=dp), dimension(nnode,nnode) :: M_heat_kIP_t, M_heat_dudt_kIP_t, M_heat_dudg_kIP_t
    real(kind=dp), dimension(nnode) :: F_heat_kIP_t, F_heat_du_kIP_t, F_heat_flux_kIP_t, F_heat_r_kIP_t

    ! =================================================!
    ! TENSORS DEFINED FOR THE Phase field damage: phi  !
    ! =================================================!

    real(kind=dp), dimension(nnode) :: phi_NPs_t, dphi_NPs, phi_NPs_tm1

    real(kind=dp) :: phi_kIP_t, dphi_kIP, phi_kIP_tm1
    real(kind=dp), dimension(ndim) :: phi_grad_kIP_t

    ! Notation: 
    ! _t refers to at the end of increment
    ! _tm1 refers to at the beginning of increment
    ! _0 refers to at the beginning of analysis

    ! Degree of freedom order for 
    ! u (total values of DOFs at the end of the current increment)
    ! du (incremental values of DOFs of the current increment) 
    ! v (velocity of DOFs at the end of the current increment)
    ! a (acceleration of DOFs at the end of the current increment)

    ! Displacement field: ux_node1, uy_node1, uz_node1, ..., ux_nnode, uy_nnode, uz_nnode
    ! Hydrogen diffusion field: CL_mol_node1, CL_mol_node2, ..., CL_mol_nnode, 
    ! Temperature field: temp_node1, temp_node2, ..., temp_nnode, 
    ! Damage phase field: phi_node1, phi_node2, ..., phi_nnode

    ! It is noted that heat transfer and mass diffusion are solved with exactly the same equations
    ! Thanks to the analogy between heat transfer and mass diffusion (Fourier's law v.s Fick's law)

    start_ux_idx = 1
    end_ux_idx = ndim * nnode ! 24
    start_CL_mol_idx = ndim * nnode + 1 ! 25
    end_CL_mol_idx = (ndim + 1) * nnode ! 32
    start_temp_idx = (ndim + 1) * nnode + 1 ! 33
    end_temp_idx = (ndim + 2) * nnode ! 40
    start_phi_idx = (ndim + 2) * nnode + 1 ! 41
    end_phi_idx = (ndim + 3) * nnode ! 48

    do k1=1,ndofel
        rhs(k1,nrhs)=0.0d0
    end do
    amatrx = 0.0d0

    identity = 0.0d0
    do kdim=1,ndim
        identity(kdim,kdim)=1.0d0
    end do

    mech_field_flag = props(start_field_flag_idx + 0)
    temp_field_flag = props(start_field_flag_idx + 1)
    hydro_field_flag = props(start_field_flag_idx + 2)
    damage_field_flag = props(start_field_flag_idx + 3)

    ! Extract from the variable u and du
    do kdim=1,ndim
        do knode=1,nnode
            disp_index = ndim * knode - ndim + kdim
            ux_t(kdim,knode) = u(disp_index)
            dux(kdim,knode) = du(disp_index, nrhs)
            ux_tm1(kdim,knode) = ux_t(kdim,knode) - dux(kdim,knode)
            ux_center(kdim,knode) = 0.5d0 * (ux_t(kdim,knode) + ux_tm1(kdim,knode))
            vx_t(kdim,knode) = v(disp_index)
            ax_t(kdim,knode) = a(disp_index)
            
        end do
    end do

    ! Extracting displacement dofs ux_t, dux and ux_tm1 from u and du
    ux_flat_t(1:ndim*nnode) = u(start_ux_idx:end_ux_idx)
    dux_flat(1:ndim*nnode) = du(start_ux_idx:end_ux_idx, nrhs)
    ux_flat_tm1(1:ndim*nnode) = ux_flat_t - dux_flat
    ux_flat_center(1:ndim*nnode) = 0.5d0 * (ux_flat_t + ux_flat_tm1)
    vx_flat_t(1:ndim*nnode) = v(start_ux_idx:end_ux_idx)
    ax_flat_t(1:ndim*nnode) = a(start_ux_idx:end_ux_idx)

    temp_NPs_t(1:nnode) = u(start_temp_idx:end_temp_idx)
    dtemp_NPs(1:nnode) = du(start_temp_idx:end_temp_idx, nrhs)
    temp_NPs_tm1(1:nnode) = temp_NPs_t - dtemp_NPs

    ! Extracting temperature dofs temp_NPs_t, dtemp_NPs and temp_NPs_tm1 from u and du
    ! if (kinc > 1) then
    !     temp_NPs_t(1:nnode) = u(start_temp_idx:end_temp_idx)
    !     dtemp_NPs(1:nnode) = du(start_temp_idx:end_temp_idx, nrhs)
    !     temp_NPs_tm1(1:nnode) = temp_NPs_t - dtemp_NPs
    ! else
    !     temp_NPs_t(1:nnode) = u(start_temp_idx:end_temp_idx)
    !     dtemp_NPs(1:nnode) = 0.0d0
    !     temp_NPs_tm1(1:nnode) = u(start_temp_idx:end_temp_idx)
    ! end if

    ! Extracting concentration dofs CL_mol_NPs_t, dCL_mol_NPs and CL_mol_NPs_tm1 from u and du
    CL_mol_NPs_t(1:nnode) = u(start_CL_mol_idx:end_CL_mol_idx)
    dCL_mol_NPs(1:nnode) = du(start_CL_mol_idx:end_CL_mol_idx, nrhs)
    CL_mol_NPs_tm1(1:nnode) = CL_mol_NPs_t - dCL_mol_NPs

    ! Extracting phase field damage dofs phi_NPs_t, dphi_NPs and phi_NPs_tm1 from u and du
    phi_NPs_t(1:nnode) = u(start_phi_idx:end_phi_idx)
    dphi_NPs(1:nnode) = du(start_phi_idx:end_phi_idx, nrhs)
    phi_NPs_tm1(1:nnode) = phi_NPs_t - dphi_NPs

    ! Current coordinates of the element jelem

    ! It will be used to calculate N_grad_NP_inter_to_kIP_inter_global_t for updated Lagrangian formulation
    coords_kelem_NPs_0 = coords

    if (lflags(2) == 0) then ! NLGEOM off
        ! Use original coordinates for total Lagrangian formulation
        coords_kelem_NPs_tm1 = coords_kelem_NPs_0
        coords_kelem_NPs_t = coords_kelem_NPs_0
        coords_kelem_NPs_center = coords_kelem_NPs_0
    else if (lflags(2) == 1) then ! NLGEOM on
        ! Use updated coordinates for updated Lagrangian formulation
        coords_kelem_NPs_tm1 = coords_kelem_NPs_0 + ux_tm1
        coords_kelem_NPs_t = coords_kelem_NPs_0 + ux_t
        coords_kelem_NPs_center = coords_kelem_NPs_0 + ux_center
    end if

    ! Calculate coordinates at all IPs

    do kinpt = 1, ninpt
        N_shape_NP_inter_to_kIP_inter(1:nnode) = all_N_shape_NP_inter_to_kIP_inter(kinpt,1:nnode)

        do kdim = 1, ndim
            coords_kelem_IPs_t(kdim, kinpt) = dot_product(N_shape_NP_inter_to_kIP_inter, &
                                                          coords_kelem_NPs_t(kdim, 1:nnode))
            coords_kelem_IPs_tm1(kdim, kinpt) = dot_product(N_shape_NP_inter_to_kIP_inter, &
                                                            coords_kelem_NPs_tm1(kdim, 1:nnode))
            coords_kelem_IPs_0(kdim, kinpt) = dot_product(N_shape_NP_inter_to_kIP_inter, &
                                                          coords_kelem_NPs_0(kdim, 1:nnode))
        end do
    end do

    ! Calculate predefined field variables at all IPs
    ! In UEL

    ! PREDEF(1,K2,K3)	Values of the variables at the end of the current increment of the K2th predefined field variable at the K3th node of the element.
    ! PREDEF(2,K2,K3)	Incremental values corresponding to the current time increment of the K2th predefined field variable at the K3th node of the element.

    do kinpt = 1, ninpt
        do kpredf = 1, npredf 
            N_shape_NP_inter_to_kIP_inter(1:nnode) = all_N_shape_NP_inter_to_kIP_inter(kinpt,1:nnode)
            predef_IPs_t(kinpt, 1:npredf) = dot_product(N_shape_NP_inter_to_kIP_inter, &
                                                        predef(1,kpredf,1:nnode))
            dpred_IPs(kinpt, 1:npredf) = dot_product(N_shape_NP_inter_to_kIP_inter, &
                                                        predef(2,kpredf,1:nnode))
            predef_IPs_tm1(kinpt, 1:npredf) = dot_product(N_shape_NP_inter_to_kIP_inter, &
                                                        predef(1,kpredf,1:nnode)-predef(2,kpredf,1:nnode))
        end do
    end do

    ! call pause(1800)

    ! ================================================================== !
    !                                                                    !
    !                    COMPUTING THE GRADIENT OF SDVs                  !
    !                                                                    !
    ! ================================================================== !

    ! print *, 'jelem = ', jelem

    do kinpt = 1, ninpt
        call calc_scalar_grad_kelem_at_kIP(jelem, kinpt)
    end do

    N_grad_NP_inter_bar_global_t(1:nnode,1:ndim) = 0.0d0
    N_grad_NP_inter_bar_global_tm1(1:nnode,1:ndim) = 0.0d0
    N_grad_NP_inter_bar_global_center(1:nnode,1:ndim) = 0.0d0
    djac_bar_t = 0.0d0
    djac_bar_tm1 = 0.0d0
    djac_bar_center = 0.0d0
    elem_vol_t = 0.0d0
    elem_vol_tm1 = 0.0d0
    elem_vol_center = 0.0d0

    dux_grad_bar_center = 0.0d0

    do kinpt=1, ninpt

        N_grad_NP_inter_to_kIP_inter_local(1:nnode,1:ndim) = all_N_grad_NP_inter_to_kIP_inter_local(kinpt,1:nnode,1:ndim) 

        xjac_inter_tm1 = matmul(coords_kelem_NPs_tm1, N_grad_NP_inter_to_kIP_inter_local)
        call calc_matrix_inv(xjac_inter_tm1, xjac_inv_inter_tm1, djac_inter_tm1, ndim)

        dvol_inter_tm1 = weight_kIP(kinpt) * djac_inter_tm1
        N_grad_NP_inter_to_kIP_inter_global_tm1 = matmul(N_grad_NP_inter_to_kIP_inter_local, xjac_inv_inter_tm1)
        N_grad_NP_inter_bar_global_tm1 = N_grad_NP_inter_bar_global_tm1 + N_grad_NP_inter_to_kIP_inter_global_tm1 * dvol_inter_tm1
        djac_bar_tm1 = djac_bar_tm1 + djac_inter_tm1 * dvol_inter_tm1
        elem_vol_tm1 = elem_vol_tm1 + dvol_inter_tm1

        xjac_inter_t = matmul(coords_kelem_NPs_t, N_grad_NP_inter_to_kIP_inter_local)
        call calc_matrix_inv(xjac_inter_t, xjac_inv_inter_t, djac_inter_t, ndim)

        dvol_inter_t = weight_kIP(kinpt) * djac_inter_t
        N_grad_NP_inter_to_kIP_inter_global_t = matmul(N_grad_NP_inter_to_kIP_inter_local, xjac_inv_inter_t)
        N_grad_NP_inter_bar_global_t = N_grad_NP_inter_bar_global_t + N_grad_NP_inter_to_kIP_inter_global_t * dvol_inter_t
        djac_bar_t = djac_bar_t + djac_inter_t * dvol_inter_t
        elem_vol_t = elem_vol_t + dvol_inter_t

        xjac_inter_center = matmul(coords_kelem_NPs_center, N_grad_NP_inter_to_kIP_inter_local)
        call calc_matrix_inv(xjac_inter_center, xjac_inv_inter_center, djac_inter_center, ndim)
        
        dvol_inter_center = weight_kIP(kinpt) * djac_inter_center
        N_grad_NP_inter_to_kIP_inter_global_center = matmul(N_grad_NP_inter_to_kIP_inter_local, xjac_inv_inter_center)
        N_grad_NP_inter_bar_global_center = N_grad_NP_inter_bar_global_center + N_grad_NP_inter_to_kIP_inter_global_center * dvol_inter_center
        djac_bar_center = djac_bar_center + djac_inter_center * dvol_inter_center
        elem_vol_center = elem_vol_center + dvol_inter_center

        dux_grad_center_kIP = matmul(dux, N_grad_NP_inter_to_kIP_inter_global_center)

        dux_grad_bar_center = dux_grad_bar_center + dux_grad_center_kIP * dvol_inter_center

    end do

    N_grad_NP_inter_bar_global_tm1 = N_grad_NP_inter_bar_global_tm1 / elem_vol_tm1
    djac_bar_tm1 = djac_bar_tm1 / elem_vol_tm1
    N_grad_NP_inter_bar_global_t = N_grad_NP_inter_bar_global_t / elem_vol_t
    djac_bar_t = djac_bar_t / elem_vol_t
    N_grad_NP_inter_bar_global_center = N_grad_NP_inter_bar_global_center / elem_vol_center
    djac_bar_center = djac_bar_center / elem_vol_center
    
    dux_grad_bar_center = dux_grad_bar_center / elem_vol_center

    ! ================================================================== !
    ! STARTING THE LOOP OVER ALL INTEGRATION POINTS FOR ALL FIELDS       !
    ! ================================================================== !
    
    do kinpt=1,ninpt

        ! Extracting coordinates of the current integration point
        coords_kelem_kIP_t = coords_kelem_IPs_t(1:ndim,kinpt)

        ! Extracting the predefined fields
        predef_kIP_t = predef_IPs_t(kinpt,1:npredf)
        predef_kIP_tm1 = predef_IPs_tm1(kinpt,1:npredf)
        dpred_kIP = dpred_IPs(kinpt,1:npredf)

        !   Transfer statev from UEL svars to statev for current integration point
        call move_between_statev_and_svars(kinpt,statev,nstatev,svars,nsvars,1)

        !   Compute N_shape_NP_inter_to_kIP_inter and N_grad_NP_inter_to_kIP_inter_local
        N_shape_NP_inter_to_kIP_inter(1:nnode) = all_N_shape_NP_inter_to_kIP_inter(kinpt,1:nnode)
        N_grad_NP_inter_to_kIP_inter_local(1:nnode,1:ndim) = all_N_grad_NP_inter_to_kIP_inter_local(kinpt,1:nnode,1:ndim) 

        ! ================================================================== !
        !                                                                    !
        !                    SOLVING THE DEFORMATION FIELD                   !
        !                                                                    !
        ! ================================================================== !

        xjac_inter_t = matmul(coords_kelem_NPs_t, N_grad_NP_inter_to_kIP_inter_local)

        call calc_matrix_inv(xjac_inter_t, xjac_inv_inter_t, djac_inter_t, ndim)

        dvol_inter_t = weight_kIP(kinpt) * djac_inter_t
        N_grad_NP_inter_to_kIP_inter_global_t = matmul(N_grad_NP_inter_to_kIP_inter_local, xjac_inv_inter_t)

        !   Calculate strain displacement B-matrix
        call kbmatrix_full(N_grad_NP_inter_to_kIP_inter_global_t,ntensor,nnode,ndim,Bu_kIP_inter_t)  
        call kbmatrix_vol(N_grad_NP_inter_to_kIP_inter_global_t,ntensor,nnode,ndim,Bu_vol_kIP_inter_t)
        call kbmatrix_vol(N_grad_NP_inter_bar_global_t,ntensor,nnode,ndim,Bu_bar_vol_t)

        Bu_bar_t = Bu_kIP_inter_t - Bu_vol_kIP_inter_t + Bu_bar_vol_t

        xjac_inter_tm1 = matmul(coords_kelem_NPs_tm1, N_grad_NP_inter_to_kIP_inter_local)
        call calc_matrix_inv(xjac_inter_tm1, xjac_inv_inter_tm1, djac_inter_tm1, ndim)

        dvol_inter_tm1 = weight_kIP(kinpt) * djac_inter_tm1
        N_grad_NP_inter_to_kIP_inter_global_tm1 = matmul(N_grad_NP_inter_to_kIP_inter_local, xjac_inv_inter_tm1)
        
        !   Calculate strain displacement B-matrix
        call kbmatrix_full(N_grad_NP_inter_to_kIP_inter_global_tm1,ntensor,nnode,ndim,Bu_kIP_inter_tm1)
        call kbmatrix_vol(N_grad_NP_inter_to_kIP_inter_global_tm1,ntensor,nnode,ndim,Bu_vol_kIP_inter_tm1)
        call kbmatrix_vol(N_grad_NP_inter_bar_global_tm1,ntensor,nnode,ndim,Bu_bar_vol_tm1)

        Bu_bar_tm1 = Bu_kIP_inter_tm1 - Bu_vol_kIP_inter_tm1 + Bu_bar_vol_tm1

        xjac_inter_center = matmul(coords_kelem_NPs_center, N_grad_NP_inter_to_kIP_inter_local)
        call calc_matrix_inv(xjac_inter_center, xjac_inv_inter_center, djac_inter_center, ndim)

        dvol_inter_center = weight_kIP(kinpt) * djac_inter_center
        N_grad_NP_inter_to_kIP_inter_global_center = matmul(N_grad_NP_inter_to_kIP_inter_local, xjac_inv_inter_center)

        !   Calculate strain displacement B-matrix
        call kbmatrix_full(N_grad_NP_inter_to_kIP_inter_global_center,ntensor,nnode,ndim,Bu_kIP_inter_center)
        call kbmatrix_vol(N_grad_NP_inter_to_kIP_inter_global_center,ntensor,nnode,ndim,Bu_vol_kIP_inter_center)
        call kbmatrix_vol(N_grad_NP_inter_bar_global_center,ntensor,nnode,ndim,Bu_bar_vol_center)

        Bu_bar_center = Bu_kIP_inter_center - Bu_vol_kIP_inter_center + Bu_bar_vol_center

        if (lflags(2) == 0) then 

            ! Engineering/infinitesimal strain (nlgeom=off)
            ! =======================================

            dstran = matmul(Bu_bar_t, dux_flat)

            ! For deformation gradients to be passed into UMAT

            ! In linear geometry, displacement is considered very small, thus deformation gradient is identity
            F_grad_bar_tm1 = identity
            F_grad_bar_t = identity

            dR_rotation = identity
            
        else if (lflags(2) == 1) then

            ! Large-displacement analysis (nlgeom=on)
            ! =======================================

            dux_grad_center_kIP = matmul(dux, N_grad_NP_inter_to_kIP_inter_global_center)
            call calc_matrix_sym(dux_grad_center_kIP, dux_grad_center_sym_kIP, ndim)

            ! Compute trace of symmetric dux gradient
            trace_dux_grad_bar_center = dux_grad_bar_center(1,1) + dux_grad_bar_center(2,2) + dux_grad_bar_center(3,3)
            trace_dux_grad_center_kIP = dux_grad_center_kIP(1,1) + dux_grad_center_kIP(2,2) + dux_grad_center_kIP(3,3)

            dstran_tensor = dux_grad_center_sym_kIP + (1.0d0/3.0d0) * identity * (trace_dux_grad_bar_center - trace_dux_grad_center_kIP)

            ! Convert to Voigt strain vector: dstran(6)

            call stran_tensor_to_voigt(dstran, dstran_tensor, ntensor, ndim)

            dstran(1) = dstran_tensor(1,1)
            dstran(2) = dstran_tensor(2,2)
            dstran(3) = dstran_tensor(3,3)
            dstran(4) = dstran_tensor(1,2) * 2.0d0
            dstran(5) = dstran_tensor(1,3) * 2.0d0
            dstran(6) = dstran_tensor(2,3) * 2.0d0
            
            ! For deformation gradients to be passed into UMAT

            ux_grad_t = matmul(ux_t, N_grad_NP_inter_to_kIP_inter_global_t)
            ux_grad_tm1 = matmul(ux_tm1, N_grad_NP_inter_to_kIP_inter_global_tm1)

            F_grad_t = identity + ux_grad_t
            F_grad_tm1 = identity + ux_grad_tm1

            F_grad_bar_t = F_grad_t * (djac_bar_t / djac_inter_t) ** (1.0d0/3.0d0)
            F_grad_bar_tm1 = F_grad_tm1 * (djac_bar_tm1 / djac_inter_tm1) ** (1.0d0/3.0d0)
            
            ! Rate of spin delta W
            call calc_matrix_asym(dux_grad_center_kIP, dW_spin, ndim)
            ! call calc_matrix_asym(dstran_tensor, dW_spin, ndim)

            dR_rotation_term_1 = identity - 0.5d0 * dW_spin
            dR_rotation_term_2 = identity + 0.5d0 * dW_spin
            call calc_matrix_inv(dR_rotation_term_1, dR_rotation_term_1_inv, det_dR_rotation_term_1, ndim)

            dR_rotation = matmul(dR_rotation_term_1_inv, dR_rotation_term_2)

            ! call calc_matrix_inv(dR_rotation, dR_rotation_inv, det_dR_rotation, ndim)
            ! print *, 'det_dR_rotation = ', det_dR_rotation (must be equal to 1)

        end if

        !   ====================================================   !
        !   Calculate deformation field (stress and strain, etc)   !
        !   ====================================================   !
                
        stress_tm1 = statev(sig_start_idx:sig_end_idx) ! stress at tm1
        stran_tm1 = statev(stran_start_idx:stran_end_idx) ! stran at tm1

        if (lflags(2) == 0) then
            
            ! nlgeom=off
            ! =======================================

            ! No need to rotate stress and strain

            stress = stress_tm1
            stran = stran_tm1

        else if (lflags(2) == 1) then
            
            ! nlgeom=on
            ! =======================================

            ! Rotating stress

            ! We integrate the total values of each strain measure as the sum of the value of that strain at the start of the increment, 
            ! rotated to account for rigid body motion during the increment, and the strain increment

            ! Convert stress from Voigt to tensor
            ! call stress_voigt_to_tensor(stress_tm1, stress_tensor_tm1, ntensor, ndim)
            ! call stran_voigt_to_tensor(stran_tm1, stran_tensor_tm1, ntensor, ndim)

            ! ! Rotate stress tensor: σ = Rᵀ ⋅ σᵣ ⋅ R
            ! rotated_stress_tensor_tm1 = matmul(matmul(dR_rotation, stress_tensor_tm1), transpose(dR_rotation))
            ! rotated_stran_tensor_tm1 = matmul(matmul(dR_rotation, stran_tensor_tm1), transpose(dR_rotation))

            ! ! Convert back to Voigt form
            ! call stress_tensor_to_voigt(rotated_stress_tm1, rotated_stress_tensor_tm1, ntensor, ndim)
            ! call stran_tensor_to_voigt(rotated_stran_tm1, rotated_stran_tensor_tm1, ntensor, ndim)

            ! stress = rotated_stress_tm1
            ! stran = rotated_stran_tm1

            call rotsig(stress_tm1,dR_rotation,rotated_stress_tm1,1,ndirect,nshear)
            call rotsig(stran_tm1,dR_rotation,rotated_stran_tm1,2,ndirect,nshear)
            stress = rotated_stress_tm1
            stran = rotated_stran_tm1

        end if

        UMAT_model = props(start_mech_props_idx)
        
        nprops_UMAT = end_flow_props_idx - start_mech_props_idx + 1

        ! UMAT official documentations
        ! https://help.3ds.com/2025/english/dssimulia_established/simacaesubrefmap/simasub-c-umat.htm?contextscope=all

        ! ENERGY(1)	Kinetic energy.
        ! ENERGY(2)	Elastic strain energy.
        ! ENERGY(3)	Creep dissipation.
        ! ENERGY(4)	Plastic dissipation.
        ! ENERGY(5)	Viscous dissipation.
        ! ENERGY(6)	“Artificial strain energy” associated with such effects as artificial stiffness introduced to control hourglassing or other singular modes in the element.
        ! ENERGY(7)	Electrostatic energy.
        ! ENERGY(8)	Incremental work done by loads applied within the user element.

        ! Stress updated in UMAT is the corotational true Cauchy stress

        if (UMAT_model == 1) then
            call UMAT_elastic(stress,statev,ddsdde,energy(2),energy(4),energy(3),rpl,ddsddt, &
                            drplde,drpldt,stran,dstran,time,dtime,temp,dtemp, &
                            predef_kIP_tm1,dpred_kIP,cmname,ndirect,nshear,ntensor,nstatev, &
                            props(start_mech_props_idx:end_flow_props_idx), &
                            nprops_UMAT,coords_kelem_kIP_t,dR_rotation,pnewdt,celent, &
                            F_grad_bar_tm1,F_grad_bar_t,jelem,kinpt,layer,kspt,kstep,kinc)

        else if (UMAT_model == 2) then
            call UMAT_isotropic_vonMises(stress,statev,ddsdde,energy(2),energy(4),energy(3),rpl,ddsddt, &
                            drplde,drpldt,stran,dstran,time,dtime,temp,dtemp, &
                            predef_kIP_tm1,dpred_kIP,cmname,ndirect,nshear,ntensor,nstatev, &
                            props(start_mech_props_idx:end_flow_props_idx), &
                            nprops_UMAT,coords_kelem_kIP_t,dR_rotation,pnewdt,celent, &
                            F_grad_bar_tm1,F_grad_bar_t,jelem,kinpt,layer,kspt,kstep,kinc)

        end if

        ! Unless you invoke the unsymmetric equation solution capability for the user-defined material, 
        ! Abaqus/Standard will use only the symmetric part of DDSDDE

        ddsdde = 0.5d0 * (ddsdde + transpose(ddsdde))

        stress_t = stress ! stress at t
        stran_t = stran + dstran

        ! Update the state variables
        ! All other mechanical properties are already updated in statev in UMAT_von_Mises
        
        statev(sig_start_idx : sig_end_idx) = stress_t ! stress at t
        statev(stran_start_idx : stran_end_idx) = stran_t

        ! ********************************************!
        ! DISPLACEMENT CONTRIBUTION TO amatrx AND rhs !
        ! ********************************************!

        ! 8 nodes x 3 displacement dofs ux, uy, uz = 24

        if (lflags(2) == 0) then 

            ! nlgeom=off
            ! =======================================
            amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) = &
                amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) + dvol_inter_t * &
                                (matmul(matmul(transpose(Bu_bar_t),ddsdde),Bu_bar_t))
                
            rhs(start_ux_idx:end_ux_idx,nrhs) = rhs(start_ux_idx:end_ux_idx,nrhs) - &
                dvol_inter_t * (matmul(transpose(Bu_bar_t),stress_t))    

        else if (lflags(2) == 1) then

            ! ! nlgeom=on
            ! ! =======================================
            ! amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) = &
            !     amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) + dvol_inter_t * &
            !                     (matmul(matmul(transpose(Bu_bar_t),ddsdde),Bu_bar_t))
                
            ! rhs(start_ux_idx:end_ux_idx,nrhs) = rhs(start_ux_idx:end_ux_idx,nrhs) - &
            !     dvol_inter_t * (matmul(transpose(Bu_bar_t),stress_t))    


            K_material = matmul(matmul(transpose(Bu_bar_t),ddsdde),Bu_bar_t)

            call stress_voigt_to_tensor(stress_t, stress_tensor_t, ntensor, ndim)

            K_geometry = 0.0d0

            do i = 1, nnode
                do j = 1, nnode
                    do alpha = 1, ndim
                        do beta = 1, ndim

                            ! Enforce Kronecker delta: only accumulate diagonal blocks
                            if (alpha == beta) then
                                temp = 0.0d0
                                do gamma = 1, ndim
                                    do delta = 1, ndim
                                        temp = temp + stress_tensor_t(gamma, delta) * &
                                            (2.0d0 * N_grad_NP_inter_to_kIP_inter_global_t(i, gamma) * &
                                                        N_grad_NP_inter_to_kIP_inter_global_t(j, delta) - &
                                                        N_grad_NP_inter_to_kIP_inter_global_t(j, gamma) * &
                                                        N_grad_NP_inter_to_kIP_inter_global_t(i, delta))
                                    end do
                                end do
                                irow = ndim * (i - 1) + alpha
                                jcol = ndim * (j - 1) + beta
                                K_geometry(irow, jcol) = K_geometry(irow, jcol) + temp
                            end if

                        end do
                    end do
                end do
            end do



            amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) = &
                amatrx(start_ux_idx:end_ux_idx,start_ux_idx:end_ux_idx) + dvol_inter_t * &
                                (K_material + K_geometry)
                
            rhs(start_ux_idx:end_ux_idx,nrhs) = rhs(start_ux_idx:end_ux_idx,nrhs) - &
                dvol_inter_t * (matmul(transpose(Bu_bar_t),stress_t))   


        end if
        
        ! ================================================================== !
        !                                                                    !
        !               SOLVING THE HYDROGEN DIFFUSION FIELD                 !
        !                                                                    !
        ! ================================================================== !

        ! From UMATHT subroutine
        ! Variables to be defined
        ! C_pred_mol_kIP: Total hydrogen concentration at the end of increment. 
        !         This variable is passed in as the value at the start of the increment (C_pred_mol_kIP_tm1)
        !         and must be updated to its value at the end of the increment (C_pred_mol_kIP_t).
        ! dC_mol_dCL_mol_kIP_t: Variation of total hydrogen concentration with respect to lattice hydrogen concentration, 
        !         ∂C_mol/∂CL_mol, evaluated at the end of the increment.
        ! dC_mol_dgrad_CL_mol_kIP_t(ndim): Variation of total hydrogen concentration with respect to the 
        !           spatial gradients of lattice hydrogen concentration, ∂C_mol/∂(∂CL_mol/∂x), evaluated at the end of the increment.
        !           The size of this array depends on ndim and it is typically zero in classical hydrogen diffusion analysis.
        ! flux_hydro_kIP(ndim): Hydrogen flux vector at the end of the increment. 
        !            This variable is passed in with the values at the beginning of the increment (flux_hydro_kIP_tm1) and 
        !            must be updated to the values at the end of the increment (flux_hydro_kIP_t).
        ! dflux_hydro_dCL_mol_kIP_t(ndim): Variation of the hydrogen flux vector with respect to lattice hydrogen concentration, 
        !        ∂q/∂CL_mol, evaluated at the end of the increment.
        ! dflux_hydro_dgrad_CL_mol_kIP_t(ndim,ndim): Variation of the hydrogen flux vector with respect to the spatial gradients of lattice hydrogen concentration,
        !        ∂f/∂(∂CL_mol/∂x), evaluated at the end of the increment.

        ! However, because we are in UEL, there is no reason we should be limited to the 6 terms enforced by the UMATHT subroutine.
        ! Therefore, we can define an additional term for the diffusitivity matrix K_hydro_kIP_t that is built on an additional term
        ! dC_mol_dtime

        ! Variables passed in for information
        ! CL_mol_kIP_tm1: Lattice hydrogen concentration at the start of the increment.
        ! dCL_mol_kIP: Increment of lattice hydrogen concentration.
        ! CL_mol_grad_kIP_t: Current values of the spatial gradients of lattice hydrogen concentration, ∂CL_mol/∂x.
        ! C_mol_kIP_tm1 is at the beginning of the increment

        ! CL_mol_kIP_tm1, dCL_mol_kIP, CL_mol_grad_kIP_t, C_mol_kIP are all defined at integration points

        ! From HETVAL subroutine
        ! Variables to be defined
        ! r_hydro_kIP_t: Hydrogen flux at this material calculation point.
        ! dr_hydro_dCL_mol_kIP_t: Variation of hydrogen flux with respect to lattice hydrogen concentration, ∂r/∂CL_mol. 
        ! This variable is nonzero only if the hydrogen flux depends on lattice hydrogen concentration. It is needed to define a correct Jacobian matrix.
        
        ! Variables passed in for information
        ! CL_mol_kIP_t: Lattice hydrogen concentration at the end of the increment.
        ! dCL_mol_kIP: Increment of lattice hydrogen concentration.

        N_shape_NP_inter_to_kIP_extra(1:nnode) = all_N_shape_NP_inter_to_kIP_extra(kinpt,1:nnode)
        N_grad_NP_inter_to_kIP_extra_local(1:nnode,1:ndim) = all_N_grad_NP_inter_to_kIP_extra_local(kinpt,1:nnode,1:ndim) 

        xjac_extra_t = matmul(coords_kelem_NPs_t, N_grad_NP_inter_to_kIP_extra_local)
        call calc_matrix_inv(xjac_extra_t, xjac_inv_extra_t, djac_extra_t, ndim)

        N_grad_NP_inter_to_kIP_extra_global_t = matmul(N_grad_NP_inter_to_kIP_extra_local, xjac_inv_extra_t)
        
        CL_mol_kIP_tm1 = dot_product(N_shape_NP_inter_to_kIP_inter, CL_mol_NPs_tm1)
        CL_mol_kIP_t = dot_product(N_shape_NP_inter_to_kIP_inter, CL_mol_NPs_t)
        dCL_mol_kIP = CL_mol_kIP_t - CL_mol_kIP_tm1
        CL_mol_grad_kIP_t = matmul(transpose(N_grad_NP_inter_to_kIP_inter_global_t), CL_mol_NPs_t)
        
        ! In mass diffusion analogy to heat transfer
        ! the internal energy of heat transfer is also equivalent to the temperature in the mass diffusion framework
        ! which means that the density is 1

        rho_hydro = 1.0d0

        C_pred_mol_kIP = statev(C_pred_mol_idx)
        C_pred_mol_kIP_tm1 = C_pred_mol_kIP ! C_pred_mol_kIP at tm1
        
        flux_hydro_kIP(1) = statev(flux_hydro_X_idx)
        flux_hydro_kIP(2) = statev(flux_hydro_Y_idx)
        flux_hydro_kIP(3) = statev(flux_hydro_Z_idx)
        flux_hydro_kIP_tm1 = flux_hydro_kIP ! flux_hydro_kIP at tm1

        nprops_UMATHT_hydro_transfer = end_CL_mol_props_idx - start_CL_mol_props_idx + 1

        ! UMATHT official documentation
        ! https://help.3ds.com/2025/english/dssimulia_established/SIMACAESUBRefMap/simasub-c-umatht.htm?contextscope=all

        UMATHT_hydro_model = props(start_CL_mol_props_idx)

        ! UMATHT_hydro_model = 1: Oriani model
        ! UMATHT_hydro_model = 2: McNabb Foster model

        if (UMATHT_hydro_model == 1) then
            call UMATHT_hydrogen_Oriani(C_pred_mol_kIP,dC_mol_dCL_mol_kIP_t,dC_mol_dgrad_CL_mol_kIP_t, &
                                    flux_hydro_kIP,dflux_hydro_dCL_mol_kIP_t,dflux_hydro_dgrad_CL_mol_kIP_t, &
                                    ! New term introduced in UMATHT only for hydrogen diffusion model
                                    ddC_mol_dCL_mol_kIP_t, &
                                    statev,CL_mol_kIP_tm1,dCL_mol_kIP,CL_mol_grad_kIP_t,time,dtime, &
                                    predef_kIP_tm1,dpred_kIP,cmname,ndim,nstatev, &
                                    props(start_CL_mol_props_idx:end_CL_mol_props_idx), &
                                    nprops_UMATHT_hydro_transfer,coords_kelem_kIP_t, &
                                    pnewdt,jelem,kinpt,layer,kspt,kstep,kinc)

            call HETVAL_hydrogen_Oriani(cmname,CL_mol_kIP_t,dCL_mol,time,dtime, &
                                    statev,r_hydro_kIP_t,dr_hydro_dCL_mol_kIP_t,predef_kIP_tm1,dpred_kIP)

        end if

        C_pred_mol_kIP_t = C_pred_mol_kIP ! C_mol_kIP is updated as C_mol_kIP_t
        statev(C_pred_mol_idx) = C_pred_mol_kIP_t

        ! flux_hydro_kIP is updated as flux_hydro_kIP_t
        flux_hydro_kIP_t(1) = flux_hydro_kIP(1)
        flux_hydro_kIP_t(2) = flux_hydro_kIP(2)
        flux_hydro_kIP_t(3) = flux_hydro_kIP(3)
        statev(flux_hydro_X_idx) = flux_hydro_kIP_t(1)
        statev(flux_hydro_Y_idx) = flux_hydro_kIP_t(2)
        statev(flux_hydro_Z_idx) = flux_hydro_kIP_t(3)
        
        dC_mol_kIP = C_pred_mol_kIP_t - C_pred_mol_kIP_tm1

        ! Matrix multiplication is associative 

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, 1) @ (1, nnode)
        K_hydro_dfdCL_kIP_t    = - matmul( &
                                        N_grad_NP_inter_to_kIP_inter_global_t, & 
                                        matmul(reshape(dflux_hydro_dCL_mol_kIP_t, [ndim, 1]), & 
                                        reshape(N_shape_NP_inter_to_kIP_inter, [1, nnode])) &
                                        )

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, ndim) @ (ndim, nnode)
        K_hydro_dfdgCL_kIP_t   = - matmul(N_grad_NP_inter_to_kIP_inter_global_t, & 
                                             matmul(dflux_hydro_dgrad_CL_mol_kIP_t, transpose(N_grad_NP_inter_to_kIP_inter_global_t)))

        ! (nnode, nnode) = (nnode, ndim) @ scalar @ (ndim, nnode)
        K_hydro_drdCL_kIP_t    = - dr_hydro_dCL_mol_kIP_t * matmul( &
                                        reshape(N_shape_NP_inter_to_kIP_inter, [nnode, 1]), &
                                        reshape(N_shape_NP_inter_to_kIP_inter, [1, nnode]) &
                                        ) 

        ! New term introduced in UMATHT only for hydrogen diffusion model
        ! (nnode, nnode) = scalar * (nnode, 1) @ (1, nnode)

        K_hydro_ddCdCL_kIP_t = + ddC_mol_dCL_mol_kIP_t * matmul( &
                                        reshape(N_shape_NP_inter_to_kIP_inter, [nnode, 1]), &
                                        reshape(N_shape_NP_inter_to_kIP_inter, [1, nnode]) &
                                        ) 

        K_hydro_kIP_t = K_hydro_dfdCL_kIP_t + K_hydro_dfdgCL_kIP_t + K_hydro_drdCL_kIP_t ! + K_hydro_ddCdCL_kIP_t


        ! (nnode, nnode) = (nnode, 1) @ (1, nnode)
        M_hydro_dCdCL_kIP_t    = + rho_hydro * dC_mol_dCL_mol_kIP_t * matmul( &
                                        reshape(N_shape_NP_inter_to_kIP_extra, [nnode, 1]), &
                                        reshape(N_shape_NP_inter_to_kIP_extra, [1, nnode]) &
                                        ) 
        
        ! (nnode, nnode) = (nnode, 1) @ (1, ndim) @ (ndim, nnode)
        M_hydro_dCdgCL_kIP_t    = + rho_hydro * matmul( &
                                        reshape(N_shape_NP_inter_to_kIP_extra, [nnode, 1]), &
                                        matmul(reshape(dC_mol_dgrad_CL_mol_kIP_t, [1, ndim]), &
                                               transpose(N_grad_NP_inter_to_kIP_extra_global_t)))
        
        M_hydro_kIP_t = M_hydro_dCdCL_kIP_t + M_hydro_dCdgCL_kIP_t

        ! (nnode) = (nnode, ndim) @ (ndim)
        F_hydro_flux_kIP_t  = - matmul(N_grad_NP_inter_to_kIP_inter_global_t, flux_hydro_kIP_t)

        ! (nnode) = (nnode) * scalar
        F_hydro_r_kIP_t = - N_shape_NP_inter_to_kIP_inter * r_hydro_kIP_t

        ! (nnode) = (nnode) * scalar * scalar
        F_hydro_dC_kIP_t = + N_shape_NP_inter_to_kIP_extra * rho_hydro * dC_mol_kIP

        ! **************************************************!
        ! HYDROGEN DIFFUSION CONTRIBUTION TO amatrx AND rhs !
        ! **************************************************!

        ! Steady-State Thermal Analysis has flags(1) = 31
        ! Transient Thermal Analysis has flags(1) = 32 or 33

        ! Steady-State Fully Coupled Thermal-Stress Analysis has lflags(1) = 71
        ! Transient Fully Coupled Thermal-Stress Analysis has lflags(1) = 72 or 73

        ! In steady state analysis, the internal hydrogen change and hydrogen mass capacitance is zero
        if (lflags(1) == 31 .or. lflags(1) == 71) then
            M_hydro_kIP_t = 0.0d0
            F_hydro_dC_kIP_t = 0.0d0
        end if 

        ! BEWARE: AT THE FIRST INCREMENT, DTIME IS ZERO
        ! WE SHOULD SKIP THE FIRST INCREMENT FOR THE HYDROGEN TRANSFER FIELD

        ! if (kinc > 1) then
        !     amatrx(start_CL_mol_idx:end_CL_mol_idx,start_CL_mol_idx:end_CL_mol_idx) = &
        !         amatrx(start_CL_mol_idx:end_CL_mol_idx,start_CL_mol_idx:end_CL_mol_idx) &
        !         + dvol_inter_t * (K_hydro_kIP_t + M_hydro_kIP_t/dtime)
                
        !     rhs(start_CL_mol_idx:end_CL_mol_idx,nrhs) = rhs(start_CL_mol_idx:end_CL_mol_idx,nrhs) &
        !         - dvol_inter_t * (F_hydro_r_kIP_t + F_hydro_flux_kIP_t + F_hydro_dC_kIP_t/dtime)
        ! end if
        ! ================================================================== !
        !                                                                    !
        !                    SOLVING THE HEAT TRANSFER FIELD                 !
        !                                                                    !
        ! ================================================================== !
        
        ! From UMATHT subroutine
        ! Variables to be defined
        ! u_heat_kIP: Internal thermal energy per unit mass, U, at the end of increment. 
        !         This variable is passed in as the value at the start of the increment (u_heat_kIP_tm1)
        !         and must be updated to its value at the end of the increment (u_heat_kIP_t).
        ! dudt_heat_kIP_t: Variation of internal thermal energy per unit mass with respect to temperature, 
        !         ∂U/∂θ, evaluated at the end of the increment.
        ! dudg_heat_kIP_t(ndim): Variation of internal thermal energy per unit mass with respect to the 
        !           spatial gradients of temperature, ∂U/∂(∂θ/∂x), evaluated at the end of the increment.
        !           The size of this array depends on ndim and it is typically zero in classical heat transfer analysis.
        ! flux_heat_kIP(ndim): Heat flux vector at the end of the increment. 
        !            This variable is passed in with the values at the beginning of the increment (flux_heat_kIP_tm1) and 
        !            must be updated to the values at the end of the increment (flux_heat_kIP_t).
        ! dfdt_heat_kIP_t(ndim): Variation of the heat flux vector with respect to temperature, 
        !        ∂q/∂θ, evaluated at the end of the increment.
        ! dfdg_heat_kIP_t(ndim,ndim): Variation of the heat flux vector with respect to the spatial gradients of temperature,
        !        ∂f/∂(∂θ/∂x), evaluated at the end of the increment.

        ! Variables passed in for information
        ! temp_kIP_tm1: Temperature at the start of the increment.
        ! dtemp_kIP: Increment of temperature.
        ! temp_grad_kIP_t: Current values of the spatial gradients of temperature, ∂θ/∂x.
        ! u_heat_kIP_tm1 is at the beginning of the increment

        ! temp_kIP_tm1, dtemp_kIP, temp_grad_kIP_t, u_heat_kIP are all defined at integration points

        ! From HETVAL subroutine
        ! Variables to be defined
        ! r_heat_kIP_t: Heat flux (thermal energy per time per volume: JT−1L−3), at this material calculation point.
        ! drdt_heat_kIP_t: Variation of heat flux with respect to temperature, ∂r/∂θ. 
        ! This variable is nonzero only if the heat flux depends on temperature. It is needed to define a correct Jacobian matrix.
        
        ! Variables passed in for information
        ! temp_kIP_t: Temperature at the end of the increment.
        ! dtemp_kIP: Increment of temperature.
        
        N_shape_NP_inter_to_kIP_extra(1:nnode) = all_N_shape_NP_inter_to_kIP_extra(kinpt,1:nnode)
        N_grad_NP_inter_to_kIP_extra_local(1:nnode,1:ndim) = all_N_grad_NP_inter_to_kIP_extra_local(kinpt,1:nnode,1:ndim) 

        xjac_extra_t = matmul(coords_kelem_NPs_t, N_grad_NP_inter_to_kIP_extra_local)
        call calc_matrix_inv(xjac_extra_t, xjac_inv_extra_t, djac_extra_t, ndim)

        N_grad_NP_inter_to_kIP_extra_global_t = matmul(N_grad_NP_inter_to_kIP_extra_local, xjac_inv_extra_t)
        
        temp_kIP_tm1 = dot_product(N_shape_NP_inter_to_kIP_inter, temp_NPs_tm1)
        temp_kIP_t = dot_product(N_shape_NP_inter_to_kIP_inter, temp_NPs_t)
        dtemp_kIP = temp_kIP_t - temp_kIP_tm1
        temp_grad_kIP_t = matmul(transpose(N_grad_NP_inter_to_kIP_inter_global_t), temp_NPs_t)
        
        rho_heat = props(start_temp_props_idx)

        ! The internal energy per unit mass
        u_heat_kIP = statev(u_heat_idx)
        u_heat_kIP_tm1 = u_heat_kIP ! u_heat_kIP at tm1
        
        flux_heat_kIP(1) = statev(flux_heat_X_idx)
        flux_heat_kIP(2) = statev(flux_heat_Y_idx)
        flux_heat_kIP(3) = statev(flux_heat_Z_idx)
        flux_heat_kIP_tm1 = flux_heat_kIP ! flux_heat_kIP at tm1

        nprops_UMATHT_heat_transfer = end_temp_props_idx - start_temp_props_idx + 1

        ! UMATHT official documentation
        ! https://help.3ds.com/2025/english/dssimulia_established/SIMACAESUBRefMap/simasub-c-umatht.htm?contextscope=all

        call UMATHT_heat_transfer(u_heat_kIP,dudt_heat_kIP_t,dudg_heat_kIP_t, &
                                  flux_heat_kIP,dfdt_heat_kIP_t,dfdg_heat_kIP_t, &
                                  statev,temp_kIP_tm1,dtemp_kIP,temp_grad_kIP_t,time,dtime, &
                                  predef_kIP_tm1,dpred_kIP,cmname,ndim,nstatev, &
                                  props(start_temp_props_idx:end_temp_props_idx), &
                                  nprops_UMATHT_heat_transfer,coords_kelem_kIP_t, &
                                  pnewdt,jelem,kinpt,layer,kspt,kstep,kinc)

        call HETVAL_heat_transfer(cmname,temp_kIP_t,dtemp,time,dtime, &
                                  statev,r_heat_kIP_t,drdt_heat_kIP_t,predef_kIP_tm1,dpred_kIP)

        u_heat_kIP_t = u_heat_kIP ! u_heat_kIP is updated as u_heat_kIP_t
        statev(u_heat_idx) = u_heat_kIP

        ! flux_heat_kIP is updated as flux_heat_kIP_t
        flux_heat_kIP_t(1) = flux_heat_kIP(1)
        flux_heat_kIP_t(2) = flux_heat_kIP(2)
        flux_heat_kIP_t(3) = flux_heat_kIP(3)
        statev(flux_heat_X_idx) = flux_heat_kIP_t(1)
        statev(flux_heat_Y_idx) = flux_heat_kIP_t(2)
        statev(flux_heat_Z_idx) = flux_heat_kIP_t(3)
        
        du_heat_kIP = u_heat_kIP_t - u_heat_kIP_tm1

        ! Matrix multiplication is associative 
        
        ! These terms dfdt and dfdg are for the K_heat_kIP_t matrix

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, 1) @ (1, nnode)
        K_heat_dfdt_kIP_t    = - matmul( &
                                        N_grad_NP_inter_to_kIP_inter_global_t, & 
                                        matmul(reshape(dfdt_heat_kIP_t, [ndim, 1]), & 
                                        reshape(N_shape_NP_inter_to_kIP_inter, [1, nnode])) &
                                        )

        ! (nnode, nnode) = (nnode, ndim) @ (ndim, ndim) @ (ndim, nnode)
        K_heat_dfdg_kIP_t   = - matmul(N_grad_NP_inter_to_kIP_inter_global_t, & 
                                             matmul(dfdg_heat_kIP_t, transpose(N_grad_NP_inter_to_kIP_inter_global_t)))

        ! (nnode, nnode) = (nnode, ndim) @ scalar @ (ndim, nnode)
        K_heat_drdt_kIP_t    = - drdt_heat_kIP_t * matmul( &
                                        reshape(N_shape_NP_inter_to_kIP_inter, [nnode, 1]), &
                                        reshape(N_shape_NP_inter_to_kIP_inter, [1, nnode]) &
                                        ) 

        K_heat_kIP_t = K_heat_dfdt_kIP_t + K_heat_dfdg_kIP_t + K_heat_drdt_kIP_t

        ! These terms dudt and dudg are for the M_heat_kIP_t matrix

        ! This code is valid for quadratic elements

        ! (nnode, nnode) = (nnode, 1) @ (1, nnode)
        ! M_heat_dudt_kIP_t    = + rho_heat * dudt_heat_kIP_t * matmul( &
        !                                 reshape(N_shape_NP_inter_to_kIP_inter, [nnode, 1]), &
        !                                 reshape(N_shape_NP_inter_to_kIP_inter, [1, nnode]) &
        !                                 ) 
        
        ! ! (nnode, nnode) = (nnode, 1) @ (1, ndim) @ (ndim, nnode)
        ! M_heat_dudg_kIP_t    = + rho_heat * matmul( &
        !                                 reshape(N_shape_NP_inter_to_kIP_inter, [nnode, 1]), &
        !                                 matmul(reshape(dudg_heat_kIP_t, [1, ndim]), &
        !                                        N_grad_NP_inter_to_kIP_inter_global_t))

        ! This code is valid for quadratic elements

        ! (nnode, nnode) = (nnode, 1) @ (1, nnode)
        M_heat_dudt_kIP_t    = + rho_heat * dudt_heat_kIP_t * matmul( &
                                        reshape(N_shape_NP_inter_to_kIP_extra, [nnode, 1]), &
                                        reshape(N_shape_NP_inter_to_kIP_extra, [1, nnode]) &
                                        ) 
        
        ! (nnode, nnode) = (nnode, 1) @ (1, ndim) @ (ndim, nnode)
        M_heat_dudg_kIP_t    = + rho_heat * matmul( &
                                        reshape(N_shape_NP_inter_to_kIP_extra, [nnode, 1]), &
                                        matmul(reshape(dudg_heat_kIP_t, [1, ndim]), &
                                               transpose(N_grad_NP_inter_to_kIP_extra_global_t)))
        
        M_heat_kIP_t = M_heat_dudt_kIP_t + M_heat_dudg_kIP_t

        ! (nnode) = (nnode, ndim) @ (ndim)
        F_heat_flux_kIP_t  = - matmul(N_grad_NP_inter_to_kIP_inter_global_t, flux_heat_kIP_t)

        ! (nnode) = (nnode) * scalar
        F_heat_r_kIP_t = - N_shape_NP_inter_to_kIP_inter * r_heat_kIP_t

        ! (nnode) = (nnode) * scalar * scalar
        ! This code is valid for quadratic elements

        ! F_heat_du_kIP_t = + N_shape_NP_inter_to_kIP_inter * rho_heat * du_heat_kIP 

        ! This code is valid for linear elements

        F_heat_du_kIP_t = + N_shape_NP_inter_to_kIP_extra * rho_heat * du_heat_kIP

        ! *********************************************!
        ! HEAT TRANSFER CONTRIBUTION TO amatrx AND rhs !
        ! *********************************************!

        ! 3D case
        ! 8 nodes x 1 heat concentration dof = 8
        ! print *, 'dtime = ', dtime

        ! Steady-State Heat Transfer Analysis has flags(1) = 31
        ! Transient Heat Transfer Analysis has flags(1) = 32 or 33

        ! Steady-State Fully Coupled Thermal-Stress Analysis has lflags(1) = 71
        ! Transient Fully Coupled Thermal-Stress Analysis has lflags(1) = 72 or 73

        ! In steady state analysis, the internal heat change and heat capacitance is zero
        if (lflags(1) == 31 .or. lflags(1) == 71) then
            M_heat_kIP_t = 0.0d0
            F_heat_du_kIP_t = 0.0d0
        end if 

        ! BEWARE: AT THE FIRST INCREMENT, THE TIME STEP IS ZERO
        ! WE SHOULD SKIP THE FIRST INCREMENT FOR THE HEAT TRANSFER FIELD
        ! if (kinc > 1) then
        !     amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) = &
        !         amatrx(start_temp_idx:end_temp_idx,start_temp_idx:end_temp_idx) &
        !         + dvol_inter_t * (K_heat_kIP_t + M_heat_kIP_t/dtime)
                
        !     rhs(start_temp_idx:end_temp_idx,nrhs) = rhs(start_temp_idx:end_temp_idx,nrhs) &
        !         - dvol_inter_t * (F_heat_r_kIP_t + F_heat_flux_kIP_t + F_heat_du_kIP_t/dtime)
        ! end if

        ! ================================================================== !
        !                                                                    !
        !                    TRANSFERRING DATA STAGE                         !
        !                                                                    !
        ! ================================================================== !

        !   Transfer data from statev to svars
        !   This stage basically updates the state variables for the current IP 
        
        call move_between_statev_and_svars(kinpt,statev,nstatev,svars,nsvars,0)
        
        !   Transfer data from statev to dummy mesh for visualization
        
        user_vars(jelem,1:nstatev,kinpt) = statev(1:nstatev)

    end do       ! end loop on material integration points

return
end
    

!***********************************************************************
! This is only a dummy subroutine to transfer data from UEL element into the dummy C3D8 element
! It does not contribute any stress or stiffness at all
!***********************************************************************

subroutine UMAT(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp,dtemp,predef,dpred, &
    cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    use common_block
    include 'aba_param.inc' 

    character*8 cmname
    dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens), &
        ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens), &
        time(2),predef(1),dpred(1),props(nprops),coords(3),drot(3,3), &
        dfgrd0(3,3),dfgrd1(3,3),jstep(4)

    ddsdde = 0.0d0
    noffset = noel - total_elems    
    ! total_elems: number of elements of UEL: [1, total_elems]
    ! noel: number of elements of UMAT: [total_elems + 1, 2 * total_elems]
    ! => noffset: number of elements of UMAT offset by total_elems: [total_elems + 1, 2 * total_elems] - total_elems = [1, total_elems]
    do kuvarm = 1, nuvarm
        original_SDV_idx = uvarm_indices(kuvarm)
        statev(kuvarm) = user_vars(noffset,original_SDV_idx,npt)
    end do

return
end


!***********************************************************************
! Dummy UMATHT that exists only for the dummy element. It does nothing
!***********************************************************************

subroutine UMATHT(u,dudt,dudg,flux,dfdt,dfdg, &
    statev,temp,dtemp,dtemdx,time,dtime,predef,dpred, &
    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
    noel,npt,layer,kspt,kstep,kinc)

    use precision
    use common_block
    inCLude 'aba_param.inc'

    character(len=80) :: cmname
    dimension dudg(ntgrd),flux(ntgrd),dfdt(ntgrd), &
      dfdg(ntgrd,ntgrd),statev(nstatv),dtemdx(ntgrd), &
      time(2),predef(*),dpred(*),props(nprops),coords(3)

    u = 0.0d0
    dudt = 0.0d0
    dudg = 0.0d0
    flux = 0.0d0
    dfdt = 0.0d0
    dfdt = 0.0d0

return
end

! ==============================================================
! Subroutine for checking damage criterion and stop the analysis
! ==============================================================

subroutine URDFIL(lstop,lovrwrt,kstep,kinc,dtime,time)
    use precision
    use common_block
    include 'aba_param.inc'

    dimension array(513),jrray(nprecd,513),time(2)
    ! equivalence (array(1),jrray(1,1))

    ! user coding to read the results file

return
end