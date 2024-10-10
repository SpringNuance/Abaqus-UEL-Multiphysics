! feacheap.f90
!
! Simple general purpose FEM code.  August 2011
! A.F. Bower
! http://solidmechanics.org
!
program feacheap
  use Types
  use ParamIO
  use Globals
  implicit none

  ! Interface blocks

  include '../inc/misc.fi'
  include '../inc/solver.fi'
  include '../inc/stiftest.fi'
  include '../inc/timestep.fi'
  include '../inc/usrelem.fi'
  include '../inc/usrprn.fi'
  include '../inc/usrstep.fi'
  include '../inc/mesh_routines.fi'
  include '../inc/el_linelast_3Dbasic.fi'

  integer :: MAXFIL

  parameter (MAXFIL = 20)  ! Max no. output files

  !-------------------Parameters governing storage for finite element routines --------------------

  integer :: MAXMSH,MAXNOD,MAXCOR,MAXDOF,MAXSTN
  integer :: MAXZON,MAXLMN,MAXCON,MAXPRP,MAXVAR,MAXHST
  integer :: MAXHVL,MAXMPC,MAXPMP,MAXFIX,MAXFOR,MAXDLD,MAXDPR,MAXDLV
  integer :: MAXSLO,MAXSUP,MAXNND,MAXEQ,MAXEPN,MAXLMP
  integer :: MAXUPR,MAXNWT,MAXUSP


  parameter (MAXNOD = 6000)  !     --  Max no. nodes
  parameter (MAXCOR = 3*MAXNOD)  !     --  Max size of storage for coords
  parameter (MAXDOF = 3*MAXNOD)  !     --  Max size of storage for DOF
  parameter (MAXSTN = MAXNOD)  !     --  Max storage for nodal stat/props
  parameter (MAXZON = 20)    !     --  Max no. element zones
  parameter (MAXLMN = 5000)  !     --  Max total no. elements
  parameter (MAXCON = 20*MAXLMN)  !     --  Max storage for connectivity
  parameter (MAXPRP = 4000)  !     --  Max storage for element props
  parameter (MAXVAR = 20*MAXLMN)  !     --  Max storage for state variables
  parameter (MAXHST = 10)  !     --  Max no. load histories
  parameter (MAXHVL = 500)  !     --  Max storage for history parameters
  parameter (MAXMPC = 1000)  !     --  Max storage for MPCs
  parameter (MAXPMP = 20)    !     -- Max storage for MPC properties
  parameter (MAXFIX = MAXNOD/2)  !     --  Max storage for fixed DOFs on boundary
  parameter (MAXFOR = MAXNOD/10)  !     --  Max storage for nodal forces on boundary
  parameter (MAXDLD = MAXLMN/10)  !     --  Max storage for distributed loads
  parameter (MAXDPR = MAXLMN/10)  !     --  Max storage for distributed load parameters
  parameter (MAXNND = MAXNOD+MAXMPC)   ! -- Max storage for renumbered nodes
  parameter (MAXEQ = 5*MAXNOD)  !     --  Max no. equations
  parameter (MAXEPN = 30*MAXNOD)  !     --  Max storage for link list used in assembling index stored stiffness
  parameter (MAXLMP = 11*MAXNOD)  !     --  Max storage for nodal values of state variables (for state projection)
  parameter (MAXUPR = 50)  !     --  Max storage for parameters controlling user defined printing
  parameter (MAXUSP = 20)  !     --  Max storage for parameters controlling user defined step
  parameter (MAXNWT = 100)  !     --  Max no. Newton-Raphson iteration

  !--------------Parameters governing storage for BC generation

  integer :: MAXNST,MAXLST,MAXNSL,MAXLSL,MAXDDF,MAXDVL,MAXDLF

  parameter(MAXNST=200)  !     --  Max no. node sets
  parameter(MAXLST=200)  !     --  Max no. element sets
  parameter(MAXNSL=MAXNOD/2)  !     --  Max storage for node sets
  parameter(MAXLSL=MAXLMN/10)  !     --  Max storage for element sets
  parameter(MAXDDF=100)  !     --  Max no. DOF definitions
  parameter(MAXDVL=100)  !     --  Max no. DOF values for definitions
  parameter(MAXDLF=100)  !     --  Max no. distributed load definitions
  parameter(MAXDLV=100)  !     --  Max no. distributed load definitions


  !     --  Max. no. parameters controlling load history

  integer :: MAXLPR
  parameter (MAXLPR = 100)


  !     --  Max. no. parameters controlling time stepping

  integer :: MAXTPR
  parameter (MAXTPR = 100)

  integer :: nfiles                           !     No. files
  character ( len = 100 ) :: fillst(MAXFIL)
  integer :: iunfil(MAXFIL)                   !     Unit numbers attached to each file
  integer :: nupiun                           !     No. unit numbers for for user subroutine controlled printing
  integer :: iunlst(MAXFIL)                   !     List of unit numbers for user subroutine controlling printing
  integer :: nprpar                           !     No. user print parameters
  real ( prec ) :: parprn(MAXUPR)             !     Parameters for user subroutine controlling printing
  integer :: iunm                             !     Unit number for mesh prints
  integer :: iblnk                              ! Set to 1 for blank line
  integer :: itype
  integer :: nstr                               ! No. strings parsed
  character ( len = 100 ) :: strin
  character ( len = 100 ) :: strpar(100)
  character ( len = 100 ) :: fname
  character ( len = 100 ) :: infil, outfil
!  logical :: strcmp

  integer :: ityp(100), lenstr(100)  

  !--------------------------Data structures for finite element routines --------------------
  !     NZONE         No. zones (sets of elements with different properties)
  !     NELM          No. elements 
  !     NOPS          No. nodes
  !     NMPC          No. multi--point constraints
  !     NFIX          No. prescribed DOF
  !     NFOR          No. prescribed nodal forces
  !     NDLOAD        No. elements with prescribed distributed loads

  !     ICON(I)        Connectivity array.  Note that
  !     ICON(IEP(2,LMN)+J-1) gives Jth node connected to LMNth element
  !     IEP(I,J)       Property and state pointer for Jth element
  !     IEP(1,J)   Flag specifying element type
  !     IEP(2,J)   Pointer to connectivity array:  Nodes on Jth element begin
  !     at ICON(IEP(2,J))
  !     IEP(3,J)   No. nodes on Jth element
  !     IEP(4,J)   Pointer to property array: properties for Jth element
  !     begin at EPROP(IEP(4,J)) and end at EPROP(IEP(4,J)+IEP(5,J))
  !     IEP(5,J)   No. material props for Jth element
  !     IEP(6,J)   Pointer to state variable array: state variables for
  !     Jth element begin at SVAR(IEP(6,J)) and end at
  !     SVAR(IEP(6,J)+IEP(7,J)
  !     IEP(7,J)   No. state variables on Jth element
  !     IZPLMN(I,J)         Pointer array dividing elements in a mesh by zone.
  !     IZPLMN(1,J) gives first element in a zone, IZPLMN(2,J) gives last
  !     element in the zone.

  !     NODPN(I,J)     Nodal pointer for Jth node
  !     NODPN(1,J)   Flag specifying node type
  !     NODPN(2,J)   Pointer to coordinate array: coords for Jth node
  !     begin at X(NODPN(2,J)) and end at X(NODPN(2,J)+NODPN(3,J))
  !     NODPN(3,J)   No. coordinates for Jth node
  !     NODPN(4,J)   Pointer to DOF arrays: First DOF at Jth node is stored at
  !     UTOT(NODPN(4,J)) (or DU(NODPN(4,J)))
  !     Similarly, residual force associated with first DOF at Jth
  !     node is stored at RFOR(NODPN(4,J))
  !     NODPN(5,J)   No. DOF for Jth node
  !     NODPN(6,J)   Pointer to nodal state/property array.  Props for Jth node
  !     start at STNOD(NODPN(6,J))
  !     NODPN(7,J)   No. state/props associated with Jth node.

  !     X(J)           Nodal coordinate array
  !     UTOT(J)        Array of accumulated degrees of freedom
  !     DU(J)          Array of increment in DOF
  !     RFOR(J)        Array of residual forces

  !     SVART(J)       state variable at end of preceding step
  !     SVARU(J)       state variable at end of current step

  !     LSTMPC(I,J)     List of multi--point constraints
  !     LSTMPC(1,J)  Flag for Jth constraint
  !     LSTMPC(2,J)  Node no. for first node in constraint
  !     LSTMPC(3,J)  DOF of first node
  !     LSTMPC(4,J)  Node no. for second constraint
  !     LSTMPC(5,J)  DOF of second node
  !     LSTMPC(6,J)  Pointer in first array controlling parameters for MPCs
  !     LSTMPC(7,J)  No. parameters for Jth MPC
  !     PARMPC(K)      Kth parameter (passed through to user subroutine)
  !     RMPC(J)         Value of Lagrange multiplier associated with Jth constraint
  !     DRMPC(J)        Correction to lagrange multiplier associated with Jth constraint



  integer ::  nzone                  ! No. element zones
  integer ::  nelm                   ! No. elements and pointers  
  integer ::  nops                   ! No. nodes and pointers  
  integer ::  nmpc                   ! No. MPCs and pointers  
  integer ::  nfix                   ! No. constrained BCs and pointers  
  integer ::  nfor                   ! No. prescribed forces and pointers
  integer ::  ndload                 ! No. distributed loads and pointers

  integer :: icon(MAXCON)                       ! Connectivity array
  integer :: itopc                              ! Last filled intry in icon
  integer :: iep(7, MAXLMN)                     ! Element property pointer array
  integer :: itoprp                             ! Top of element property array
  integer :: izplmn(2, MAXZON)                  ! First/last el #s in each zone
  real ( prec ) :: eprop(MAXPRP)                ! Element property values
  real ( prec ) :: density(MAXZON)              ! Mass density
  integer :: itops                              ! Top of state var array
  real ( prec ) :: svart(MAXVAR)                ! State var values at time t
  real ( prec ) :: svaru(MAXVAR)                ! State var values at time t+dt

  integer :: lstmpc(7, MAXMPC)                  ! MPC pointer array
  integer :: itopmp                             ! Top of MPC parameter array
  real ( prec ) :: parmpc(MAXPMP)               ! MPC properties
  real ( prec ) :: rmpc(MAXMPC)                 ! Residual force values for MPCs
  real ( prec ) :: drmpc(MAXMPC)                ! Increment in residual forces for MPCs

  integer :: nodpn(7, MAXNOD)                   ! Nodal property pointer array
  integer :: itopx                              ! Top of nodal coord array
  real ( prec ) ::  x(MAXCOR)                   ! Nodal coordinate array
  integer :: itopu                              ! Top of DOF array
  real ( prec ) ::  utot(MAXDOF)                ! Nodal DOF array
  real ( prec ) ::  du(MAXDOF)                  ! Increment in nodal DOF
  real ( prec ) ::  stnod(MAXSTN)               ! Nodal state var array
  real ( prec ) ::  rfor(MAXDOF)                ! Residual force array
  integer :: numnod(MAXNND)                     ! Node numbers assigned by bandwidth minimizer
  integer :: numnod_projection(MAXNND)          ! Node numbers for state projection

  integer :: nstat                              ! No. state vars projected to nodes
  logical :: lumpedprojection                   ! Set to .true. to project state using lumped matrix
  real ( prec ) :: stlump(MAXLMP)               ! Lumped or projected nodal state vars
  integer ::  lumpn(2,MAXNOD,MAXZON)            ! Nodal state pointer

! 
  integer :: nhist                              ! No. load histories
  character ( len = 100 ) :: histnam(MAXHST)     ! History names
  integer                :: ipnhist(2,MAXHST)   ! Pointer for history names
  integer :: histpoin(2,MAXHST)                 ! Nodal DOF history pointer array
  real ( prec ) :: histvals(MAXHVL)             ! Values of DOF history
  integer :: lstfix(2, MAXFIX)                  ! Constrained DOF pointer array
  real ( prec ) :: dofval(MAXFIX)               ! DOF values
  integer :: lstfor(2, MAXFOR)                  ! Nodal force pointer array
  real ( prec ) :: forval(MAXFOR)               ! Nodal force values
  integer :: lstlod(5, MAXDLD)                  ! Distributed load pointer array
  real ( prec ) :: dlprops(MAXDPR)              ! Distributed load property array
  integer :: itopdlp                            ! Top of distributed load property array

  logical :: ifl                                ! set to TRUE for unsymmetric stiffness
  integer :: isolv                              ! set to 0 for linear static step, 1 for nonlinear N-R step
  integer :: solvertype                         ! Sets type of solver to use
  logical :: stifcheck                          ! set to TRUE by CHECK STIFFNESS key
  integer :: atop                               ! Top of A arrays (used for cg solver)
  real ( prec ), allocatable ::  alow(:)        ! Lower half of global stiffness matrix
  real ( prec ), allocatable ::  aupp(:)        ! Upper half of global stiffness matrix
  real ( prec ) :: diag(MAXEQ)                  ! Diagonal of global stiffness matrix
  real ( prec ) :: rhs(MAXEQ)                   ! RHS of global equation system
  real ( prec ) :: lmass(MAXDOF)                ! Lumped mass matrix for explicit dynamics
  real ( prec ) :: vel(MAXDOF)                  ! Velocity vector for explicit dynamics
  real ( prec ) :: forc(MAXDOF)                 ! Force vector for explicit dynamics
  real ( prec ) :: accel(MAXDOF)                ! acceleration vector for explicit dynamics
  integer :: neq                                ! Total no. equations
  integer  :: ieqs(MAXDOF)                      ! Equation numbers for each DOF
  integer :: jpoin(MAXEQ)                       ! Diag pointer array for skyline storage
  integer, allocatable ::  aur(:)               ! Row number pointer for CG solver
  integer, allocatable ::  auc(:)               ! Column number pointer for CG solver
  integer :: eqpoin(MAXEQ)                      ! Eq # to A pointer link list
  integer :: eqtoa(7,MAXEPN)                    ! Eq # to A pointer link list
  integer :: mpceq(MAXMPC)                      ! Eq #s for MPCs

  real ( prec ), allocatable ::  work(:)        ! Workspace for GMRES solver
  integer :: lwork                              ! Size of workspace for GMRES solver
  integer :: ldstrt                             ! Projection size for GMRES solver

! Data structures to track names of node sets and element sets 
! (used only when mesh is read from a file)
  character ( len = 100 ) :: bcnsetnam(MAXNST)               ! Names for BC node sets
  character ( len = 100 ) :: bclsetnam(MAXLST)               ! Nemes for BC element sets
  integer               :: ipnbcnset(2,MAXNST)              ! Pointer for BC node sets
  integer               :: ipnbclset(2,MAXLST)              ! Pointer for BC element sets
!
! Data structures to store lists of nodes, elements and BCs, used only when 
! mesh is read from a file
!

!      nbcnset          No. node sets
!      nbclset          No. element sets
!      nsetbcpoin(1,i)      Nodes in ith set start at nsetlst(nsetbcpoin(1,i))
!      nsetbcpoin(2,i)      No. nodes in ith set
!      nsetlst          List of nodes in sets
!      lsetlst          List of elements in sets
!      MAXDDF           Max no. DOF definitions
!      ndofdef          No. DOF definitions
!      dofdefpoin(1,i)  Node set for DOF definition
!      dofdefpoin(2,i)  >0 DOF no. for DOF definition
!                       <0 DOF no. for force definition
!      dofdefpoin(3,i)  >0 - take DOF value from dofdefvals(dofdefpoin(4,i))
!                       <0 - compute DOF value by interpolating hist table dofdefpoin(
!      dofdefvals       list of DOF values
!      ndldef           no. distributed load definitions
!      dldefpoin(1,i)  element set for distributed load definition
!      dldefpoin(2,i)  face number for distributed load definition
!      dldefpoin(3,i)  Pointer to distributed load parameter array
!      dldefpoin(4,i)  No. distributed load parameters
!      dldefpoin(5,i)  Option number for distributed load
!      dldefvals        list of distributed load parameters
!
!
  integer                 :: nbcnset
  integer                 :: nbclset
  integer                 :: itopnset
  integer                 :: itoplset
  integer                 :: itopdvals
  integer                 :: itopdlvals
  integer                 :: nsetbcpoin(2,MAXNST)
  integer                 :: lsetbcpoin(2,MAXLST)
  integer                 :: nsetlst(MAXNSL)
  integer                 :: lsetlst(MAXNSL)
  integer                 :: ndofdef
  integer                 :: dofdefpoin(3,MAXDDF)
  real (prec)             :: dofdefvals(MAXDVL)
  real (prec)             :: dldefvals(MAXDLV)
  integer                 :: ndldef
  integer                 :: dldefpoin(5,MAXDLF)

  !     User step control parameters
  integer :: nusprp
  real ( prec ) :: usprop(MAXUSP)

  !
  !     Time step control and load step control
  !
  integer :: ntprops
  integer :: istep
  real ( prec )  :: tprops(MAXTPR)
  real ( prec )  :: dtnew
  real ( prec )  :: dtopt

  integer :: nlprops
  real (prec) :: lprops(MAXLPR)
  real ( prec )  :: umag
  real ( prec )  :: fmag
  real ( prec )  :: dlmag
  real( prec ) :: tolrnc      
  integer :: nit
  integer :: maxitn

  logical :: recalc(2),prin(4),iterate,cutback,continue_stepping,converged
  real ( prec ) :: cnorm(MAXNWT)                ! Norm of DOF correction at each NR iteration
  real ( prec ) :: dunorm(MAXNWT)               ! Normm of DOF at each NR iteration
  real ( prec ) :: rnorm(MAXNWT)                ! Norm of residual at each NR iteration
  integer :: stiffail
  

  ! Local variables

  integer :: status
  integer :: n_explicit_steps,state_print_interval,user_print_interval
  integer :: count_user_print,count_state_print
  integer ::  n, nf
  integer ::  izone,iz,iz0, ilst
  integer :: iun
  integer :: i, j, k,kk, m

  integer :: lda


100 write (6, 99001, advance = 'no')
  read (5, '(A100)') infil
  open (unit = IOR, file = infil, status = 'old', ERR = 100)
200 write (6, 99002, ADVANCE = 'no')
  read (5, '(A100)') outfil
  open (UNIT = IOW, FILE = outfil, STATUS = 'new', ERR = 200)


  !     Analysis is started at time t=0
  !     Bacground temperature is zero by default.
  nfiles = 0
  nupiun = 0
  nprpar = 0
  iunm = 0
  itype = 0
  iblnk = 0
  nstr = 0

  TIME = 0.D0
  BTEMP = 0.D0
  BTINC = 0.D0

  !     --- Set the pointers for the FEM analysis data structures

  nops = 0
  nzone = 0
  nelm = 0
  nfix = 0
  nfor = 0
  ndload = 0
  nmpc = 0


  itopc = 0
  itoprp = 0
  itops = 0
  itopmp = 0
  itopx = 0
  itopu = 0
  itopdlp = 0

  utot = 0.d0
  du = 0.d0
  accel = 0.d0
  svart = 0.d0
  svaru = 0.d0
  rfor = 0.d0

  !     No. state variables to be projected or lumped
  nstat = 0
  lumpedprojection = .false.       ! Default is to use full projection matrix
  
  nhist = 0
  
  ifl = .false.     ! Equation system assumed symmetric
  solvertype = 1    ! Direct solver is default
  stifcheck = .false.
  atop = 1
  neq = 0
  
  !     --- Set the pointers for the boundary condition generation data structures
  
  nbcnset = 0
  nbclset = 0
  itopnset = 0
  itoplset = 0
  itopdvals = 0
  itopdlvals = 0
  ndofdef = 0
  ndldef = 0


  ! Set parameters tracking printing and timesteps

    ntprops = 0
    istep = 0
    nlprops = 0
    n_total_steps = 0 
    n_state_prints = 0
    n_usr_prints = 0
    state_print_steps = 1
    usr_print_steps = 1
    prin(1:4) = .false.
    stiffail = 0
    iterate = .false.
    cutback = .false.
    continue_stepping = .true.
    converged = .false.

    do while(.true.)

  !     Read a line of the input file
       iblnk =1
  	   do while (iblnk==1)
         read (IOR, 99003, ERR = 500, end = 500) strin
         call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
       end do

      do while(.true.)
      !     --------------------- Set up a mesh ---------------------

        if ( strcmp(strpar(1), 'MESH', 4) ) then
 
          !     Read the mesh
          call rdmesh(nops, nodpn, MAXNOD,  &
               x, MAXCOR, itopx, utot,du,MAXDOF, itopu, &
      		   MAXZON,nzone,izplmn,density,nelm,iep, MAXLMN, icon,MAXCON, itopc,  &
               eprop, MAXPRP, itoprp, svart, MAXVAR, itops, &
               nhist,histnam,ipnhist,MAXHST,histvals,MAXHVL,histpoin,&
               nbcnset,bcnsetnam,ipnbcnset,MAXNST,nsetbcpoin,nsetlst,itopnset,MAXNSL, &
	           nbclset,bclsetnam,ipnbclset,MAXLST,lsetbcpoin,lsetlst,itoplset,MAXLSL, &
               MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals,itopdvals, &
               MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals,itopdlvals, &
               nmpc, lstmpc, MAXMPC, parmpc, MAXPMP, strin)
 
          !     Set initial equation numbers (may be modified by RENUM later)

          do k = 1, nops
            numnod(k) = k
          end do

          call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)  !  Parse the next nonblank line, and continue inner loop
		  cycle

      !     --------------------- Set the time increment ---------------------------

       else if ( strcmp(strpar(1), 'TIME', 4) ) then


        if ( nstr<3 .or. ityp(3)==2 ) then
          write (IOW, 99018) strin
          stop
        end if

        if ( strcmp(strpar(2), 'VALU', 4) ) then
           read (strpar(3), *) TIME
        else if ( strcmp(strpar(2), 'INCR', 4) ) then
          read (strpar(3), *) DTIME
        else
          write (IOW, 99019) strin
          stop
        end if

        exit               ! Leave the inner loop, and continue reading nonblank line of input file

      !     --------------------- Set the background temperature ---------------------------

      else if ( strcmp(strpar(1), 'TEMP', 4) ) then

        if ( nstr<3 .or. ityp(3)==2 ) then
          write (IOW, 99020) strin
          stop
        end if

        if ( strcmp(strpar(2), 'VALU', 4) ) then
          read (strpar(3), *) BTEMP
        else if ( strcmp(strpar(2), 'INCR', 4) ) then
          read (strpar(3), *) BTINC
          BTEMP = BTEMP + BTINC
        else
          write (IOW, 99021) strin
          stop
        end if

        exit  ! Leave the inner loop, and continue reading nonblank line of input file

 
! ----------------- Check consistency of element residual and element stiffness

      else if ( strcmp(strpar(1),'CHECKSTIF', 9) ) then

         if (ityp(2) /= 0) then
	        write(IOW,*) ' *** ERROR IN INPUT FILE '
	  	    write(IOW,*) ' Expecting integer element identifier after '
		    write(IOW,*) ' CHECK STIFFNESS keyword.  Found '
		    write(IOW,*) strin
		    stop
	     endif

	     read(strpar(2),*) i

         call stiftest(nelm, nops, nmpc, i, MAXCOR,  &
           MAXDOF, MAXSTN, MAXCON, MAXVAR, MAXPRP, &
           iep, icon, nodpn, x, utot, du,  &
           stnod, eprop, svart,  svaru, lstmpc,  &
           parmpc, MAXPMP, rmpc, drmpc,stiffail)


         exit ! Leave the inner loop, and continue reading nonblank line of input file


      !-------------------------Print --------------------------

      else if ( strcmp(strpar(1), 'PRIN', 4) ) then
          if (nstr<2) then
             write(IOW,*) ' Error detected in input file '
             write(IOW,*) ' PRINT key must be followed by a file name '
             stop
          endif

          call files(strpar(2),1, nfiles, iunfil, fillst, MAXFIL, iun)
          call tecprn(iun,nzone, nops, nelm,  &
               izplmn,nodpn, iep,  &
               x, MAXCOR, icon,  &
               MAXCON, utot, du,  &
               MAXDOF, stlump, MAXLMP, lumpn, strin)

          call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)  !  Parse the next nonblank line, and continue inner loop
		  cycle


