!     Subroutines to allow user to develop a special purpose solution step.
!
!     ====================== SUBROUTINE USRSTEP ===============================
  subroutine usrstep(&
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
                nelm, nops, nmpc, nfix, nfor, ndload,dlprops,MAXDPR,icon, iep,  &
                eprop, svart, svaru, lstmpc, parmpc, rmpc,  &
                drmpc, nodpn, x, utot, du, stnod, rfor,  &
                stlump, lumpn, nstat, lstfix, dofval, lstfor,  &
                forval, lstlod, numnod, diag, rhs, ieqs,  &
                jpoin, mpceq, nzone,izplmn, &
                MAXNOD,  &
                MAXCOR, MAXDOF, MAXSTN, MAXLMN, MAXCON, MAXPRP,  &
                MAXVAR, MAXMPC, MAXPMP, MAXFIX, MAXFOR, MAXDLD, &
                MAXEQ, MAXNND, MAXLMP,  MAXZON)
  Use Types
  use ParamIO
  use Globals, only : TIME, DTIME, BTEMP, BTINC
  implicit none
  
  integer, intent( in )                    :: nusprp
  integer, intent( in )                    :: ntprops
!
! Data structures to store load histories
! 
  integer, intent( in )                :: MAXHST
  integer, intent( in )                :: MAXHVL                      
  integer, intent( inout )             :: nhist
               
  integer, intent( inout )             :: histpoin(2,MAXHST)          
  real( prec ), intent(inout)          :: histvals(MAXHVL)
      
!
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
!                       <0 - compute DOF value by interpolating hist table -dofdefpoin(3,i)
!      dofdefvals       list of DOF values
!      MAXDLF           Max no. distributed load definitions
!      ndldef           no. distributed load definitions
!      dldefpoin(1,i)   Abs value specifies element set number.  If negative, tractions applied normal to element
!      dldefpoin(2,i)   face number for distributed load definition.
!                       Sign controls whether tractions are computed using user subroutine  
!      dldefpoin(3,i)   >0 Take traction parameters or values from dldefvals(dldefpoin(3,i))
!                       <0 - compute traction magnitude by interpolating hist table -dofdefpoin(3,i)
!      dldefpoin(4,i)   No. parameters 
!      dldefpoin(5,i)   Option 
!
!
  integer, intent(in)                 :: MAXNST
  integer, intent(in)                 :: MAXLST
  integer, intent(in)                 :: MAXNSL
  integer, intent(in)                 :: MAXLSL
  integer, intent(in)                 :: nbcnset
  integer, intent(in)                 :: nbclset
  integer, intent(in)                 :: nsetbcpoin(2,MAXNST)
  integer, intent(in)                 :: lsetbcpoin(2,MAXLST)
  integer, intent(in)                 :: nsetlst(MAXNSL)
  integer, intent(in)                 :: lsetlst(MAXNSL)
  integer, intent(in)                 :: MAXDDF
  integer, intent(in)                 :: ndofdef
  integer, intent(in)                 :: dofdefpoin(3,MAXDDF)
  integer, intent(in)                 :: MAXDVL
  real (prec), intent(in)             :: dofdefvals(MAXDVL)
  integer, intent(in)                 :: MAXDLF
  integer, intent(in)                 :: ndldef
  integer, intent(in)                 :: dldefpoin(5,MAXDLF)
  integer, intent(in)                 :: MAXDLV
  real (prec), intent(in)             :: dldefvals(MAXDLV)
