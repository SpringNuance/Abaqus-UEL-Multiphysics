SUBROUTINE UEL(RHS,AMATRX,SVARS,ENERGY,NDOFEL,NRHS,NSVARS,PROPS,         
     1 NPROPS,coords,mcrd,nnode,U,DU,V,A,JTYPE,TIME,dtime,KSTEP,KINC,
     2 JELEM,PARAMS,NDLOAD,JDLTYP,ADLMAG,PREDEF,NPREDF,LFLAGS,
     3 MLVARX,DDLMAG,MDLOAD,PNEWDT,JPROPS,NJPROP,PERIOD)
C
      INCLUDE 'aba_param.inc'
C
      DIMENSION RHS(MLVARX,*),AMATRX(NDOFEL,NDOFEL),SVARS(NSVARS),
     1 ENERGY(8),PROPS(*),coords(mcrd,nnode),
     2 U(NDOFEL),DU(MLVARX,*),V(NDOFEL),A(NDOFEL),TIME(2),
     3 PARAMS(3),JDLTYP(MDLOAD,*),ADLMAG(MDLOAD,*),
     4 DDLMAG(MDLOAD,*),PREDEF(2,NPREDF,nnode),LFLAGS(*),JPROPS(*)
C
      DIMENSION xi_int_inter(9),eta_int_inter(9),weight(9),N_shape_node_to_kinpt(8),N_deriv_global_kinpt_current_X(8),N_deriv_global_kinpt_current_Y(8),N_deriv_local_kinpt_current_X(8),
     1 N_deriv_local_kinpt_current_Y(8),IFACE(9),GWE(3)
C

      DATA IFACE/1,5,2,6,3,7,4,8,1/
C
C    8 NODE CONTINUUM UEL FOR TRANSIENT HEAT TRANSFER ANALYSIS;
C    TEMPERATURE DEPENDENT CONDUCTIVITY AND THE UNSYMMETRIC
C    CONTRIBUTION OF THIS TERM TO THE JACOBIAN INCLUDED
C
C     VARIABLE DECLARATION
C

C     rho_heat   :  DENSITY
C     cp_heat  :  SPECIFIC HEAT
C     conductivity  :  THERMAL CONDUCTIVITY 
C     film_coeff :  FILM COEFFICIENT
C     T     :  TEMPERATURE AT TIME T + DELTA T
C     temp_kinpt_prev  :  TEMPERATURE AT TIME T
C     TSINK :  SINK TEMPERATURE 
C     dtemdx_kinpt_current_X  :  DERIVATIVE OF TEMPERATURE WRT X
C     dtemdx_kinpt_current_Y  :  DERIVATIVE OF TEMPERATURE WRT Y
C     dtemp_dtime_kinpt_current  :  DERIVATIVE OF TEMPERATURE WRT TO TIME
C     DCDT  :  DERIVATIVE OF CONDUCTIVITY WRT TO TEMPERATURE
C     xi_int     :  ISOPARAMETRIC COORDINATE, XI
C     eta_int     :  ISOPARAMETRIC COORDINATE, ETA
C     dvol    :  GAUSS WEIGHT MULTIPLIED BY JACOBIAN OF TRANSFORMATION
C     N_shape_node_to_kinpt   :  INTERPOLATION FUNCTIONS
C     N_deriv_global_kinpt_current_X  :  DERIVATIVE OF N_shape_node_to_kinpt WRT X
C     N_deriv_global_kinpt_current_Y  :  DERIVATIVE OF N_shape_node_to_kinpt WRT Y
C     N_deriv_local_kinpt_current_X  :  DERIVATIVE OF N_shape_node_to_kinpt WRT XI
C     N_deriv_local_kinpt_current_Y  :  DERIVATIVE OF N_shape_node_to_kinpt WRT ETA
C
C     MATERIAL PROPERTY DEFINITION
C
      rho_heat   = PROPS(2)
      cp_heat  = PROPS(3)
      conductivity = 204.D0

    initialising
        do k1=1,ndofel
            rhs(k1,1)=0.d0
        end do
        amatrx=0.d0        
C
      IF (LFLAGS(3).EQ.4) RETURN
C
C     TRANSIENT ANALYSIS
C
      IF (LFLAGS(1).EQ.33) THEN
C
C     DETERMINE GAUSS POINT LOCATIONS
C
      CALL GSPT(xi_int_inter,eta_int_inter)