! ---------------- User controlled step

      else if ( strcmp(strpar(1), 'USERST', 6) ) then

        call rdustep( &
            usprop, MAXUSP, nusprp, &
            tprops, MAXTPR, ntprops, &
            lprops, MAXLPR, nlprops, &
            isolv, solvertype,ifl,tolrnc,  &
            maxitn, nfiles, iunfil, fillst, MAXFIL,  &
            iunm, iunlst, nupiun, parprn,  &
            MAXUPR, nprpar, umag,  &
            fmag, dlmag, nstat,lumpedprojection)

        call usrstep(&
                usprop, nusprp, &
                nhist,MAXHST,histvals,MAXHVL,histpoin,&
                nbcnset,MAXNST,nsetbcpoin,nsetlst,MAXNSL, &
	            nbclset,MAXLST,lsetbcpoin,lsetlst,MAXLSL, &
                MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals, &
                MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals, &
                tprops, ntprops, &
                lprops, nlprops, &
                isolv, solvertype,ifl,tolrnc,maxitn,  &
                iunm,iunlst, nupiun, parprn, nprpar,  &
                umag,fmag, dlmag,lumpedprojection, &
                nelm, nops, nmpc, nfix, nfor, ndload,dlprops,MAXDPR, icon, iep,  &
                eprop, svart, svaru, lstmpc, parmpc, rmpc,  &
                drmpc, nodpn, x, utot, du, stnod, rfor,  &
                stlump, lumpn, nstat, lstfix, dofval, lstfor,  &
                forval, lstlod, numnod, diag, rhs, ieqs,  &
                jpoin, mpceq, nzone,izplmn, &
                MAXNOD,  &
                MAXCOR, MAXDOF, MAXSTN, MAXLMN, MAXCON, MAXPRP,  &
                MAXVAR, MAXMPC, MAXPMP, MAXFIX, MAXFOR, MAXDLD, &
                MAXEQ, MAXNND, MAXLMP,  MAXZON)

! ---------------- Static step 

      else if ( strcmp(strpar(1), 'STATIC', 6) ) then


        ifl = .false.

        umag = 1.D0
        fmag = 1.D0
        dlmag = 1.D0

        !     Read instructions controlling the static analysis

         call rdsstep( &
            tprops, MAXTPR, ntprops, &
            lprops, MAXLPR, nlprops, &
            isolv, solvertype,ifl,tolrnc,  &
            maxitn, nfiles, iunfil, fillst, MAXFIL,  &
            iunm, iunlst, nupiun, parprn,  &
            MAXUPR, nprpar, umag,  &
            fmag, dlmag, nstat,lumpedprojection)

           if (solvertype==1) then

!            For direct solver, renumber nodes to minimize bandwidth

             call renum(nops, nelm,MAXCON, icon,iep,nmpc,lstmpc, numnod)

!            Profile equations
             call profil(nops, nelm, nmpc, MAXDOF,  &
              MAXCON, MAXEQ,MAXNND, MAXSUP, MAXSLO, ifl,solvertype,icon, &
             iep,numnod, nodpn,lstmpc, ieqs, mpceq, jpoin, neq)

!            Allocate storage for stiffness matrix

             allocate(aupp(jpoin(neq)+1), stat=status)
			 MAXSUP = jpoin(neq) + 1
			 if (status/=0) then
			     write(IOW,*) ' Unable to allocate memory for stiffness matrix '
				 stop
		     endif

			 if (ifl) then
               allocate(alow(jpoin(neq)+1), stat=status)
			   MAXSLO = jpoin(neq) + 1
             else
			   allocate(alow(1), stat=status)
			   MAXSLO = 1
             endif
		 	 if (status/=0) then
			   write(IOW,*) ' Unable to allocate memory for stiffness matrix '
			   stop
		     endif

		   else

             call renum(nops, nelm,MAXCON, icon,iep,nmpc,lstmpc, numnod)
!            For CG and GMRES solvers, we guess the storage required
             MAXSUP = 500*nops
             allocate(aupp(MAXSUP),aur(MAXSUP),auc(MAXSUP), stat=status)
			 if (status/=0) then
			     write(IOW,*) ' Unable to allocate memory for cg or GMRES solver '
				 stop
		     endif
		     
		     if (solvertype==3) then
		        allocate(work(5*MAXSUP), stat=status)
		        lwork = 5*MAXSUP
			    if (status/=0) then
			     write(IOW,*) ' Unable to allocate workspace for GMRES solver '
				 stop
		         endif
		     endif
			 if (ifl) then
               allocate(alow(MAXSUP), stat=status)
			   MAXSLO = MAXSUP
             else
			   allocate(alow(1), stat=status)
			   MAXSLO = 1
             endif
		 	 if (status/=0) then
			   write(IOW,*) ' Unable to allocate memory for stiffness matrix '
			   stop
		     endif
           endif
		   
           dtopt = DTIME

!+++++++++++++++++++++++++++++ START OF TIME LOOP +++++++++++++++++++++

         continue_stepping = .true.
  
         do while (continue_stepping)

        
8723       Continue               ! RETURN HERE AFTER TIMESTEP CUTBACK

!            Profile equations (need to repeat this step because profile gets destroyed during state projection)

          call profil(nops, nelm, nmpc, MAXDOF,  &
              MAXCON, MAXEQ,MAXNND, MAXSUP, MAXSLO, ifl,solvertype,icon, &
             iep,numnod, nodpn,lstmpc, ieqs, mpceq, jpoin, neq)


           nfix = 0
           nfor = 0
           ndload = 0
  
		   call setbcs_static(nhist,MAXHST,histvals,MAXHVL,histpoin,&
   	          nbcnset,MAXNST,nsetbcpoin,nsetlst,MAXNSL, &
	          nbclset,MAXLST,lsetbcpoin,lsetlst,MAXLSL, &
                MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals, &
                MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals, &
                nfix,MAXFIX,lstfix,dofval, &
	          nfor,MAXFOR,lstfor,forval, &
	          ndload,MAXDLD,lstlod,dlprops,MAXDPR,&
	          utot,du,rfor,nodpn,MAXDOF,MAXNOD)


           if (nlprops>8) then
             call global_load_history(lprops,nlprops,TIME+DTIME,umag,dlmag,fmag)
           end if

           Write(IOW,6934) n_total_steps+1,TIME+DTIME,umag,fmag,dlmag,BTEMP
6934       format(// '  *** Attempting step number ',i5/  &
                  '       Time at end of step           ',D16.5/ &
                  '       Deformation scale factor      ',d16.5/ &
                  '       Nodal force scale factor      ',d16.5/ &
                  '       Distributed load scale factor ',d16.5/ &
                  '       Temperature value             ',d16.5/ )

 !          du = 0.D0
 !          drmpc = 0.d0
 
 
           if ( isolv==1 ) then     ! Nonlinear static time increment

!         ++++++++++++++++++ START OF NEWTON-RAPHSON LOOP +++++++

             iterate = .true.
             nit = 1
             do while(iterate)

               if (solvertype == 1) then  ! Direct solver
                 call asstif(nelm, nops, nmpc, ifl,  &
                   MAXCOR, MAXDOF, MAXSTN, MAXCON, MAXVAR,  &
                   MAXPRP, MAXSLO, MAXSUP, MAXEQ, iep,icon,  &
                   nodpn, x, utot, du, stnod, rfor, eprop, svart,  &
                   svaru, lstmpc, parmpc, MAXPMP,rmpc, drmpc, rhs,  &
                   alow, aupp, diag, ieqs, mpceq, jpoin, neq,stiffail)


                 if (stiffail == 1) exit
  
                 call bcons(ifl, nops, nelm, MAXCOR, MAXDOF,  &
                   MAXCON, MAXSLO, MAXSUP, MAXEQ, icon, &
                   iep,nodpn, x, utot, du, eprop, MAXPRP, nfix,  &
                   lstfix, dofval, umag, nfor, lstfor,  &
                   forval, fmag, ndload, lstlod,dlprops,MAXDPR, dlmag, rhs, alow, &
                   aupp, diag, ieqs, jpoin, neq)


                 call instif(dunorm(nit), cnorm(nit), rnorm(nit), &
                   nops, nmpc, ifl,  &
                   MAXDOF, MAXSLO, MAXSUP, MAXEQ, nodpn, &
                   du,drmpc, rhs, alow, aupp, diag, ieqs, &
                   mpceq, jpoin, neq)


               else if (solvertype==2) then  !CG Solver

                 call asstif_cg(nelm, nops, nmpc, ifl,  &
                   MAXCOR, MAXDOF, MAXSTN, MAXCON, MAXVAR,  &
                   MAXPRP, MAXSLO, MAXSUP, MAXEQ, iep, &
                   icon,  nodpn, x, utot, du, stnod, rfor,  &
                   eprop, svart, svaru, lstmpc, parmpc, MAXPMP,  &
                   rmpc, drmpc, rhs, alow, aupp, diag, ieqs, mpceq, neq, &
                   eqpoin,eqtoa,MAXEPN,aur,auc,atop,stiffail)

                 if (stiffail == 1) exit
  
                 call bcons_cg(ifl, nops, nelm, MAXCOR, MAXDOF,  &
                   MAXCON, MAXSLO, MAXSUP, MAXEQ, icon, &
                   iep,nodpn, x, utot, du, eprop, MAXPRP, nfix,  &
                   lstfix, dofval, umag, nfor, lstfor,  &
                   forval, fmag, ndload,lstlod,dlprops,MAXDPR, dlmag, rhs, alow, &
                   aupp, diag, ieqs, neq, aur,auc,atop)


                 call instif_cg(dunorm(nit), cnorm(nit), rnorm(nit), &
                   nops, nmpc, ifl, MAXDOF, MAXSLO, atop, nodpn,du,  &
                   drmpc, rhs, alow, aupp, diag, aur,auc,ieqs, &
                   mpceq, neq,stiffail)

                 if (stiffail == 1) exit

               else if (solvertype==3) then  !GMRES Solver

                 call asstif_cg(nelm, nops, nmpc, ifl,  &
                   MAXCOR, MAXDOF, MAXSTN, MAXCON, MAXVAR,  &
                   MAXPRP, MAXSLO, MAXSUP, MAXEQ, iep, &
                   icon,  nodpn, x, utot, du, stnod, rfor,  &
                   eprop, svart, svaru, lstmpc, parmpc, MAXPMP,  &
                   rmpc, drmpc, rhs, alow, aupp, diag, ieqs, mpceq, neq, &
                   eqpoin,eqtoa,MAXEPN,aur,auc,atop,stiffail)

                 if (stiffail == 1) exit
  
                 call bcons_cg(ifl, nops, nelm, MAXCOR, MAXDOF,  &
                   MAXCON, MAXSLO, MAXSUP, MAXEQ, icon, &
                   iep,nodpn, x, utot, du, eprop, MAXPRP, nfix,  &
                   lstfix, dofval, umag, nfor, lstfor,  &
                   forval, fmag, ndload,lstlod,dlprops,MAXDPR, dlmag, rhs, alow, &
                   aupp, diag, ieqs, neq, aur,auc,atop)

                 ldstrt = neq ! This will force solver to use max size for projection
                 call instif_gmres(dunorm(nit), cnorm(nit), rnorm(nit), &
                   nops, nmpc, ifl, MAXDOF, MAXSLO, atop, nodpn,du,  &
                   drmpc, rhs, alow, aupp, diag, aur,auc,ieqs, &
                   mpceq, neq,stiffail,work,ldstrt,lwork)

                 if (stiffail == 1) exit


               endif

               call convergencecheck(nit,dunorm,cnorm,rnorm,tolrnc,maxitn,&
                  iterate,converged)

             end do


             if (stiffail==1) then
               converged = .false.
               call staticstep(tprops,ntprops,converged,nit,dunorm,cnorm,rnorm,&
                      dtnew,dtopt,cutback,continue_stepping,prin)
               du = 0.D0
               drmpc = 0.d0
               DTIME = dtnew
               goto 8723
             endif

