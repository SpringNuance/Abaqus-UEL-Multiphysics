c
c     To be used with acoustuserelemdyn.inp.
c
      SUBROUTINE UEL(RHS,AMATRX,SVARS,ENERGY,NDOFEL,NRHS,NSVARS,
     1     PROPS,NPROPS,COORDS,MCRD,NNODE,U,DU,V,A,JTYPE,TIME,DTIME,
     2     KSTEP,KINC,JELEM,PARAMS,NDLOAD,JDLTYP,ADLMAG,PREDEF,
     3     NPREDF,LFLAGS,MLVARX,DDLMAG,MDLOAD,PNEWDT,JPROPS,NJPROP,
     4     PERIOD)
C     
      INCLUDE 'ABA_PARAM.INC'
      PARAMETER ( ZERO=0.D0,HALF=0.5D0,ONE=1.D0,TWO=2.D0,THREE=3.d0)
c      parameter (beta=0.25d0)
C
      DIMENSION RHS(MLVARX,*),AMATRX(NDOFEL,NDOFEL),
     1     SVARS(NSVARS),ENERGY(8),PROPS(*),COORDS(MCRD,NNODE),
     2     U(NDOFEL),DU(MLVARX,*),V(NDOFEL),A(NDOFEL),TIME(2),
     3     PARAMS(3),JDLTYP(MDLOAD,*),ADLMAG(MDLOAD,*),
     4     DDLMAG(MDLOAD,*),PREDEF(2,NPREDF,NNODE),LFLAGS(*),
     5     JPROPS(*)
      dimension shapef(8),shapefgder(3,8)
      dimension dhdxdhdxmatrix(8,8),hhmatrix(8,8),xj(3,3),Hmatrix(3,24)
      dimension xg(2),gw(2),diagpmmatrix(8)
      dimension scaledstifmatrix(8,8),scaledmassmatrix(8,8)
      dimension rhss(8),rhsm(8)
C
c     Get necessary properties
      akf  = PROPS(1) ! Fluid bulk modulus
      rhof = PROPS(2) ! Fluid material density
c
      if (akf.le.zero) then
         write (7,*) ' ERROR in UEL: PROPS(1) should be positive.'
         stop
      else
         akfm1 =one/akf
      end if
      if (rhof.le.zero) then
         write (7,*) ' ERROR in UEL: PROPS(2) should be positive.'
         stop
      else
         rhofm1=one/rhof
      end if
c
c     In geometrically linear analysis, coords (original ones)
c     are taken as current ones
c
      DO K1 = 1, NDOFEL                      
        DO KRHS = 1, NRHS
          RHS(K1,KRHS) = ZERO
        END DO
        DO K2 = 1, NDOFEL
          AMATRX(K2,K1) = ZERO
          scaledstifmatrix(k2,k1) = zero
          scaledmassmatrix(k2,k1) = zero
        END DO
        rhss(k1) = zero
        rhsm(k1) = zero
      END DO
      svars(1)=zero
      do i=1,8
         energy(i)=zero
      end do
c
c     Gauss coordinates, 2x2
      XG(1)=-0.577350269189626D0
      XG(2)=-XG(1)
c
c     Gauss weights, 2x2
      gw(1)=1.d0
      gw(2)=1.d0
C
      IF (LFLAGS(3).EQ.1 .or. LFLAGS(3).EQ.2) THEN
c
c        Stiffness matrix
c
         if (lflags(1).eq.11 .or. lflags(1).eq.12) beta=params(2)
         stiffnessfactor=-beta*(dtime*dtime)
         do kinttl=1,2          ! Gauss integration 2x2x2, t direction
            tl =xg(kinttl)
            wtl=gw(kinttl)
            do kintsl=1,2       ! Gauss integration 2x2x2, s direction
               sl =xg(kintsl)
               wsl=gw(kintsl)
               do kintrl=1,2    ! Gauss integration 2x2x2, r direction
                  rl =xg(kintrl)
                  wrl=gw(kintrl)
c                 
                  gweigth=wtl*wsl*wrl * stiffnessfactor
