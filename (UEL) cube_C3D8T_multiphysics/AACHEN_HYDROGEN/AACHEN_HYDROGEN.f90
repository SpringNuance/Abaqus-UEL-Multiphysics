!====================================================================
!          Program for mechanical loading and hydrogen diffusion 
!          Mechanical model: standard Hooke's law elasticity 
!                            isotropic Von Mises plasticity
!                            evolving nonassociated anisotropic Hill48 plasticity (enHill48)
!                            conventional mechanism-based strain gradient (CMSG)
!
!          Hydrogen diffusion model: Fick's second law 
!                                    with effects of hydrostatic stress gradient and trapping mechanisms
!          Damage model: flow stress softening 
!                        modified Bai-Wierzbicki model
! 
!          by Nguyen Xuan Binh
!          binh.nguyen@aalto.fi
!          July 2024, Abaqus 2023
!          DO NOT DISTRIBUTE WITHOUT AUTHOR'S PERMISSION
!====================================================================

! Include files
include 'precision.f90'
include 'userinputs.f90'
include 'common_block.f90'
include 'utilities.f90'

! 2D elements
include 'elements/CPE4_element.f90'
include 'elements/CPE4R_element.f90'

! 3D elements
include 'elements/C3D8_element.f90'
include 'elements/C3D8R_element.f90'

! Constructing mesh connectivity
include 'mesh_connectivity.f90'

! Initialize shape functions and their gradient
include 'elements/shape_functions.f90'

! Gradient for sig_H and eqplas
include 'scalar_gradient.f90'



! Please read Binh's Master Thesis to understand how Abaqus subroutines are assembled
! https://github.com/SpringNuance/Master-Thesis-Hydrogen-Official/blob/main/00%20Official%20Thesis%20Manuscript/master_Nguyen_Binh_2024.pdf

! IO = 100 for general purposes

! Code	Unit Number	Description
! ABAQUS/Standard	1	Internal database
!  	                2	Solver file
!  	                6	Printed output (.dat) file (You can write output to this file.)
!  	                7	Message (.msg) file (You can write output to this file.)
!  	                8	Results (.fil) file
!  	                10	Internal database
!  	                12	Restart (.res) file
!  	                19–30	Internal databases (scratch files). Unit numbers 21 and 22 are always written to disk.
!  	                73	Text file containing meshed beam cross-section properties (.bsp)


! Code	Unit Number	Description
! ABAQUS/Explicit Analysis	    6	Printed output (.log or .sta) file (You can write output to the .sta file.)
!                               60	Package (.pac) file
!  	                            61	State (.abq) file
!  	                            62	Temporary file
!  	                            63	Selected results (.sel) file
!  	                            64	Message (.msg) file
!  	                            69	Internal database; temporary file

! https://classes.engineering.wustl.edu/2009/spring/mase5513/abaqus/docs/v6.6/books/usb/default.htm?startat=pt01ch03s06aus30.html
!***********************************************************************

