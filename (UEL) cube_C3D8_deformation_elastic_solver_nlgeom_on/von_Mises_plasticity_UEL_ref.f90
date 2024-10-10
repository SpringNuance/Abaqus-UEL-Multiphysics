module C3D8_uel_pack

implicit none

  ! real(8),parameter :: int_inter = sqrt(3.0)/3.0
  real(8),parameter :: int_inter = 0.577350269d0
  real(8),parameter :: G_GAUSS_PT(8,3) = reshape([-int_inter,  int_inter, -int_inter, int_inter,-int_inter,int_inter,-int_inter,int_inter,     &
                                                  -int_inter, -int_inter,  int_inter, int_inter,-int_inter,-int_inter,int_inter,int_inter,     &
                                                  -int_inter, -int_inter, -int_inter,-int_inter,int_inter,int_inter,int_inter,int_inter] ,[8,3])
  real(8),parameter :: weight(8) = [1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0]

  ! 状态变量的个数
  integer,parameter :: ninpt  = 8               ! 高斯积分点的个数
  integer,parameter :: nsvint  = 12              ! 每个高斯积分点上状态变量的个数: 6个应变和6个应力
  integer,parameter :: nstatev = ninpt * nsvint ! 单元状态变量的总数

  ! 可视化，根据job的不同需要手动修改单元总数
  ! integer,parameter :: nelem = 520
  integer,parameter :: nelem = 1
  