c                 
c                 Compute shape functions and their global derivatives shapefgder
c                 together with jacobian determinant det.
                  call derq3(shapef,shapefgder,det,rl,sl,tl,coords,nnode)
c
                  do i1=1,8
                     do j1=1,8
                        dummy=zero
                        do k1=1,3
                           dummy=dummy+shapefgder(k1,i1)*shapefgder(k1,j1)
                        end do
                        dhdxdhdxmatrix(i1,j1)=dummy
                     end do
                  end do
c
                  factor=gweigth*det*rhofm1
                  do j=1,ndofel
                     do i=1,ndofel
                        AMATRX(i,j) = AMATRX(i,j) +
     *                       factor * dhdxdhdxmatrix(i,j)
                     end do
                  end do
c
               end do           ! end tl
            end do              ! end sl
         end do                 ! end rl
c
c        Copy scaled stiffness matrix to scaledstifmatrix
c
         do j=1,ndofel
            do i=1,ndofel
               scaledstifmatrix(i,j) = AMATRX(i,j)
            end do
         end do        
c
c        Add mass matrix to form the effective stiffness matrix
c      
         massfactor=-one
         do kinttl=1,2          ! Gauss integration 2x2x2, t direction
            tl =xg(kinttl)
            wtl=gw(kinttl)
            do kintsl=1,2       ! Gauss integration 2x2x2, s direction
               sl =xg(kintsl)
               wsl=gw(kintsl)
               do kintrl=1,2    ! Gauss integration 2x2x2, r direction
                  rl =xg(kintrl)
                  wrl=gw(kintrl)
c                 
                  gweigth=wtl*wsl*wrl * massfactor
c                 
c                 Compute shape functions together with jacobian determinant det.
                  call funct3(rl,sl,tl,shapef,shapefgder,xj,coords,det,nnode)
c
c                 H matrix
c
                  do j1=1,24
                     do i1=1,3
                        Hmatrix(i1,j1)=zero
                     end do
                  end do
c
                  jcol=0
                  do j1=1,8
                     Hmatrix(1,jcol+1)=shapef(j1)
                     Hmatrix(2,jcol+2)=shapef(j1)
                     Hmatrix(3,jcol+3)=shapef(j1)
                     jcol=jcol+3
                  end do
c
c                 First compute consistent mass matrix.
                  do i1=1,8
                     do j1=1,8
                        hhmatrix(i1,j1)=shapef(i1)*shapef(j1)
                     end do
                  end do
c
c                 Diagonalize mass matrix as row sum.
                  do i1=1,8
                     dummy=zero
                     do j1=1,8
                        dummy=dummy+hhmatrix(i1,j1)
                     end do
                     diagpmmatrix(i1)=dummy
                  end do

                  factor=gweigth*det*akfm1
                  do i1=1,ndofel
                     AMATRX(i1,i1) = AMATRX(i1,i1) +
     *                    factor * diagpmmatrix(i1)
                     scaledmassmatrix(i1,i1) = scaledmassmatrix(i1,i1) +
     *                    factor * diagpmmatrix(i1)
                  end do
               end do           ! end tl
            end do              ! end sl
         end do                 ! end rl
c
c        RHS computation
c
         do k1=1,ndofel
            do j1=1,ndofel
               rhss(k1)=rhss(k1) + scaledstifmatrix(k1,j1)*u(j1)
               rhsm(k1)=rhsm(k1) + scaledmassmatrix(k1,j1)*a(j1)
            end do
            rhs(k1,1) = rhs(k1,1) - rhss(k1) + rhsm(k1)*stiffnessfactor
         end do
      else if (lflags(3).eq.3) then
C        Damping requested
         if(lflags(7).eq.1) then
C           Viscous damping matrix requested
         else if(lflags(7).eq.2) then
C           Structural damping matrix requested
         end if
      ELSE IF (LFLAGS(3).EQ.4 .or. LFLAGS(3).EQ.6) THEN
c
c        Mass matrix
c
         massfactor=-one
         do kinttl=1,2          ! Gauss integration 2x2x2, t direction
            tl =xg(kinttl)
            wtl=gw(kinttl)
            do kintsl=1,2       ! Gauss integration 2x2x2, s direction
               sl =xg(kintsl)
               wsl=gw(kintsl)
               do kintrl=1,2    ! Gauss integration 2x2x2, r direction
                  rl =xg(kintrl)
                  wrl=gw(kintrl)