C
C     DETERMINE GAUSS WEIGHTS
C
      CALL GSWT(weight,GWE)
C
C     ASSEMBLE AMATRX AND RHS
C
      DO 300 K=1,9
C     LOOP THROUGH GAUSS PTS
      	xi_int=xi_int_inter(K)
      	eta_int=eta_int_inter(K)
      	CALL kjacobian(xi_int,eta_int,xi_int_inter,eta_int_inter,weight,N_shape_node_to_kinpt,N_deriv_global_kinpt_current_X,N_deriv_global_kinpt_current_Y,N_deriv_local_kinpt_current_X,N_deriv_local_kinpt_current_Y
     1           ,xjac_xx,xjac_xy,xjac_yx,xjac_yy,djac,coords,mcrd,nnode)  
      	dtemdx_kinpt_current_X=0.0d0
      	dtemdx_kinpt_current_Y=0.0d0
        temp_kinpt_current = 0.0d0
        temp_kinpt_prev= 0.0d0
      	DO I=1,8
           dtemdx_kinpt_current_X=U(I)*N_deriv_global_kinpt_current_X(I)+dtemdx_kinpt_current_X
           dtemdx_kinpt_current_Y=U(I)*N_deriv_global_kinpt_current_Y(I)+dtemdx_kinpt_current_Y
           temp_kinpt_current =U(I)*N_shape_node_to_kinpt(I)+temp_kinpt_current
           temp_kinpt_prev=(U(I)-DU(I,NRHS))*N_shape_node_to_kinpt(I)+temp_kinpt_prev
        END DO

        DCDT=0.0d0

        dtemp_dtime_kinpt_current=(temp_kinpt_current-temp_kinpt_prev)/dtime
        dvol=weight(K)*djac
        DO KI=1,8
C       LOOP OVER NODES
        RHS(KI,NRHS) = RHS(KI,NRHS) - 
     1                 dvol*
     (N_shape_node_to_kinpt(KI)*rho_heat*cp_heat*dtemp_dtime_kinpt_current + 
     
     conductivity*(N_deriv_global_kinpt_current_X(KI)*dtemdx_kinpt_current_X + 
                   N_deriv_global_kinpt_current_Y(KI)*dtemdx_kinpt_current_Y))

        DO KJ=1,8
        AMATRX(KI,KJ) = AMATRX(KI,KJ) + dvol*
        
        (N_shape_node_to_kinpt(KI)*N_shape_node_to_kinpt(KJ)*rho_heat* cp_heat/dtime 
     
     + conductivity*(N_deriv_global_kinpt_current_X(KI)*N_deriv_global_kinpt_current_X(KJ) + 
                     N_deriv_global_kinpt_current_Y(KI)*N_deriv_global_kinpt_current_Y(KJ)) 
     
     + DCDT*N_shape_node_to_kinpt(KJ)*(N_deriv_global_kinpt_current_X(KI)*dtemdx_kinpt_current_X + 
     3                 N_deriv_global_kinpt_current_Y(KI)*dtemdx_kinpt_current_Y))

        END DO
        END DO


  
  300 CONTINUE
C
C    FLUX BOUNDARY CONDITIONS
C
C      APPLIED DISTRIBUTED FLUX
C
       IF (JELEM.EQ.101.AND.JDLTYP(1,1).EQ.4) THEN
          xi_int=-1.
          DO KI=1,3
C         LOOP THROUGH GAUSS PTS
             eta_int=eta_int_inter(KI)
             CALL kjacobian(xi_int,eta_int,xi_int_inter,eta_int_inter,weight,N_shape_node_to_kinpt,N_deriv_global_kinpt_current_X,N_deriv_global_kinpt_current_Y,N_deriv_local_kinpt_current_X,N_deriv_local_kinpt_current_Y
     1            ,xjac_xx,xjac_xy,xjac_yx,xjac_yy,djac,coords,mcrd,nnode)  
             DS=SQRT(xjac_xy*xjac_xy + xjac_yy*xjac_yy)
             DO KJ=7,9
C            LOOP THROUGH NODES
                RHS(IFACE(KJ),NRHS) = RHS(IFACE(KJ),NRHS) 
     1                      + GWE(KI)*DS*N_shape_node_to_kinpt(IFACE(KJ))*ADLMAG(1,1)
             END DO
          END DO
       END IF
