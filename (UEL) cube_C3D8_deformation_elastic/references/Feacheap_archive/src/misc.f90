! misc.f90                                                    
! Miscellaneous bookkeeping routines
 
!=========================SUBROUTINE UPDATE =====================
subroutine update(nops, nelm, nodpn, iep, utot, du, MAXDOF, svart,  &
     svaru, MAXVAR, nmpc, lstmpc, rmpc, drmpc, MAXMPC)
  use Types
  implicit none

  integer, intent( inout )    :: nops                          
  integer, intent( inout )    :: nelm                          
  integer, intent( in )       :: MAXDOF                        
  integer, intent( in )       :: MAXVAR                        
  integer, intent( inout )    :: nmpc                          
  integer, intent( in )       :: MAXMPC                        
  integer, intent( inout )    :: nodpn(7, nops)                
  integer, intent( inout )    :: iep(7, nelm)                  
  integer, intent( inout )    :: lstmpc(7, MAXMPC)             
  real( prec ), intent( inout ) :: utot(MAXDOF)                  
  real( prec ), intent( in )  :: du(MAXDOF)                    
  real( prec ), intent( out ) :: svart(MAXVAR)                 
  real( prec ), intent( in )  :: svaru(MAXVAR)                 
  real( prec ), intent( inout ) :: rmpc(MAXMPC)                  
  real( prec ), intent( in )  :: drmpc(MAXMPC)                 

  ! Local Variables
  integer :: n

  utot(1:MAXDOF) = utot(1:MAXDOF) + du(1:MAXDOF)
  svart(1:MAXVAR) = svaru(1:MAXVAR)
  rmpc(1:MAXMPC) = rmpc(1:MAXMPC) + drmpc(1:MAXMPC)

end subroutine update