c                 
                  gweigth=wtl*wsl*wrl * massfactor
c                 
c                 Compute shape functions together with jacobian determinant det.
                  call funct3(rl,sl,tl,shapef,shapefgder,xj,coords,det,nnode)
c
c                 H matrix
c
                  do j1=1,24
                     do i1=1,3
                        Hmatrix(i1,j1)=zero
                     end do
                  end do
c
                  jcol=0
                  do j1=1,8
                     Hmatrix(1,jcol+1)=shapef(j1)
                     Hmatrix(2,jcol+2)=shapef(j1)
                     Hmatrix(3,jcol+3)=shapef(j1)
                     jcol=jcol+3
                  end do
c
c                 First compute consistent mass matrix.
                  do i1=1,8
                     do j1=1,8
                        hhmatrix(i1,j1)=shapef(i1)*shapef(j1)
                     end do
                  end do
c
c                 Diagonalize mass matrix as row sum.
                  do i1=1,8
                     dummy=zero
                     do j1=1,8
                        dummy=dummy+hhmatrix(i1,j1)
                     end do
                     diagpmmatrix(i1)=dummy
                  end do

                  factor=gweigth*det*akfm1
                  do i1=1,ndofel
                     AMATRX(i1,i1) = AMATRX(i1,i1) +
     *                    factor * diagpmmatrix(i1)
                  end do
               end do           ! end tl
            end do              ! end sl
         end do                 ! end rl
      END IF
C
      return
      end         
c---------------------------------------------------------
C
C     SHAPE FUNCTIONS HF, THEIR GLOBAL DERIVATIVES PG,
C     AND JACOBIAN DETERMINANT DET
C     AT POINT WITH LOCAL COORDINATES (RL,SL,TL)
C     FOR HEXAHEDRAL ISOPARAMETRIC 8-NODE ELEMENT.
C
      SUBROUTINE DERQ3(HF,PG,DET,RL,SL,TL,coords,nnode)
c      IMPLICIT double precision (A-H,O-Z)
      INCLUDE 'ABA_PARAM.INC'
C
      DIMENSION coords(3,8),PG(3,8),HF(8),PF(3,8),XJ(3,3),XJI(3,3)
C
C     SHAPE FUNCTIONS, THEIR LOCAL DERIVATIVES, JACOBIAN AND ITS DET
      CALL FUNCT3(RL,SL,TL,HF,PF,XJ,coords,DET,nnode)
C
C     INVERT JACOBIAN
      DUM=1.D0/DET
      XJI(1,1)=DUM*( XJ(2,2)*XJ(3,3) - XJ(2,3)*XJ(3,2))
      XJI(2,1)=DUM*(-XJ(2,1)*XJ(3,3) + XJ(2,3)*XJ(3,1))
      XJI(3,1)=DUM*( XJ(2,1)*XJ(3,2) - XJ(2,2)*XJ(3,1))
      XJI(1,2)=DUM*(-XJ(1,2)*XJ(3,3) + XJ(1,3)*XJ(3,2))
      XJI(2,2)=DUM*( XJ(1,1)*XJ(3,3) - XJ(1,3)*XJ(3,1))
      XJI(3,2)=DUM*(-XJ(1,1)*XJ(3,2) + XJ(1,2)*XJ(3,1))
      XJI(1,3)=DUM*( XJ(1,2)*XJ(2,3) - XJ(1,3)*XJ(2,2))
      XJI(2,3)=DUM*(-XJ(1,1)*XJ(2,3) + XJ(1,3)*XJ(2,1))
      XJI(3,3)=DUM*( XJ(1,1)*XJ(2,2) - XJ(1,2)*XJ(2,1))
C
C     GLOBAL DERIVATIVES ( B MATRIX )
      do k=1,nnode
         PG(1,k) = XJI(1,1)*PF(1,K) + XJI(1,2)*PF(2,K) + XJI(1,3)*PF(3,K)
         PG(2,k) = XJI(2,1)*PF(1,K) + XJI(2,2)*PF(2,K) + XJI(2,3)*PF(3,K)
         PG(3,k) = XJI(3,1)*PF(1,K) + XJI(3,2)*PF(2,K) + XJI(3,3)*PF(3,K)
      end do
