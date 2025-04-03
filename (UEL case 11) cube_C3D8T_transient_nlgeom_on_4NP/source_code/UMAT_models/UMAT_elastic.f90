
!***********************************************************************

! Hookean elastic model

!***********************************************************************

subroutine UMAT_elastic(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt, &
    drplde,drpldt,stran,dstran,time,dtime,temp2,dtemp,predef,dpred, &
    cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt, &
    celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

    use precision
    use common_block
    !use ieee_arithmetic
    include 'aba_param.inc' 

    character*8 cmname
    dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens), &
        ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens), &
        time(2),predef(1),dpred(1),props(nprops),coords(3),drot(3,3), &
        dfgrd0(3,3),dfgrd1(3,3),jstep(4)
    
    real(kind=dp) :: E, nu, lambda, mu, eqplas, deqplas, sig_vonMises, sig_H, sig_P1, sig_P2, sig_P3, sig_Tresca  
    real(kind=dp) :: sig_principal_unsorted(ndim), sig_principal_sorted(ndim)
    real(kind=dp) :: sig_principal_dir(ndim, ndim)
    real(kind=dp) :: invariant_p, invariant_q, invariant_r, triaxiality, lode_norm
    real(kind=dp) :: sig_principal_1, sig_principal_2, sig_principal_3

    UMAT_model = props(1)  ! UMAT model number
    E = props(2)           ! Young's modulus 
    nu = props(3)          ! Poisson's ratio 
    
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

    !    Calculate predictor stress and elastic strain
    stress = stress + matmul(ddsdde,dstran)

    ! Calculate equivalent von Mises stress
    
    sig_vonMises = (stress(1) - stress(2))**2.0d0 + &
                   (stress(2) - stress(3))**2.0d0 + &
                   (stress(3) - stress(1))**2.0d0 + &
                    6.0d0 * (stress(4)**2.0d0 + stress(5)**2.0d0 + stress(6)**2.0d0)

    sig_vonMises = sqrt(sig_vonMises/2.0d0)
    
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
    
    !statev(sig_start_idx:sig_end_idx) = stress(1:ntens)
    !statev(stran_start_idx:stran_end_idx) = stran(1:ntens)
    statev(eqplas_idx) = 0.0d0
    statev(deqplas_idx) = 0.0d0
    statev(sig_H_idx) = sig_H
    statev(sig_H_grad_X_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 1)
    statev(sig_H_grad_Y_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 2)
    statev(sig_H_grad_Z_idx) = sig_H_grad_all_elems_at_inpts(noel, npt, 3)
    statev(sig_vonMises_idx) = sig_vonMises
    statev(sig_Tresca_idx) = sig_Tresca
    statev(sig_P1_idx) = sig_P1
    statev(triaxiality_idx) = triaxiality
    statev(lode_norm_idx) = lode_norm

    ! Update the sig_H_all_elems_at_inpts (VERY IMPORTANT)
    sig_H_all_elems_at_inpts(noel, npt) = sig_H
    eqplas_all_elems_at_inpts(noel, npt) = 0.0d0

return
end