! ====================== SUBROUTINE PROSTA =====================
!
subroutine prosta(lumpedprojection,nstat, nops, nelm, izplmn, nzone, &
     MAXCOR, MAXDOF, MAXCON, MAXVAR, MAXPRP, iep, icon,  &
     nodpn, x, utot, du, eprop, svart, svaru, stlump,  &
     MAXLMP, lumpn, numnod, rhs, aupp, MAXSUP, diag, jpoin)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  logical, intent( in )         :: lumpedprojection
  integer, intent( inout )      :: nstat                    
  integer, intent( inout )      :: nops                     
  integer, intent( in )         :: nelm                     
  integer, intent( in )         :: nzone
  integer, intent( in )         :: izplmn(2,nzone)
  integer, intent( in )         :: MAXCOR                   
  integer, intent( in )         :: MAXDOF                   
  integer, intent( in )         :: MAXCON                   
  integer, intent( in )         :: MAXVAR                   
  integer, intent( in )         :: MAXPRP                   
  integer, intent( in )         :: MAXLMP                   
  integer, intent( in )         :: MAXSUP                   
  integer, intent( inout )      :: iep(7, nelm)             
  integer, intent( in )         :: icon(MAXCON)             
  integer, intent( in )         :: nodpn(7, nops)           
  integer, intent( out )        :: lumpn(2,nops,nzone)              
  integer, intent( out )        :: numnod(nops)             
  integer, intent( inout )      :: jpoin(nops)              
  real( prec ), intent( in )    :: x(MAXCOR)                      
  real( prec ), intent( in )    :: utot(MAXDOF)                   
  real( prec ), intent( in )    :: du(MAXDOF)                     
  real( prec ), intent( inout ) :: eprop(MAXPRP)                  
  real( prec ), intent( inout ) :: svart(MAXVAR)                  
  real( prec ), intent( inout ) :: svaru(MAXVAR)                  
  real( prec ), intent( out )   :: stlump(MAXLMP)                 
  real( prec ), intent( out )   :: rhs(nops)                
  real( prec ), intent( inout ) :: aupp(MAXSUP)             
  real( prec ), intent( inout ) :: diag(nops)               


  ! Local Variables
  real( prec ) :: duloc, stloc, utloc, xloc
  integer      :: iz,ic, icount, ip, ipn, itops, iu, ix, j, jp, k, l, lmn
  integer      :: n, neq, nloop, node, nodpl, nonzer, ns, nelzon
  logical      :: ifl,skip

  integer dummy(7,1)


  dimension nodpl(3, MAXNDL)
  dimension xloc(MAXCRL)
  dimension utloc(MAXDFL), duloc(MAXDFL)
  dimension stloc(MAXSTT)

  !     Project state variables to nodes, using the full mass matrix
  !
  !     NSTAT      Total number of state variables to be projected
  !     KNPROJ     Controls order of elements used in state projection.
  !                If KNPRON <= 0, then order of state projection is
  !                same as that of original solution.  If KNPRON>0, then
  !                KNPROJ specifies no. nodes per element in state projection.
  !                For boundary migration problems, use KNPROJ=3 (i.e. project
  !                state using linear interpolation between corner nodes of
  !                6 noded trianges) to reduce instability associated with
  !                repeated projections.
  !     NOPS       Total no. nodes in the mesh.
  !     NELM       Total no. elements in the mesh
  !     IZPLMN     Pointer to first and last element numbers in each zone
  !     NZONE      No. zones
  !     MAXCOR     Dimension of array X
  !     MAXDOF     Dimension of array DU,UTOT
  !     MAXCON     Dimension of array ICON
  !     MAXVAR     Dimension of arrays SVART,SVARU
  !     MAXPRP     Dimension of array EPROP
  !     ICON(I)        Connectivity array.  Note that
  !     ICON(KNODE(1,LMN)+J) gives Jth node connected to LMNth element
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

  !     X(J)           Nodal coordinate array
  !     UTOT(J)        Array of accumulated degrees of freedom
  !     DU(J)          Array of increment in DOF
  !     RFOR(J)        Array of residual forces

  !     SVART(J)       state variable at end of preceding step
  !     SVARU(J)       state variable at end of current step

  !     STLUMP(J)      Array of projected state variables
  !     MAXLMP         Dimension of array STLUMP
  !     LUMPN(1,N,IZ)  No. state variables at Nth node in zone IZ.
  !     LUMPN(2,N,IZ)  Pointer to state variables at Nth node in zone IZ.
  !                    State variables are stored in 
  !                    STLUMP(LUMPN(2,N,IZ):LUMPN(2,N,IZ)+LUMPN(1,N,IZ))
  !     NUMNOD         Integer array of dimension at least NOPS.  Used to store
  !     local equation numbers for each node
  !     RHS            Real array of dimension at least NOPS.
  !     Used to store RHS in system of equations.C
  !     AUPP           Upper half of global mass matrix.
  !     MAXSUP         Dimension of array AUPP
  !     DIAG           Diagonal of global mass matrix
  !     JPOIN          Diagonal pointer for skyline storage of global mass matrix.

  !     Set the pointer to the nodal state variables, and set up equation numbers

  do lmn = 1,nelm
  if ( nstat*iep(3,lmn)>MAXSTT ) then
    write (IOW, 99001) nstat*iep(3,lmn), MAXSTT
    stop
  end if
  end do

  stlump = 0.D0
  lumpn = 0
  itops = 1
  do iz = 1,nzone                                ! Loop over zones
    do lmn = izplmn(1,iz),izplmn(2,iz)           ! Loop over elements in zone
      do j = 1,iep(3,lmn)                        ! Loop over nodes on element
        node = icon(iep(2,lmn)+j-1)
        if (lumpn(1,node,iz) == 0) then          ! Node does not have pointer
          lumpn(1,node,iz) = nstat
          lumpn(2,node,iz) = itops
          itops = itops + nstat
        endif
      end do
    end do
  end do

!
! Loop over zones
!
 
  Do iz = 1,nzone