subroutine UEXTERNALDB(lop,lrestart,time,dtime,kstep,kinc)
    use precision
    use common_block

    include 'aba_param.inc' 
    dimension time(2)
        
    ! lop = 0 indicates that UEXTERNALDB is called at the start of the analysis
    ! lop = 4 indicates that UEXTERNALDB is called at the start of the restart analysis
    
    if (lop == 0 .or. lop == 4) then

        ! Ensuring that only one thread is accessing the shared memory
        
        do klock = 1, 40
            call mutexInit(klock)
        end do
        
        call mutexLock(1)

        ! ========================================================
        ! Initialize all common matrixes as zeros
        ! ========================================================

        sig_H_all_elems_at_inpts = 0.0d0
        sig_H_all_elems_at_nodes = 0.0d0
        sig_H_at_nodes = 0.0d0
        sig_H_grad_all_elems_at_inpts = 0.0d0
    
        eqplas_all_elems_at_inpts = 0.0d0
        eqplas_all_elems_at_nodes = 0.0d0
        eqplas_at_nodes = 0.0d0
        eqplas_grad_all_elems_at_inpts = 0.0d0
        
        coords_all_inpts = 0.0d0
        coords_all_nodes = 0.0d0
        djac_all_elems_at_nodes = 0.0d0

        ! ========================================================
        ! BUILDING THE CONNECTIVITY MATRIX
        ! elems_to_nodes_matrix: (total_elems, nnode)
        ! nodes_to_elems_matrix: (total_nodes, nmax_elems, 2)
        ! num_elems_of_nodes_matrix: (nnode)
        ! ========================================================

        call build_elems_to_nodes_matrix() ! for elems_to_nodes_matrix
        call build_nodes_to_elems_matrix() ! for nodes_to_elems_matrix and num_elems_of_nodes_matrix

        ! print *, 'elems_to_nodes_matrix = '
        ! do ielem = 1, 10
        !     print *, elems_to_nodes_matrix(ielem, :)
        ! end do
        ! print *, 'nodes_to_elems_matrix = '
        ! do inode = 1, 10
        !     print *, nodes_to_elems_matrix(inode, :, :)
        ! end do
        ! print *, 'num_elems_of_nodes_matrix = '
        ! do inode = 1, 10
        !     print *, num_elems_of_nodes_matrix(inode)
        ! end do

        ! call pause(180)

        ! ========================================================
        ! CALCULATING SHAPE FUNCTIONS AND THE SHAPE FUNCTION GRADIENT
        ! W.R.T LOCAL COORDINATES. THESE VALUES NEVER CHANGE DURING THE ANALYSIS
        ! all_N_inpt_to_local_knode: (nnode, ninpt)
        ! all_N_node_to_local_kinpt: (ninpt, nnode)
        ! all_N_grad_node_to_local_kinpt: (ninpt, ndim, nnode)
        ! all_N_grad_node_to_local_knode: (nnode, ndim, nnode)
        ! ========================================================

        call calc_shape_functions()

        ! print *, 'all_N_inpt_to_local_knode = '
        ! print *, all_N_inpt_to_local_knode

        ! print *, 'all_N_node_to_local_kinpt = '
        ! print *, all_N_node_to_local_kinpt

        ! print *, 'all_N_grad_node_to_local_kinpt = '
        ! print *, all_N_grad_node_to_local_kinpt

        ! print *, 'all_N_grad_node_to_local_knode = '
        ! print *, all_N_grad_node_to_local_knode

        ! Releasing the lock
        call mutexUnlock(1)

    end if

    ! lop = 2 indicates that UEXTERNALDB is called at the end of the current analysis increment
    
    if (lop == 2) then 

        call mutexLock(2)
        
        ! ========================================================
        ! Populating sig_H_all_elems_at_nodes(total_elems, nnode)
        !        and eqplas_all_elems_at_nodes(total_elems, nnode)
        ! by using N_inpt_to_local_knode to extrapolate from IPs to NPs
        ! ========================================================

        call calc_scalar_all_elems_at_nodes()
        ! print *, 'sig_H_all_elems_at_nodes = '
        ! print *, sig_H_all_elems_at_nodes
        ! call pause(180)

        ! print *, 'suceeeded calc_scalar_all_elems_at_nodes'

        ! ========================================================
        ! Populating djac_all_elems_at_nodes(total_elems, nnode)
        ! ========================================================

        call calc_djac_all_elems_at_nodes()
        ! print *, 'djac_all_elems_at_nodes = '
        ! print *, djac_all_elems_at_nodes
        ! call pause(180)

        ! print *, 'suceeeded calc_djac_all_elems_at_nodes'

        ! ========================================================
        ! Populating sig_H_at_nodes(total_nodes)
        !        and eqplas_at_nodes(total_nodes, ndim)
        ! Weighted average based on determinant of Jacobian
        ! ========================================================

        call calc_scalar_at_nodes()

        ! print *, 'sig_H_at_nodes = '
        ! print *, sig_H_at_nodes

        ! call pause(180)

        ! print *, 'suceeeded calc_scalar_at_nodes'
        
        call mutexUnlock(2)
        
    end if