!          +++++++++++++++ END OF NEWTON-RAPHSON LOOP

           else    ! Linear step

             nit = 1
             if (solvertype == 1) then
               call asstif(nelm, nops, nmpc, ifl,  &
                 MAXCOR, MAXDOF, MAXSTN, MAXCON, MAXVAR,  &
                 MAXPRP, MAXSLO, MAXSUP, MAXEQ, iep,icon,  &
                 nodpn, x, utot, du, stnod, rfor, eprop, svart,  &
                 svaru, lstmpc, parmpc, MAXPMP,rmpc, drmpc, rhs,  &
                 alow, aupp, diag, ieqs, mpceq, jpoin, neq,stiffail)

               call bcons(ifl, nops, nelm, MAXCOR, MAXDOF,  &
                 MAXCON, MAXSLO, MAXSUP, MAXEQ, icon, &
                 iep,nodpn, x, utot, du, eprop, MAXPRP, nfix,  &
                 lstfix, dofval, umag, nfor, lstfor,  &
                 forval, fmag, ndload, lstlod,dlprops,MAXDPR, dlmag, rhs, alow, &
                 aupp, diag, ieqs, jpoin, neq)

               call instif(dunorm(nit), cnorm(nit), rnorm(nit), &
                 nops, nmpc, ifl,  &
                 MAXDOF, MAXSLO, MAXSUP, MAXEQ, nodpn, &
                 du,drmpc, rhs, alow, aupp, diag, ieqs, &
                 mpceq, jpoin, neq)

             else if (solvertype==2) then

               call asstif_cg(nelm, nops, nmpc, ifl,  &
                 MAXCOR, MAXDOF, MAXSTN, MAXCON, MAXVAR,  &
                 MAXPRP, MAXSLO, MAXSUP, MAXEQ, iep, &
                 icon,  nodpn, x, utot, du, stnod, rfor,  &
                 eprop, svart, svaru, lstmpc, parmpc, MAXPMP,  &
                 rmpc, drmpc, rhs, alow, aupp, diag, ieqs, mpceq, neq, &
                 eqpoin,eqtoa,MAXEPN,aur,auc,atop,stiffail)

               if (stiffail == 1) then
			      write(IOW,*) ' Stiffness computation failed during linear static step'
				  write(IOW,*) ' Analysis terminated '
				  stop
			   endif
  
               call bcons_cg(ifl, nops, nelm, MAXCOR, MAXDOF,  &
                 MAXCON, MAXSLO, MAXSUP, MAXEQ, icon, &
                 iep,nodpn, x, utot, du, eprop, MAXPRP, nfix,  &
                 lstfix, dofval, umag, nfor, lstfor,  &
                 forval, fmag, ndload,lstlod,dlprops,MAXDPR, dlmag, rhs, alow, &
                 aupp, diag, ieqs, neq, aur,auc,atop)


               call instif_cg(dunorm(nit), cnorm(nit), rnorm(nit), &
                 nops, nmpc, ifl, MAXDOF, MAXSLO, atop, nodpn,du,  &
                 drmpc, rhs, alow, aupp, diag, aur,auc,ieqs, &
                 mpceq, neq,stiffail)

               else if (solvertype==3) then  !GMRES Solver

                 call asstif_cg(nelm, nops, nmpc, ifl,  &
                   MAXCOR, MAXDOF, MAXSTN, MAXCON, MAXVAR,  &
                   MAXPRP, MAXSLO, MAXSUP, MAXEQ, iep, &
                   icon,  nodpn, x, utot, du, stnod, rfor,  &
                   eprop, svart, svaru, lstmpc, parmpc, MAXPMP,  &
                   rmpc, drmpc, rhs, alow, aupp, diag, ieqs, mpceq, neq, &
                   eqpoin,eqtoa,MAXEPN,aur,auc,atop,stiffail)

                 if (stiffail == 1) exit
  
                 call bcons_cg(ifl, nops, nelm, MAXCOR, MAXDOF,  &
                   MAXCON, MAXSLO, MAXSUP, MAXEQ, icon, &
                   iep,nodpn, x, utot, du, eprop, MAXPRP, nfix,  &
                   lstfix, dofval, umag, nfor, lstfor,  &
                   forval, fmag, ndload,lstlod,dlprops,MAXDPR, dlmag, rhs, alow, &
                   aupp, diag, ieqs, neq, aur,auc,atop)

                 ldstrt = neq ! This will force solver to use max size for projection
                 call instif_gmres(dunorm(nit), cnorm(nit), rnorm(nit), &
                   nops, nmpc, ifl, MAXDOF, MAXSLO, atop, nodpn,du,  &
                   drmpc, rhs, alow, aupp, diag, aur,auc,ieqs, &
                   mpceq, neq,stiffail,work,ldstrt,lwork)

                 if (stiffail == 1) exit


 
             endif

             if (stiffail==1) then
               converged = .false.
               call staticstep(tprops,ntprops,converged,nit,dunorm,cnorm,rnorm,&
                      dtnew,dtopt,cutback,continue_stepping,prin)
               du = 0.d0
               drmpc = 0.d0
               DTIME = dtnew
               goto 8723
             endif

             converged = .true.
             nit = 1
           end if


           call staticstep(tprops,ntprops,converged,nit,dunorm,cnorm,rnorm,&
                      dtnew,dtopt,cutback,continue_stepping,prin)


           if (cutback) then
             DTIME = dtnew
             goto 8723
           endif



           if (prin(1).and.iunm > 0) then  !  Print element state


             if ( nstat>0 ) then          ! Project element state to nodes
!
               call prosta(lumpedprojection,nstat, nops, nelm,izplmn, nzone, &
                MAXCOR, MAXDOF, MAXCON, MAXVAR, MAXPRP, &
				iep, icon,nodpn, x, utot, du, eprop, svart,  &
                svaru, stlump, MAXLMP, lumpn, numnod_projection, rhs, aupp, MAXSUP, & 
                diag, jpoin)
  
             end if


              call prnstt(iunm, nzone, nops, nelm,  &
               izplmn,nodpn, iep,  &
               x, MAXCOR, icon, MAXCON,  &
               utot, du, MAXDOF,  &
               stlump, MAXLMP, lumpn)

           endif

           if ( prin(2).and.nupiun > 0 ) then !  User print


             if ( nstat>0 ) then          ! Project element state to nodes
!
               call prosta(lumpedprojection,nstat, nops, nelm,izplmn, nzone, &
                MAXCOR, MAXDOF, MAXCON, MAXVAR, MAXPRP, &
				iep, icon,nodpn, x, utot, du, eprop, svart,  &
                svaru, stlump, MAXLMP, lumpn, numnod_projection, rhs, aupp, MAXSUP, & 
                diag, jpoin)
  
             end if

             call usrprn(iunlst, nupiun, parprn, nprpar,  &
                nelm, nops, nmpc, nfix, nfor, ndload, icon, iep,  &
                eprop, svart, svaru, lstmpc, parmpc, rmpc,  &
                drmpc, nodpn, x, utot, du, stnod, rfor,  &
                stlump, lumpn, nstat, lstfix, dofval, lstfor,  &
                forval, lstlod, alow, aupp, diag, rhs, ieqs,  &
                jpoin, mpceq, nzone,izplmn, &
                  MAXNOD,  &
                MAXCOR, MAXDOF, MAXSTN, MAXLMN, MAXCON, MAXPRP,  &
                MAXVAR, MAXMPC,MAXPMP, MAXFIX, MAXFOR, MAXDLD, MAXSLO,  &
                MAXSUP, MAXEQ, MAXLMP,  MAXZON)
 
           endif

           TIME = TIME + DTIME

           call update(nops, nelm, nodpn,iep, utot,  &
               du, MAXDOF, svart,svaru, MAXVAR, nmpc,  &
               lstmpc, rmpc, drmpc, MAXMPC)

!           dtopt = DTIME
           DTIME = dtnew
           

         end do

!++++++++++++++++++++++++++ END OF TIME LOOP ++++++++++++++++++++++++



         exit      ! exit inner loop and proceed to next line of input file

!---------------------------------------     Explicit dynamic step

      else if (STRCMP(STRPAR(1),'EXPL',4)) THEN
 
        call rddstep( &
          n_explicit_steps,state_print_interval,user_print_interval, nfiles, iunfil, fillst, MAXFIL,  &
          iunm, iunlst, nupiun, parprn,  &
          MAXUPR, nprpar, nstat,lumpedprojection)

   	    if (nstat>0) then  ! Set up storage for state projection matrix

          if (lumpedprojection) then
             MAXSUP = 1
          else
             MAXSUP = 150*nops   !      This is just a guess for storage required - may need to increase the 150
          endif
          
          allocate(aupp(MAXSUP), stat=status)

		  if (status/=0) then
		     write(IOW,*) ' Unable to allocate memory for state projection matrix '
			 stop
  	      endif
        endif

        neq = 0
		do i = 1,nops
		   neq = neq + nodpn(5,i)
		end do

!       Mass matrix assumed to be constant - move this into time loop if not

        call asslmass(nzone, izplmn, nelm, nops,  MAXCOR, MAXDOF, MAXSTN,  &
              MAXCON, MAXVAR, MAXPRP, iep, icon, nodpn, x, utot, du, stnod,  &
              density, eprop, svart, svaru, lmass, neq)

        vel(1:neq) = du(1:neq)
        accel(1:neq) = 0.d0

!+++++++++++++++++++++++++++++ START OF TIME LOOP +++++++++++++++++++++

        count_user_print = 0
		count_state_print = 0

        do istep = 1,n_explicit_steps

           count_user_print = count_user_print + 1
	       count_state_print = count_state_print + 1

 	       du(1:neq) = DTIME*(vel(1:neq) + 0.5d0*DTIME*accel(1:neq)) 

           forc = 0.d0

	       call bcons_explicit(nhist,MAXHST,histvals,MAXHVL,histpoin,&
	                       nbcnset,MAXNST,nsetbcpoin,nsetlst,MAXNSL, &
                             nbclset,MAXLST,lsetbcpoin,lsetlst,MAXLSL, &
                             MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals, &
                             MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals, &
		                     nops, nelm, MAXCOR, MAXDOF,  &
                             MAXCON, icon, &
                             iep,nodpn, x, utot, du, eprop, MAXPRP, forc)

  	       if (count_user_print == user_print_interval.or.count_state_print == state_print_interval) then
!              Project state for printing
               if (nstat>0) then
		         call prosta(lumpedprojection,nstat, nops, nelm,izplmn, nzone, &
                              MAXCOR, MAXDOF, MAXCON, MAXVAR, MAXPRP, &
                              iep, icon,nodpn, x, utot, du, eprop, svart,  &
                              svaru, stlump, MAXLMP, lumpn, numnod_projection, rhs, aupp, MAXSUP, & 
                              diag, jpoin)
		       endif
           endif

		   if (count_state_print == state_print_interval) then

            write(IOW,*) 
            write(IOW,*) ' Printing state at step number ',istep
		    write(IOW,*) ' Time increment:               ',DTIME
	        write(IOW,*) ' Total elapsed time:           ',TIME
		    write(IOW,*) 
            
            call prnstt(iunm, nzone, nops, nelm,  &
                             izplmn,nodpn, iep,  &
                             x, MAXCOR, icon, MAXCON,  &
                             utot, du, MAXDOF,  &
                             stlump, MAXLMP, lumpn)
			           count_state_print = 0
		   endif

		   if (count_user_print == user_print_interval) then


		     write(IOW,*) 
		     write(IOW,*) ' User print at step number     ',istep
		     write(IOW,*) ' Time increment:               ',DTIME
		     write(IOW,*) ' Total elapsed time:           ',TIME
		     write(IOW,*) 

                 call usrprn(iunlst, nupiun, parprn, nprpar,  &
                      nelm, nops, nmpc, nfix, nfor, ndload, icon, iep,  &
                      eprop, svart, svaru, lstmpc, parmpc, rmpc,  &
                      drmpc, nodpn, x, utot, du, stnod, rfor,  &
                      stlump, lumpn, nstat, lstfix, dofval, lstfor,  &
                      forval, lstlod, alow, aupp, diag, rhs, ieqs,  &
                      jpoin, mpceq, nzone,izplmn, &
                        MAXNOD,  &
                      MAXCOR, MAXDOF, MAXSTN, MAXLMN, MAXCON, MAXPRP,  &
                      MAXVAR, MAXMPC,MAXPMP, MAXFIX, MAXFOR, MAXDLD, MAXSLO,  &
                      MAXSUP, MAXEQ, MAXLMP,  MAXZON)
           endif

           call assforc(nzone, izplmn, nelm, nops,  MAXCOR, MAXDOF, MAXSTN,  &
              MAXCON, MAXVAR, MAXPRP, iep, icon, nodpn, x, utot, du, stnod,  &
              density, eprop, svart, svaru, forc, neq)

           accel(1:neq) = forc(1:neq)/lmass(1:neq)
           vel(1:neq) = vel(1:neq) + DTIME*accel(1:neq)
		   utot(1:neq) = utot(1:neq) + du(1:neq)
		   svart = svaru               ! Update element state
		   TIME = TIME + DTIME

        end do

!+++++++++++++++++++++++++++++ END OF TIME LOOP +++++++++++++++++++++

        exit          ! Exit inner loop and proceed to next line of input file

      else if (STRCMP(STRPAR(1),'STOP',4)) THEN

         Write(IOW,9045)
9045     FORMAT(//' *** ANALYSIS TERMINATED AT STOP KEYWORD *** ')
         Write(6,*) ' Program terminated at STOP keyword '
         STOP
      
	  else
	  
	     Write(IOW,*) ' *** Error - unrecognized keyword *** '
	     write(IOW,*) strin
	     stop
      
	  end if
    end do

  end do


500 write (*, *) 'Program completed successfully!'

99001 format ('Please specify the input file name:  ')
99002 format ('Please specify the log file name:    ')
99003 format (A100)

99016 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting option INCREMENTAL DOF,',  &
           ' ACCUMULATED DOF, NODAL STATE  or ELEMENT STATE.'/ ' Found'/A80)
99017 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting option SYMMETRIC or UNSYMMETRIC.'/' Found'/A80 )
99018 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting real number specifying time.'/' Found'/A80)
99019 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting key VALUE or INCREMENT following TIME'/ ' Found '/A80)
99020 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting real number specifying temperature '/' Found'/ A80)
99021 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting key VALUE or INCREMENT following TEMPERATURE'/ &
           ' Found '/A80)
99022 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting number giving degree of freedom magnitude '/ &
           ' Found '/A80)
99023 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting number giving force magnitude '/' Found '/A80)
99024 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting number giving distributed load magnitude '/ &
           ' Found '/A80)
99025 format ( // '  **** ERROR DETECTED IN INPUT FILE ***'/  &
           '  Expecting tolerance and max. no iterations after ',  &
           ' NONLINEAR key.  Found '/A80)
99026 format ( // '  WARNING '/'  Solution vector has zero norm '/)
99027 format ( // '  Newton Raphson iteration ', I5/'  Residual norm  ',  &
           D15.6/'  Solution norm  ', D15.6/'  Ratio          ',  &
           D15.6/'  Tolerance      ', D15.6)
99028 format ( // '  WARNING '/  &
           ' Newton-Raphson iterations did not converge '/ &
           '   CNORM/DUNORM : ', D15.6)
99029 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           '    Expecting keys LINEAR or NONLINEAR '/'    Found '/A80 )
99037 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Number of variables to be projected must be specified '/  &
           ' following PROJECT keyword.  Found '/A80)
99038 format (' **** ERROR DETECTED IN INPUT FILE ****'/A80/  &
           ' is an invalid file name ')
99039 format ( // , '**** ERROR DETECTED IN INPUT FILE **** ',  &
           '  No output files were specified with PRINT, USER ')
99040 format ( // '  WARNING '/  &
           ' Newton-Raphson iterations did not converge '/ &
           '   CNORM/DUNORM : ', D15.6)
99041 format ( // '  WARNING '/'  Solution vector has zero norm '/)
99042 format ( // '  Newton Raphson iteration ', I5/'  Residual norm  ',  &
           D15.6/'  Solution norm  ', D15.6/'  Ratio          ',  &
           D15.6/'  Tolerance      ', D15.6)

! ==========================================================================
!
contains
!


!============================= rdsstep ==============================
subroutine rdsstep( &
     tprops, MAXTPR, ntprops, &
     lprops, MAXLPR, nlprops, &
     isolv,solvertype,ifl, tolrnc,  &
     maxitn, nfiles, iunfil, fillst, MAXFIL,  &
     iunm, iunlst, nupiun, parprn,  &
     MAXUPR, nprpar, umag, fmag, dlmag, nstat,lumpedprojection)
  use Types
  use ParamIO
  use Globals, only : TIME, DTIME
  implicit none

  integer, intent( in )                    :: MAXTPR
  integer, intent( in )                    :: MAXFIL
  integer, intent( in )                    :: MAXLPR
  integer, intent( in )                    :: MAXUPR

  integer, intent( out )                   :: ntprops
  integer, intent( out )                   :: nlprops
  integer, intent( out )                   :: isolv
  integer, intent( inout )                 :: solvertype
  integer, intent( out )                   :: maxitn
  integer, intent( inout )                 :: nfiles
  integer, intent( out )                   :: iunm
  integer, intent( out )                   :: nupiun
  integer, intent( inout )                 :: nprpar
  integer, intent( inout )                 :: nstat
  integer, intent( inout )                 :: iunfil(MAXFIL)
  integer, intent( out )                   :: iunlst(MAXFIL)
  
  logical, intent( inout )                 :: lumpedprojection

  real( prec ), intent( out )              :: tprops(MAXTPR)
  real( prec ), intent( out )              :: lprops(MAXLPR)
  real( prec ), intent( inout )            :: tolrnc
  real( prec ), intent( inout )            :: umag
  real( prec ), intent( inout )            :: fmag
  real( prec ), intent( inout )            :: dlmag
  real( prec ), intent( inout )            :: parprn(MAXUPR)
  character ( len = 100 ), intent( inout )  :: fillst(MAXFIL)
  logical, intent(inout) :: ifl

  ! Local Variables
  integer      :: i, iblnk, iboun, ilst, ipoin
  integer      :: iseg, isiz, iszprs, itpmbp, iun, iz, iz0, izone,  &
       j, k, kboun
  integer      :: kci, kcs, kint, kjn, kkk, kseg, ktrp, kzone, &
       n, nn, npgbm,  nstat2, nstr,lproptop

  character ( len = 100 ) :: strin
  character ( len = 100 ) :: strpar(100)
  character ( len = 200 ) :: callstr
  integer :: ityp(100), lenstr(100)
  logical :: strcmp

  !     Initialize pointers


   lproptop = 9
   lprops(1:4) = 0
   lprops(5:8) = 1
   nlprops = 8
   umag = 1.D0
   fmag = 1.D0
   dlmag = 1.D0
   BTEMP = 0.D0
   BTINC = 0.D0

100 read (IOR, 99001, ERR = 400, end = 400) strin
  do while ( .true. )
    !     Parse it
    call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
    if ( iblnk==1 ) goto 100

 
      !----------------------Parameters controlling files --------------

     if ( strcmp(strpar(1), 'PRIN', 4) ) then

      !     Syntax is FILE
      !     OPTION, filename, 
      if ( nstr>2 ) then
        write (IOW, 99018)
        stop
      end if

      !     Read the option

180   read (IOR, 99001, ERR = 400, end = 400) strin
      do while ( .true. )
        call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
        if ( iblnk==1 ) goto 180

        if ( strcmp(strpar(1), 'MESH', 4) ) then
          call files(strpar(2),1, nfiles, iunfil, fillst, MAXFIL, iun)
          iunm = iun
          goto 180

        else if ( strcmp(strpar(1), 'USER', 4) ) then


          !     Read user print option

185       read (IOR, 99001, ERR = 400, end = 400) strin
          do while ( .true. )
            !     Parse it
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) goto 185

            if ( strcmp(strpar(1), 'FILE', 4) ) then
              do while ( .true. )

                !     Read the list of files

                read (IOR, 99001, ERR = 400, end = 400) strin
                !     Parse it
                call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
                if ( iblnk==1 ) cycle

                if ( ityp(1)/=2 .or. nstr/=1 ) then
                  write (IOW, 99021) strin
                  stop
                end if

                if ( strcmp(strpar(1), 'ENDFILES', 8) ) goto 185

                nupiun = nupiun + 1
                call files(strpar(1),1, nfiles, iunfil, fillst, MAXFIL, iun)

                iunlst(nupiun) = iun
              end do

            else if ( strcmp(strpar(1), 'PARA', 4) ) then

              if ( nprpar + 1>MAXUPR ) then
                write (IOW, 99022) MAXUPR
                stop
              end if
              call rdprm(parprn(nprpar + 1), MAXUPR - nprpar, nn, strin)
              nprpar = nprpar + nn
              cycle
            end if

            if ( nupiun==0 ) then
              write (IOW, 99024)
              stop
            end if
            goto 200
          end do
        end if

        exit