!    Skip zones that do not contain any solid elements
     skip = .true.
     do lmn = izplmn(1,iz),izplmn(2,iz)
	    if (iep(1,lmn) <100 ) then
		   skip = .false.
		   exit
		endif
		if (iep(1,lmn) > 1000.and.iep(1,lmn)<2000) then
		   skip = .false.
		   exit
		endif 
	 end do
	 
	 if (skip) cycle 
	 
	 
	 if (lumpedprojection) then            ! State is computed using lumped projection matrix
        nelzon = izplmn(2,iz)-izplmn(1,iz) + 1

       numnod = 0

   	   call maklproj(x, MAXCOR, nodpn, numnod, nops,  &
                   nelzon, icon, MAXCON, iep(1,izplmn(1,iz)), eprop, MAXPRP, diag)
	 
	 else    ! Full projection matrix
!
!     Compute equation numbers 
!
      nelzon = izplmn(2,iz)-izplmn(1,iz) + 1
!
      numnod = 0

      call renum(nops, nelzon, MAXCON, icon, iep(1,izplmn(1,iz)), 0,dummy, numnod)

  !     Form a full mass matrix with elements of appropriate order
    
      neq = maxval(numnod)

      call makproj(x, MAXCOR, nodpn, numnod, nops, nelzon,  &
       icon, MAXCON, iep(1,izplmn(1,iz)), eprop, MAXPRP, aupp, MAXSUP, diag, jpoin, neq)

  !     Form the LU decomposition of the mass matrix

       ifl = .false.
       call tri(ifl, aupp, aupp, diag, jpoin, neq)


    endif

  !     Set up RHS for projected state.  Stored in STLUMP.

    do lmn = izplmn(1,iz),izplmn(2,iz)

      ix = 0
      iu = 0
      do j = 1, iep(3, lmn)
        node = icon(iep(2, lmn) + j - 1)
        nodpl(1, j) = nodpn(1, node)
        nodpl(2, j) = nodpn(3, node)
        nodpl(3, j) = nodpn(5, node)
        do n = 1, nodpn(3, node)
          ix = ix + 1
          xloc(ix) = x(nodpn(2, node) + n - 1)
        end do
        do n = 1, nodpn(5, node)
          iu = iu + 1
          duloc(iu) = du(nodpn(4, node) + n - 1)
          utloc(iu) = utot(nodpn(4, node) + n - 1)
        end do
      end do

      call elstat(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
           duloc, utloc, iu, eprop(iep(4, lmn)), iep(5, lmn),  &
           svart(iep(6, lmn)), svaru(iep(6, lmn)), iep(7, lmn), &
           stloc, nstat)

      ic = 0
      do j = 1, iep(3, lmn)
        node = icon(iep(2, lmn) + j - 1)
        ipn = lumpn(2,node,iz)
        do ns = 1, nstat
          ic = ic + 1
          stlump(ipn + ns - 1) = stlump(ipn + ns - 1) + stloc(ic)
        end do
      end do

    end do


    if (lumpedprojection) then
!
!       Equation solution only requires division by lumped mass matrix
!

       do n = 1, nops
        if ( numnod(n) /= 0 ) then
          do ns = 1, nstat
            ip = lumpn(2,n,iz)
            stlump(ip+ns-1) = stlump(ip + ns - 1)/diag(n)
          end do
        end if
       end do
    
    else

  !       Solve equations for each state...

      do ns = 1, nstat
        nonzer = 0
        do n = 1, nops
         if ( numnod(n) /= 0 ) then
            ip = lumpn(2,n,iz)
            jp = numnod(n)
            rhs(jp) = stlump(ip + ns - 1)
            if ( rhs(jp)/=0.D0 ) nonzer = 1
          end if
        end do

        if ( nonzer/=0 ) then
  
        call solv(aupp, aupp, diag, rhs, jpoin, neq)

        do n = 1, nops
          if ( numnod(n) /= 0 ) then
            ip = lumpn(2,n,iz)
            jp = numnod(n)
            stlump(ip + ns - 1) = rhs(jp)
          end if
        end do
        end if
      end do

  endif

  end do

