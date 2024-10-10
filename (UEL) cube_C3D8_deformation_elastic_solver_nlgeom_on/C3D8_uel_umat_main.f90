module C3D8_uel_pack

implicit none

  ! real(8),parameter :: RT1B3 = sqrt(3.0)/3.0
  real(8),parameter :: RT1B3 = 0.577350269d0
  real(8),parameter :: G_GAUSS_PT(8,3) = reshape([-RT1B3,RT1B3,-RT1B3,RT1B3,-RT1B3,RT1B3,-RT1B3,RT1B3,     &
                                                  -RT1B3,-RT1B3,RT1B3,RT1B3,-RT1B3,-RT1B3,RT1B3,RT1B3,     &
                                                  -RT1B3,-RT1B3,-RT1B3,-RT1B3,RT1B3,RT1B3,RT1B3,RT1B3] ,[8,3])
  real(8),parameter :: G_GAUSS_W(8) = [1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0, 1.0d0]

  ! 状态变量的个数
  integer,parameter :: NGAUSS  = 8               ! 高斯积分点的个数
  integer,parameter :: NSVINT  = 12              ! 每个高斯积分点上状态变量的个数: 6个应变和6个应力
  integer,parameter :: NSTATEV = NGAUSS * NSVINT ! 单元状态变量的总数

  ! 可视化，根据job的不同需要手动修改单元总数
  ! integer,parameter :: NELEMENT = 520
  integer,parameter :: NELEMENT = 1
  