contains


  !-----------------------------------------------------------------------------
  ! 计算弹性矩阵
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_ddsdde(E,nu) result(ddsdde)

    real(8),intent(in) :: E,nu
    real(8)            :: ddsdde(6,6)

    real(8) :: lambda, mu
    integer :: i,j

    lambda = E * nu / ( 1.0d0 + nu ) / ( 1.0d0 - 2.0d0 * nu)
    mu = E / ( 1.0d0 + nu ) / 2.0d0

    ddsdde = 0.0d0
    ddsdde(1:3,1:3) = lambda
    do i=1,3
      ddsdde(i,i) = ddsdde(i,i) + 2.0d0 * mu
      ddsdde(i+3,i+3) = mu
    enddo

    return
  end function C3D8_uel_compute_ddsdde

  !-----------------------------------------------------------------------------
  ! 计算形函数矩阵
  ! 
  !-----------------------------------------------------------------------------
 function C3D8_uel_compute_shape_N(xi) result(N)
  
    real(8),intent(in) :: xi(3)
    real(8)            :: N(3,24)

    real(8) :: shape(8)
    integer :: i,j

    shape(1) = 0.125d0 * ( 1.0d0 - xi(1) ) * ( 1.0d0 - xi(2) ) * ( 1.0d0 - xi(3) )
    shape(2) = 0.125d0 * ( 1.0d0 + xi(1) ) * ( 1.0d0 - xi(2) ) * ( 1.0d0 - xi(3) )
    shape(3) = 0.125d0 * ( 1.0d0 + xi(1) ) * ( 1.0d0 + xi(2) ) * ( 1.0d0 - xi(3) )
    shape(4) = 0.125d0 * ( 1.0d0 - xi(1) ) * ( 1.0d0 + xi(2) ) * ( 1.0d0 - xi(3) )
    shape(5) = 0.125d0 * ( 1.0d0 - xi(1) ) * ( 1.0d0 - xi(2) ) * ( 1.0d0 + xi(3) )
    shape(6) = 0.125d0 * ( 1.0d0 + xi(1) ) * ( 1.0d0 - xi(2) ) * ( 1.0d0 + xi(3) )
    shape(7) = 0.125d0 * ( 1.0d0 + xi(1) ) * ( 1.0d0 + xi(2) ) * ( 1.0d0 + xi(3) )
    shape(8) = 0.125d0 * ( 1.0d0 - xi(1) ) * ( 1.0d0 + xi(2) ) * ( 1.0d0 + xi(3) )

    j = 1
    do i = 1,8
      N(1,j) = shape(i)
      N(2,j+1) = shape(i)
      N(3,j+2) = shape(i)
      j = j + 3
    enddo 

    return
  end function C3D8_uel_compute_shape_N

  !-----------------------------------------------------------------------------
  ! 计算形函数对参数坐标的导数
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_N_deriv_local_kinpt(xi) result(N_deriv_local_kinpt)

    real(8),intent(in) :: xi(3)
    real(8)            :: N_deriv_local_kinpt(8,3)

    real(8) :: x, y, z
    x = xi(1)
    y = xi(2)
    z = xi(3)

    N_deriv_local_kinpt(1,1) = -0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(1,2) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(1,3) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - y )
    
    N_deriv_local_kinpt(2,1) =  0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(2,2) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(2,3) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - y )
    
    N_deriv_local_kinpt(3,1) =  0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(3,2) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(3,3) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + y )
    
    N_deriv_local_kinpt(4,1) = -0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(4,2) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - z )
    N_deriv_local_kinpt(4,3) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + y )
    
    N_deriv_local_kinpt(5,1) = -0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(5,2) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(5,3) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - y )
    
    N_deriv_local_kinpt(6,1) =  0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(6,2) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(6,3) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - y )
    
    N_deriv_local_kinpt(7,1) =  0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(7,2) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(7,3) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + y )
    
    N_deriv_local_kinpt(8,1) = -0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(8,2) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + z )
    N_deriv_local_kinpt(8,3) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + y )

    return
  end function C3D8_uel_compute_N_deriv_local_kinpt

  !-----------------------------------------------------------------------------
  ! 计算雅克比矩阵
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_jac(coords, xi) result(jac)

      real(8),intent(in) :: coords(3,8)
      real(8),intent(in) :: xi(3)
      real(8)            :: jac(3,3)

      real(8) :: N_deriv_local_kinpt(8,3)
      
      N_deriv_local_kinpt = C3D8_uel_compute_N_deriv_local_kinpt(xi)
      jac = matmul(coords,N_deriv_local_kinpt)

      return
  end function C3D8_uel_compute_jac

  !-----------------------------------------------------------------------------
  ! 计算雅克比矩阵的行列式
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_djac(jac) result(djac)

    real(8),intent(in) :: jac(3,3)
    real(8)            :: djac

    djac = jac(1,1)*jac(2,2)*jac(3,3) + jac(1,2)*jac(2,3)*jac(3,1)   &
            + jac(1,3)*jac(2,1)*jac(3,2) - jac(1,1)*jac(3,2)*jac(2,3)   &
            - jac(2,1)*jac(1,2)*jac(3,3) - jac(3,1)*jac(2,2)*jac(1,3)

    return
  end function C3D8_uel_compute_djac

  !-----------------------------------------------------------------------------
  ! 计算雅克比矩阵的逆
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_jac_inv(jac) result(jac_inv)

    real(8),intent(in) :: jac(3,3)
    real(8)            :: jac_inv(3,3)

    real(8) :: djac
    djac = C3D8_uel_compute_djac(jac)

    jac_inv(1,1) = (jac(2,2)*jac(3,3) - jac(2,3)*jac(3,2)) / djac
    jac_inv(1,2) = (jac(1,3)*jac(3,2) - jac(3,3)*jac(1,2)) / djac
    jac_inv(1,3) = (jac(1,2)*jac(2,3) - jac(2,2)*jac(1,3)) / djac
    jac_inv(2,1) = (jac(2,3)*jac(3,1) - jac(3,3)*jac(2,1)) / djac
    jac_inv(2,2) = (jac(1,1)*jac(3,3) - jac(3,1)*jac(1,3)) / djac
    jac_inv(2,3) = (jac(1,3)*jac(2,1) - jac(2,3)*jac(1,1)) / djac
    jac_inv(3,1) = (jac(2,1)*jac(3,2) - jac(3,1)*jac(2,2)) / djac
    jac_inv(3,2) = (jac(1,2)*jac(3,1) - jac(3,2)*jac(1,1)) / djac
    jac_inv(3,3) = (jac(1,1)*jac(2,2) - jac(1,2)*jac(2,1)) / djac

    return
  end function C3D8_uel_compute_jac_inv

  !-----------------------------------------------------------------------------
  ! 计算形函数对物理坐标的导数
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_N_deriv_global_kinpt(coords, xi) result(N_deriv_global_kinpt)

    real(8),intent(in) :: coords(3,8)
    real(8),intent(in) :: xi(3)
    real(8)            :: N_deriv_global_kinpt(8,3)

    real(8) :: jac(3,3)
    real(8) :: jac_inv(3,3)
    real(8) :: N_deriv_local_kinpt(8,3)

    N_deriv_local_kinpt = C3D8_uel_compute_N_deriv_local_kinpt(xi)
    jac = C3D8_uel_compute_jac(coords,xi)
    jac_inv = C3D8_uel_compute_jac_inv(jac)

    N_deriv_global_kinpt = matmul(N_deriv_local_kinpt, jac_inv)

    return
  end function C3D8_uel_compute_N_deriv_global_kinpt

  !-----------------------------------------------------------------------------
  ! 计算B矩阵
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_B_matrix(coords, xi) result(Bu_kinpt)

    real(8),intent(in) :: coords(3,8)
    real(8),intent(in) :: xi(3)
    real(8)            :: B(6,24)

    real(8) :: N_deriv_global_kinpt(8,3)
    integer :: i,j

    N_deriv_global_kinpt = C3D8_uel_compute_N_deriv_global_kinpt(coords, xi)

    j = 1
    B = 0.0d0
    do i= 1,8
      B(1,j)   = N_deriv_global_kinpt(i,1)
      B(2,j+1) = N_deriv_global_kinpt(i,2)
      B(3,j+2) = N_deriv_global_kinpt(i,3)
      B(4,j)   = N_deriv_global_kinpt(i,2)
      B(4,j+1) = N_deriv_global_kinpt(i,1)
      B(5,j)   = N_deriv_global_kinpt(i,3)
      B(5,j+2) = N_deriv_global_kinpt(i,1)
      B(6,j+1) = N_deriv_global_kinpt(i,3)
      B(6,j+2) = N_deriv_global_kinpt(i,2)
      j = j + 3
    enddo

    return
  end function C3D8_uel_compute_B_matrix
 
  !-----------------------------------------------------------------------------
  ! remark: 计算单元体积
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_elem_vol(coords) result(elem_vol)

    real(8),intent(in) :: coords(3,8)
    real(8)            :: elem_vol

    real(8) :: jac(3,3)
    real(8) :: djac
    integer :: i

    elem_vol = 0.0d0
    ! 对高斯积分点进行循环
    do i = 1, 8
      jac = C3D8_uel_compute_jac(coords, G_GAUSS_PT(i,1:3))
      djac = C3D8_uel_compute_djac(jac)
      elem_vol = elem_vol + djac * weight(i)
    enddo

    return
  end function C3D8_uel_compute_elem_vol

  !-----------------------------------------------------------------------------
  ! 计算B矩阵的体部分, B_vol
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_B_vol(coords,xi) result(B_vol)

    real(8),intent(in) :: coords(3,8)
    real(8),intent(in) :: xi(3)
    real(8)            :: B_vol(6,24)

    real(8) :: N_deriv_global_kinpt(8,3)
    integer :: i,j

    N_deriv_global_kinpt = C3D8_uel_compute_N_deriv_global_kinpt(coords, xi)

    j = 1
    B_vol = 0.0d0
    do i = 1,8
      B_vol(1,j:j+2) = N_deriv_global_kinpt(i,:)
      B_vol(2,j:j+2) = N_deriv_global_kinpt(i,:)
      B_vol(3,j:j+2) = N_deriv_global_kinpt(i,:)
      j = j + 3
    enddo

    B_vol = B_vol / 3.0d0

    return
  end function C3D8_uel_compute_B_vol

  !-----------------------------------------------------------------------------
  ! 计算B_vol的体积分
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_B_bar_vol(coords) result(B_bar_vol)

    real(8),intent(in) :: coords(3,8)
    real(8)            :: B_bar_vol(6,24)

    real(8) :: B_vol(6,24)
    real(8) :: elem_vol
    real(8) :: jac(3,3)
    real(8) :: djac
    integer :: i

    elem_vol = C3D8_uel_compute_elem_vol(coords)
    ! 对高斯积分点进行循环进行体积分
    B_bar_vol = 0.0d0
    do i = 1,8
      B_vol = C3D8_uel_compute_B_vol(coords,G_GAUSS_PT(i,1:3))
      jac = C3D8_uel_compute_jac(coords, G_GAUSS_PT(i,1:3))
      djac = C3D8_uel_compute_djac(jac)
      B_bar_vol = B_bar_vol + B_vol * djac * weight(i)
    enddo

    B_bar_vol = B_bar_vol / elem_vol

    return
  end function C3D8_uel_compute_B_bar_vol

  !-----------------------------------------------------------------------------
  ! 计算B_bar
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_B_bar(coords,xi) result(B_bar)
    
    real(8),intent(in) :: coords(3,8)
    real(8),intent(in) :: xi(3)
    real(8)            :: B_bar(6,24)

    real(8) :: B(6,24)
    real(8) :: B_vol(6,24)
    real(8) :: B_bar_vol(6,24)

    B = C3D8_uel_compute_B_matrix(coords, xi)
    B_vol = C3D8_uel_compute_B_vol(coords, xi)
    B_bar_vol = C3D8_uel_compute_B_bar_vol(coords)

    B_bar = B - B_vol + B_bar_vol

    return
  end function C3D8_uel_compute_B_bar

  !-----------------------------------------------------------------------------
  ! uel主程序
  ! 
  !-----------------------------------------------------------------------------
  subroutine C3D8_uel(E,nu, coords, u, du, amatrx, rhs, svars)

    real(8),intent(in)     :: E,nu
    real(8),intent(in)     :: coords(3,8)
    real(8),intent(in)     :: u(24) ! 当前增量步结束时刻的位移
    real(8),intent(in)     :: du(24)
    real(8),intent(out)    :: amatrx(24,24)
    real(8),intent(out)    :: rhs(24)
    real(8),intent(inout)  :: svars(nstatev) ! 状态变量的个数可以设一个较大的值

    real(8) :: u_n0(24) 
    real(8) :: strain_prev(6)
    real(8) :: dstran(6)
    real(8) :: strain_current(6)
    real(8) :: stress_current(6)
    real(8) :: ddsdde(6,6)
    real(8) :: B(6,24)
    real(8) :: jac(3,3)
    real(8) :: djac
    integer :: i,j

    u_n0 = u - du
    amatrx = 0.0d0
    rhs = 0.0d0
    ddsdde = C3D8_uel_compute_ddsdde(E,nu)

    ! 对高斯积分点进行循环
    j = 1
    do i =1,8
      B_bar = C3D8_uel_compute_B_bar(coords, G_GAUSS_PT(i,1:3))
      strain_prev = matmul(B_bar,u_n0)
      dstran = matmul(B_bar,du)
      strain_current  = strain_prev + dstran
      ! 计算应力
      stress_current = matmul(ddsdde,strain_current)
      ! 计算单元刚度矩阵
      jac = C3D8_uel_compute_jac(coords, G_GAUSS_PT(i,1:3))
      djac = C3D8_uel_compute_djac(jac)
      amatrx = amatrx + matmul(matmul(transpose(B_bar),ddsdde),B_bar) * djac * weight(i)
      ! 计算内力列阵
      rhs = rhs - matmul(transpose(B_bar), stress_current) * djac * weight(i)

      ! 存储状态变量, 每一个积分点存6个应变和6个应力
      svars(j:j+5)    = strain_current(1:6)
      svars(j+6:j+11) = stress_current(1:6)
      j = j + 12
    enddo

    return
  end subroutine C3D8_uel