!
99001 format ( // ' *** Error detected during state projection '/  &
           ' Insufficient storage to project state. '/  &
           ' Parameter MAXSTT must be increased to at least ',  &
           I7/' Its current value is ', I7)
99002 format ( // , ' *** Error detected during state projection *** ',  &
           ' Insufficient storage for projected state ', /,  &
           ' Parameter MAXLMP must be increased ', /, &
           ' Its current value is ', I7)
  
end subroutine prosta


!========================== SUBROUTINE MAKPROJ =====================
subroutine makproj(x, MAXCOR, nodpn, numnod, nops,  &
     nelm, icon, MAXCON, iep, eprop, MAXPRP, aupp, MAXSUP, diag, jpoin, neq)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )                    :: MAXCOR
  integer, intent( inout )                 :: nops
  integer, intent( in )                    :: nelm
  integer, intent( in )                    :: MAXCON
  integer, intent( in )                    :: MAXPRP
  integer, intent( in )                    :: MAXSUP
  integer, intent( in )                    :: neq
  integer, intent( in )                    :: nodpn(7, nops)
  integer, intent( in )                    :: numnod(nops)
  integer, intent( in )                    :: icon(MAXCON)
  integer, intent( inout )                 :: iep(7, nelm)
  integer, intent( out )                   :: jpoin(nops)
  real( prec ), intent( in )               :: x(MAXCOR)
  real( prec ), intent( inout )            :: eprop(MAXPRP)
  real( prec ), intent( out )              :: aupp(MAXSUP)
  real( prec ), intent( out )              :: diag(nops)

  ! Local Variables
  real( prec ) :: stif, xloc
  integer      :: i, i1, i2, icol, irow, ix, j, jeq, jpold, l, lmn,  mineq
  integer      :: n, nloop, nn, nnode, node, node1, node2, nodpl, nsc, nsr

  dimension nodpl(2, MAXNDL)
  dimension xloc(MAXCRL), stif(MAXNDL, MAXNDL)

  !     Assemble a full projection matrix for (part of) a mesh

  do n = 1, nops
    diag(n) = 0.D0
    jpoin(n) = 0
  end do
  do n = 1, MAXSUP
    aupp(n) = 0.D0
  end do

  !     Assemble the profile for the global stiffness matrix

  !     ---  Loop over elements
  do lmn = 1, nelm

    mineq = nops
    nnode = iep(3, lmn)
    !     ---    Loop over nodes on element
    do i = 1, nnode
      node = icon(i + iep(2, lmn) - 1)
      !     ---      Find smallest eqn. no. on current element
      jeq = numnod(node)
      mineq = min(mineq, jeq)
    end do
    !     ---    Current column heights for all other eqs on same element
    do i = 1, nnode
      node = icon(i + iep(2, lmn) - 1)
      jeq = numnod(node)
      jpold = jpoin(jeq)
      jpoin(jeq) = max(jpold, jeq - mineq)
    end do
  end do

  !     ---  Compute diagonal pointers for profile

  jpoin(1) = 0
  do n = 2, neq
    jpoin(n) = jpoin(n) + jpoin(n - 1)
  end do

  if ( jpoin(neq)>MAXSUP ) then
    write (IOW, 99001) jpoin(neq), MAXSUP
    stop
  end if

  do lmn = 1, nelm

    !     Extract local coords for the element

    ix = 0
    do j = 1, iep(3, lmn)
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
    end do

    !     Form element projection matrix

    call elproj(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         eprop(iep(4, lmn)), iep(5, lmn), stif, MAXNDL)

    !     --   Add element projection matrix to global array

    nsr = 0
    do i1 = 1, iep(3, lmn)
      node1 = icon(i1 + iep(2, lmn) - 1)
      irow = numnod(node1)
      nsr = nsr + 1
      nsc = 0
      do i2 = 1, iep(3, lmn)
        node2 = icon(i2 + iep(2, lmn) - 1)
        icol = numnod(node2)
        nsc = nsc + 1
        if ( icol==irow ) then
          diag(irow) = diag(irow) + stif(nsc, nsr)
        else if ( icol>irow ) then
          nn = jpoin(icol) + irow - (icol - 1)
          aupp(nn) = aupp(nn) + stif(nsc, nsr)
        end if
      end do
    end do

  end do