contains

  !-----------------------------------------------------------------------------
  ! 计算拉梅常数lambda
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_lambda(E,nu) result(lambda)

    real(8),intent(in) :: E,nu
    real(8)            :: lambda

    lambda = E * nu / ( 1.0d0 + nu ) / ( 1.0d0 - 2.0d0 * nu)

    return
  end function C3D8_uel_compute_lambda

  !-----------------------------------------------------------------------------
  ! 计算拉梅常数mu
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_mu(E, nu) result(mu)

    real(8),intent(in) :: E,nu
    real(8)            :: mu

    mu = E / ( 1.0d0 + nu ) / 2.0d0

    return
  end function C3D8_uel_compute_mu

  !-----------------------------------------------------------------------------
  ! 计算弹性矩阵
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_De(E,nu) result(De)

    real(8),intent(in) :: E,nu
    real(8)            :: De(6,6)

    real(8) :: lambda, mu
    integer :: i,j

    lambda = C3D8_uel_compute_lambda(E,nu)
    mu = C3D8_uel_compute_mu(E,nu)

    De = 0.0d0
    De(1:3,1:3) = lambda
    do i=1,3
      De(i,i) = De(i,i) + 2.0d0 * mu
      De(i+3,i+3) = mu
    enddo

    return
  end function C3D8_uel_compute_De

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
  function C3D8_uel_compute_dNdxi(xi) result(dNdxi)

    real(8),intent(in) :: xi(3)
    real(8)            :: dNdxi(8,3)

    real(8) :: x, y, z
    x = xi(1)
    y = xi(2)
    z = xi(3)

    dNdxi(1,1) = -0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 - z )
    dNdxi(1,2) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - z )
    dNdxi(1,3) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - y )
    dNdxi(2,1) =  0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 - z )
    dNdxi(2,2) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - z )
    dNdxi(2,3) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - y )
    dNdxi(3,1) =  0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 - z )
    dNdxi(3,2) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - z )
    dNdxi(3,3) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + y )
    dNdxi(4,1) = -0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 - z )
    dNdxi(4,2) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - z )
    dNdxi(4,3) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + y )
    dNdxi(5,1) = -0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 + z )
    dNdxi(5,2) = -0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + z )
    dNdxi(5,3) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 - y )
    dNdxi(6,1) =  0.125d0 * ( 1.0d0 - y ) * ( 1.0d0 + z )
    dNdxi(6,2) = -0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + z )
    dNdxi(6,3) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 - y )
    dNdxi(7,1) =  0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 + z )
    dNdxi(7,2) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + z )
    dNdxi(7,3) =  0.125d0 * ( 1.0d0 + x ) * ( 1.0d0 + y )
    dNdxi(8,1) = -0.125d0 * ( 1.0d0 + y ) * ( 1.0d0 + z )
    dNdxi(8,2) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + z )
    dNdxi(8,3) =  0.125d0 * ( 1.0d0 - x ) * ( 1.0d0 + y )

    return
  end function C3D8_uel_compute_dNdxi

  !-----------------------------------------------------------------------------
  ! 计算雅克比矩阵
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_jac(coords, xi) result(jac)

      real(8),intent(in) :: coords(3,8)
      real(8),intent(in) :: xi(3)
      real(8)            :: jac(3,3)

      real(8) :: dNdxi(8,3)
      
      dNdxi = C3D8_uel_compute_dNdxi(xi)
      jac = matmul(coords,dNdxi)

      return
  end function C3D8_uel_compute_jac

  !-----------------------------------------------------------------------------
  ! 计算雅克比矩阵的行列式
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_jac_det(jac) result(jac_det)

    real(8),intent(in) :: jac(3,3)
    real(8)            :: jac_det

    jac_det = jac(1,1)*jac(2,2)*jac(3,3) + jac(1,2)*jac(2,3)*jac(3,1)   &
            + jac(1,3)*jac(2,1)*jac(3,2) - jac(1,1)*jac(3,2)*jac(2,3)   &
            - jac(2,1)*jac(1,2)*jac(3,3) - jac(3,1)*jac(2,2)*jac(1,3)

    return
  end function C3D8_uel_compute_jac_det

  !-----------------------------------------------------------------------------
  ! 计算雅克比矩阵的逆
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_jac_inv(jac) result(jac_inv)

    real(8),intent(in) :: jac(3,3)
    real(8)            :: jac_inv(3,3)

    real(8) :: jac_det
    jac_det = C3D8_uel_compute_jac_det(jac)

    jac_inv(1,1) = (jac(2,2)*jac(3,3) - jac(2,3)*jac(3,2)) / jac_det
    jac_inv(1,2) = (jac(1,3)*jac(3,2) - jac(3,3)*jac(1,2)) / jac_det
    jac_inv(1,3) = (jac(1,2)*jac(2,3) - jac(2,2)*jac(1,3)) / jac_det
    jac_inv(2,1) = (jac(2,3)*jac(3,1) - jac(3,3)*jac(2,1)) / jac_det
    jac_inv(2,2) = (jac(1,1)*jac(3,3) - jac(3,1)*jac(1,3)) / jac_det
    jac_inv(2,3) = (jac(1,3)*jac(2,1) - jac(2,3)*jac(1,1)) / jac_det
    jac_inv(3,1) = (jac(2,1)*jac(3,2) - jac(3,1)*jac(2,2)) / jac_det
    jac_inv(3,2) = (jac(1,2)*jac(3,1) - jac(3,2)*jac(1,1)) / jac_det
    jac_inv(3,3) = (jac(1,1)*jac(2,2) - jac(1,2)*jac(2,1)) / jac_det

    return
  end function C3D8_uel_compute_jac_inv

  !-----------------------------------------------------------------------------
  ! 计算形函数对物理坐标的导数
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_dNdx(coords, xi) result(dNdx)

    real(8),intent(in) :: coords(3,8)
    real(8),intent(in) :: xi(3)
    real(8)            :: dNdx(8,3)

    real(8) :: jac(3,3)
    real(8) :: jac_inv(3,3)
    real(8) :: dNdxi(8,3)

    dNdxi = C3D8_uel_compute_dNdxi(xi)
    jac = C3D8_uel_compute_jac(coords,xi)
    jac_inv = C3D8_uel_compute_jac_inv(jac)

    dNdx = matmul(dNdxi, jac_inv)

    return
  end function C3D8_uel_compute_dNdx

  !-----------------------------------------------------------------------------
  ! 计算B矩阵
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_B_matrix(coords, xi) result(B)

    real(8),intent(in) :: coords(3,8)
    real(8),intent(in) :: xi(3)
    real(8)            :: B(6,24)

    real(8) :: dNdx(8,3)
    integer :: i,j

    dNdx = C3D8_uel_compute_dNdx(coords, xi)

    j = 1
    B = 0.0d0
    do i= 1,8
      B(1,j)   = dNdx(i,1)
      B(2,j+1) = dNdx(i,2)
      B(3,j+2) = dNdx(i,3)
      B(4,j)   = dNdx(i,2)
      B(4,j+1) = dNdx(i,1)
      B(5,j)   = dNdx(i,3)
      B(5,j+2) = dNdx(i,1)
      B(6,j+1) = dNdx(i,3)
      B(6,j+2) = dNdx(i,2)
      j = j + 3
    enddo

    return
  end function C3D8_uel_compute_B_matrix

  !-----------------------------------------------------------------------------
  ! 计算应变
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_strain(B,u) result(strain)

    real(8),intent(in) :: B(6,24)
    real(8),intent(in) :: u(24)
    real(8)            :: strain(6)
    
    strain = matmul(B,u)

    return
  end function C3D8_uel_compute_strain

  !-----------------------------------------------------------------------------
  ! remark: 计算单元体积
  ! 
  !-----------------------------------------------------------------------------
  function C3D8_uel_compute_elem_vol(coords) result(elem_vol)

    real(8),intent(in) :: coords(3,8)
    real(8)            :: elem_vol

    real(8) :: jac(3,3)
    real(8) :: jac_det
    integer :: i

    elem_vol = 0.0d0
    ! 对高斯积分点进行循环
    do i = 1, 8
      jac = C3D8_uel_compute_jac(coords, G_GAUSS_PT(i,1:3))
      jac_det = C3D8_uel_compute_jac_det(jac)
      elem_vol = elem_vol +  jac_det * G_GAUSS_W(i)
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

    real(8) :: dNdx(8,3)
    integer :: i,j

    dNdx = C3D8_uel_compute_dNdx(coords, xi)

    j = 1
    B_vol = 0.0d0
    do i = 1,8
      B_vol(1,j:j+2) = dNdx(i,:)
      B_vol(2,j:j+2) = dNdx(i,:)
      B_vol(3,j:j+2) = dNdx(i,:)
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
    real(8) :: jac_det
    integer :: i

    elem_vol = C3D8_uel_compute_elem_vol(coords)
    ! 对高斯积分点进行循环进行体积分
    B_bar_vol = 0.0d0
    do i = 1,8
      B_vol = C3D8_uel_compute_B_vol(coords,G_GAUSS_PT(i,1:3))
      jac = C3D8_uel_compute_jac(coords, G_GAUSS_PT(i,1:3))
      jac_det = C3D8_uel_compute_jac_det(jac)
      B_bar_vol = B_bar_vol + B_vol * jac_det * G_GAUSS_W(i)
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
  subroutine C3D8_uel(E,nu, coords, u, du, Ke, fint, svars)

    real(8),intent(in)     :: E,nu
    real(8),intent(in)     :: coords(3,8)
    real(8),intent(in)     :: u(24) ! 当前增量步结束时刻的位移
    real(8),intent(in)     :: du(24)
    real(8),intent(out)    :: Ke(24,24)
    real(8),intent(out)    :: fint(24)
    real(8),intent(inout)  :: svars(NSTATEV) ! 状态变量的个数可以设一个较大的值

    real(8) :: u_n0(24) 
    real(8) :: strain_n0(6)
    real(8) :: strain_inc(6)
    real(8) :: strain_n1(6)
    real(8) :: stress_n1(6)
    real(8) :: ddsdde(6,6)
    real(8) :: B(6,24)
    real(8) :: jac(3,3)
    real(8) :: jac_det
    integer :: i,j

    u_n0 = u - du
    Ke = 0.0d0
    fint = 0.0d0
    ddsdde = C3D8_uel_compute_De(E,nu)

    ! 对高斯积分点进行循环
    j = 1
    do i =1,8
      B = C3D8_uel_compute_B_bar(coords, G_GAUSS_PT(i,1:3))
      strain_n0  = C3D8_uel_compute_strain(B,u_n0)
      strain_inc = C3D8_uel_compute_strain(B,du)
      strain_n1  = strain_n0 + strain_inc
      ! 计算应力
      stress_n1 = matmul(ddsdde,strain_n1)
      ! 计算单元刚度矩阵
      jac = C3D8_uel_compute_jac(coords, G_GAUSS_PT(i,1:3))
      jac_det = C3D8_uel_compute_jac_det(jac)
      Ke = Ke + matmul(matmul(transpose(B),ddsdde),B) * jac_det * G_GAUSS_W(i)
      ! 计算内力列阵
      fint = fint + matmul(transpose(B), stress_n1) * jac_det * G_GAUSS_W(i)

      ! 存储状态变量, 每一个积分点存6个应变和6个应力
      svars(j:j+5)    = strain_n1(1:6)
      svars(j+6:j+11) = stress_n1(1:6)
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
    REAL*8 UVAR(NELEMENT,NSVINT, NGAUSS)
    INTEGER JELEM,K1,K2,KINTK
    COMMON/KUSER/UVAR
    ! **************************************************************
    
    real(8) :: E
    real(8) :: nu
    real(8) :: Ke(24,24)
    real(8) :: fint(24)
    integer :: i

    E  = props(1)
    nu = props(2)

    ! call uel
    call C3D8_uel(E,nu, coords, u, du, Ke, fint, svars)
    
    rhs(:,1) = -fint
    amatrx = Ke

    ! ! 输出单元刚度矩阵
    ! do i = 1,24
    !     write(*,*) Ke(i,1:i)
    ! enddo

    ! **************************************************************
    ! for visualization
    DO KINTK = 1,NGAUSS !对高斯积分点进行循环
        DO K1=1,NSVINT  !对每个高斯积分点上的状态变量进行循环
            UVAR(JELEM,K1,KINTK) = SVARS(NSVINT*(KINTK-1)+K1)
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
    INTEGER NELEMAN, K1
    real(8) :: E,nu
    COMMON/KUSER/UVAR(NELEMENT,NSVINT, NGAUSS)
    NELEMAN=NOEL-NELEMENT

    DO K1=1,NSVINT
        STATEV(K1)=UVAR(NELEMAN,K1,NPT)
    END DO
    ! **************************************************************
    E = props(1)
    nu = props(2)

    ddsdde = C3D8_uel_compute_De(E,nu)
    stress = matmul(ddsdde,stran + dstran)
    
    return
end subroutine umat