return
end


subroutine USDFLD(field,statev,pnewdt,direct,t,celent, &
    time,dtime,cmname,orname,nfield,nstatv,noel,npt,layer, &
    kspt,kstep,kinc,ndi,nshr,coord,jmac,jmatyp,matlayo,laccfla)
    
    use precision
    use common_block
    include 'aba_param.inc'

    character*80 cmname,orname
    character*3  flgray(15)
    dimension field(nfield),statev(nstatv),direct(3,3), &
              t(3,3),time(2)
    dimension array(100),jarray(100),jmac(*),jmatyp(*),coord(*)

    !     the dimensions of the variables array and jarray
    !     must be set equal to or greater than 15.
    !     Number 100 is arbitrary, which can accomodate lots of SDV

    ! user coding to define field and, if necessary, statev and pnewdt

    ! Example of how to use usdfld (not related to HE)
    ! ! absolute value of current strain:
    ! call GETVRM('LE',array,jarray,flgray,jrcd,jmac,jmatyp,matlayo,laccfla)
    ! eps = abs( array(1) )
    ! ! maximum value of strain up to this point in time:
    ! call GETVRM('SDV',array,jarray,flgray,jrcd,jmac,jmatyp,matlayo,laccfla)
    ! epsmax = array(1)
    ! ! use the maximum strain as a field variable
    ! field(1) = max(eps, epsmax)
    ! ! store the maximum strain as a SDV
    ! statev(1) = field(1)

    !  Compute the gradient of the sig_H and gradient of eqplas 

    if (time(1) > 0) then
        call calc_scalar_grad_all_elems_at_inpts(noel, npt)
    end if 

return
end

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

    ! print *, 'UFIELD: node = ', node, 'coords = ', coords

    ! IMPORTANT: coords in this subroutine is NP coordinates, not IP coordinates
    ! like the one in UMAT and UMATHT

    call mutexInit(3)
    call mutexLock(3)

    ! Assign the current nodal coordinates to coords_all_nodes

    if (ndim == 3) then
        coords_all_nodes(node, 1) = coords(1)
        coords_all_nodes(node, 2) = coords(2)
        coords_all_nodes(node, 3) = coords(3)
    else if (ndim == 2) then
        coords_all_nodes(node, 1) = coords(1)
        coords_all_nodes(node, 2) = coords(2)
    end if

    ! Unlock Mutex #5
    call mutexUnlock(3)

return
end

include 'UMAT_models/UMAT_elastic.f90'
include 'UMAT_models/UMAT_vonMises.f90'
include 'UMAT_models/UMAT_enHill48.f90'

