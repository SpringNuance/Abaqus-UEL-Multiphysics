!
!    ABAQUS format UEL subroutine
!
!    This file is compatible with both EN234_FEA and ABAQUS/Standard
!
!    The example implements a standard fully integrated 3D linear elastic continuum element
!
!    The file also contains the following subrouines:
!          abq_UEL_3D_integrationpoints           - defines integration ponits for 3D continuum elements
!          abq_UEL_3D_shapefunctions              - defines shape functions for 3D continuum elements
!          abq_UEL_invert3D                       - computes the inverse and determinant of a 3x3 matrix
!          abq_facenodes_3D                       - returns list of nodes on the face of a 3D element
!
!=========================== ABAQUS format user element subroutine ===================

      SUBROUTINE UEL(RHS,AMATRX,SVARS,ENERGY,NDOFEL,NRHS,NSVARS,
     1     PROPS,NPROPS,COORDS,MCRD,NNODE,U,DU,V,A,JTYPE,TIME,DTIME,
     2     KSTEP,KINC,JELEM,PARAMS,NDLOAD,JDLTYP,ADLMAG,PREDEF,NPREDF,
     3     LFLAGS,MLVARX,DDLMAG,MDLOAD,PNEWDT,JPROPS,NJPROP,PERIOD)
    !
      INCLUDE 'ABA_PARAM.INC'
    !
    !
      DIMENSION RHS(MLVARX,*),AMATRX(NDOFEL,NDOFEL),PROPS(*),
     1   SVARS(*),ENERGY(8),COORDS(MCRD,NNODE),U(NDOFEL),
     2   DU(MLVARX,*),V(NDOFEL),A(NDOFEL),TIME(2),PARAMS(*),
     3   JDLTYP(MDLOAD,*),ADLMAG(MDLOAD,*),DDLMAG(MDLOAD,*),
     4   PREDEF(2,NPREDF,NNODE),LFLAGS(*),JPROPS(*)

    !
    !       Variables that must be computed in this routine
    !       RHS(i)                     Right hand side vector.  In EN234_FEA the dimensions are always RHS(MLVARX,1)
    !       AMATRX(i,j)                Stiffness matrix d RHS(i)/ d DU(j)
    !       SVARS(1:NSVARS)            Element state variables.  Must be updated in this routine
    !       ENERGY(1:8)
    !                                  Energy(1) Kinetic Energy
    !                                  Energy(2) Elastic Strain Energy
    !                                  Energy(3) Creep Dissipation
    !                                  Energy(4) Plastic Dissipation
    !                                  Energy(5) Viscous Dissipation
    !                                  Energy(6) Artificial strain energy
    !                                  Energy(7) Electrostatic energy
    !                                  Energy(8) Incremental work done by loads applied to the element
    !       PNEWDT                     Allows user to control ABAQUS time increments.
    !                                  If PNEWDT<1 then time step is abandoned and computation is restarted with
    !                                  a time increment equal to PNEWDT*DTIME
    !                                  If PNEWDT>1 ABAQUS may increase the time increment by a factor PNEWDT
    !
    !       Variables provided for information
    !       NDOFEL                     Total # DOF for the element
    !       NRHS                       Dimension variable
    !       NSVARS                     Total # element state variables
    !       PROPS(1:NPROPS)            User-specified properties of the element
    !       NPROPS                     No. properties
    !       JPROPS(1:NJPROPS)          Integer valued user specified properties for the element
    !       NJPROPS                    No. integer valued properties
    !       COORDS(i,N)                ith coordinate of Nth node on element
    !       MCRD                       Maximum of (# coords,minimum of (3,#DOF)) on any node
    !       U                          Vector of DOF at the end of the increment
    !       DU                         Vector of DOF increments
    !       V                          Vector of velocities (defined only for implicit dynamics)
    !       A                          Vector of accelerations (defined only for implicit dynamics)
    !       TIME(1:2)                  TIME(1)   Current value of step time
    !                                  TIME(2)   Total time
    !       DTIME                      Time increment
    !       KSTEP                      Current step number (always 1 in EN234_FEA)
    !       KINC                       Increment number
    !       JELEM                      User assigned element number in ABAQUS (internally assigned in EN234_FEA)
    !       PARAMS(1:3)                Time increment parameters alpha, beta, gamma for implicit dynamics
    !       NDLOAD                     Number of user-defined distributed loads defined for this element
    !       JDLTYP(1:NDLOAD)           Integers n defining distributed load types defined as Un or (if negative) UnNU in input file
    !       ADLMAG(1:NDLOAD)           Distributed load magnitudes
    !       DDLMAG(1:NDLOAD)           Increment in distributed load magnitudes
    !       PREDEF(1:2,1:NPREDF,1:NNODE)   Predefined fields.
    !       PREDEF(1,...)              Value of predefined field
    !       PREDEF(2,...)              Increment in predefined field
    !       PREDEF(1:2,1,k)            Value of temperature/temperature increment at kth node
    !       PREDEF(1:2,2:NPREDF,k)     Value of user defined field/field increment at kth node (not used in EN234FEA)
    !       NPREDF                     Number of predefined fields (1 for en234FEA)
    !       LFLAGS                     Control variable
    !       LFLAGS(1)                  Defines procedure type
    !       LFLAGS(2)                  0 => small displacement analysis  1 => Large displacement (NLGEOM option)
    !       LFLAGS(3)                   1 => Subroutine must return both RHS and AMATRX (always true in EN234FEA)
    !                                   2 => Subroutine must return stiffness AMATRX = -dF/du
    !                                   3 => Subroutine must return daming matrix AMATRX = -dF/dudot
    !                                   4 => Subroutine must return mass matrix AMATRX = -dF/duddot
    !                                   5 => Define the RHS only
    !                                   6 => Define the mass matrix for the initial acceleration calculation
    !                                   100 => Define perturbation quantities for output
    !       LFLAGS(4)                   0 => General step   1 => linear perturbation step
    !       LFLAGS(5)                   0 => current approximation to solution based on Newton correction; 1 => based on extrapolation
    !       MLVARX                      Dimension variable (equal to NDOFEL in EN234FEA)
    !       PERIOD                      Time period of the current step
    !
    !
    ! Local Variables
      integer      :: i,j,n_points,kint, nfacenodes, ipoin, ie
      integer      :: face_node_list(8)                       ! List of nodes on an element face
    !
      double precision  ::  xi(3,64)                          ! Volumetric Integration points
      double precision  ::  w(64)                             ! Integration weights
      double precision  ::  N(20)                             ! 3D Shape functions
      double precision  ::  dNdxi(20,3)                       ! 3D Shape function derivatives
      double precision  ::  dxdxi(3,3)                        ! Derivative of position wrt normalized coords
      double precision  ::  dNdx(20,3)                        ! Derivative of shape functions wrt reference coords
      double precision  ::  dNdy(20,3)                        ! Derivative of shape functions wrt deformed coords
    !
    !   Variables below are for computing integrals over element faces
      double precision  ::  face_coords(3,8)                  ! Coords of nodes on an element face
      double precision  ::  xi2(2,9)                          ! Area integration points
      double precision  ::  N2(9)                             ! 2D shape functions
      double precision  ::  dNdxi2(9,2)                       ! 2D shape function derivatives
      double precision  ::  norm(3)                           ! Normal to an element face
      double precision  ::  dxdxi2(3,2)                       ! Derivative of spatial coord wrt normalized areal coord
    !
      double precision  ::  stress(6)                         ! Stress vector contains [s11, s22, s33, s12, s13, s23]
      double precision  ::  F(3,3)                            ! Deformation gradient
      double precision  ::  Finv(3,3)                         ! Inverse of deformation gradient
      double precision  ::  B(3,3)                            ! C-G deformation tensor
      double precision  ::  JJ                                ! det(F)
      double precision  ::  G(6,9)
      double precision  ::  D(6,6)                            ! Material tangent
      double precision  ::  Bbar(6,60)                        ! strain = Bbar*(dof_total)
      double precision  ::  Bstar(9,60)                       ! F = Bstar*(dof_total)
      double precision  ::  Pvec(3*NNODE)
      double precision  ::  Pmat(3*NNODE,3*NNODE)
      double precision  ::  P(3*NNODE,3*NNODE)     !
      double precision  ::  S(3,NNODE)
      double precision  ::  Svec(3*NNODE)
      double precision  ::  Smat(3*NNODE,3*NNODE)
      double precision  ::  dxidx(3,3), determinant           ! Jacobian inverse and determinant

    !
    !     Example ABAQUS UEL implementing 3D linear elastic elements
    !     El props are:

    !     PROPS(1)         Young's modulus
    !     PROPS(2)         Poisson's ratio

      if (NNODE == 4) n_points = 1               ! Linear tet
      if (NNODE == 10) n_points = 4              ! Quadratic tet
      if (NNODE == 8) n_points = 8               ! Linear Hex
      if (NNODE == 20) n_points = 27             ! Quadratic hex

      call abq_UEL_3D_integrationpoints(n_points, NNODE, xi, w)

      if (MLVARX<3*NNODE) then
        write(6,*) ' Error in abaqus UEL '
        write(6,*) ' Variable MLVARX must exceed 3*NNODE'
        write(6,*) ' MLVARX = ',MLVARX,' NNODE = ',NNODE
        stop
      endif

      RHS(1:MLVARX,1) = 0.d0
      AMATRX(1:NDOFEL,1:NDOFEL) = 0.d0


      ENERGY(1:8) = 0.d0

    !     --  Loop over integration points
      do kint = 1, n_points
        call abq_UEL_3D_shapefunctions(xi(1:3,kint),NNODE,N,dNdxi)
        dxdxi = matmul(coords(1:3,1:NNODE),dNdxi(1:NNODE,1:3))
        call abq_UEL_invert3d(dxdxi,dxidx,determinant)
        dNdx(1:NNODE,1:3) = matmul(dNdxi(1:NNODE,1:3),dxidx)

        ! Caculate the deformation gradient
        do i = 1,3
            ie = 3*(NNODE-1)+i
            F(i,1:3) = matmul(U(i:ie:3),dNdx(1:NNODE,1:3))
            F(i,i) = F(i,i) + 1.d0
        end do
        B = matmul(F,transpose(F))
        
        call abq_UEL_invert3d(F,Finv,JJ)
        dNdy(1:NNODE,1:3) = matmul(dNdx(1:NNODE,1:3),Finv)
        
        call neohooke(PROPS(1:NPROPS),NPROPS,F,JJ,stress,D)

        Bbar = 0.d0
        Bbar(1,1:3*NNODE-2:3) = dNdy(1:NNODE,1)
        Bbar(2,2:3*NNODE-1:3) = dNdy(1:NNODE,2)
        Bbar(3,3:3*NNODE:3)   = dNdy(1:NNODE,3)
        Bbar(4,1:3*NNODE-2:3) = dNdy(1:NNODE,2)
        Bbar(4,2:3*NNODE-1:3) = dNdy(1:NNODE,1)
        Bbar(5,1:3*NNODE-2:3) = dNdy(1:NNODE,3)
        Bbar(5,3:3*NNODE:3)   = dNdy(1:NNODE,1)
        Bbar(6,2:3*NNODE-1:3) = dNdy(1:NNODE,3)
        Bbar(6,3:3*NNODE:3)   = dNdy(1:NNODE,2)        
        
        Bstar = 0.d0
        Bstar(1,1:3*NNODE-2:3) = dNdy(1:NNODE,1)
        Bstar(2,2:3*NNODE-1:3) = dNdy(1:NNODE,2)
        Bstar(3,3:3*NNODE:3)   = dNdy(1:NNODE,3)
        Bstar(4,1:3*NNODE-2:3) = dNdy(1:NNODE,2)
        Bstar(5,2:3*NNODE-1:3) = dNdy(1:NNODE,1)
        Bstar(6,1:3*NNODE-2:3) = dNdy(1:NNODE,3)
        Bstar(7,3:3*NNODE:3)   = dNdy(1:NNODE,1)
        Bstar(8,2:3*NNODE-1:3) = dNdy(1:NNODE,3)
        Bstar(9,3:3*NNODE:3)   = dNdy(1:NNODE,2)

        G(1,1:9) = [B(1,1),0.d0,0.d0,B(1,2),0.d0,B(1,3),0.d0,0.d0,0.d0]
        G(2,1:9) = [0.d0,B(2,2),0.d0,0.d0,B(1,2),0.d0,0.d0,B(2,3),0.d0]
        G(3,1:9) = [0.d0,0.d0,B(3,3),0.d0,0.d0,0.d0,B(1,3),0.d0,B(2,3)]
        G(4,1:9) = [B(1,2),B(1,2),0.d0,
     1                          B(2,2),B(1,1),B(2,3),0.d0,B(1,3), 0.d0]
        G(5,1:9) = [B(1,3),0.d0,B(1,3),
     1                          B(2,3),0.d0,B(3,3),B(1,1),0.d0,B(1,2)]
        G(6,1:9) = [0.d0,B(2,3),B(2,3),
     1                           0.d0,B(1,3),0.d0,B(1,2),B(3,3),B(2,2)]

        G = 2.d0*G

        RHS(1:3*NNODE,1) = RHS(1:3*NNODE,1)
     1   - matmul(transpose(Bbar(1:6,1:3*NNODE)),stress(1:6))*
     2                                          w(kint)*determinant

  
        AMATRX(1:3*NNODE,1:3*NNODE) = AMATRX(1:3*NNODE,1:3*NNODE)
     1  + matmul(transpose(Bbar(1:6,1:3*NNODE)),
     2     matmul(D,matmul(G,Bstar(1:9,1:3*NNODE))))*w(kint)*determinant

!       Geometric stiffness
        
        S = reshape(matmul(transpose(Bbar),stress),(/3,3*NNODE/3/))
        do i = 1,NNODE
          Pvec(1:3*NNODE) = reshape(spread(transpose(dNdy(i:i,1:3)),
     1                              dim=2,ncopies=NNODE),(/3*NNODE/))
          Pmat(3*i-2:3*i,1:3*NNODE) = spread(Pvec,dim=1,ncopies=3)
          Svec(1:3*NNODE) = reshape(spread(S(1:3,i:i),
     1                              dim=2,ncopies=NNODE),(/3*NNODE/))
          Smat(3*i-2:3*i,1:3*NNODE) = spread(Svec,dim=1,ncopies=3)
        end do
        
        AMATRX(1:3*NNODE,1:3*NNODE) = AMATRX(1:3*NNODE,1:3*NNODE) -
     1    Pmat(1:3*NNODE,1:3*NNODE)*transpose(Smat(1:3*NNODE,1:3*NNODE))
     2                          *w(kint)*determinant

        if (NSVARS>=n_points*6) then   ! Store Cauchy stress at each integration point (if space was allocated to do so)
            SVARS(6*kint-5:6*kint) =  stress(1:6)/JJ
        endif
      end do


      PNEWDT = 1.d0          ! This leaves the timestep unchanged (ABAQUS will use its own algorithm to determine DTIME)
    !
    !   Apply distributed loads
    !
    !   Distributed loads are specified in the input file using the Un option in the input file.
    !   n specifies the face number, following the ABAQUS convention.
    !
    !   This is coded to apply nominal tractions to the element face (the residual force does not change as the element deforms)
    !
    !
      do j = 1,NDLOAD

        call abq_facenodes_3D(NNODE,iabs(JDLTYP(j,1)),
     1                                     face_node_list,nfacenodes)

        do i = 1,nfacenodes
            face_coords(1:3,i) = coords(1:3,face_node_list(i))
        end do

        if (nfacenodes == 3) n_points = 3
        if (nfacenodes == 6) n_points = 4
        if (nfacenodes == 4) n_points = 4
        if (nfacenodes == 8) n_points = 9

        call abq_UEL_2D_integrationpoints(n_points, nfacenodes, xi2, w)

        do kint = 1,n_points
            call abq_UEL_2D_shapefunctions(xi2(1:2,kint),
     1                        nfacenodes,N2,dNdxi2)
            dxdxi2 = matmul(face_coords(1:3,1:nfacenodes),
     1                           dNdxi2(1:nfacenodes,1:2))
            norm(1)=(dxdxi2(2,1)*dxdxi2(3,2))-(dxdxi2(2,2)*dxdxi2(3,1))
            norm(2)=(dxdxi2(1,1)*dxdxi2(3,2))-(dxdxi2(1,2)*dxdxi2(3,1))
            norm(3)=(dxdxi2(1,1)*dxdxi2(2,2))-(dxdxi2(1,2)*dxdxi2(2,1))

            do i = 1,nfacenodes
                ipoin = 3*face_node_list(i)-2
                RHS(ipoin:ipoin+2,1) = RHS(ipoin:ipoin+2,1)
     1                 - N2(1:nfacenodes)*adlmag(j,1)*norm(1:3)*w(kint)      ! Note determinant is already in normal
            end do
        end do
      end do

      return

      END SUBROUTINE UEL


      subroutine neohooke(element_properties,n_properties,F,J,stress,D)

       implicit none

       integer, intent(in)           :: n_properties
       double precision, intent(in)  :: element_properties(n_properties)
       double precision, intent(in)  :: F(3,3)
       double precision, intent(in)  :: J
       double precision, intent(out) :: stress(6)
       double precision, intent(out) :: D(6,6)

       double precision :: B(3,3)
       double precision :: Binv(3,3)
       double precision :: Bvec(6)
       double precision :: Binvvec(6)
       double precision :: eyevec(6)
       double precision :: mu
       double precision :: K
       double precision :: ss
       double precision :: trB

       integer :: i

       !  This subroutine calculates the Kirchhoff stress tau = J*cauchy_stress (stored as a vector stress(i) = [tau_11, tau_22, tau_33, etc]
       !  and the tangent matrix D[I,J] = [dtau_11/dB_11, dtau_11/dB_22,... 
       !                                   dtau_22/dB_11, dtau_22/dB_22,
       !                                    etc
       
       mu = element_properties(1)
       K  = element_properties(2)

       B = matmul(F,transpose(F))
       call abq_UEL_invert3d(B,Binv,ss)      ! ss is just a dummy variable here

       ss = J**(-2.d0/3.d0)
       do i = 1,3
         stress(i) = mu*B(i,i)*ss
       end do
       trB = sum(stress(1:3))/3.d0
       stress(1:3) = stress(1:3) - trB + K*J*(J-1.d0)
       stress(4) = mu*B(1,2)*ss
       stress(5) = mu*B(1,3)*ss
       stress(6) = mu*B(2,3)*ss
       D = 0.d0
       D(1,1) = 1.d0
       D(2,2) = 1.d0
       D(3,3) = 1.d0
       D(4,4) = 0.5d0
       D(5,5) = 0.5d0
       D(6,6) = 0.5d0
       D = D*mu*ss

       eyevec(1:3) = 1.d0
       eyevec(4:6) = 0.d0
       Bvec(1) = B(1,1)
       Bvec(2) = B(2,2)
       Bvec(3) = B(3,3)
       Bvec(4) = B(1,2)
       Bvec(5) = B(1,3)
       Bvec(6) = B(2,3)
       Binvvec(1) = Binv(1,1)
       Binvvec(2) = Binv(2,2)
       Binvvec(3) = Binv(3,3)
       Binvvec(4) = Binv(1,2)
       Binvvec(5) = Binv(1,3)
       Binvvec(6) = Binv(2,3)

       trB = sum(Bvec(1:3))/3.d0

       D = D + (ss*mu/3.d0)*( trB*spread(eyevec,dim=2,ncopies=6)*
     1                                   spread(Binvvec,dim=1,ncopies=6) 
     2              - spread(eyevec,dim=2,ncopies=6)*
     3                                    spread(eyevec,dim=1,ncopies=6)  
     4              - spread(Bvec,dim=2,ncopies=6)*
     5                                 spread(Binvvec,dim=1,ncopies=6) )

       D = D + K*J*(J-0.5d0)*spread(eyevec,dim=2,ncopies=6)*
     1                                   spread(Binvvec,dim=1,ncopies=6)


       return

      end subroutine neohooke