!
   
  integer, intent( in )                    :: nlprops
  integer, intent( in )                    :: isolv
  integer, intent( in )                    :: solvertype
  integer, intent( in )                    :: maxitn
  integer, intent( in )                    :: iunm
  integer, intent( in )                    :: nupiun
  integer, intent( in )                    :: nprpar
  
  logical, intent( in )                    :: lumpedprojection

  real( prec ), intent( in )               :: usprop(nusprp)
  real( prec ), intent( in )               :: tprops(ntprops)
  real( prec ), intent( in )               :: lprops(nlprops)
  real( prec ), intent( in )               :: tolrnc
  real( prec ), intent( in )               :: umag
  real( prec ), intent( in )               :: fmag
  real( prec ), intent( in )               :: dlmag
  real( prec ), intent( in )               :: parprn(nprpar)
  logical, intent(inout) :: ifl
 
  integer, intent( in )                    :: nstat
  integer, intent( in )                    :: MAXNOD  
  integer, intent( in )                    :: MAXCOR  
  integer, intent( in )                    :: MAXDOF  
  integer, intent( in )                    :: MAXSTN  
  integer, intent( in )                    :: MAXLMN  
  integer, intent( in )                    :: MAXCON  
  integer, intent( in )                    :: MAXPRP  
  integer, intent( in )                    :: MAXVAR  
  integer, intent( in )                    :: MAXMPC
  integer, intent( in )                    :: MAXPMP   
  integer, intent( in )                    :: MAXFIX  
  integer, intent( in )                    :: MAXFOR  
  integer, intent( in )                    :: MAXDLD
  integer, intent( in )                    :: MAXDPR  
  integer, intent( in )                    :: MAXLMP
  integer, intent( in )                    :: MAXEQ
  integer, intent( in )                    :: MAXNND       
  integer, intent( in )                    :: MAXZON  

  integer, intent( inout )                 :: iunlst(nupiun)
  integer, intent( inout )                 :: nelm
  integer, intent( inout )                 :: nops
  integer, intent( inout )                 :: nmpc
  integer, intent( inout )                 :: nfix
  integer, intent( inout )                 :: nfor
  integer, intent( inout )                 :: ndload
  integer, intent( inout )                 :: icon(MAXCON)
  integer, intent( inout )                 :: iep(7, MAXLMN)
  integer, intent( inout )                 :: numnod(MAXNND)
  integer, intent( inout )                 :: lstmpc(7, MAXMPC)
  integer, intent( inout )                 :: nodpn(7, MAXNOD)
  integer, intent( inout )                 :: lumpn(2,nops,nzone)
  integer, intent( inout )                 :: lstfix(2, MAXFIX)
  integer, intent( inout )                 :: lstfor(2, MAXFOR)
  integer, intent( inout )                 :: lstlod(3, MAXDLD)
  integer, intent( inout )                 :: ieqs(MAXDOF)
  integer, intent( inout )                 :: jpoin(MAXEQ)
  integer, intent( inout )                 :: mpceq(MAXMPC)
  integer, intent( inout )                 :: nzone

  integer, intent( inout )                 :: izplmn(2, MAXZON)

  real( prec ), intent( inout )            :: dlprops(MAXDPR)
  real( prec ), intent( inout )            :: eprop(MAXPRP)
  real( prec ), intent( inout )            :: svart(MAXVAR)
  real( prec ), intent( inout )            :: svaru(MAXVAR)
  real( prec ), intent( inout )            :: parmpc(MAXPMP)
  real( prec ), intent( inout )            :: rmpc(MAXMPC)
  real( prec ), intent( inout )            :: drmpc(MAXMPC)
  real( prec ), intent( inout )            :: x(MAXCOR)
  real( prec ), intent( inout )            :: utot(MAXDOF)
  real( prec ), intent( inout )            :: du(MAXDOF)
  real( prec ), intent( inout )            :: stnod(MAXSTN)
  real( prec ), intent( inout )            :: rfor(MAXDOF)
  real( prec ), intent( inout )            :: stlump(MAXLMP)
  real( prec ), intent( inout )            :: dofval(MAXFIX)
  real( prec ), intent( inout )            :: forval(MAXFOR) 
  real( prec ), intent( inout )            :: diag(MAXDOF)
  real( prec ), intent( inout )            :: rhs(MAXDOF)  
  
  real ( prec ), allocatable ::  alow(:)        ! Lower half of global stiffness matrix
  real ( prec ), allocatable ::  aupp(:)        ! Upper half of global stiffness matrix
  real ( prec ), allocatable :: aproj(:)        ! Stiffness matrix used for state projection
  real ( prec ), allocatable :: dproj(:)        ! Diagonal for state projection
  real ( prec ), allocatable :: rhsproj(:)      ! RHS vector used for state projection
  integer, allocatable :: jpproj(:)             ! Pointer for state projection

  logical :: recalc(2),prin(4),iterate,cutback,continue_stepping,converged
  real ( prec ) dunorm,cnorm,rnorm
  integer :: status
  integer :: ifail,apsiz,lcol,nit
  real ( prec )  :: dtnew
  real ( prec )  :: dtopt
  integer :: n,j,ipoin
  
  
  integer :: MAXSUP, MAXSLO, neq, stiffail
  