200   end do


      !------------------------Magnitude of constrained DOFS ---------------

    else if ( strcmp(strpar(1), 'DEGR', 4) ) then
      if (nstr==2) then
         read (strpar(2), *) umag
         goto 100
      else
!       Read displacement history parameters
        lprops(5) = lproptop

        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lprops(1) = nn/2                     ! Data ccontains pairs of points - lprops(1) gives no. pairs
        lproptop = lproptop + nn
        nlprops = nlprops + nn
      endif

      !------------------------Magnitude of nodal forces ---------------

    else if ( strcmp(strpar(1), 'FORC', 4) ) then
      if (nstr==2 ) then
        read (strpar(2), *) fmag
        goto 100
      else
        lprops(7) = lproptop
        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lproptop = lproptop + nn
        nlprops = nlprops + nn
        lprops(3) = nn/2                 ! No. pairs of points
      endif

      !------------------------Magnitude of distributed loads ---------------

    else if ( strcmp(strpar(1), 'DIST', 4) ) then
      if (nstr == 2) then
        read (strpar(2), *) dlmag
        goto 100
      else
!       Read displacement history parameters
        lprops(6) = lproptop

        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lprops(2) = nn/2               ! No. pairs of points
        lproptop = lproptop + nn
        nlprops = nlprops + nn
      endif

      !-----------Initialize temperature value or history ---------------

    else if ( strcmp(strpar(1), 'TEMP', 4) ) then

      if (nstr==2) then
         read(strpar(2),*) BTEMP
         BTINC = 0.D0
         goto 100      
      else if (nstr==3) then
         read(strpar(3),*) BTINC
         goto 100
      Else

!       Read displacement history parameters
        lprops(8) = lproptop

        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lproptop = lproptop + nn
        nlprops = nlprops + nn
        lprops(4) = nn/2               ! No. pairs of points
      Endif
      !------------------------Initialize state projection ---------------

    else if ( strcmp(strpar(1), 'PROJ', 4) ) then


      if ( ityp(2)/=0 .or. nstr<2 ) then
        write (IOW, 99031) strin
        stop
      end if

      read (strpar(2), *) nstat

      if (nstr==3) then
         if (strcmp(strpar(3), 'LUMP', 4 )) then
            lumpedprojection = .true.
         endif
      endif

      goto 100

      !------------------------Initialize time increment ---------------

    else if ( strcmp(strpar(1), 'TIME', 4) ) then

!       Read time step parameters

        call rdprm(tprops, MAXTPR, ntprops, strin)

        DTIME = tprops(1)

      !------------------Parameters controlling solver File -----------------

    else if ( strcmp(strpar(1), 'SOLV', 4) ) then
        if (strcmp(strpar(2), 'FACT',4)) then
           solvertype = 1
        else if (strcmp(strpar(2),'CONJ',4)) then
           solvertype = 2
        else if (strcmp(strpar(2),'GMRE',4)) then
           solvertype = 3
        else
           write(IOW,*) ' Unknown solver option '
           write(IOW,*) strin
           write(IOW,*) ' Syntax is '
           write(IOW,*) 'SOLVE, FACTOR, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
           write(IOW,*) 'SOLVE, GMRES, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, GMRES, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
           write(IOW,*) 'SOLVE, FACTOR, NONLINEAR, tolerance, max its, (UNSYMMETRIC) '
           stop
        endif        

      if ( strcmp(strpar(3), 'LINE', 4) ) then
        isolv = 0
		if (nstr>3) then
		  if (strcmp(strpar(4),'UNSY',4) ) then
		     ifl = .true.
		  else
                 write(IOW,*) ' Unknown solver option '
                 write(IOW,*) strin
                 write(IOW,*) ' Syntax is '
                 write(IOW,*) 'SOLVE, FACTOR, LINEAR, (UNSYMMETRIC) '
                 write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, LINEAR, (UNSYMMETRIC) '
                 write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
                 write(IOW,*) 'SOLVE, FACTOR, NONLINEAR, tolerance, max its, (UNSYMMETRIC) '
                 stop
		  endif
		endif
      else
        isolv = 1
        if ( nstr<5 ) then
          write (IOW, 99037) strin
          stop
        end if
        if ( ityp(4)==2 ) then
          write (IOW, 99037) strin
          stop
        end if
        read (strpar(4), *) tolrnc
        if ( ityp(5)/=0 ) then
          write (IOW, 99037) strin
          stop
        end if
        read (strpar(5), *) maxitn

		if (nstr>5) then
		  if (strcmp(strpar(6),'UNSY',4) ) then
		     ifl = .true.
		  else if (strcmp(strpar(6),'SYMM',4) ) then
		     ifl = .false.
		  else
           write(IOW,*) ' Unknown solver option '
           write(IOW,*) strin
           write(IOW,*) ' Syntax is '
           write(IOW,*) 'SOLVE, FACTOR, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
           write(IOW,*) 'SOLVE, FACTOR, NONLINEAR, tolerance, max its, (UNSYMMETRIC) '
           stop
		  endif
        endif
      end if

      goto 100

      !------------------------Exit ---------------

    else if ( strcmp(strpar(1), 'ENDS', 4) ) then

      exit

    else

      write (IOW, 99038) strin
      stop

    end if
300 end do


400 return


99001 format (A100)

99018 format ( // , ' **** ERROR DETECTED IN INPUT FILE **** ', /,  &
           ' The syntax for PRINT command  is '  &
           , /, '   PRINT '/'MESH, filename, no. steps ', /,  &
           ' or PRINT '/' USER ', /, ' FILES ', /, ' filanames ', /,  &
           ' END FILES ', ' PARAMETERS ', /, ' list of parameters ')
99019 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting file name and no. steps between prints',  &
           ' following PRINT, MESH command '/' Found '/A80)
99021 format (' **** ERROR DETECTED IN INPUT FILE ****'/A80/  &
           ' is an invalid file name ')
99022 format ( // ' ** ERROR DETECTED IN SUBROUTINE rdsstep **'/  &
           ' Insufficient storage to read user supplied parameters'/  &
           ' controlling USER PRINT '/ &
           ' Parameter MAXUPR must be increased'/  &
           ' Its current value is ', I6)
99023 format ( // ' **** ERROR DETECTED IN INPUT FILE **** '/  &
           ' Expecting integer number of steps between prints '/  &
           ' following STEP keyword in PRINT, USER option.  Found'/ A80)
99024 format ( // , '**** ERROR DETECTED IN INPUT FILE **** ',  &
           '  No output files were specified with PRINT, USER ')
99031 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Number of variables to be projected must be specified '/  &
           ' following PROJECT STATE keyword.  Found '/A80)
99033 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting number specifying initial time increment,',  &
           /' Found '/A80)
99037 format ( // ' **** ERROR IN INPUT FILE **** '/  &
           ' Expecting numbers specifying tolerance and '/  &
           ' max no. iterations for nonlinear solver '/' Found '/A80)
99038 format ( // ' **** ERROR IN INPUT FILE **** '/  &
           ' Unrecognized keyword while reading static step  '/  &
           ' Terminate static step with END STEP '/' Found '/A80)

end subroutine rdsstep

!============================= rddstep ==============================
subroutine rddstep(n_dynamic_steps,state_print_interval,user_print_interval, nfiles, iunfil, fillst, MAXFIL,  &
     iunm, iunlst, nupiun, parprn,MAXUPR, nprpar, nstat,lumpedprojection)
  use Types
  use ParamIO
  use Globals, only : TIME, DTIME
  implicit none

  integer, intent( in )                    :: MAXFIL
  integer, intent( in )                    :: MAXUPR


  integer, intent( inout )                 :: n_dynamic_steps
  integer, intent( inout )                 :: state_print_interval
  integer, intent( inout )                 :: user_print_interval
  integer, intent( inout )                 :: nfiles
  integer, intent( out )                   :: iunm
  integer, intent( out )                   :: nupiun
  integer, intent( inout )                 :: nprpar
  integer, intent( inout )                 :: nstat
  integer, intent( inout )                 :: iunfil(MAXFIL)
  integer, intent( out )                   :: iunlst(MAXFIL)

  logical, intent( inout )                 :: lumpedprojection

  real( prec ), intent( inout )            :: parprn(MAXUPR)
  character ( len = 100 ), intent( inout )  :: fillst(MAXFIL)



  ! Local Variables
  integer :: nn

  character ( len = 100 ) :: strin
  character ( len = 100 ) :: strpar(100)
  character ( len = 200 ) :: callstr
  integer :: ityp(100), lenstr(100)
  logical :: strcmp



   BTEMP = 0.D0
   BTINC = 0.D0

100 read (IOR, 99001, ERR = 400, end = 400) strin
  do while ( .true. )
    !     Parse it
    call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
    if ( iblnk==1 ) goto 100

 
      !----------------------Parameters controlling files --------------

     if ( strcmp(strpar(1), 'PRIN', 4) ) then

      !     Syntax is FILE
      !     OPTION, filename, 
      if ( nstr>2 ) then
        write (IOW, 99018)
        stop
      end if

      !     Read the option

180   read (IOR, 99001, ERR = 400, end = 400) strin
      do while ( .true. )
        call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
        if ( iblnk==1 ) goto 180

        if ( strcmp(strpar(1), 'MESH', 4) ) then
          call files(strpar(2),1, nfiles, iunfil, fillst, MAXFIL, iun)
          iunm = iun
          goto 180

        else if ( strcmp(strpar(1), 'USER', 4) ) then


          !     Read user print option

185       read (IOR, 99001, ERR = 400, end = 400) strin
          do while ( .true. )
            !     Parse it
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) goto 185

            if ( strcmp(strpar(1), 'FILE', 4) ) then
              do while ( .true. )

                !     Read the list of files

                read (IOR, 99001, ERR = 400, end = 400) strin
                !     Parse it
                call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
                if ( iblnk==1 ) cycle

                if ( ityp(1)/=2 .or. nstr/=1 ) then
                  write (IOW, 99021) strin
                  stop
                end if

                if ( strcmp(strpar(1), 'ENDFILES', 8) ) goto 185

                nupiun = nupiun + 1
                call files(strpar(1),1, nfiles, iunfil, fillst, MAXFIL, iun)

                iunlst(nupiun) = iun
              end do

            else if ( strcmp(strpar(1), 'PARA', 4) ) then

              if ( nprpar + 1>MAXUPR ) then
                write (IOW, 99022) MAXUPR
                stop
              end if
              call rdprm(parprn(nprpar + 1), MAXUPR - nprpar, nn, strin)
              nprpar = nprpar + nn
              cycle
            end if

            if ( nupiun==0 ) then
              write (IOW, 99024)
              stop
            end if
            goto 200
          end do
        end if

        exit
200   end do


      !-----------Initialize temperature value  ---------------

    else if ( strcmp(strpar(1), 'TEMP', 4) ) then

      if (nstr==2) then
         read(strpar(2),*) BTEMP
         BTINC = 0.D0
      endif      
      if (nstr==3) then
         read(strpar(3),*) BTINC
      Endif
      goto 100
      !------------------------Initialize state projection ---------------

    else if ( strcmp(strpar(1), 'PROJ', 4) ) then


      if ( ityp(2)/=0 .or. nstr<2 ) then
        write (IOW, 99031) strin
        stop
      end if

      read (strpar(2), *) nstat

      if (nstr==3) then
         if (strcmp(strpar(3), 'LUMP', 4)) then
            lumpedprojection = .true.
         endif
      endif

      goto 100

      !------------------------Initialize time increment ---------------

    else if ( strcmp(strpar(1), 'TIME', 4) ) then

!       Read time step parameters
        
        if (nstr<5.or.ityp(2)==2.or.ityp(3)/=0.or.ityp(4)/=0.or.ityp(5)/=0) then
		   write(IOW,*) ' Error detected in input file '
		   write(IOW,*) ' Expecting time increment, no.steps no steps between state prints, no steps between user prints'
		   write(IOW,*) ' following TIME STEP key in explicit dynamic step'
		   write(IOW,*) ' Found '
		   write(IOW,*) strin
		   stop
		endif

        read(strpar(2),*) DTIME 
		read(strpar(3),*) n_dynamic_steps
		read(strpar(4),*) state_print_interval
		read(strpar(5),*) user_print_interval

		goto 100
 
      !------------------------Exit ---------------

    else if ( strcmp(strpar(1), 'ENDE', 4) ) then

      exit

    else

      write (IOW, 99038) strin
      stop

    end if
300 end do


400 return


99001 format (A100)

99018 format ( // , ' **** ERROR DETECTED IN INPUT FILE **** ', /,  &
           ' The syntax for PRINT command is '  &
           , /, '   PRINT '/'MESH, filename, no. steps ', /,  &
           ' or PRINT '/' USER ', /, ' FILES ', /, ' filanames ', /,  &
           ' END FILES ', ' PARAMETERS ', /, ' list of parameters ')
99019 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting file name and no. steps between prints',  &
           ' following PRINT, MESH command '/' Found '/A80)
99021 format (' **** ERROR DETECTED IN INPUT FILE ****'/A80/  &
           ' is an invalid file name ')
99022 format ( // ' ** ERROR DETECTED IN SUBROUTINE rdsstep **'/  &
           ' Insufficient storage to read user supplied parameters'/  &
           ' controlling USER PRINT '/ &
           ' Parameter MAXUPR must be increased'/  &
           ' Its current value is ', I6)
99023 format ( // ' **** ERROR DETECTED IN INPUT FILE **** '/  &
           ' Expecting integer number of steps between prints '/  &
           ' following STEP keyword in PRINT, USER option.  Found'/ A80)
99024 format ( // , '**** ERROR DETECTED IN INPUT FILE **** ',  &
           '  No output files were specified with PRINT, USER ')
99031 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Number of variables to be projected must be specified '/  &
           ' following PROJECT STATE keyword.  Found '/A80)
99033 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting number specifying initial time increment,',  &
           /' Found '/A80)
99037 format ( // ' **** ERROR IN INPUT FILE **** '/  &
           ' Expecting numbers specifying tolerance and '/  &
           ' max no. iterations for nonlinear solver '/' Found '/A80)
99038 format ( // ' **** ERROR IN INPUT FILE **** '/  &
           ' Unrecognized keyword while reading static step  '/  &
           ' Terminate dynamic step with END EXPLICIT DYNAMIC STEP '/' Found '/A80)

end subroutine rddstep


!============================= rdsstep ==============================
subroutine rdustep( &
     usprop, MAXUSP, nusprp, &
     tprops, MAXTPR, ntprops, &
     lprops, MAXLPR, nlprops, &
     isolv,solvertype,ifl, tolrnc,  &
     maxitn, nfiles, iunfil, fillst, MAXFIL,  &
     iunm, iunlst, nupiun, parprn,  &
     MAXUPR, nprpar, umag, fmag, dlmag, nstat,lumpedprojection)
  use Types
  use ParamIO
  use Globals, only : TIME, DTIME
  implicit none

  integer, intent( in )                    :: MAXUSP
  integer, intent( in )                    :: MAXTPR
  integer, intent( in )                    :: MAXFIL
  integer, intent( in )                    :: MAXLPR
  integer, intent( in )                    :: MAXUPR

  integer, intent( out )                   :: nusprp
  integer, intent( out )                   :: ntprops
  integer, intent( out )                   :: nlprops
  integer, intent( out )                   :: isolv
  integer, intent( inout )                 :: solvertype
  integer, intent( out )                   :: maxitn
  integer, intent( inout )                 :: nfiles
  integer, intent( out )                   :: iunm
  integer, intent( out )                   :: nupiun
  integer, intent( inout )                 :: nprpar
  integer, intent( inout )                 :: nstat
  integer, intent( inout )                 :: iunfil(MAXFIL)
  integer, intent( out )                   :: iunlst(MAXFIL)
  
  logical, intent( inout )                 :: lumpedprojection

  real( prec ), intent( out )              :: usprop(MAXUSP)
  real( prec ), intent( out )              :: tprops(MAXTPR)
  real( prec ), intent( out )              :: lprops(MAXLPR)
  real( prec ), intent( inout )            :: tolrnc
  real( prec ), intent( inout )            :: umag
  real( prec ), intent( inout )            :: fmag
  real( prec ), intent( inout )            :: dlmag
  real( prec ), intent( inout )            :: parprn(MAXUPR)
  character ( len = 100 ), intent( inout )  :: fillst(MAXFIL)
  logical, intent(inout) :: ifl



  ! Local Variables
  integer      :: i, iblnk, iboun, ilst, ipoin
  integer      :: iseg, isiz, iszprs, itpmbp, iun, iz, iz0, izone,  &
       j, k, kboun
  integer      :: kci, kcs, kint, kjn, kkk, kseg, ktrp, kzone, &
       n, nn, npgbm,  nstat2, nstr,lproptop

  character ( len = 100 ) :: strin
  character ( len = 100 ) :: strpar(100)
  character ( len = 200 ) :: callstr
  integer :: ityp(100), lenstr(100)
  logical :: strcmp

  !     Initialize pointers


   lproptop = 9
   lprops(1:4) = 0
   lprops(5:8) = 1
   nusprp = 0
   nlprops = 8
   umag = 1.D0
   fmag = 1.D0
   dlmag = 1.D0
   BTEMP = 0.D0
   BTINC = 0.D0

100 read (IOR, 99001, ERR = 400, end = 400) strin
  do while ( .true. )
    !     Parse it
    call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
    if ( iblnk==1 ) goto 100

 
      !----------------------Parameters controlling files --------------

     if ( strcmp(strpar(1), 'PRIN', 4) ) then

      !     Syntax is FILE
      !     OPTION, filename, 
      if ( nstr>2 ) then
        write (IOW, 99018)
        stop
      end if

      !     Read the option

180   read (IOR, 99001, ERR = 400, end = 400) strin
      do while ( .true. )
        call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
        if ( iblnk==1 ) goto 180

        if ( strcmp(strpar(1), 'MESH', 4) ) then
          call files(strpar(2),1, nfiles, iunfil, fillst, MAXFIL, iun)
          iunm = iun
          goto 180

        else if ( strcmp(strpar(1), 'USER', 4) ) then


          !     Read user print option

185       read (IOR, 99001, ERR = 400, end = 400) strin
          do while ( .true. )
            !     Parse it
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) goto 185

            if ( strcmp(strpar(1), 'FILE', 4) ) then
              do while ( .true. )

                !     Read the list of files

                read (IOR, 99001, ERR = 400, end = 400) strin
                !     Parse it
                call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
                if ( iblnk==1 ) cycle

                if ( ityp(1)/=2 .or. nstr/=1 ) then
                  write (IOW, 99021) strin
                  stop
                end if

                if ( strcmp(strpar(1), 'ENDFILES', 8) ) goto 185

                nupiun = nupiun + 1
                call files(strpar(1),1, nfiles, iunfil, fillst, MAXFIL, iun)

                iunlst(nupiun) = iun
              end do

            else if ( strcmp(strpar(1), 'PARA', 4) ) then

              if ( nprpar + 1>MAXUPR ) then
                write (IOW, 99022) MAXUPR
                stop
              end if
              call rdprm(parprn(nprpar + 1), MAXUPR - nprpar, nn, strin)
              nprpar = nprpar + nn
              cycle
            end if

            if ( nupiun==0 ) then
              write (IOW, 99024)
              stop
            end if
            goto 200
          end do
        end if

        exit