99001 format ( // ' *** Error detected in subroutine MAKMAS ***', /,  &
           '   Insufficient storage to assemble mass matrix ',  &
           /'   Parameter MAXSUP must be increased to at least',  &
           I7/'   Its current value is ', I7)
  
end subroutine makproj
!
!========================== SUBROUTINE MAKLPROJ =====================
subroutine maklproj(x, MAXCOR, nodpn, numnod, nops,  &
     nelm, icon, MAXCON, iep, eprop, MAXPRP, lproj)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )                    :: MAXCOR
  integer, intent( inout )                 :: nops
  integer, intent( in )                    :: nelm
  integer, intent( in )                    :: MAXCON
  integer, intent( in )                    :: MAXPRP
  integer, intent( in )                    :: nodpn(7, nops)
  integer, intent( inout )                 :: numnod(nops)
  integer, intent( in )                    :: icon(MAXCON)
  integer, intent( inout )                 :: iep(7, nelm)
  real( prec ), intent( in )               :: x(MAXCOR)
  real( prec ), intent( inout )            :: eprop(MAXPRP)
  real( prec ), intent( out )              :: lproj(nops)

  ! Local Variables
  integer      :: i,j, lmn
  integer      :: n,ix,iof, node, nodpl,icount

  dimension nodpl(2, MAXNDL)
  real ( prec ) ::  xloc(MAXCRL)
  real ( prec ) :: dmloc(MAXDFL)

  !     Assemble a lumped projection matrix

  lproj = 0.d0

  do lmn = 1,nelm

     !     Extract local coords, DOF and nodal state/props for the element

      ix = 0

      do j = 1, iep(3, lmn)
        node = icon(iep(2, lmn) + j - 1)
        nodpl(1, j) = nodpn(1, node)
        nodpl(2, j) = nodpn(3, node)
        do n = 1, nodpn(3, node)
          ix = ix + 1
          xloc(ix) = x(nodpn(2, node) + n - 1)
        end do
      end do

   !     Form element lumped projection matrix

       call ellmproj(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         eprop(iep(4, lmn)), iep(5, lmn), dmloc, MAXDFL)

    !     --   Add element lumped mass matrix to global lumped mass matrix

        do j = 1,iep(3,lmn)
	       node = icon(iep(2,lmn)+j-1)
	       numnod(node) = 1             ! This is used to flag nodes inside current zone
	       lproj(node) = lproj(node) + dmloc(j)
	    end do

    end do


  
end subroutine maklproj

!======================SUBROUTINE PARSE =======================
subroutine parse(strin, strpar, length, nstr, lenstr, ityp, iblnk)
  use Types
  implicit none

  integer, intent( in )                    :: length
  integer, intent( out )                   :: nstr
  integer, intent( out )                   :: iblnk
  integer, intent( out )                   :: lenstr(*)
  integer, intent( out )                   :: ityp(*)
  character ( len = 100 ), intent( inout )   :: strin
  character ( len = 100 ), intent( inout )  :: strpar(length)


  ! Local Variables
  integer :: i, itst, itst2, jp, k, n, nd, ne, nnum, np, npm, nz,iasc
  character ( len = 1 ) blank

  blank = ' '