!     Subroutine to perform a user-defined load step or procedure
!  
!   This code calculates stress distribution in a 3D linear elastic body subjected
!   to a cycle of load.   It uses the fact that the stiffness matrix remains constant
!   to do an LU decomposition of K, and then do only the back-substitution
!   to calculate the time variation in the solution after the first step.  
!
  !     Parameters to control user printing and user defined data files.
  !     IUNLST(I)        Ith unit number for output files to contain user data.  If IUNLST(I)<0 the file
  !                      is intended for reading.
  !     NUPIUN           No. user controlled files
  !     PARPRN(I)        Ith user supplied control parameter to govern printing
  !     NPRPAR           No. user supplied control parameters to govern printing.
!
!    All the standard keywords for defining a static step can be used to initialize
!    data structures for user-defined step.   In addition, user-supplied parameters
!    controlling the behavior of the user-step can be supplied, e.g. with
! USER STEP
!   PARAMETERS
!      .... provide list of parameters
!
! In addition, readable data files can be opened in the user-step using the keywords
!
!  DATA FILES
!    devstrain.dat
!  END DATA FILES
!
!  Readable files have negative unit numbers.   They appear in the
!  list iunlst(i) in the order they are defined.
!
!
!  First step needs to be done with a full factoring of stiffness matrix
!  renumber nodes to minimize bandwidth

    ifl = .true.  ! Equation system has to be unsymmetric - override...
    
    call renum(nops, nelm,MAXCON, icon,iep,nmpc,lstmpc, numnod)

!  Profile equations
    call profil(nops, nelm, nmpc, MAXDOF,  &
              MAXCON, MAXEQ,MAXNND, MAXSUP, MAXSLO, ifl,solvertype,icon, &
             iep,numnod, nodpn,lstmpc, ieqs, mpceq, jpoin, neq)

!  Allocate storage for stiffness matrix

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

!  Allocate memory for state projection matrices
    apsiz = (jpoin(neq) + 1)/3 + 1
    allocate(aproj(apsiz),dproj(nops),jpproj(nops),rhsproj(nops), stat=status)
    if (status/=0) then
      write(IOW,*) ' Unable to allocate memory for state projection matrix ' 
  	  stop
    endif

    nfix = 0
    nfor = 0
    ndload = 0
    rhs = 0.d0
  
    call setbcs_static(nhist,MAXHST,histvals,MAXHVL,histpoin,&
   	          nbcnset,MAXNST,nsetbcpoin,nsetlst,MAXNSL, &
	          nbclset,MAXLST,lsetbcpoin,lsetlst,MAXLSL, &
              MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals, &
              MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals, &
              nfix,MAXFIX,lstfix,dofval, &
	          nfor,MAXFOR,lstfor,forval, &
	          ndload,MAXDLD,lstlod,dlprops,MAXDPR, &
	          utot,du,rfor,nodpn,MAXDOF,MAXNOD)


    call asstif(nelm, nops, nmpc, ifl,  &
                   MAXCOR, MAXDOF, MAXSTN, MAXCON, MAXVAR,  &
                   MAXPRP, MAXSLO, MAXSUP, MAXEQ, iep,icon,  &
                   nodpn, x, utot, du, stnod, rfor, eprop, svart,  &
                   svaru, lstmpc, parmpc, MAXPMP,rmpc, drmpc, rhs,  &
                   alow, aupp, diag, ieqs, mpceq, jpoin, neq,stiffail)