200   end do


      !------------------------Magnitude of constrained DOFS ---------------

    else if ( strcmp(strpar(1), 'DEGR', 4) ) then
      if (nstr==2) then
         read (strpar(2), *) umag
         goto 100
      else
!       Read displacement history parameters
        lprops(5) = lproptop

        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lprops(1) = nn/2                     ! Data ccontains pairs of points - lprops(1) gives no. pairs
        lproptop = lproptop + nn
        nlprops = nlprops + nn
      endif

      !------------------------Magnitude of nodal forces ---------------

    else if ( strcmp(strpar(1), 'FORC', 4) ) then
      if (nstr==2 ) then
        read (strpar(2), *) fmag
        goto 100
      else
        lprops(7) = lproptop
        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lproptop = lproptop + nn
        nlprops = nlprops + nn
        lprops(3) = nn/2                 ! No. pairs of points
      endif

      !------------------------Magnitude of distributed loads ---------------

    else if ( strcmp(strpar(1), 'DIST', 4) ) then
      if (nstr == 2) then
        read (strpar(2), *) dlmag
        goto 100
      else
!       Read displacement history parameters
        lprops(6) = lproptop

        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lprops(2) = nn/2               ! No. pairs of points
        lproptop = lproptop + nn
        nlprops = nlprops + nn
      endif

      !-----------Initialize temperature value or history ---------------

    else if ( strcmp(strpar(1), 'TEMP', 4) ) then

      if (nstr==2) then
         read(strpar(2),*) BTEMP
         BTINC = 0.D0
         goto 100      
      else if (nstr==3) then
         read(strpar(3),*) BTINC
         goto 100
      Else

!       Read displacement history parameters
        lprops(8) = lproptop

        call rdprm(lprops(lproptop), MAXLPR, nn, strin)
        lproptop = lproptop + nn
        nlprops = nlprops + nn
        lprops(4) = nn/2               ! No. pairs of points
      Endif
      !------------------------Initialize state projection ---------------

    else if ( strcmp(strpar(1), 'PROJ', 4) ) then


      if ( ityp(2)/=0 .or. nstr<2 ) then
        write (IOW, 99031) strin
        stop
      end if

      read (strpar(2), *) nstat

      if (nstr==3) then
         if (strcmp(strpar(3), 'LUMP', 4 )) then
            lumpedprojection = .true.
         endif
      endif

      goto 100


      !------------------------Initialize user step parameters ---------------

    else if ( strcmp(strpar(1), 'PARA', 4) ) then

!       Read time step parameters

        call rdprm(usprop, MAXUSP, nusprp, strin)

      !------------------------Initialize time increment ---------------

    else if ( strcmp(strpar(1), 'TIME', 4) ) then

!       Read time step parameters

        call rdprm(tprops, MAXTPR, ntprops, strin)

        DTIME = tprops(1)

      !------------------Parameters controlling solver File -----------------

    else if ( strcmp(strpar(1), 'SOLV', 4) ) then
        if (strcmp(strpar(2), 'FACT',4)) then
           solvertype = 1
        else if (strcmp(strpar(2),'CONJ',4)) then
           solvertype = 2
        else if (strcmp(strpar(2),'GMRE',4)) then
           solvertype = 3
        else
           write(IOW,*) ' Unknown solver option '
           write(IOW,*) strin
           write(IOW,*) ' Syntax is '
           write(IOW,*) 'SOLVE, FACTOR, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
           write(IOW,*) 'SOLVE, FACTOR, NONLINEAR, tolerance, max its, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, GMRES, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, GMRES, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
           stop
        endif        

      if ( strcmp(strpar(3), 'LINE', 4) ) then
        isolv = 0
		if (nstr>3) then
		  if (strcmp(strpar(4),'UNSY',4) ) then
		     ifl = .true.
		  else
                 write(IOW,*) ' Unknown solver option '
                 write(IOW,*) strin
                 write(IOW,*) ' Syntax is '
                 write(IOW,*) 'SOLVE, FACTOR, LINEAR, (UNSYMMETRIC) '
                 write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, LINEAR, (UNSYMMETRIC) '
                 write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
                 write(IOW,*) 'SOLVE, FACTOR, NONLINEAR, tolerance, max its, (UNSYMMETRIC) '
                 stop
		  endif
		endif
      else
        isolv = 1
        if ( nstr<5 ) then
          write (IOW, 99037) strin
          stop
        end if
        if ( ityp(4)==2 ) then
          write (IOW, 99037) strin
          stop
        end if
        read (strpar(4), *) tolrnc
        if ( ityp(5)/=0 ) then
          write (IOW, 99037) strin
          stop
        end if
        read (strpar(5), *) maxitn

		if (nstr>5) then
		  if (strcmp(strpar(6),'UNSY',4) ) then
		     ifl = .true.
		  else if (strcmp(strpar(6),'SYMM',4) ) then
		     ifl = .false.
		  else
           write(IOW,*) ' Unknown solver option '
           write(IOW,*) strin
           write(IOW,*) ' Syntax is '
           write(IOW,*) 'SOLVE, FACTOR, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, LINEAR, (UNSYMMETRIC) '
           write(IOW,*) 'SOLVE, CONJUGATE GRADIENT, NONLINEAR, tolerance, max its, (UNSYMMETRIC)'
           write(IOW,*) 'SOLVE, FACTOR, NONLINEAR, tolerance, max its, (UNSYMMETRIC) '
           stop
		  endif
        endif
      end if

      goto 100
!
! --------------------------  Open a data file
!
        else if ( strcmp(strpar(1), 'DATAFILE', 8) ) then

              do while ( .true. )

                !     Read the list of files

                read (IOR, 99001, ERR = 400, end = 400) strin
                !     Parse it
                call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
                if ( iblnk==1 ) cycle

                if ( ityp(1)/=2 .or. nstr/=1 ) then
                  write (IOW, 99021) strin
                  stop
                end if

                if ( strcmp(strpar(1), 'ENDDATAF', 8) ) goto 100

                nupiun = nupiun + 1
                call files(strpar(1),-1, nfiles, iunfil, fillst, MAXFIL, iun)
                iunlst(nupiun) = -iun
              end do


      !------------------------Exit ---------------

    else if ( strcmp(strpar(1), 'ENDS', 4) ) then

      exit

    else

      write (IOW, 99038) strin
      stop

    end if
300 end do


400 return


99001 format (A100)

99018 format ( // , ' **** ERROR DETECTED IN INPUT FILE **** ', /,  &
           ' The syntax for PRINT command  is '  &
           , /, '   PRINT '/'MESH, filename, no. steps ', /,  &
           ' or PRINT '/' USER ', /, ' FILES ', /, ' filanames ', /,  &
           ' END FILES ', ' PARAMETERS ', /, ' list of parameters ')
99019 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting file name and no. steps between prints',  &
           ' following PRINT, MESH command '/' Found '/A80)
99021 format (' **** ERROR DETECTED IN INPUT FILE ****'/A80/  &
           ' is an invalid file name ')
99022 format ( // ' ** ERROR DETECTED IN SUBROUTINE rdsstep **'/  &
           ' Insufficient storage to read user supplied parameters'/  &
           ' controlling USER PRINT '/ &
           ' Parameter MAXUPR must be increased'/  &
           ' Its current value is ', I6)
99023 format ( // ' **** ERROR DETECTED IN INPUT FILE **** '/  &
           ' Expecting integer number of steps between prints '/  &
           ' following STEP keyword in PRINT, USER option.  Found'/ A80)
99024 format ( // , '**** ERROR DETECTED IN INPUT FILE **** ',  &
           '  No output files were specified with PRINT, USER ')
99031 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Number of variables to be projected must be specified '/  &
           ' following PROJECT STATE keyword.  Found '/A80)
99033 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Expecting number specifying initial time increment,',  &
           /' Found '/A80)
99037 format ( // ' **** ERROR IN INPUT FILE **** '/  &
           ' Expecting numbers specifying tolerance and '/  &
           ' max no. iterations for nonlinear solver '/' Found '/A80)
99038 format ( // ' **** ERROR IN INPUT FILE **** '/  &
           ' Unrecognized keyword while reading static step  '/  &
           ' Terminate static step with END STEP '/' Found '/A80)

end subroutine rdustep



!================================SUBROUTINE PRNSTT ============================
!subroutine prnstt(iun,nzone,nops,nelm,izplmn,nodpn,iep,x,MAXCOR,  &
!     icon, MAXCON, utot, du, MAXDOF, stlump, MAXLMP, lumpn)
!  use Types
!  use ParamIO
!  use Globals, only : TIME, DTIME, n_state_prints
!  implicit none

!  integer, intent( inout )      :: iun                      
!  integer, intent( in )         :: nops                                    
!  integer, intent( in )         :: nelm                     
!  integer, intent( in )         :: nzone
!  integer, intent( in )         :: MAXCOR                   
!  integer, intent( in )         :: MAXCON                   
!  integer, intent( in )         :: MAXDOF                   
!  integer, intent( in )         :: MAXLMP                   
!  integer, intent( in )         :: izplmn(2,nzone)
!  integer, intent( in )         :: nodpn(7, nops)           
!  integer, intent( in )         :: iep(7, nelm)             
!  integer, intent( inout )      :: icon(MAXCON)             
!  integer, intent( in )         :: lumpn(2,nops,nzone)              
!  real( prec ), intent( inout ) :: x(MAXCOR)                
!  real( prec ), intent( inout ) :: utot(MAXDOF)             
!  real( prec ), intent( inout ) :: du(MAXDOF)               
!  real( prec ), intent( inout ) :: stlump(MAXLMP)           

  ! Local Variables
!  integer      :: j, jp, js, ju, jx, k, l, lmn, n, ndof,npstat
!  integer      :: nelpr3,nelpr4, nelpr6, nelpr8,nelpr9, nelprn, nodpr2d,nodpr3d,nodprn, nst, node
!  character ( len = 80 ) :: vout
!  character ( len = 12 ) :: string
!  real(prec) :: x1,x2

!  integer, allocatable :: nodenum(:,:)

!  dimension vout(15)

!  vout(1) = 'V1'
!  vout(2) = 'V1,V2'
!  vout(3) = 'V1,V2,V3'
!  vout(4) = 'V1,V2,V3,V4'
!  vout(5) = 'V1,V2,V3,V4,V5'
!  vout(6) = 'V1,V2,V3,V4,V5,V6'
!  vout(7) = 'V1,V2,V3,V4,V5,V6,V7'
!  vout(8) = 'V1,V2,V3,V4,V5,V6,V7,V8'
!  vout(9) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9'
!  vout(10) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10'
!  vout(11) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11'
!  vout(12) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12'
!  vout(13) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13'
!  vout(14) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14'
!  vout(15) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15'

  ! Print diffusion solution to a file that may be read by TECPLOT

  !     Check the no. DOFs and no. states associated with the first node.
!  ndof = nodpn(5, 1)
!  nst = lumpn(1,1,1)

!  allocate(nodenum(nops,nzone))

!  nodenum = 0
!  nodprn = 0
!  nelpr3 = 0
!  nelpr4 = 0
!  nelpr6 = 0
!  nelpr8 = 0
!  nelpr9 = 0
!  nodpr2d = 0
!  nodpr3d = 0


!  do n = 1, nops
!    if ( nodpn(3, n)==2 ) nodpr2d = nodpr2d + 1
!	if ( nodpn(3, n)==3 ) nodpr3d = nodpr3d + 1
!  end do
!  if (nodpr3d==0) nodprn = nodpr2d
!  if (nodpr2d==0) nodprn = nodpr3d
!  if (nodpr3d>0.and.nodpr2d>0) then
!     write(IOW,*) ' WARNING: subroutine PRNSTT found both 2D and 3D nodes '
!	 write(IOW,*) ' Only 3d nodes will be printed '
!     nodprn = nodpr3d
!	 nodpr2d = 0
!  endif

! State print is done zone by zone, to allow discontinuities across zone
! boundaries
!
! Count the number of printable nodes and elements, and compute print order
! for nodes
!  nodprn = 0
!  do iz = 1,nzone                             ! Loop over zones

!    do lmn = izplmn(1,iz),izplmn(2,iz)        ! Loop over elements in zone
!      if (iep(1,lmn)<100) then
!        if (iep(3,lmn) == 3) nelpr3 = nelpr3 + 1
!        if (iep(3,lmn) == 4) nelpr4 = nelpr4 + 1
!        if (iep(3,lmn) == 6) nelpr6 = nelpr6 + 1
!      endif
!	  if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
!	    if (iep(3,lmn) == 8) nelpr8 = nelpr8 + 1
!	    if (iep(3,lmn) == 4) nelpr4 = nelpr4 + 1
!	  endif
!      do n = 1,iep(3,lmn)
!        node = icon(iep(2,lmn)+n-1)
!        if (iep(1,lmn)<100.or.(iep(1,lmn)>1000.and.iep(1,lmn)<2000)) then
!          if (nodenum(node,iz) == 0) then
!            nodprn = nodprn + 1
!            nodenum(node,iz) = -nodprn
!          endif
!        endif
!      end do
!    end do
!  end do

!  nelprn = 4*nelpr6 + nelpr3 + nelpr4 + nelpr8 + 4*nelpr9

!      npstat = ndof+nst
!	  if (npstat>15) then
!	     write(IOW,*) ' *** Warning - only 15 of ',ndof+nst,' nodal vars were printed *** '
!		 npstat = 15
!	  endif
!      if (nodpr3d==0) then
!	    write (iun, '(A16,A80)') 'VARIABLES = X,Y,', vout(npstat)
!         write (iun, *) ' ZONE, T="',TIME+DTIME,'" F=FEPOINT, I=', nodprn, ' J=', nelprn      
!	  else if (nodpr2d==0) then
!	     write (iun,'(A18,A80)') 'VARIABLES = X,Y,Z,', vout(npstat)
!	     if (nelpr8>0) then
!         write (iun,'(A10,D10.4,A15,I5,A3,I5,A9)') ' ZONE, T="',TIME+DTIME, &
!		                    '" F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=BRICK'
!		 else if (nelpr4>0) then
!	         write (iun,'(A10,D10.4,A15,I5,A3,I5,A15)') ' ZONE, T="',TIME+DTIME, &
!		                    '" F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=TETRAHEDRON'
!		 endif	 
!      endif
!

! Print the nodes

!  do iz = 1,nzone                             ! Loop over zones
!    do lmn = izplmn(1,iz),izplmn(2,iz)        ! Loop over elements in zone
!      do n = 1,iep(3,lmn)                     ! loop over nodes on element
!        node = icon(iep(2,lmn)+n-1)
!        if (nodenum(node,iz) < 0) then           ! If not yet printed, print

!          nodenum(node,iz) = -nodenum(node,iz)  ! prevents more prints

!          jx = nodpn(2, node)
!          ju = nodpn(4, node)
!          js = lumpn(2,node,iz)
!		  if (nodpr3d==0) then
!            if (ndof>=2) then
!              x1 = x(jx)+ utot(ju)+du(ju)
!              x2 = x(jx+1)+ utot(ju+1)+du(ju+1)
!            else
!              x1 = x(jx)
!              x2 = x(jx+1)
!            endif
!            write (iun, '(17(1X,E18.10))') x1, x2,  &
!         (utot(ju+j)+du(ju + j), j = 0, ndof - 1), (stlump(js + j), j = 0, npstat-ndof - 1)
!          else if (nodpr2d==0) then
!              write (iun, '(17(1X,E18.10))') (x(jx+k) &
!               + (utot(ju+k)+du(ju+k)), k=0,2),  &
!			   (utot(ju+j)+du(ju + j), j = 0, ndof - 1),  &
!                 (stlump(js + j), j = 0, npstat-ndof - 1)
!		  endif
!        endif
!      end do
!    end do
!  end do

! Print the elements

!  do iz = 1,nzone
!   do lmn = izplmn(1,iz),izplmn(2,iz)
!     jp = iep(2, lmn)
!     if (iep(1,lmn)<100) then
!        if ( iep(3, lmn)==9 ) then
!              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 1),iz), nodenum(icon(jp + 4),iz), nodenum(icon(jp + 3),iz)
!              write (iun, *) nodenum(icon(jp + 1),iz), nodenum(icon(jp + 2),iz),  &
!                   nodenum(icon(jp + 5),iz), nodenum(icon(jp + 4),iz)
!              write (iun, *) nodenum(icon(jp + 3),iz), nodenum(icon(jp + 4),iz),  &
!                   nodenum(icon(jp + 7),iz), nodenum(icon(jp + 6),iz)
!              write (iun, *) nodenum(icon(jp + 4),iz), nodenum(icon(jp + 5),iz),  &
!                   nodenum(icon(jp + 8),iz), nodenum(icon(jp + 7),iz)
!        else if ( iep(3, lmn)==6 ) then
!              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 3),iz), nodenum(icon(jp + 5),iz), nodenum(icon(jp + 5),iz)
!              write (iun, *) nodenum(icon(jp + 3),iz), nodenum(icon(jp + 1),iz),  &
!                   nodenum(icon(jp + 4),iz), nodenum(icon(jp + 4),iz)
!              write (iun, *) nodenum(icon(jp + 4),iz), nodenum(icon(jp + 2),iz),  &
!                   nodenum(icon(jp + 5),iz), nodenum(icon(jp + 5),iz)
!              write (iun, *) nodenum(icon(jp + 3),iz), nodenum(icon(jp + 4),iz),  &
!                   nodenum(icon(jp + 5),iz), nodenum(icon(jp + 5),iz)
!        else if ( iep(3, lmn)==4 ) then
!              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 1),iz), nodenum(icon(jp + 2),iz), nodenum(icon(jp + 3),iz)
!        else if ( iep(3, lmn)==3 ) then             
!              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 1),iz), nodenum(icon(jp + 2),iz), nodenum(icon(jp + 2),iz)
!        endif
!      else if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
!	     if (iep(3,lmn)==8) then
!	       write(iun,'(8(1x,i5))') (nodenum(icon(jp+k),iz), k=0,7)
!         end if
!         if (iep(3,lmn) ==4) then
!            write(iun,'(4(1x,i5))') (nodenum(icon(jp+k),iz), k=0,3)
!         endif
!      endif
!   end do
! end do

!  write (iun, *) 'TEXT,M=WINDOW,X=0.25,Y=0.91,H=6.0,F=TIMES-ITALIC'
!  write (iun, *) 'ZN=', n_state_prints, ',BX=FILLED,BXF=WHITE,BXO=BLACK'
!  write (iun, *) 'BXM=40.,T="t/t_0 = ', string, '"'


!  deallocate(nodenum)

!end subroutine prnstt




