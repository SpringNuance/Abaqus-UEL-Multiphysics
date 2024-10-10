      SUBROUTINE UEL(RHS,AMATRX,SVARS,ENERGY,NDOFEL,NRHS,NSVARS,
     1     PROPS,NPROPS,COORDS,MCRD,NNODE,U,DU,V,A,JTYPE,TIME,DTIME,
     2     KSTEP,KINC,JELEM,PARAMS,NDLOAD,JDLTYP,ADLMAG,PREDEF,
     3     NPREDF,LFLAGS,MLVARX,DDLMAG,MDLOAD,PNEWDT,JPROPS,NJPROP,
     4     PERIOD)
C     
      INCLUDE 'ABA_PARAM.INC'
      PARAMETER ( ZERO = 0.D0, HALF = 0.5D0, ONE = 1.D0 )
C
      DIMENSION RHS(MLVARX,*),AMATRX(NDOFEL,NDOFEL),
     1     SVARS(NSVARS),ENERGY(8),PROPS(*),COORDS(MCRD,NNODE),
     2     U(NDOFEL),DU(MLVARX,*),V(NDOFEL),A(NDOFEL),TIME(2),
     3     PARAMS(3),JDLTYP(MDLOAD,*),ADLMAG(MDLOAD,*),
     4     DDLMAG(MDLOAD,*),PREDEF(2,NPREDF,NNODE),LFLAGS(*),
     5     JPROPS(*)
      DIMENSION SRESID(6)
C
C UEL SUBROUTINE FOR A HORIZONTAL TRUSS ELEMENT
C
C     SRESID - stores the static residual at time t+dt
C     SVARS  - In 1-6, contains the static residual at time t 
C              upon entering the routine. SRESID is copied to 
C              SVARS(1-6) after the dynamic residual has been 
C              calculated.
C            - For half-step residual calculations: In 7-12, 
C              contains the static residual at the beginning 
C              of the previous increment. SVARS(1-6) are copied 
C              into SVARS(7-12) after the dynamic residual has 
C              been calculated.
C
      AREA = PROPS(1)
      E    = PROPS(2)
      ANU  = PROPS(3)
      RHO  = PROPS(4)
C     
      ALEN = ABS(COORDS(1,2)-COORDS(1,1))
      AK   = AREA*E/ALEN
      AM   = HALF*AREA*RHO*ALEN
C
      DO K1 = 1, NDOFEL                      
        SRESID(K1) = ZERO
        DO KRHS = 1, NRHS
          RHS(K1,KRHS) = ZERO
        END DO
        DO K2 = 1, NDOFEL
          AMATRX(K2,K1) = ZERO
        END DO
      END DO
C
      IF (LFLAGS(3).EQ.1) THEN
C       Normal incrementation
        IF (LFLAGS(1).EQ.1 .OR. LFLAGS(1).EQ.2) THEN
C         *STATIC
          AMATRX(1,1) =  AK  
          AMATRX(4,4) =  AK  
          AMATRX(1,4) = -AK  
          AMATRX(4,1) = -AK
          IF (LFLAGS(4).NE.0) THEN
            FORCE  = AK*(U(4)-U(1))
            DFORCE = AK*(DU(4,1)-DU(1,1))
            SRESID(1) = -DFORCE
            SRESID(4) =  DFORCE
            RHS(1,1) = RHS(1,1)-SRESID(1)
            RHS(4,1) = RHS(4,1)-SRESID(4)
            ENERGY(2) = HALF*FORCE*(DU(4,1)-DU(1,1))
     *           + HALF*DFORCE*(U(4)-U(1))
     *           + HALF*DFORCE*(DU(4,1)-DU(1,1))
          ELSE
            FORCE = AK*(U(4)-U(1))
            SRESID(1) = -FORCE
            SRESID(4) =  FORCE
            RHS(1,1) = RHS(1,1)-SRESID(1)
            RHS(4,1) = RHS(4,1)-SRESID(4)
            DO KDLOAD = 1, NDLOAD
              IF (JDLTYP(KDLOAD,1).EQ.1001) THEN
                RHS(4,1)  = RHS(4,1)+ADLMAG(KDLOAD,1)
                ENERGY(8) = ENERGY(8)+(ADLMAG(KDLOAD,1)
     *               - HALF*DDLMAG(KDLOAD,1))*DU(4,1)
                IF (NRHS.EQ.2) THEN
C                 Riks
                  RHS(4,2) = RHS(4,2)+DDLMAG(KDLOAD,1)
                END IF
              END IF
            END DO
            ENERGY(2) = HALF*FORCE*(U(4)-U(1))
          END IF
        ELSE IF (LFLAGS(1).EQ.11 .OR. LFLAGS(1).EQ.12) THEN
C         *DYNAMIC
          ALPHA = PARAMS(1)
          BETA  = PARAMS(2)
          GAMMA = PARAMS(3)
C                  
          DADU = ONE/(BETA*DTIME**2)
          DVDU = GAMMA/(BETA*DTIME)