end module C3D8_uel_pack

subroutine uel(rhs,amatrx,svars,energy,ndofel,nrhs,nsvars,                  &
                props,nprops,coords,mcrd,nnode,u,du,v,a,jtype,time,dtime,   &
                kstep,kinc,jelem,params,ndload,jdltyp,adlmag,predef,npredf, &
                lflags,mlvarx,ddlmag,mdload,pnewdt,jprops,njprop,period)

    use C3D8_uel_pack

    include 'aba_param.inc'

    dimension   rhs(mlvarx,*),amatrx(ndofel,ndofel),props(*),               &
                svars(*),energy(8),coords(mcrd,nnode),u(ndofel),            &
                du(mlvarx,*),v(ndofel),a(ndofel),time(2),params(*),         &
                jdltyp(mdload,*),adlmag(mdload,*),ddlmag(mdload,*),         &
                predef(2,npredf,nnode),lflags(*),jprops(*)
    


    ! **************************************************************
    ! 使用umat进行结果可视化
    REAL*8 user_vars(nelem,nsvint, ninpt)
    INTEGER JELEM,K1,K2,kinpt
    COMMON/KUSER/user_vars
    ! **************************************************************
    
    real(8) :: E
    real(8) :: nu
    real(8) :: amatrx(24,24)
    real(8) :: rhs(24)
    integer :: i

    E  = props(1)
    nu = props(2)

    ! call uel
    call C3D8_uel(E,nu, coords, u, du, amatrx, rhs, svars)

    ! ! 输出单元刚度矩阵
    ! do i = 1,24
    !     write(*,*) Ke(i,1:i)
    ! enddo

    ! **************************************************************
    ! for visualization
    DO kinpt = 1,ninpt !对高斯积分点进行循环
        DO K1=1,nsvint  !对每个高斯积分点上的状态变量进行循环
            user_vars(JELEM,K1,kinpt) = SVARS(nsvint*(kinpt-1)+K1)
        END DO
    ENDDO
    ! **************************************************************

    return