!======================SUBROUTINE RDPRM ======================
subroutine rdprm(params, MAXPRS, nprs, strin)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )                   :: MAXPRS
  integer, intent( out )                  :: nprs
  real( prec ), intent( inout )           :: params(MAXPRS)
  character ( len = 100 ), intent( inout ) :: strin

  ! Local Variables
  integer :: iblnk, ityp, k, lenstr, nstr
  character ( len = 100 ) :: strpar(100)

  real (prec) testvar
  dimension ityp(100), lenstr(100)

  ! Read a list of parameters.
  nprs = 0

  do while ( .true. )


    read (IOR, 99001, ERR = 100, end = 100) strin
    call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
    if ( iblnk==1 ) cycle

    if ( ityp(1)==2 ) return

    if ( nprs + nstr>MAXPRS ) then
      write (IOW, 99002) MAXPRS
      stop
    end if

    do k = 1, nstr
      nprs = nprs + 1
      read (strpar(k), *) params(nprs)
    end do
  end do


100 return

99001 format (A100)
99002 format ( // '  *** Error detected in subroutine RDPRS ***'/  &
           ' Insufficient storage to read parameters '/  &
           ' Parameter MAXPRS must be increased '/ &
           ' Its current value is ', I5)

end subroutine rdprm



!=====================SUBROUTINE GETNAM =======================
subroutine getnam(name, len, nnam, namlst, ipnnam, MAXIPN, ipoin)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )                    :: MAXIPN
  integer, intent( in )                    :: len
  integer, intent( in )                    :: nnam
  integer, intent( out )                   :: ipoin
  integer, intent( in )                    :: ipnnam(2, MAXIPN)
  character ( len = 100 ), intent( inout )  :: name
  character ( len = 100 ), intent( in )     :: namlst(MAXIPN)

  ! Local Variables
  integer :: n
  logical :: strcmp

  !     Find the pointers for the zone named zname
  !     by searching through the list of named zones

  do n = 1, nnam
    if ( ipnnam(1, n)==len ) then
      if ( strcmp(name, namlst(n), len) ) then
        ipoin = ipnnam(2, n)
        return
      end if
    end if
  end do

  write (IOW, 99001) name
  stop

99001 format ( // ' *** ERROR DETECTED IN INPUT FILE ***', /, &
           ' The name '/(A100)/' was not defined ')

end subroutine getnam

!=======================SUBROUTINE RDMESH =====================
subroutine rdmesh(nops, nodpn, MAXNOD, x, MAXCOR, itopx, utot, du,  &
     MAXDOF, itopu, &
	 MAXZON,nzon,izplmn,density, nelm, iep, MAXLMN, icon, MAXCON,  &
     itopc, eprop, MAXPRP, itopp, svart, MAXVAR, itops, &
     nhist,histnam,ipnhist,MAXHST,histvals,MAXHVL,histpoin,&
	 nbcnset,bcnsetnam,ipnbcnset,MAXNST,nsetbcpoin,nsetlst,itopnset,MAXNSL, &
	 nbclset,bclsetnam,ipnbclset,MAXLST,lsetbcpoin,lsetlst,itoplset,MAXLSL, &
     MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals,itopdvals, &
     MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals,itopdlvals, &
     nmpc, lstmpc, MAXMPC, parmpc, MAXPMP,  strin)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )                :: MAXNOD             
  integer, intent( in )                :: MAXCOR             
  integer, intent( in )                :: MAXDOF
  integer, intent( in )                :: MAXZON             
  integer, intent( in )                :: MAXLMN             
  integer, intent( in )                :: MAXCON             
  integer, intent( in )                :: MAXPRP             
  integer, intent( in )                :: MAXVAR
  integer, intent( in )                :: MAXHST
  integer, intent( in )                :: MAXHVL             
  integer, intent( in )                :: MAXMPC  
  integer, intent( in )                :: MAXPMP           
  integer, intent( out )               :: nops                  
  integer, intent( out )               :: itopx                 
  integer, intent( out )               :: itopu
  integer, intent( inout  )            :: nzon                 
  integer, intent( out )               :: nelm                  
  integer, intent( out )               :: itopc                 
  integer, intent( out )               :: itopp                 
  integer, intent( out )               :: itops
  integer, intent( inout )             :: nhist                 
  integer, intent( out )               :: nmpc                  
  integer, intent( out )               :: nodpn(7, MAXNOD)
  integer, intent( inout)              :: izplmn(2,MAXZON)      
  integer, intent( out )               :: iep(7, MAXLMN)        
  integer, intent( inout )             :: icon(MAXCON)
  integer, intent( inout )             :: histpoin(2,MAXHST)          
  integer, intent( out )               :: lstmpc(7, MAXMPC)   
  real( prec ), intent( inout )        :: density(MAXZON)  
  real( prec ), intent( inout )        :: x(MAXCOR)             
  real( prec ), intent( out )          :: utot(MAXDOF)          
  real( prec ), intent( out )          :: du(MAXDOF)            
  real( prec ), intent( inout )        :: eprop(MAXPRP)         
  real( prec ), intent( out )          :: svart(MAXVAR)
  real( prec ), intent(inout)          :: histvals(MAXHVL)
  real( prec ), intent(inout)          :: parmpc(MAXPMP)         
  character ( len = 100 ), intent( inout ) :: strin

! Data structures to store lists of nodes, elements and BCs
!
!      MAXNST           Max no. node sets
!      MAXLST           Max no. element sets
!      MAXNSL           Max storage for node sets
!      MAXLSL           Max storage for element sets
!      nbcnset          No. node sets
!      nbclset          No. element sets
!      nsetbcpoin(1,i)      Nodes in ith set start at nsetlst(nsetbcpoin(1,i))
!      nsetbcpoin(2,i)      No. nodes in ith set
!      nsetlst          List of nodes in sets
!      lsetlst          List of elements in sets
!      MAXDDF           Max no. DOF definitions
!      ndofdef          No. DOF definitions
!      dofdefpoin(1,i)  Node set for DOF definition
!      dofdefpoin(2,i)  >0 DOF no. for DOF definition
!                       <0 DOF no. for force definition
!      dofdefpoin(3,i)  >0 - take DOF value from dofdefvals(dofdefpoin(4,i))
!                       <0 - compute DOF value by interpolating hist table dofdefpoin(
!      dofdefvals       list of DOF values
!      ndldef           no. distributed load definitions
!      dlddefpoin(1,i)  element set for distributed load definition
!      dlddefpoin(2,i)  face number for distributed load definition
!      dlddefpoin(3,i)  control flag for distributed load definition
!
!
  integer, intent(in)                 :: MAXNST
  integer, intent(in)                 :: MAXLST
  integer, intent(in)                 :: MAXNSL
  integer, intent(in)                 :: MAXLSL
  integer, intent(inout)              :: nbcnset
  integer, intent(inout)              :: nbclset
  integer, intent(inout)              :: itopnset
  integer, intent(inout)              :: itoplset
  integer, intent(inout)              :: itopdvals
  integer, intent(inout)              :: itopdlvals
  integer, intent(inout)              :: nsetbcpoin(2,MAXNST)
  integer, intent(inout)              :: lsetbcpoin(2,MAXLST)
  integer, intent(inout)              :: nsetlst(MAXNSL)
  integer, intent(inout)              :: lsetlst(MAXNSL)
  integer, intent(in)                 :: MAXDDF
  integer, intent(inout)              :: ndofdef
  integer, intent(inout)              :: dofdefpoin(3,MAXDDF)
  integer, intent(in)                 :: MAXDVL
  real (prec), intent(inout)          :: dofdefvals(MAXDVL)
  integer, intent(in)                 :: MAXDLF
  integer, intent(inout)              :: ndldef
  integer, intent(inout)              :: dldefpoin(5,MAXDLF)
  integer, intent(in)                 :: MAXDLV
  real (prec), intent(inout)          :: dldefvals(MAXDLV)
! Data structures to track names of load histories, node sets and element sets
  character ( len = 100 ), intent( inout ) :: histnam(MAXHST)
  character ( len = 100 ), intent( inout ) :: bcnsetnam(MAXNST)
  character ( len = 100 ), intent( inout ) :: bclsetnam(MAXLST)
  integer, intent(inout)                :: ipnhist(2,MAXHST)
  integer, intent(inout)                :: ipnbcnset(2,MAXNST)
  integer, intent(inout)                :: ipnbclset(2,MAXLST)
!
  ! Local Variables
  real( prec ) :: dfstor, svstor, coord_scale_factor
  integer      :: iblnk, icount,  ityp, k, lenstr, lmntyp,  mpctyp, ncoor,nprops, &
       ndof, nnod, nodtyp, nprop, nstr, nsvar, iopt, nodenum, iof, itoppmp,nset1,nset2
  character ( len = 100 ) :: strpar(100)
  logical :: strcmp

  dimension ityp(100), lenstr(100)
  dimension svstor(400), dfstor(400)

  !     Subroutine to read the data defining a finite element mesh and BCs
  !     directly from an input file.

  !     Pointers to top of connectivity stack; state variable stack;
  !     nodal dof stack; property stack and coordinate stack.

  itopx = 0
  itopu = 0
  itopc = 0
  itops = 0
  itopp = 0
  nops = 0
  nzon = 0
  nelm = 0
  nmpc = 0
  lmntyp = 0
  nodtyp = 0
  mpctyp = 0
  nbcnset = 0
  nbclset = 0
  itopnset = 0
  itoplset = 0
  itopdvals = 0
  itopdlvals = 0
  itoppmp = 0

  density = -1.d0

!     read a line of the input file


   do while ( .true. )
      read (IOR, 99001, ERR = 200, end = 200) strin
      call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
      if ( iblnk==1 ) cycle
      exit
   end do


  do while ( .true. )

    continue

!     ---------------------- READ NODAL DATA ---------------------
    if ( strcmp(strpar(1), 'NODE', 4) ) then

      if ( nstr<3 .or. (ityp(2)/=0) .or. (ityp(3)/=0) ) then
        write (IOW, 99002)
        stop
      end if

      read (strpar(2), *) ncoor
      read (strpar(3), *) ndof

      if ( nstr==4 .and. ityp(4)==0 ) then
        read (strpar(4), *) nodtyp
      else
        nodtyp = nodtyp + 1
      end if
 
      do while ( .true. )
        read (IOR, 99001, ERR = 200, end = 200) strin
        call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
        if ( iblnk==1 ) cycle
        exit
      end do

      do while ( .true. )

        !     --------- read initial nodal dof  ----------

        if ( strcmp(strpar(1), 'INIT', 4) ) then
!
!         Read initial DOF or velocity values for nodes
!
          if (nops==0) then
		     write(IOW,*) ' Error detected in input file '
			 write(IOW,*) ' Nodal coordinates must be defined before initial DOF'
			 stop
		  endif

          iopt = 1
          if (strcmp(strpar(2),'VEL',3)) iopt = 2
          icount = 0
          do while ( .true. )
            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle

            if ( ityp(1)/=2 ) then

              if (ityp(1)/=0) then
			     write(IOW,*) ' Error detected in input file'
				 write(IOW,*) ' Expecting node number following INITIAL CONDITIONS key '
				 write(IOW,*) 'Found'
				 write(IOW,*) strin
				 stop
			  endif
			  read(strpar(1),*) nodenum
			  
              if (nstr/=nodpn(5,nodenum)+1) then
			     write(IOW,*) ' Error detected in input file '
				 write(IOW,*) ' Expecting ',nodpn(5,nodenum),' initial DOFs for node ',nodenum
				 write(IOW,*) ' Found only ',nstr-1
				 stop
			  endif

              if (iopt==1) then
                do k = 1, nstr-1
			      iof = nodpn(4,nodenum)
                  read (strpar(k+1), *) utot(iof+k-1)
                end do
			  else
                do k = 1, nstr-1
			      iof = nodpn(4,nodenum)
                  read (strpar(k+1), *) du(iof+k-1)
                end do
              endif

            elseif (strcmp(strpar(1), 'ALLNODES', 8) ) then
            ! Initialize DOF for all nodes with one line
               do nodenum = 1,nops
                 if (iopt==1) then
                   do k = 1, nstr-1
			         iof = nodpn(4,nodenum)
                     read (strpar(k+1), *) utot(iof+k-1)
                   end do
			     else
                   do k = 1, nstr-1
			        iof = nodpn(4,nodenum)
                    read (strpar(k+1), *) du(iof+k-1)
                   end do
                 endif
               end do
              
              else
              
                exit

            end if
          end do

        else if ( strcmp(strpar(1), 'COOR', 4) ) then
        
          coord_scale_factor = 1.d0
          if (nstr>1) then
              Read(strpar(2),*) coord_scale_factor
          endif
!
!         Read coords of nodes
!
          do while ( .true. )

            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle


            if ( ityp(1)==2 ) exit
            if ( nstr>ncoor+1 ) then
              write (IOW, 99005) ncoor, nstr
              stop
            end if

            nops = nops + 1
            nodpn(1, nops) = nodtyp
            nodpn(2, nops) = itopx + 1
            nodpn(3, nops) = ncoor
            nodpn(4, nops) = itopu + 1
            nodpn(5, nops) = ndof
            do k = nstr-ncoor+1, nstr
			  itopx = itopx + 1
			  if (itopx>maxcor) then
			     write(IOW,*) ' Insufficient storage for nodal coordinates'
			     write(IOW,*) ' Increase parameter MAXCOR '
			     stop
			  endif
              read (strpar(k), *) x(itopx)
              x(itopx) = x(itopx)*coord_scale_factor
            end do
            itopu = itopu + ndof
          end do

        else
          exit
        end if
      end do

      !     -------------------- READ ELEMENT DATA ----------------------

    else if ( strcmp(strpar(1), 'ELEM', 4) ) then

      if ( nstr<4 .or. (ityp(2)/=0) .or. (ityp(3)/=0) .or. (ityp(4)/=0) ) then
        write (IOW, 99006)
        stop
      end if

      read (strpar(2), *) nnod
      read (strpar(3), *) nprop
      read (strpar(4), *) nsvar

      if (nsvar>400) then
	     write(IOW,*) ' Error in subroutine RDMESH '
		 write(IOW,*) ' Insufficient storage for state vars '
		 write(IOW,*) ' Increase dimension of array svstor to ',nsvar
		 stop
	  endif

      do k = 1, nsvar
        svstor(k) = 0.D0
      end do

      if ( nstr==5 .and. ityp(5)==0 ) then
        read (strpar(5), *) lmntyp
      else
        lmntyp = lmntyp + 1
      end if

      do while ( .true. )
        read (IOR, 99001, ERR = 200, end = 200) strin
        call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
        if ( iblnk==1 ) cycle
        exit
      end do
      nzon = nzon + 1
      izplmn(1,nzon) = nelm+1

      do while ( .true. )


        !     --------- read element props ----------

        if ( strcmp(strpar(1), 'PROP', 4) ) then

          icount = 0
          do while ( .true. )

            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle

            if ( ityp(1)/=2 ) then
              if ( icount + nstr>nprop ) then
                write (IOW, 99007)
                write (IOW, 99001) strin
                stop
              end if

              do k = 1, nstr
                itopp = itopp + 1
                icount = icount + 1
                read (strpar(k), *) eprop(itopp)
              end do
            else

              if ( icount<nprop ) then
                write (IOW, 99008) nprop, icount
                stop
              end if

              exit
            end if
          end do

          !     --------- Read element mass density ----------

        else if ( strcmp(strpar(1), 'DENS', 4) ) then

           if (nstr<2.or.ityp(2)==2) then
		      write(IOW,*) ' Error detected in input file '
			  write(IOW,*) ' Expecting mass density value following DENSITY keyword '
			  write(IOW,*) ' Found '
			  write(IOW,*) strin
		   endif

		   read(strpar(2),*) density(nzone)

		   do while ( .true. )
              read (IOR, 99001, ERR = 200, end = 200) strin
              call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
              if ( iblnk==1 ) cycle
              exit
           end do

          !     --------- Read element connectivity ----------

        else if ( strcmp(strpar(1), 'CONN', 4) ) then


          do while ( .true. )

            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle

            if ( ityp(1)==2 ) then
               if (lmntyp<100.or.(lmntyp>9000.and.lmntyp<9100) ) then
                 izplmn(2,nzon) = nelm
               endif
			   exit
			endif

            if ( nstr>nnod+1 ) then
              write (IOW, 99009) nnod, nstr
              stop
            end if
           if ( nstr<nnod ) then
              write (IOW, 99009) nnod, nstr
              stop
            end if
            nelm = nelm + 1
            iep(1, nelm) = lmntyp
            iep(2, nelm) = itopc + 1
            iep(3, nelm) = nnod
            iep(4, nelm) = itopp - nprop + 1
            iep(5, nelm) = nprop
            iep(6, nelm) = itops + 1
            iep(7, nelm) = nsvar
            do k = nstr-nnod+1, nstr
              itopc = itopc + 1
              read (strpar(k), *) icon(itopc)
              if (icon(itopc)>nops.or.icon(itopc)<1) then
			     write(IOW,*)
			     write(IOW,*) ' *** Error in element connectivity ***'
				 write(IOW,*) ' Element ',nelm,' has node ',icon(itopc)
				 write(IOW,*) ' No. nodes in mesh is ',nops
				 stop
			  endif
            end do
            do k = 1, nsvar
              itops = itops + 1
			  if (itops>MAXVAR) then
			    write(IOW,*) 
				write(IOW,*) ' *** Error detected in subroutine RDMESH '
				write(IOW,*) ' Insufficient storage for element state vars '
				write(IOW,*) ' Parameter MAXSVR must be increased '
                write(IOW,*) ' its current value is ',MAXVAR
				stop
			  endif
              svart(itops) = svstor(k)

            end do
          end do

          izplmn(2,nzon) = nelm
          !     --------- Read element state variables ----------

        else if ( strcmp(strpar(1), 'STAT', 4) ) then

          icount = 0
          do while ( .true. )

            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle

            if ( ityp(1)/=2 ) then
              if ( icount + nstr>nsvar ) then
                write (IOW, 99010)
                stop
              end if

              do k = 1, nstr
                icount = icount + 1
                read (strpar(k), *) svstor(icount)
              end do

            else

              if ( icount<nsvar ) then

                write (IOW, 99011) nsvar, icount
                stop
              end if

              exit

            end if
          end do

        else
          exit
        end if
      end do

      !     --------- Read boundary conditions ----------

    else if ( strcmp(strpar(1), 'BOUN', 4) ) then


      do while ( .true. )

        read (IOR, 99001, ERR = 200, end = 200) strin
        call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
        if ( iblnk==1 ) cycle
        exit
      end do

      do while ( .true. )

        continue

        if (strcmp(strpar(1), 'HIST', 4) ) then

!             Read data defining boundary condition history

              if (nstr.lt.2) then
                write(IOW,*) ' Error detected in input file '
                write(IOW,*) ' A name was not supplied for a history '
                write(IOW,'(A100)') strin
                stop
              endif
              nhist = nhist + 1
              read (strpar(2), '(A100)') histnam(nhist)
              ipnhist(1, nhist) = lenstr(2)
              ipnhist(2, nhist) = nhist
              if (nhist == 1) then
                histpoin(1,1) = 1
              else
                histpoin(1,nhist) = histpoin(1,nhist-1) + histpoin(2,nhist-1)
              endif
              i = MAXHVL - histpoin(1,nhist)
              if (i<1) then
                 write(IOW,*) ' Insufficient storage for load history data '
                 write(IOW,*) ' Increase the value of parameter MAXHVL '
                 stop
              endif
              call rdprm(histvals(histpoin(1,nhist)),i,histpoin(2,nhist),strin)
              call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)

        else if ( strcmp(strpar(1), 'NODESET',7) ) then


		   nbcnset = nbcnset + 1
           if (nbcnset > MAXNST) then
		     write(IOW,1001) MAXNST