C
C      FILM CONDITION
C
       IF (JELEM.EQ.102) THEN
          TSINK=200.0d0
          film_coeff=500.0d0
          C=1.
          DO KI=1,3
C         LOOP THROUGH GAUSS PTS
             E=eta_int_inter(KI)
             CALL kjacobian(C,E,xi_int_inter,eta_int_inter,weight,N_shape_node_to_kinpt,
             N_deriv_global_kinpt_current_X,
             N_deriv_global_kinpt_current_Y,
             N_deriv_local_kinpt_current_X,
             N_deriv_local_kinpt_current_Y,
     1       xjac_xx,xjac_xy,xjac_yx,xjac_yy,djac,coords,mcrd,nnode)  
             temp_kinpt_current=0.0
  	     DO I=1,8
               temp_kinpt_current=U(I)*N_shape_node_to_kinpt(I)+temp_kinpt_current
             END DO
             DS=SQRT(xjac_xy*xjac_xy + xjac_yy*xjac_yy)
             DO KJ=3,5
C            LOOP THROUGH NODES
                RHS(IFACE(KJ),NRHS) = RHS(IFACE(KJ),NRHS) - 
     1                  GWE(KI)*DS*N_shape_node_to_kinpt(IFACE(KJ))*film_coeff*(temp_kinpt_current-TSINK)
             DO KK=1,8
C            LOOP THROUGH NODES
                AMATRX(IFACE(KJ),KK)= AMATRX(IFACE(KJ),KK) + 
     1                  GWE(KI)*DS*N_shape_node_to_kinpt(IFACE(KJ))*film_coeff*N_shape_node_to_kinpt(KK)
             END DO
             END DO
          END DO
       END IF

      END IF
      RETURN
      END



      SUBROUTINE GSPT(xi_int_inter,eta_int_inter)
      INCLUDE 'aba_param.inc'
      DIMENSION AR(3),xi_int_inter(9),eta_int_inter(9)

C
C     xi_int_inter: X COORDINATE OF GAUSS PT
C     eta_int_inter: Y COORDINATE OF GAUSS PT
C
      R=SQRT(6.0d0/2.0d0)
      AR(1)=-1.0d0
      AR(2)=0.0d0
      AR(3)=1.0d0
      DO 10 I=1,3
      DO 10 J=1,3
      NUMGP=(I-1)*3+J
      xi_int_inter(NUMGP)=AR(I)*R
      eta_int_inter(NUMGP)=AR(J)*R
 10   CONTINUE
      RETURN
      END
C
C
      SUBROUTINE GSWT(weight,GWE)
      INCLUDE 'aba_param.inc'
      DIMENSION weight(9),GWE(3)
C
      PARAMETER(5.0d0=5.D0,8.0d0=8.D0,9.0d0=9.D0)
C
C     weight : GAUSS WEIGHT
C
      GWE(1)=5.0d0/9.0d0
      GWE(2)=8.0d0/9.0d0
      GWE(3)=5.0d0/9.0d0
      DO 10 I=1,3
      DO 10 J=1,3
      NUMGP=(I-1)*3+J
      weight(NUMGP)=GWE(I)*GWE(J)
 10   CONTINUE
      RETURN
      END
C
C
      SUBROUTINE kjacobian(xi_int,eta_int,xi_int_inter,eta_int_inter,weight,
                        N_shape_node_to_kinpt,N_deriv_global_kinpt_current_X,
                        N_deriv_global_kinpt_current_Y,N_deriv_local_kinpt_current_X,
                        N_deriv_local_kinpt_current_Y,
     1 xjac_xx,xjac_xy,xjac_yx,xjac_yy,djac,coords,mcrd,nnode)
      INCLUDE 'aba_param.inc'
      DIMENSION N_shape_node_to_kinpt(8),N_deriv_global_kinpt_current_X(8),N_deriv_global_kinpt_current_Y(8),N_deriv_local_kinpt_current_X(8),N_deriv_local_kinpt_current_Y(8),
     1 coords(mcrd,nnode)