!      Apply the boundary conditions
    call bcons(ifl, nops, nelm, MAXCOR, MAXDOF,  &
                   MAXCON, MAXSLO, MAXSUP, MAXEQ, icon, &
                   iep,nodpn, x, utot, du, eprop, MAXPRP, nfix,  &
                   lstfix, dofval, umag, nfor, lstfor,  &
                   forval, fmag, ndload, lstlod,dlprops,MAXDPR, dlmag, rhs, alow, &
                   aupp, diag, ieqs, jpoin, neq)

    call instif(dunorm, cnorm, rnorm, &
                 nops, nmpc, ifl,  &
                 MAXDOF, MAXSLO, MAXSUP, MAXEQ, nodpn, &
                 du,drmpc, rhs, alow, aupp, diag, ieqs, &
                 mpceq, jpoin, neq)
                 
  
     call prosta(lumpedprojection,nstat, nops, nelm,izplmn, nzone, &
                MAXCOR, MAXDOF, MAXCON, MAXVAR, MAXPRP, &
				iep, icon,nodpn, x, utot, du, eprop, svart,  &
                svaru, stlump, MAXLMP, lumpn, numnod, rhsproj, aproj, apsiz, & 
                dproj, jpproj)

!    Print state

     if (iunm>0) then
     call prnstt(iunm, nzone, nops, nelm,  &
               izplmn,nodpn, iep,  &
               x, MAXCOR, icon, MAXCON,  &
               utot, du, MAXDOF,  &
               stlump, MAXLMP, lumpn)
     endif

!    Update the solution

     TIME = TIME + DTIME

     continue_stepping = .true.
     converged = .true.
     nit = 1
     
     dtopt = DTIME
     call staticstep(tprops,ntprops,converged,nit,dunorm,cnorm,rnorm,&
                      dtnew,dtopt,cutback,continue_stepping,prin)

     DTIME = dtnew


!+++++++++++++++++++++++++++++ START OF TIME LOOP +++++++++++++++++++++


  
     do while (continue_stepping)

        nfix = 0
        nfor = 0
        ndload = 0
        
       du = 0.d0
       rhs = 0.d0
       
        call setbcs_static(nhist,MAXHST,histvals,MAXHVL,histpoin,&
   	          nbcnset,MAXNST,nsetbcpoin,nsetlst,MAXNSL, &
	          nbclset,MAXLST,lsetbcpoin,lsetlst,MAXLSL, &
              MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals, &
              MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals, &
              nfix,MAXFIX,lstfix,dofval, &
	          nfor,MAXFOR,lstfor,forval, &
	          ndload,MAXDLD,lstlod,dlprops,MAXDPR, &
	          utot,du,rfor,nodpn,MAXDOF,MAXNOD)


 
       call modify_bcons(ifl, nops, nelm, MAXCOR, MAXDOF, MAXCON, MAXSLO,  &
               MAXSUP, MAXEQ, icon, iep, nodpn, x, utot, du,  &
               eprop, MAXPRP, nfix, lstfix, dofval, umag, nfor,  &
               lstfor, forval, fmag, ndload, lstlod, dlprops,MAXDPR,dlmag, rhs,  &
               alow, aupp, diag, ieqs, jpoin, neq)

       call solv(alow, aupp, diag, rhs, jpoin, neq)
         
       do n = 1, nops
         do j = 1, nodpn(5, n)
            ipoin = j + nodpn(4, n) - 1
            du(ipoin) = du(ipoin) + rhs(ieqs(ipoin))
         end do
       end do
 
       if (prin(1).and.iunm > 0) then  !  Print element state
 
          if (nstat>0) then
          call prosta(lumpedprojection,nstat, nops, nelm,izplmn, nzone, &
                MAXCOR, MAXDOF, MAXCON, MAXVAR, MAXPRP, &
				iep, icon,nodpn, x, utot, du, eprop, svart,  &
                svaru, stlump, MAXLMP, lumpn, numnod, rhsproj, aproj, apsiz, & 
                dproj, jpproj)
           endif
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
                svaru, stlump, MAXLMP, lumpn, numnod, rhs, aupp, MAXSUP, & 
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


       call staticstep(tprops,ntprops,converged,nit,dunorm,cnorm,rnorm,&
                      dtnew,dtopt,cutback,continue_stepping,prin)

           dtopt = DTIME
           DTIME = dtnew

   end do  
  
   return 


end subroutine usrstep