1001         format(// ' *** Error in file RDMESH *** '/ &
                       ' Insufficient storage for node set ' &
                       ' Parameter MAXNST must be increased ' &
                       ' Its current value is ',I10)
			 stop
		   endif

           if (nstr.lt.2) then
             write(IOW,*) ' Error detected in input file '
             write(IOW,*) ' A name was not supplied for a node set '
             write(IOW,'(A100)') strin
             stop
           endif
           read (strpar(2), '(A100)') bcnsetnam(nbcnset)
           ipnbcnset(1, nbcnset) = lenstr(2)
           ipnbcnset(2, nbcnset) = nbcnset

 		   nsetbcpoin(1,nbcnset) = itopnset + 1
           do while ( .true. )

             read (IOR, 99001, ERR = 200, end = 200) strin
             call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
             if ( iblnk==1 ) cycle

             if (ityp(1) /=0) exit

             do i = 1,nstr
			   if (ityp(i) /= 0) then
			     write(IOW,1002) strin
1002             FORMAT(//'**** Error detected in input file **** '/ &
                          ' Expecting integer node number following NODE SET key '/ &
                          ' Found '/A80)
				 stop
			   endif
               itopnset = itopnset + 1
			   if (itopnset > MAXNSL) then
			     write(IOW,1003) MAXNSL
1003             format(// ' *** Error in file RDMESH *** '/ &
                         ' Insufficient storage for node set ' &
                         ' Parameter MAXNSL must be increased ' &
                         ' Its current value is ',I10)
			     stop
		       endif
			   read(strpar(i),*) nsetlst(itopnset)
               if (nsetlst(itopnset)>nops.or.nsetlst(itopnset)<1) then
			      write(IOW,*)
				  write(IOW,*) ' *** Error in input file *** '
				  write(IOW,*) ' Node set ',bcnsetnam(nbcnset)
				  write(IOW,*) ' contains node ',nsetlst(itopnset)
				  write(IOW,*) ' Max no. nodes in mesh is ',nops
			      stop
			   endif
			   nsetbcpoin(2,nbcnset) = nsetbcpoin(2,nbcnset) + 1
			 end do
           end do

        else if ( strcmp(strpar(1), 'ELEMENTSET',10) ) then

		   nbclset = nbclset + 1
           if (nbclset > MAXLST) then
		     write(IOW,1004) MAXLST
1004         format(// ' *** Error in file RDMESH *** '/ &
                       ' Insufficient storage for node set ' &
                       ' Parameter MAXLST must be increased ' &
                       ' Its current value is ',I10)
			 stop
		   endif

           if (nstr.lt.2) then
             write(IOW,*) ' Error detected in input file '
             write(IOW,*) ' A name was not supplied for an element set '
             write(IOW,'(A100)') strin
             stop
           endif
           read (strpar(2), 99001) bclsetnam(nbclset)
           ipnbclset(1, nbclset) = lenstr(2)
           ipnbclset(2, nbclset) = nbclset

 		   lsetbcpoin(1,nbclset) = itoplset + 1
           do while ( .true. )

             read (IOR, 99001, ERR = 200, end = 200) strin
             call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
             if ( iblnk==1 ) cycle

             if (ityp(1) /=0) exit

             do i = 1,nstr
			   if (ityp(i) /= 0) then
			     write(IOW,1005) strin
1005             FORMAT(//'**** Error detected in input file **** '/ &
                          ' Expecting integer element number following ELEMENT SET key '/ &
                          ' Found '/A80)
				 stop
			   endif
               itoplset = itoplset + 1
			   if (itopnset > MAXLSL) then
			     write(IOW,1006) MAXLSL
1006             format(// ' *** Error in file RDMESH *** '/ &
                         ' Insufficient storage for node set ' &
                         ' Parameter MAXLSL must be increased ' &
                         ' Its current value is ',I10)
			     stop
		       endif
			   read(strpar(i),*) lsetlst(itoplset)
			   lsetbcpoin(2,nbclset) = lsetbcpoin(2,nbclset) + 1
			 end do
           end do
 
 
        else if ( strcmp(strpar(1), 'DEGR', 4) ) then

!         Syntax is node set name, DOF, value or history name

          do while ( .true. )

            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle

            if (strcmp(strpar(1), 'ENDDEG', 6 ) ) then
			   do while ( .true. )

                 read (IOR, 99001, ERR = 200, end = 200) strin
                 call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
                 if ( iblnk==1 ) cycle
                 exit
               end do
			
			  exit
            endif

            if ( nstr<3 .or. ityp(2)/=0 ) then
              write (IOW, 1007) strin
1007          format(// ' *** Error detected in input file *** '/ &
                        ' Expecting node set name, DOF, history name / value (SUBROUTINE)' &
                        ' following DEGREES OF FREEDOM keyword. Found '/A80)
              stop
            end if
         
            call getnam(strpar(1), lenstr(1), nbcnset, bcnsetnam, ipnbcnset, nbcnset, i)
            
			ndofdef = ndofdef + 1
			if (ndofdef>MAXDDF) then
			   write(IOW,*) ' *** Error in subroutine RDMESH *** '
			   write(IOW,*) ' Insufficient storage for DOF arrays '
			   write(IOW,*) ' Parameter MAXDDF must be increased '
			   write(IOW,*) ' Its current value is ',MAXDDF
			   stop
			endif
			dofdefpoin(1,ndofdef) = i
			read(strpar(2),*) dofdefpoin(2,ndofdef)

			if (ityp(3) == 1) then
			   itopdvals = itopdvals + 1
			   dofdefpoin(3,ndofdef) = itopdvals
			   read(strpar(3),*) dofdefvals(itopdvals) 
            else

              call getnam(strpar(3), lenstr(3), nhist, histnam, ipnhist, nhist, i)
              dofdefpoin(3,ndofdef) = -i
            endif
!           Flag user subroutine to be used to compute degrees of freedom            
            if (nstr==4) then
               if (strcmp(strpar(4),'SUBROUTINE',10)) then
                 dofdefpoin(1,ndofdef) = -dofdefpoin(1,ndofdef)
                 if (ityp(3)==1) then
                    write(IOW,*) ' Error detected in input file '
                    write(IOW,*) ' Expecting load history name with user-subroutine controlled forces'
                    write(IOW,*) ' Found a value instead'
                    stop
                 endif
               endif
            endif

          end do

        else if ( strcmp(strpar(1), 'FORC', 4) ) then


!         Syntax is node set name, DOF, value or history name

          do while ( .true. )

            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle

 
            if (strcmp(strpar(1), 'ENDFOR', 6 ) ) then
			   do while ( .true. )

                 read (IOR, 99001, ERR = 200, end = 200) strin
                 call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
                 if ( iblnk==1 ) cycle
                 exit
               end do
			
			  exit
            endif

            if ( nstr<3 .or. ityp(2)/=0 ) then
              write (IOW, 1008) strin
1008          format(// ' *** Error detected in input file *** ' &
                        ' Expecting node set name, DOF, history name / value ' &
                        ' following FORCES keyword. Found '/A80)
              stop
            end if
         
            call getnam(strpar(1), lenstr(1), nbcnset, bcnsetnam, ipnbcnset, nbcnset, i)
            
			ndofdef = ndofdef + 1
			if (ndofdef>MAXDDF) then
			   write(IOW,*) ' *** Error in subroutine RDMESH *** '
			   write(IOW,*) ' Insufficient storage for DOF arrays '
			   write(IOW,*) ' Parameter MAXDDF must be increased '
			   write(IOW,*) ' Its current value is ',MAXDDF
			   stop
			endif
			dofdefpoin(1,ndofdef) = i
			read(strpar(2),*) dofdefpoin(2,ndofdef)
            dofdefpoin(2,ndofdef) = -dofdefpoin(2,ndofdef)

			if (ityp(3) == 1) then
			   itopdvals = itopdvals + 1
			   dofdefpoin(3,ndofdef) = itopdvals
			   read(strpar(3),*) dofdefvals(itopdvals) 
            else

            call getnam(strpar(3), lenstr(3), nhist, histnam, ipnhist, nhist, i)
            dofdefpoin(3,ndofdef) = -i

            endif

!           Flag user subroutine to be used to compute degrees of freedom            
            if (nstr==4) then
               if (strcmp(strpar(4),'SUBROUTINE',10)) then
                 dofdefpoin(1,ndofdef) = -dofdefpoin(1,ndofdef)
                 if (ityp(3)==1) then
                    write(IOW,*) ' Error detected in input file '
                    write(IOW,*) ' Expecting load history name with user-subroutine controlled forces'
                    write(IOW,*) ' Found a value instead'
                    stop
                 endif
               endif
            endif


          end do
 
        else if ( strcmp(strpar(1), 'DIST', 4) ) then


!           element set, face #, VALUE, tx,ty,(tz)        (applies constant pressure to element face in direction DOF)
!           element set, face #, history name, nx,ny,(nz) (applies constant pressure to element face in direction (nx,ny,nz))
!           element set, face #, NORMAL, history name     (applies time dependent pressure normal to element face)
!           element set, face #, SUBROUTINE, list of parameters


          do while ( .true. )

            read (IOR, 99001, ERR = 200, end = 200) strin
            call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
            if ( iblnk==1 ) cycle

 
            if (strcmp(strpar(1), 'ENDDIS', 6 ) ) then
			   do while ( .true. )

                 read (IOR, 99001, ERR = 200, end = 200) strin
                 call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
                 if ( iblnk==1 ) cycle
                 exit
               end do
			
			  exit
            endif

            call getnam(strpar(1), lenstr(1), nbclset, bclsetnam, ipnbclset, nbclset, i)          
			ndldef = ndldef + 1
			dldefpoin(1,ndldef) = i

			if (ityp(2) /=0) then
                write (IOW, 1109) strin
1109            format(// ' *** Error detected in input file *** ' &
                          ' face number ' &
                          ' defining distributed loads.  Found '/A80)
                stop
			endif

			read(strpar(2),*) dldefpoin(2,ndldef)

			if (strcmp(strpar(3),'VALUE',5)) then

              if ( nstr<4 ) then
                write (IOW, 1009) strin
1009            format(// ' *** Error detected in input file *** ' &
                          ' Expecting tractions tx, (ty,tz) ' &
                          ' defining distributed loads.  Found '/A80)
                stop
              endif
			  dldefpoin(3,ndldef) = itopdlvals+1
              do i = 4,nstr
			    if ( ityp(i) ==2 ) then
                  write (IOW, 1009) strin
                  stop
                endif
				itopdlvals = itopdlvals + 1
				read(strpar(i),*) dldefvals(itopdlvals)
				dldefpoin(4,ndldef) = i-3
			  end do
              dldefpoin(5,ndldef) = 1

			else if (strcmp(strpar(3),'NORMAL',6)) then

              if ( nstr<4 ) then
                write (IOW, 1209) strin
1209            format(// ' *** Error detected in input file *** ' &
                          ' Expecting history name ' &
                          ' defining distributed loads.  Found '/A80)
                stop
              endif

              call getnam(strpar(4), lenstr(4), nhist, histnam, ipnhist, nhist, i)
              dldefpoin(3,ndldef) = i
			  dldefpoin(4,ndldef) = 0
              dldefpoin(5,ndldef) = 3

			else if (strcmp(strpar(3),'SUBROU',6)) then

              do i = 4,nstr
			    if ( ityp(i) ==2 ) then
                  write (IOW, 1309) strin
1309            format(// ' *** Error detected in input file *** ' &
                          ' Expecting list of numerical values ' &
                          ' defining distributed loads.  Found '/A80)
                  stop
                endif
				itopdlvals = itopdlvals + 1
				dldefpoin(3,ndldef) = itopdlvals
				read(strpar(i),*) dldefvals(itopdlvals)
				dldefpoin(4,ndldef) = i-3
			  end do
              dldefpoin(5,ndldef) = 4

            else

              call getnam(strpar(3), lenstr(3), nhist, histnam, ipnhist, nhist, i)
			  itopdlvals = itopdlvals + 1
			  dldefpoin(3,ndldef) = itopdlvals
		      dldefvals(itopdlvals) = i
              dldefpoin(5,ndldef) = 2
              
			  if ( nstr<5 ) then
                write (IOW, 1409) strin
1409            format(// ' *** Error detected in input file *** ' &
                          ' Expecting traction direction nx,ny,(nz) ' &
                          ' defining distributed loads.  Found '/A80)
                stop
              endif
              do i = 4,nstr
			    if ( ityp(i) ==2 ) then
                  write (IOW, 1409) strin
                  stop
                endif
			    itopdlvals = itopdlvals + 1
				read(strpar(i),*) dldefvals(itopdlvals)
				dldefpoin(4,ndldef) = i-2
			  end do

            end if
         

          end do
        else
		  exit
	    endif
      end do

    else if ( strcmp(strpar(1), 'CONS', 4) ) then
!
!      Apply constraints to pairs of nodes in two nodesets
!
!      Syntax is
!              CONSTRAINTS, node set 1,DOF1, node set 2,DOF2, no. parameters, optional flag
!                    List of parameters for constraint
!

      mpctyp = mpctyp + 1
        
      call getnam(strpar(2), lenstr(2), nbcnset, bcnsetnam, ipnbcnset, nbcnset, nset1)
      call getnam(strpar(4), lenstr(4), nbcnset, bcnsetnam, ipnbcnset, nbcnset, nset2)
      
      if (ityp(3) /= 0.or.ityp(5)/=0) then
	    write(IOW,*) ' Error in input file '
	    write(IOW,*) ' Syntax for specifying constraints is '
	    write(IOW,*) ' CONSTRAINT, nodeset1, DOF1, nodeset2, DOF2, no. params '
	    write(IOW,*) ' Found '
	    write(IOW,*) strin
	    stop
	  endif
	  if (nsetbcpoin(2,nset1) /= nsetbcpoin(2,nset2)) then
	     write(IOW,*) ' Error in input file '
		 write(IOW,*) ' Node set pairs in a constraint must have the number of nodes '
	     stop
	  endif
      nprops = 0
      if (nstr>5) then
	    if (ityp(6)==0) then
		   read(strpar(6),*) nprops
        endif
	  endif

	  do i = 1,nsetbcpoin(2,nset1)
        nmpc = nmpc + 1
        lstmpc(1, nmpc) = mpctyp
        if (nstr==7.and.ityp(7)==0) then
		  read (strpar(7), *) lstmpc(1, nmpc)
		  mpctyp = lstmpc(1,nmpc)
		endif
        lstmpc(2, nmpc) = nsetlst(nsetbcpoin(1,nset1)+i-1)

        read (strpar(3), *) lstmpc(3, nmpc)
        lstmpc(4, nmpc) = nsetlst(nsetbcpoin(1,nset2)+i-1)
        read (strpar(5), *) lstmpc(5, nmpc)
!
!       These are pointers to the parameter array - 
!       need to code if parameters are used.
		lstmpc(6,nmpc) = itoppmp+1
		lstmpc(7,nmpc) = nprops
      end do
!
	  if (nprops>0) then
        call rdprm(parmpc,MAXPMP-itoppmp,i,strin)
        call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
        if (i/=nprops) then
		   write(IOW,*) ' Error detected in input file '
		   write(IOW,*) ' Expecting ',nprops,' properties for a constraint '
		   write(IOW,*) ' Found',i
		   stop
		 endif
	  else

        do while ( .true. )
          read (IOR, 99001, ERR = 200, end = 200) strin
          call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
          if ( iblnk==1 ) cycle
          exit
        end do
      
	  endif

	  itoppmp = itoppmp + nprops
	  cycle
    else
	  exit
    end if


    end do



200  return





