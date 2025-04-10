!***********************************************************************

subroutine UMATHT_heat_transfer(u,dudt,dudg,flux,dfdt,dfdg, &
    statev,temp,dtemp,dtemdx,temp_kIP,dtemp_kIP,dtemdx_kIP,time,dtime,predef,dpred, &
    cmname,ntgrd,nstatv,props,nprops,coords,pnewdt, &
    noel,npt,layer,kspt,kstep,kinc)

    use precision
    use common_block
    inCLude 'aba_param.inc'

    character(len=80) :: cmname
    dimension dudg(ntgrd),flux(ntgrd),dfdt(ntgrd), &
      dfdg(ntgrd,ntgrd),statev(nstatv),dtemdx(ntgrd),dtemdx_kIP(ntgrd), &
      time(2),predef(*),dpred(*),props(nprops),coords(3)

    rho_heat = props(1)
    sfd_temp = props(2)
    cp_heat = props(3)
    conductivity = props(4)

    dudt = cp_heat
    u = u + dudt * dtemp
    
    dudg = 0.0d0
    dfdt = 0.0d0
    dfdg = 0.0d0

    do kdim=1,ntgrd
        flux(kdim) = - conductivity * dtemdx(kdim)
        dfdg(kdim,kdim) = - conductivity
    end do

    ! Even though temperature that we used at kIP is located at NP, for visualization
    ! It would be nice if we could show temperature at IP instead

    statev(temp_idx) = temp + dtemp
    statev(temp_grad_X_idx) = statev_grad_all_elems_at_IPs(temp_idx, noel, npt, 1)
    statev(temp_grad_Y_idx) = statev_grad_all_elems_at_IPs(temp_idx, noel, npt, 2)
    statev(temp_grad_Z_idx) = statev_grad_all_elems_at_IPs(temp_idx, noel, npt, 3)

    ! Update the statev_all_elems_at_IPs (VERY IMPORTANT)
    statev_all_elems_at_IPs(temp_idx, noel, npt) = temp + dtemp

end