C                  
          DO K1 = 1, NDOFEL
            AMATRX(K1,K1) = AM*DADU
            RHS(K1,1) = RHS(K1,1)-AM*A(K1)
          END DO
          AMATRX(1,1) = AMATRX(1,1)+(ONE+ALPHA)*AK  
          AMATRX(4,4) = AMATRX(4,4)+(ONE+ALPHA)*AK  
          AMATRX(1,4) = AMATRX(1,4)-(ONE+ALPHA)*AK  
          AMATRX(4,1) = AMATRX(4,1)-(ONE+ALPHA)*AK
          FORCE = AK*(U(4)-U(1))
          SRESID(1) = -FORCE
          SRESID(4) =  FORCE
          RHS(1,1) = RHS(1,1) -
     *         ((ONE+ALPHA)*SRESID(1)-ALPHA*SVARS(1))
          RHS(4,1) = RHS(4,1) -
     *         ((ONE+ALPHA)*SRESID(4)-ALPHA*SVARS(4))
          ENERGY(1) = ZERO
          DO K1 = 1, NDOFEL
            SVARS(K1+6) = SVARS(k1)
            SVARS(K1)   = SRESID(K1)
            ENERGY(1)   = ENERGY(1)+HALF*V(K1)*AM*V(K1)
          END DO
          ENERGY(2) = HALF*FORCE*(U(4)-U(1))
        END IF
      ELSE IF (LFLAGS(3).EQ.2) THEN
C       Stiffness matrix
        AMATRX(1,1) =  AK  
        AMATRX(4,4) =  AK  
        AMATRX(1,4) = -AK  
        AMATRX(4,1) = -AK
      ELSE IF (LFLAGS(3).EQ.4) THEN
C       Mass matrix
        DO K1 = 1, NDOFEL
          AMATRX(K1,K1) = AM
        END DO
      ELSE IF (LFLAGS(3).EQ.5) THEN
C       Half-step residual calculation
        ALPHA = PARAMS(1)
        FORCE = AK*(U(4)-U(1))
        SRESID(1) = -FORCE
        SRESID(4) =  FORCE
        RHS(1,1) = RHS(1,1)-AM*A(1)-(ONE+ALPHA)*SRESID(1)
     *       + HALF*ALPHA*( SVARS(1)+SVARS(7) )
        RHS(4,1) = RHS(4,1)-AM*A(4)-(ONE+ALPHA)*SRESID(4)
     *       + HALF*ALPHA*( SVARS(4)+SVARS(10) )
      ELSE IF (LFLAGS(3).EQ.6) THEN
C       Initial acceleration calculation
        DO K1 = 1, NDOFEL
          AMATRX(K1,K1) = AM
        END DO
        FORCE = AK*(U(4)-U(1))
        SRESID(1) = -FORCE
        SRESID(4) =  FORCE
        RHS(1,1) = RHS(1,1)-SRESID(1)
        RHS(4,1) = RHS(4,1)-SRESID(4)
        ENERGY(1) = ZERO
        DO K1 = 1, NDOFEL
          SVARS(K1) = SRESID(K1)
          ENERGY(1) = ENERGY(1)+HALF*V(K1)*AM*V(K1)
        END DO
        ENERGY(2) = HALF*FORCE*(U(4)-U(1))
      ELSE IF (LFLAGS(3).EQ.100) THEN
C       Output for perturbations
        IF (LFLAGS(1).EQ.1 .OR. LFLAGS(1).EQ.2) THEN
C         *STATIC
          FORCE  = AK*(U(4)-U(1))
          DFORCE = AK*(DU(4,1)-DU(1,1))
          SRESID(1) = -DFORCE
          SRESID(4) =  DFORCE
          RHS(1,1) = RHS(1,1)-SRESID(1)
          RHS(4,1) = RHS(4,1)-SRESID(4)
          ENERGY(2) = HALF*FORCE*(DU(4,1)-DU(1,1))
     *         + HALF*DFORCE*(U(4)-U(1))
     *         + HALF*DFORCE*(DU(4,1)-DU(1,1))
          DO KVAR = 1, NSVARS
            SVARS(KVAR) = ZERO
          END DO
          SVARS(1) = RHS(1,1)
          SVARS(4) = RHS(4,1)
        ELSE IF (LFLAGS(1).EQ.41) THEN
C         *FREQUENCY
          DO KRHS = 1, NRHS
            DFORCE = AK*(DU(4,KRHS)-DU(1,KRHS))
            SRESID(1) = -DFORCE
            SRESID(4) =  DFORCE
            RHS(1,KRHS) = RHS(1,KRHS)-SRESID(1)
            RHS(4,KRHS) = RHS(4,KRHS)-SRESID(4)
          END DO
          DO KVAR = 1, NSVARS
            SVARS(KVAR) = ZERO
          END DO
          SVARS(1) = RHS(1,1)
          SVARS(4) = RHS(4,1)
        END IF
      END IF
C
      RETURN
      END         