99001 format (A100)
99002 format ( // '  *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' No. coords and no. dof must be supplied with node keyword' )
99003 format ( // '  *** ERROR DETECTED IN INPUT FILE ***'/  &
           '  Too many nodal degrees of freedom were supplied ')
99004 format ( // '  *** ERROR DETECTED IN INPUT FILE ***'/  &
           '   Expecting ', I4, ' degrees of freedom.  Found only ', I4)
99005 format ( // '  *** ERROR DETECTED IN INPUT FILE ***'/' Expecting ', I4, &
           ' coords of a node.  Found only ', I4)
99006 format ( // '  *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' No. nodes per element, no. properties and no. state vars', &
           ' must be supplied with element keyword')
99007 format ( // '  *** Error detected in input file ***'/  &
           '  Too many element properties were supplied ')
99008 format ( // '  *** Error detected in input file ***'/  &
           '       Expecting ', I4, ' properties.  Found only ', I4)
99009 format ( // '  *** Error detected in input file ***'/  &
           '       Expecting ', I4, ' nodes.  Found only ', I4)
99010 format ( // '  *** Error detected in input file ***'/  &
           '  Too many element state variables were supplied ')
99011 format ( // '  *** Error detected in input file ***'/  &
           '   Expecting ', I4, ' state variables.  Found only ', I4)
99012 format ( // '  *** Error detected in input file ***'/  &
           '   Expecting node number, dof number, optional value', &
           '  Found: '/A80)
99013 format ( // '  *** Error detected in input file ***'/  &
           '   Expecting node number, dof number, optional value', &
           '  Found: '/A80)
99014 format ( // '  *** Error detected in input file ***'/  &
           '   Expecting element number, control flag', '  Found: '/A80)
99015 format ( // '  *** Error detected in input file ***'/  &
           '   Expecting node #, dof #, node #, dof #, optional flag' , &
           '  Found: '/A80)

end subroutine rdmesh



!================================SUBROUTINE TECPRN ============================
subroutine tecprn(iun, nzone, nops, nelm, izplmn, nodpn, iep, x, MAXCOR,  &
     icon, MAXCON, utot, du, MAXDOF, stlump, MAXLMP, lumpn, strin)
  use Types
  use ParamIO
  use Globals, only : TIME, DTIME
  implicit none

  integer, intent( in )                   :: MAXCOR           
  integer, intent( in )                   :: MAXCON           
  integer, intent( in )                   :: MAXDOF           
  integer, intent( in )                   :: MAXLMP           
  integer, intent( inout )                :: iun              
  integer, intent( in )                   :: nzone
  integer, intent( in )                   :: nops                   
  integer, intent( in )                   :: nelm             
  integer, intent( in )                   :: izplmn(2,nzone)
  integer, intent( in )                   :: nodpn(7, nops)   
  integer, intent( in )                   :: iep(7, nelm)     
  integer, intent( inout )                :: icon(MAXCON)     
  integer, intent( in )                   :: lumpn(2,nops,nzone)      
  real( prec ), intent( inout )           :: x(MAXCOR)        
  real( prec ), intent( inout )           :: utot(MAXDOF)     
  real( prec ), intent( inout )           :: du(MAXDOF)       
  real( prec ), intent( inout )           :: stlump(MAXLMP)    
  character ( len = 100 ), intent( inout ) :: strin               

  ! Local Variables
  real( prec ) :: scald
  integer      :: iacd, iact, iblnk, ityp, j, jp, js, ju, jx, k, l, lenstr, lmn
  integer      :: n, ndof, nelpr3,nelpr4, nelpr6,nelpr8,nelpr9,nelprn
  integer      :: nodprn,nodpr2d,nodpr3d, nst, nstr,node
  character ( len = 100 ) :: strpar(100)
  character ( len = 60 ) :: uout, sout
!  logical :: strcmp

  integer, allocatable :: nodenum(:,:)


  dimension uout(10), sout(12)
  dimension ityp(100), lenstr(100)

  uout(1) = 'U1'
  uout(2) = 'U1,U2'
  uout(3) = 'U1,U2,U3'
  uout(4) = 'U1,U2,U3,U4'
  uout(5) = 'U1,U2,U3,U4,U5'
  uout(6) = 'U1,U2,U3,U4,U5,U6'
  uout(7) = 'U1,U2,U3,U4,U5,U6,U7'
  uout(8) = 'U1,U2,U3,U4,U5,U6,U7,U8'
  uout(9) = 'U1,U2,U3,U4,U5,U6,U7,U8,U9'
  uout(10) = 'U1,U2,U3,U4,U5,U6,U7,U8,U9,U10'

  sout(1) = 'S1'
  sout(2) = 'S1,S2'
  sout(3) = 'S1,S2,S3'
  sout(4) = 'S1,S2,S3,S4'
  sout(5) = 'S1,S2,S3,S4,S5'
  sout(6) = 'S1,S2,S3,S4,S5,S6'
  sout(7) = 'S1,S2,S3,S4,S5,S6,S7'
  sout(8) = 'S1,S2,S3,S4,S5,S6,S7,S8'
  sout(9) = 'S1,S2,S3,S4,S5,S6,S7,S8,S9'
  sout(10) = 'S1,S2,S3,S4,S5,S6,S7,S8,S9,S10'
  sout(11) = 'S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11'
  sout(12) = 'S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,S12'

  ! Print solution to a file that may be read by TECPLOT
  ! Count the number of printable nodes and elements

  nodprn = 0
  nodpr2d = 0
  nodpr3d = 0
  nelpr3 = 0
  nelpr4 = 0
  nelpr6 = 0
  nelpr8 = 0
  nelpr9 = 0
  do n = 1, nops
    if ( nodpn(3, n)==2 ) nodpr2d = nodpr2d + 1
	if ( nodpn(3, n)==3 ) nodpr3d = nodpr3d + 1
  end do
  if (nodpr3d==0) nodprn = nodpr2d
  if (nodpr2d==0) nodprn = nodpr3d
  if (nodpr3d>0.and.nodpr2d>0) then
     write(IOW,*) ' WARNING: subroutine TECPRN found both 2D and 3D nodes '
	 write(IOW,*) ' Only 3d nodes will be printed '
     nodprn = nodpr3d
	 nodpr2d = 0
  endif
  do l = 1, nelm
    if ( iep(1, l)<100 ) then
      if ( iep(3, l)==3 ) nelpr3 = nelpr3 + 1
      if ( iep(3, l)==4 ) nelpr4 = nelpr4 + 1
      if ( iep(3, l)==6 ) nelpr6 = nelpr6 + 1
      if ( iep(3, l)==9 ) nelpr9 = nelpr9 + 1
    end if
	if (iep(1,l)>1000.and.iep(1,l)<2000) then
	  if (iep(3,l) == 8) nelpr8 = nelpr8 + 1
	endif
  end do
  nelprn = 4*nelpr6 + nelpr3 + nelpr4 + nelpr8 + 4*nelpr9
  if ( nodprn/=nops ) write (IOW, 99001)
  if ( (nelprn/=4*nelm) .and. (nelprn/=nelm) ) write (IOW, 99002)

  do while ( .true. )

    !     Read print option

    read (IOR, 99003, ERR = 100, end = 100) strin
    !     Parse it
    call parse(strin, strpar, 100, nstr, lenstr, ityp, iblnk)
    if ( iblnk==1 ) cycle

    !----------------------------Plot the mesh only -------------------------

    if ( strcmp(strpar(1), 'MESH', 4) ) then

      if ( strcmp(strpar(2), 'ALLN', 4) ) then
        if (nodpr3d==0) then
		  write (iun, *) 'VARIABLES = X,Y,NODNUM'
          write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn
        else
		  write (iun,*)  'VARIABLES = X,Y,Z,NODNUM'
          write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=BRICK'
		endif

        do k = 1, nops
          if ( nodpr3d==0.and.nodpn(3, k)==2 ) then
            jx = nodpn(2, k)
            write (iun, *) x(jx), x(jx + 1), k
          else if (nodpr2d==0.and.nodpn(3,k)==3) then
            jx = nodpn(2, k)
            write (iun, '(3(1x,d16.6),i5)') x(jx), x(jx + 1), x(jx+2), k		    
		  end if
        end do

        do lmn = 1, nelm
          jp = iep(2, lmn)
          if ( iep(1, lmn)<100 ) then
             if ( iep(3, lmn)==9 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 4), icon(jp + 3)
              write (iun, *) icon(jp + 1), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 4)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 7), icon(jp + 6)
              write (iun, *) icon(jp + 4), icon(jp + 5),  &
                   icon(jp + 8), icon(jp + 7)
            else if ( iep(3, lmn)==6 ) then
              write (iun, *) icon(jp), icon(jp + 3), icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 1),  &
                   icon(jp + 4), icon(jp + 4)
              write (iun, *) icon(jp + 4), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 5), icon(jp + 5)
            else if ( iep(3, lmn)==4 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 3)
            else if ( iep(3, lmn)==3 ) then             
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 2)
            endif
           else if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
			if ( iep(3, lmn)==8 ) then
			  write (iun, '(8(1x,i5))') (icon(jp+k-1), k=1,8)
            end if
          end if

        end do

      else

        !     Print corner nodes only 

        if (nodpr3d == 0) then
          write (iun, *) 'VARIABLES = X,Y,NODNUM'
          write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelpr3 + nelpr6
        else
		  write (iun,*)  'VARIABLES = X,Y,Z,NODNUM'
          write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=BRICK'
		endif         
		  
		do k = 1, nops
            if ( nodpr3d==0.and.nodpn(3, k)==2 ) then
              jx = nodpn(2, k)
              write (iun, *) x(jx), x(jx + 1), k
			else if (nodpr2d==0.and.nodpn(3,k)==3) then
			  jx = nodpn(2,k)
			  write(iun,'(3(1x,d16.6),i5)') x(jx),x(jx+1),x(jx+2),k
            end if
        end do
        do lmn = 1, nelm
          jp = iep(2, lmn)
          if ( iep(1, lmn)<100 ) then
            if (iep(3,lmn) == 6.or.iep(3,lmn)==6) then 
               write(iun, *) icon(jp),  &
                 icon(jp + 1), icon(jp + 2), icon(jp + 2)
            else if (iep(3,lmn) ==4) then
               write(iun,*) icon(jp),icon(jp+1),icon(jp+2),icon(jp+3)
            else if (iep(3,lmn) == 9) then
               write(iun,*) icon(jp),icon(jp+2),icon(jp+8),icon(jp+6)
            endif
		  else if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
			       write(iun,'(8i5)') (icon(jp+k),k=0,7)
		  endif
        end do
      end if

      cycle

      !     ------------------------ Plot a displaced mesh -----------------------

    else if ( strcmp(strpar(1), 'DISP', 4) ) then

      !     Count the no. printable nodes

      nodprn = 0
      do n = 1, nops
        if ( nodpn(3, n)==2 .and. nodpn(5, n)>=2 ) nodprn = nodprn + 1
      end do
      if ( nodprn/=nops ) write (IOW, 99001)

      if ( strcmp(strpar(2), 'ACCU', 4) ) then
        iact = 1
        iacd = 0
      else if ( strcmp(strpar(2), 'INCR', 4) ) then
        iact = 0
        iacd = 1
      else
        write (IOW, 99004) strin
        stop
      end if

      !     Read the scale factor, if it was specified

      scald = 1.D0
      if ( nstr>2 .and. ityp(3)/=2 ) read (strpar(3), *) scald

      if (nodpr3d==0) then
		  write (iun, *) 'VARIABLES = X,Y,NODNUM'
          write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn
      else
		  write (iun,*)  'VARIABLES = X,Y,Z,NODNUM'
          write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=BRICK'
      endif
      do k = 1, nops
        jx = nodpn(2, k)
        ju = nodpn(4, k)
        if ( nodpr3d==0.and. nodpn(3, k)==2 .and. nodpn(5, k)>=2 ) write (iun, *)  &
             x(jx) + scald*(iact*utot(ju) + iacd*du(ju)), x(jx + 1)  &
             + scald*(iact*utot(ju + 1) + iacd*du(ju + 1)), k
        if ( nodpr2d==0.and. nodpn(3, k)==3 .and. nodpn(5, k)>=3 ) &
		     write (iun, '(3(1x,d16.6),i5)')  &
             (x(jx+i) + scald*(iact*utot(ju+i) + iacd*du(ju+i)), i=1,3), k  
      end do

      do lmn = 1, nelm
        jp = iep(2, lmn)
        if ( iep(1, lmn)<100 ) then
             if ( iep(3, lmn)==9 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 4), icon(jp + 3)
              write (iun, *) icon(jp + 1), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 4)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 7), icon(jp + 6)
              write (iun, *) icon(jp + 4), icon(jp + 5),  &
                   icon(jp + 8), icon(jp + 7)
            else if ( iep(3, lmn)==6 ) then
              write (iun, *) icon(jp), icon(jp + 3), icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 1),  &
                   icon(jp + 4), icon(jp + 4)
              write (iun, *) icon(jp + 4), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 5), icon(jp + 5)
            else if ( iep(3, lmn)==4 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 3)
            else if ( iep(3, lmn)==3 ) then             
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 2)
            endif
		else if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
		  if ( iep(3, lmn)==8 ) then
		    write (iun, '(8(1x,i5))') (icon(jp+k-1), k=1,8)
          end if
        end if
      end do

      cycle

      !     ---------------- Plot the mesh with nodal DOFs -----------------------


    else if ( strcmp(strpar(1), 'DEGR', 4) ) then

      if ( strcmp(strpar(2), 'ACCU', 4) ) then
        iact = 1
        iacd = 0
      else if ( strcmp(strpar(2), 'INCR', 4) ) then
        iact = 0
        iacd = 1
      else
        write (IOW, 99005) strin
        stop
      end if

      !     Check the no. DOFs associated with the first node.

      ndof = nodpn(5, 1)
      if (nodpr3d==0) then
	    write (iun, *) 'VARIABLES = X,Y,', uout(ndof)
         write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn      
	  else if (nodpr2d==0) then
	     write (iun, *) 'VARIABLES = X,Y,Z', uout(ndof)
         write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=BRICK'
      endif
	  do k = 1, nops
        jx = nodpn(2, k)
        ju = nodpn(4, k)
        if ( nodpr3d==0.and.nodpn(3, k)==2 ) write (iun, '(12(1X,E14.6))') x(jx),  &
             x(jx + 1), (iact*utot(ju + j) + iacd*du(ju + j), j = 0, ndof - 1)
        if ( nodpr2d==0.and.nodpn(3, k)==4 ) write (iun, '(12(1X,E14.6))') x(jx),  &
             x(jx+1),x(jx+2), (iact*utot(ju + j) + iacd*du(ju + j), j = 0, ndof - 1)
      end do

      do lmn = 1, nelm
        jp = iep(2, lmn)
        if ( iep(1, lmn)<100 ) then
            if ( iep(3, lmn)==9 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 4), icon(jp + 3)
              write (iun, *) icon(jp + 1), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 4)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 7), icon(jp + 6)
              write (iun, *) icon(jp + 4), icon(jp + 5),  &
                   icon(jp + 8), icon(jp + 7)
            else if ( iep(3, lmn)==6 ) then
              write (iun, *) icon(jp), icon(jp + 3), icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 1),  &
                   icon(jp + 4), icon(jp + 4)
              write (iun, *) icon(jp + 4), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 5), icon(jp + 5)
            else if ( iep(3, lmn)==4 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 3)
            else if ( iep(3, lmn)==3 ) then             
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 2)
            endif
		else if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
		 if ( iep(3, lmn)==8 ) then
		    write (iun, '(8(1x,i5))') (icon(jp+k-1), k=1,8)
          end if
        end if
      end do

      cycle

      !     ---------------- Plot the mesh with nodal state variables -----------------------


    else if ( strcmp(strpar(1), 'STATE', 5) ) then


      !     Check the no. state vars associated with the first node.

      nst = lumpn(1,1,1)

      allocate(nodenum(nops,nzone))

      nodenum = 0
      nodprn = 0
      nelpr3 = 0
      nelpr6 = 0
	  nelpr8 = 0
! State print is done zone by zone, to allow discontinuities across zone
! boundaries
!
! Count the number of printable nodes and elements, and compute print order
! for nodes
      nodprn = 0
  	  do iz = 1,nzone                             ! Loop over zones

        do lmn = izplmn(1,iz),izplmn(2,iz)        ! Loop over elements in zone
          if (iep(1,lmn)<100) then
            if (iep(3,lmn) == 3) nelpr3 = nelpr3 + 1
            if (iep(3,lmn) == 6) nelpr6 = nelpr6 + 1
          endif
	      if (iep(1,lmn)>9000.and.iep(1,lmn)<9100) then
	        if (iep(3,lmn) == 8) nelpr8 = nelpr8 + 1
	      endif

          do n = 1,iep(3,lmn)
            node = icon(iep(2,lmn)+n-1)
            if (nodenum(node,iz) == 0) then
              nodprn = nodprn + 1
              nodenum(node,iz) = -nodprn
            endif
          end do
        end do
      end do

      nelprn = 4*nelpr6 + nelpr3 + nelpr8


      if (nodpr3d==0) then
	    write (iun, *) 'VARIABLES = X,Y,', sout(nst)
         write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn      
	  else if (nodpr2d==0) then
	     write (iun, *) 'VARIABLES = X,Y,Z', sout(nst)
         write (iun, *) ' ZONE, F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=BRICK'
      endif

! Print the nodes, accounting for displacements as necessary


      if ( nstr<2 ) then
        iact = 0
        iacd = 0
        scald = 0.D0
      else if ( strcmp(strpar(2), 'DISP', 4) ) then
        iact = 1
        iacd = 0
        if ( nstr>2 ) then
          if ( strcmp(strpar(3), 'INCR', 4) ) then
            iact = 0
            iacd = 1
          end if
        end if

        !     Read the scale factor, if it was specified

        scald = 1.D0
        if ( nstr==4 .and. ityp(4)/=2 ) read (strpar(4), *) scald
      else
        write (IOW, 99006)
        iact = 0
        iacd = 0
        scald = 0.D0
      end if



      do iz = 1,nzone                             ! Loop over zones
        do lmn = izplmn(1,iz),izplmn(2,iz)        ! Loop over elements in zone
          do n = 1,iep(3,lmn)                     ! loop over nodes on element
            node = icon(iep(2,lmn)+n-1)
            if (nodenum(node,iz) < 0) then        ! If not yet printed, print

              nodenum(node,iz) = -nodenum(node,iz)  ! prevents more prints

              jx = nodpn(2, node)
              ju = nodpn(4, node)
              js = lumpn(2,node,iz)
			  if (nodpr3d==0) then
                write (iun, '(16(1X,E18.10))') x(jx) &
               + scald*(iact*utot(ju) + iacd*du(ju)), x(jx + 1)  &
               + scald*(iact*utot(ju + 1) + iacd*du(ju + 1)),  &
                 (stlump(js + j), j = 0, nst - 1)
              else if (nodpr2d==0) then
               write (iun, '(16(1X,E18.10))') (x(jx+k) &
               + scald*(iact*utot(ju+k) + iacd*du(ju+k)), k=0,2),  &
                 (stlump(js + j), j = 0, nst - 1)
              endif
			endif
          end do
        end do
      end do

!   Print the elements

      do iz = 1,nzone
       do lmn = izplmn(1,iz),izplmn(2,iz)
         jp = iep(2, lmn)
          if (iep(1,lmn)<100) then
            if ( iep(3, lmn)==9 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 4), icon(jp + 3)
              write (iun, *) icon(jp + 1), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 4)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 7), icon(jp + 6)
              write (iun, *) icon(jp + 4), icon(jp + 5),  &
                   icon(jp + 8), icon(jp + 7)
            else if ( iep(3, lmn)==6 ) then
              write (iun, *) icon(jp), icon(jp + 3), icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 1),  &
                   icon(jp + 4), icon(jp + 4)
              write (iun, *) icon(jp + 4), icon(jp + 2),  &
                   icon(jp + 5), icon(jp + 5)
              write (iun, *) icon(jp + 3), icon(jp + 4),  &
                   icon(jp + 5), icon(jp + 5)
            else if ( iep(3, lmn)==4 ) then
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 3)
            else if ( iep(3, lmn)==3 ) then             
              write (iun, *) icon(jp), icon(jp + 1), icon(jp + 2), icon(jp + 2)
            endif
          else if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
		    if (iep(3,lmn)==8) then            
		      write(iun,'(8(1x,i5))') (nodenum(icon(jp+k),iz), k=0,7)
            endif
          end if
       end do
      end do

      deallocate(nodenum)

      cycle


    end if
    exit
  end do

100 return

99001 format ( // '          *** TECPLOT print Warning *** '/  &
           '  Some nodes in the mesh do not have two coords '/  &
           '  or have less than 2 DOF. '/ '  They will not be printed. ')
99002 format ( // '          *** TECPLOT print Warning *** '/  &
           '  Some elements in the mesh are not triangles or 8 noded bricks.'/  &
           '  They will not be printed. ')
99003 format (A100)
99004 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Unknown option was specifed with DISPLACED', &
           ' MESH print option '/A100)
99005 format ( // ' *** ERROR DETECTED IN INPUT FILE ***'/  &
           ' Unknown option was specifed with DEGREES OF', &
           ' FREEDOM print option '/A100)
99006 format ( // '  *** ERROR DETECTED IN INPUT FILE *** '/  &
           '   Unknown suboption with PRINT,TECPLOT,STATE '/  &
           '   Possible options are DISPLACED,INCREMENT '/  &
           '   or DISPLACED, ACCUMULATED '/  &
           '   State will be plotted on undeformed config ')

end subroutine tecprn



end program feacheap