C
      RETURN
      END
c---------------------------------------------------------
C
C     SHAPE FUNCTIONS HF AND THEIR LOCAL DERIVATIVES PF
C     FOR 3D ISOPARAMETRIC SOLID ELEMENT WITH NUMBER OF NODES = 8,
C     WITH LOCAL COODINATES (RL,SL,TL),
C     JACOBI MATRIX XJ(I,J)=DX(I)/DXL(J).
C
      SUBROUTINE FUNCT3(RL,SL,TL,HF,PF,XJ,coords,det,nnode)
c      IMPLICIT double precision (A-H,O-Z)
      INCLUDE 'ABA_PARAM.INC'
      DIMENSION HF(8),PF(3,8),XJ(3,3),coords(3,8)
c
      if (nnode.ne.8) then
         write (7,2001)
 2001    format(' ERROR in FUNCT3: only 8-node elements are allowed.')
         stop
      end if
C
      RP=1.D0 + RL
      SP=1.D0 + SL
      TP=1.D0 + TL
      RM=1.D0 - RL
      SM=1.D0 - SL
      TM=1.D0 - TL
C
C     SHAPE FUNCTIONS AND THEIR LOCAL DERIVATIVES
C
      HF(1)=0.125D0*RM*SM*TM
      HF(2)=0.125D0*RP*SM*TM
      HF(3)=0.125D0*RP*SP*TM
      HF(4)=0.125D0*RM*SP*TM
      HF(5)=0.125D0*RM*SM*TP
      HF(6)=0.125D0*RP*SM*TP
      HF(7)=0.125D0*RP*SP*TP
      HF(8)=0.125D0*RM*SP*TP
c
      PF(1,1)=-0.125D0*SM*TM
      PF(2,1)=-0.125D0*RM*TM
      PF(3,1)=-0.125D0*RM*SM
c
      PF(1,2)= 0.125D0*SM*TM
      PF(2,2)=-0.125D0*RP*TM
      PF(3,2)=-0.125D0*RP*SM
c
      PF(1,3)= 0.125D0*SP*TM
      PF(2,3)= 0.125D0*RP*TM
      PF(3,3)=-0.125D0*RP*SP
c
      PF(1,4)=-0.125D0*SP*TM
      PF(2,4)= 0.125D0*RM*TM
      PF(3,4)=-0.125D0*RM*SP
c
      PF(1,5)=-0.125D0*SM*TP
      PF(2,5)=-0.125D0*RM*TP
      PF(3,5)= 0.125D0*RM*SM
c
      PF(1,6)= 0.125D0*SM*TP
      PF(2,6)=-0.125D0*RP*TP
      PF(3,6)= 0.125D0*RP*SM
c
      PF(1,7)= 0.125D0*SP*TP
      PF(2,7)= 0.125D0*RP*TP
      PF(3,7)= 0.125D0*RP*SP
c
      PF(1,8)=-0.125D0*SP*TP
      PF(2,8)= 0.125D0*RM*TP
      PF(3,8)= 0.125D0*RM*SP
C
C     JACOBI MATRIX XJ(I,J)=DX(I)/DXL(J)
C
      DO 100 I=1,3
      DO 100 J=1,3
      DUM=0.0d0
      DO 90 K=1,nnode
90    DUM=DUM + PF(J,K)*coords(I,K)
100   XJ(J,I)=DUM
C
C     JACOBIAN DETERMINANT
C
      DET = XJ(1,1)*XJ(2,2)*XJ(3,3)
     1    + XJ(1,2)*XJ(2,3)*XJ(3,1)
     2    + XJ(1,3)*XJ(2,1)*XJ(3,2)
     3    - XJ(1,3)*XJ(2,2)*XJ(3,1)
     4    - XJ(1,2)*XJ(2,1)*XJ(3,3)
     5    - XJ(1,1)*XJ(2,3)*XJ(3,2)
c
      RETURN
      END