subroutine UMAT(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp2,dtemp,predef,dpred, &
    cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    use precision
    use common_block
    include 'aba_param.inc'

    character*8 cmname
    dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens), &
        ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens), &
        time(2),predef(1),dpred(1),props(nprops),coords(3),drot(3,3), &
        dfgrd0(3,3),dfgrd1(3,3),jstep(4)
    
    integer :: UMAT_model
    UMAT_model = props(1)
    
    if (UMAT_model == 1) then
        if (ndim == 3) then
            call UMAT_elastic_3D(stress, statev, ddsdde, sse, spd, scd, rpl, ddsddt, &
                drplde, drpldt, stran, dstran, time, dtime, temp2, dtemp, predef, dpred, &
                cmname, ndi, nshr, ntens, nstatv, props, nprops, coords, drot, pnewdt, &
                celent, dfgrd0, dfgrd1, noel, npt, layer, kspt, jstep, kinc)
        else if (ndim == 2) then
            call UMAT_elastic_2D(stress, statev, ddsdde, sse, spd, scd, rpl, ddsddt, &
                drplde, drpldt, stran, dstran, time, dtime, temp2, dtemp, predef, dpred, &
                cmname, ndi, nshr, ntens, nstatv, props, nprops, coords, drot, pnewdt, &
                celent, dfgrd0, dfgrd1, noel, npt, layer, kspt, jstep, kinc)
        end if
    else if (UMAT_model == 2) then
        if (ndim == 3) then
            call UMAT_vonMises_3D(stress, statev, ddsdde, sse, spd, scd, rpl, ddsddt, &
                drplde, drpldt, stran, dstran, time, dtime, temp2, dtemp, predef, dpred, &
                cmname, ndi, nshr, ntens, nstatv, props, nprops, coords, drot, pnewdt, &
                celent, dfgrd0, dfgrd1, noel, npt, layer, kspt, jstep, kinc)
        end if
        ! You can implement UMAT_vonMises_2D here if you want
    else if (UMAT_model == 3) then
        if (ndim == 3) then
            call UMAT_enHill48_3D(stress, statev, ddsdde, sse, spd, scd, rpl, ddsddt, &
                drplde, drpldt, stran, dstran, time, dtime, temp2, dtemp, predef, dpred, &
                cmname, ndi, nshr, ntens, nstatv, props, nprops, coords, drot, pnewdt, &
                celent, dfgrd0, dfgrd1, noel, npt, layer, kspt, jstep, kinc)
        end if
        ! enHill48 doesnt make much sense in 2D
    else
        write(7,*) 'Error: Invalid material model'
        
    end if

return
end

include 'UMATHT_models/UMATHT_Oriani.f90'
include 'UMATHT_models/UMATHT_McNabb_Foster.f90'

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
      time(2),predef(1),dpred(1),props(nprops),coords(3)

    integer :: UMATHT_model
    UMATHT_model = props(1)
    
    if (UMATHT_model == 1) then
        call UMATHT_Oriani(u,dudt,dudg,flux,dfdt,dfdg, &
                    statev,temp,dtemp,dtemdx,time,dtime,predef,dpred, &
                    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
                    noel,npt,layer,kspt,kstep,kinc)
    else if (UMAT_model == 2) then
        call UMATHT_McNabb_Foster(u,dudt,dudg,flux,dfdt,dfdg, &
                    statev,temp,dtemp,dtemdx,time,dtime,predef,dpred, &
                    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
                    noel,npt,layer,kspt,kstep,kinc)
    end if
return
end


subroutine UVARM(uvar,direct,t,time,dtime,cmname,orname, &
    nuvarm,noel,npt,layer,kspt,kstep,kinc,ndi,nshr,coord, &
    jmac,jmatyp,matlayo,laccfla)
    
    use common_block
    include 'aba_param.inc'
!
    character*80 cmname,orname
    character*3 flgray(1000)
    dimension uvar(nuvarm),direct(3,3),t(3,3),time(2)
    dimension array(1000),jarray(1000),jmac(*),jmatyp(*),coord(*)

    !     the dimensions of the variables flgray, array and jarray
    !     must be set equal to or greater than 15.
    !     Number 1000 is arbitrary, which can accomodate lots of SDV

    ! print *, 'UVARM: noel = ', noel, 'npt = ', npt, 'kinc = ', kinc
    ! call pause(180)
    ! Variables to Be Defined
    ! uvar(nuvarm)
    ! An array containing the user-defined output variables. 
    ! These are passed in as the values at the beginning of the increment 
    ! and must be returned as the values at the end of the increment.
    
    call GETVRM('SDV',array,jarray,flgray,jcrd,jmac,jmatyp,matlayo,laccfla)
    
    ! Choose only a subset of SDV to output
    ! If we output all SDV the odb file would be extremely heavy

    ! Manually define which sdv to be output
    ! Please refer to processing_input/depvar.xlsx for the list of chosen SDV
    
    do kuvar = 1, nuvarm
        kstatev = uvar_indices(kuvar)
        uvar(kuvar) = array(kstatev)
    end do
    
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