!  logical :: strcmp

  !     Parser for free format input

  !     STRIN     Character string of length LEN
  !     STRIN should contain characters; integers or real #s separated
  !     by commas.  The routine will separate each field into the parsed
  !     string STRPAR(N).  Blanks are removed, blank lines or lines starting
  !     with * are ignored completely. STRPAR(N) contains strings left justified
  !     and padded on the right with blanks.
  !     STRPAR(N) Nth string extracted from STRIN
  !     LENGTH    Length of input character string
  !     NSTR      No. strings extracted from STRIN
  !     LENSTR(N) Length of Nth string (total no. non blank characters)
  !     ITYP(N)   Type of Nth string. 0 for integer; 1 for real #; 2 for character string
  !     IBLNK     Set to 1 if blank line or comment encountered; zero otherwise.

  !     Fill all output strings with blanks
  do k = 1, length
    do i = 1, 100
      call adchar(strpar(k), 100, ' ', i)
    end do
    lenstr(k) = 0
  end do

  !     Check for blank line or comment line

  iblnk = 1
  if ( ichar(strin(1:1))==ichar('%') ) return
  do k = 1, length
    if ( .not.(ichar(strin(k:k))==ichar(' ')) ) iblnk = 0
  end do
  if ( iblnk==1 ) return

  nstr = 1
  !     Loop over input string.
  do i = 1, length
    !     Ignore blanks
    if ( .not.(ichar(strin(i:i))==ichar(' ')) ) then
      !     Check for comma
      if ( strin(i:i)==',' ) then
        nstr = nstr + 1
      else
        !     If character is anything other than blank or comma, put it in the output string
        jp = lenstr(nstr) + 1
        call adchar(strpar(nstr), 100, strin(i:i), jp)
        lenstr(nstr) = jp
      end if
    end if
  end do

  !     Determine the type of each output string

  do n = 1, nstr
    ityp(n) = 0
    nd = 0
    ne = 0
    nz = 0
    npm = 0
    np = 0
    nnum = 0
    do i = 1, lenstr(n)
      !     Check for anything other than a number in the string
      itst = iasc(strpar(n), 100, i)
      if ( itst>=48 .and. itst<=57 ) then
        nnum = nnum + 1
        !     Count the number of Ds or ds
      else if ( itst==68 .or. itst==100 ) then
        nd = nd + 1
        !     Check if character following D or d is +or-
        itst2 = iasc(strpar(n), 100, i + 1)
        if ( itst2==43 .or. itst2==45 ) npm = npm - 1
        !     Count the number of Es or es
      else if ( itst==69 .or. itst==101 ) then
        ne = ne + 1
        !     Check if character following E or e is +or-
        itst2 = iasc(strpar(n), 100, i + 1)
        if ( itst2==43 .or. itst2==45 ) npm = npm - 1
        !     Count the number of + or -
      else if ( itst==43 .or. itst==45 ) then
        npm = npm + 1
        !     Count the number of .
      else if ( itst==46 ) then
        np = np + 1
      else
        nz = nz + 1
      end if
    end do
    !     If there was a single decimal point we might have a floating point #
    if ( np==1 ) ityp(n) = 1
    !     Too many .s; +; -; Ee; Dd to be a number
    if ( np>1 .or. nd>1 .or. ne>1 .or. npm>1 ) ityp(n) = 2
    !     Non numerical character in string - must be character string
    if ( nz>0 ) ityp(n) = 2
    !     No numbers in string -- treated as character string
    if ( nnum==0 ) ityp(n) = 2
  end do

end subroutine parse
!===========================SUBROUTINE ADCHAR =========================
subroutine adchar(strin, len, char, ipoin)
  use Types
  implicit none
  
  integer                              :: len
  integer                              :: ipoin
  character ( len = 1 )                :: char
  character ( len = 100 )               :: strin

  !     Add character CHAR to position IPOIN in string STRIN
  strin(ipoin:ipoin) = char