C
C     INTERPOLATION FUNCTIONS
C
      N_shape_node_to_kinpt(1) = 0.25d0*(1.0d0-xi_int)*(1.0d0-eta_int)*(-xi_int-eta_int-1.0d0)
      N_shape_node_to_kinpt(2) = 0.25d0*(1.0d0+xi_int)*(1.0d0-eta_int)*(xi_int-eta_int-1.0d0)
      N_shape_node_to_kinpt(3) = 0.25d0*(1.0d0+xi_int)*(1.0d0+eta_int)*(xi_int+eta_int-1.0d0)
      N_shape_node_to_kinpt(4) = 0.25d0*(1.0d0-xi_int)*(1.0d0+eta_int)*(-xi_int+eta_int-1.0d0)
      N_shape_node_to_kinpt(5) = 0.50d0*(1.0d0-xi_int*xi_int)*(1.0d0-eta_int)
      N_shape_node_to_kinpt(6) = 0.50d0*(1.0d0+xi_int)*(1.0d0-eta_int*eta_int)
      N_shape_node_to_kinpt(7) = 0.50d0*(1.0d0-xi_int*xi_int)*(1.0d0+eta_int)
      N_shape_node_to_kinpt(8) = 0.50d0*(1.0d0-xi_int)*(1.0d0-eta_int*eta_int)
C
C     DERIVATIVES WRT TO C
C
      N_deriv_local_kinpt_current_X(1) = 0.25d0*(1.0d0-eta_int)*(2.0d0*xi_int+eta_int)
      N_deriv_local_kinpt_current_X(2) = 0.25d0*(1.0d0-eta_int)*(2.0d0*xi_int-eta_int)
      N_deriv_local_kinpt_current_X(3) = 0.25d0*(1.0d0+eta_int)*(2.0d0*xi_int+eta_int)
      N_deriv_local_kinpt_current_X(4) = 0.25d0*(1.0d0+eta_int)*(2.0d0*xi_int-eta_int)
      N_deriv_local_kinpt_current_X(5) = -xi_int*(1.0d0-eta_int)
      N_deriv_local_kinpt_current_X(6) = 0.50d0*(1.0d0-eta_int*eta_int)
      N_deriv_local_kinpt_current_X(7) = -xi_int*(1.0d0+eta_int)
      N_deriv_local_kinpt_current_X(8) = -0.50d0*(1.0d0-eta_int*eta_int)
C
C     DERIVATIVES WRT TO E
C
      N_deriv_local_kinpt_current_Y(1) = 0.25d0*(1.0d0-xi_int)*(2.0d0*eta_int+xi_int)
      N_deriv_local_kinpt_current_Y(2) = 0.25d0*(1.0d0+xi_int)*(2.0d0*eta_int-xi_int)
      N_deriv_local_kinpt_current_Y(3) = 0.25d0*(1.0d0+xi_int)*(2.0d0*eta_int+xi_int)
      N_deriv_local_kinpt_current_Y(4) = 0.25d0*(1.0d0-xi_int)*(2.0d0*eta_int-xi_int)
      N_deriv_local_kinpt_current_Y(5) = -0.50d0*(1.0d0-xi_int*xi_int)
      N_deriv_local_kinpt_current_Y(6) = -eta_int*(1.0d0+xi_int)   
      N_deriv_local_kinpt_current_Y(7) = 0.50d0*(1.0d0-xi_int*xi_int)
      N_deriv_local_kinpt_current_Y(8) = -eta_int*(1.0d0-xi_int)    

      xjac_xx=0.0d0
      xjac_xy=0.0d0
      xjac_yx=0.0d0
      xjac_yy=0.0d0

      DO 3 I=1,8
        xjac_xx=xjac_xx+coords(1,I)*N_deriv_local_kinpt_current_X(I)
        xjac_xy=xjac_xy+coords(1,I)*N_deriv_local_kinpt_current_Y(I)
        xjac_yx=xjac_yx+coords(2,I)*N_deriv_local_kinpt_current_X(I)
        xjac_yy=xjac_yy+coords(2,I)*N_deriv_local_kinpt_current_Y(I)
    3 CONTINUE
C
C     CALCULATION OF JACOBIAN
C
      djac=(xjac_xx*xjac_yy-xjac_xy*xjac_yx)
C
C     DERIVATIVES WRT TO X AND Y
C
      DO 5 I=1,8
        N_deriv_global_kinpt_current_X(I)=(N_deriv_local_kinpt_current_X(I)*xjac_yy-N_deriv_local_kinpt_current_Y(I)*xjac_yx)/djac
        N_deriv_global_kinpt_current_Y(I)=(N_deriv_local_kinpt_current_Y(I)*xjac_xx-N_deriv_local_kinpt_current_X(I)*xjac_xy)/djac
5     CONTINUE
      RETURN
      END