end subroutine uel

! ******************************************************************
! umat进行可视化
subroutine umat(stress,statev,ddsdde,sse,spd,scd,                       &
                rpl,ddsddt,drplde,drpldt,                               &
                stran,dstran,time,dtime,temp,dtemp,predef,dpred,cmname, &
                ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt,  &
                celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,kstep,kinc)

    use C3D8_uel_pack

    include 'aba_param.inc'

    character*80 cmname
    dimension    stress(ntens),statev(nstatv),ddsdde(ntens,ntens),   &
                ddsddt(ntens),drplde(ntens),                        &
                stran(ntens),dstran(ntens),time(2),                 &
                predef(1),dpred(1),props(nprops),coords(3),         &
                drot(3,3),dfgrd0(3,3),dfgrd1(3,3)

    ! **************************************************************
    ! 可视化
    INTEGER noffset, K1
    real(8) :: E,nu
    COMMON/KUSER/user_vars(nelem, nsvint, ninpt)
    
    noffset=noel-nelem

    DO K1=1,nsvint
        STATEV(K1)=user_vars(noffset,K1,npt)
    END DO
    ! **************************************************************
    E = props(1)
    nu = props(2)

    ddsdde = C3D8_uel_compute_ddsdde(E,nu)
    stress = matmul(ddsdde,stran + dstran)
    
    return
end subroutine umat