end subroutine adchar
!
!===========================FUNCTION IASC =============================
function iasc(strin, len, ipoin)
  use Types
  implicit none

  integer, intent( in )                  :: len
  integer, intent( in )                  :: ipoin
  character ( len = 100 ), intent( in )   :: strin
  integer                                :: iasc
  
  ! Determine ASCII character # for character at position IPOIN in string STRIN
  
  iasc = ichar(strin(ipoin:ipoin))
  
end function iasc
!==========================FUNCTION STRCMP ====================
function strcmp(wd1, wd2, length)
  use Types
  implicit none

  integer, intent( in )                  :: length
  character ( len = 100 )                :: wd1
  character (len=length)                 :: wd2
  logical                                :: strcmp

  ! Local Variables
  integer :: i, ia, ib
  
  !     Determine whether character strings WD1 and WD2 match
  strcmp = .false.
  do i = 1, length
    ia = ichar(wd1(i:i))
    ib = ichar(wd2(i:i))
    if ( ia/=ib .and. ia + 32/=ib .and. ia/=ib + 32 ) return
  end do
  strcmp = .true.

end function strcmp
!=========================SUBROUTINE FILES =======================
subroutine files(fname,rw, nfiles, iunfil, fillst, MAXFIL, iun)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )                   :: MAXFIL
  integer, intent( in )                   :: rw
  integer, intent( inout )                :: nfiles
  integer, intent( out )                  :: iun
  integer, intent( inout )                :: iunfil(MAXFIL)
  character ( len = 100 ), intent( inout ) :: fname
  character ( len = 100 ), intent( inout ) :: fillst(MAXFIL)

  ! Local Variables
  integer :: iblnk, ityp, k, lenstr, nstr
  character ( len = 100 ) :: pfname(100)
  character ( len = 100 ) :: charname
  character ( len = 200 ) :: callstr

  dimension ityp(100), lenstr(100)
  logical :: strcmp
    
  !     Look for file name in list of open files
  do k = 1, nfiles
    charname = fillst(k)
    if ( strcmp(fname,charname, 100) ) then
      iun = iunfil(k)
      return
    end if
  end do
  
  !     IFLAG determines how the file will be opened
  !     IFLAG = 0 : File is opened for writing in ASCII
  !     IFLAG = 1 : File is opened for writing in BINARY
  !     IFLAG = 2 : File is opened for reading in BINARY
  !     (after reading, the file is must be closed by
  !     the reading subroutine)
  
  !     File has not been opened - open it.
  
  !     Move existing file with name
  !     FNAME to FNAME~

  call parse(fname, pfname, 100, nstr, lenstr, ityp, iblnk)
  if (rw==1) then
    call adchar(pfname(1), 100, '~', lenstr(1) + 1)
    if ( IOPSYS==0 ) then
      callstr = 'mv ' // fname // pfname(1)
    else if ( IOPSYS==1 ) then
      callstr = 'move ' // fname // pfname(1)
    end if
    call system(callstr)
  endif
  !     Open the file and add it to the list of open files

  !     Set unit number.  The largest open unit number is always in IUNFIL(NFILES)

  if ( nfiles==0 ) then
    iun = 11
  else
    iun = iunfil(nfiles) + 1
  end if

  nfiles = nfiles + 1
  if ( nfiles>MAXFIL ) then
    write (IOW, 99001) MAXFIL
    stop
  end if
    
  iunfil(nfiles) = iun
  fillst(nfiles) = fname
  if (rw==1) then
    open (UNIT = iun, FILE = fname, STATUS = 'NEW')   ! File opened for writing
  else if (rw==-1) then
    open (UNIT = iun, file = fname, STATUS = 'OLD')   ! File opened for reading
  endif
99001 format ( // ' *** ERROR DETECTED IN SUBROUTINE FILES ***'/  &
           ' Too many open files requested.'/ &
           ' Parameter MAXFIL must be increased.'/  &
           ' Its current value is ', I10)

end subroutine files

