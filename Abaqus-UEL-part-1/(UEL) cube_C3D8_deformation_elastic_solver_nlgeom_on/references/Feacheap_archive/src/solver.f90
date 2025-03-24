! solver.f90                                                  
 
!     Subroutines associated with matrix assembly and solution
!
!     Routines for conjugate gradient solution with indexed storage
!
!====================Subroutine ASSTIF_CG ======================
subroutine asstif_cg(nelm, nops, nmpc, ifl, MAXCOR, MAXDOF, MAXSTN,  &
     MAXCON, MAXVAR, MAXPRP, MAXSLO, MAXSUP, MAXEQ,  &
     iep, icon, nodpn, x, utot, du, stnod, rfor,  &
     eprop, svart, svaru, lstmpc, parmpc, maxpmc,  &
     rmpc, drmpc, rhs, alow, aupp, diag, ieqs, mpceq, neq,&
     eqpoin,eqtoa,MAXEPN,aur,auc,atop,ifail)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )         :: nelm                       
  integer, intent( in )         :: nops                       
  integer, intent( in )         :: nmpc                       
  logical, intent( in )         :: ifl                        
  integer, intent( in )         :: MAXCOR                     
  integer, intent( in )         :: MAXDOF                     
  integer, intent( in )         :: MAXSTN                     
  integer, intent( in )         :: MAXCON                     
  integer, intent( in )         :: MAXVAR                     
  integer, intent( in )         :: MAXPRP                     
  integer, intent( in )         :: MAXSLO                     
  integer, intent( in )         :: MAXSUP                     
  integer, intent( in )         :: MAXEQ                      
  integer, intent( in )         :: MAXEPN                      
  integer, intent( in )         :: maxpmc                     
  integer, intent( in )         :: neq                        
  integer, intent( inout)       :: ifail
  integer, intent( inout )      :: atop
  integer, intent( inout )      :: iep(7, nelm)               
  integer, intent( in )         :: icon(MAXCON)               
  integer, intent( inout )      :: nodpn(7, nops)             
  integer, intent( in )         :: lstmpc(7, nmpc)            
  integer, intent( in )         :: ieqs(MAXDOF)               
  integer, intent( in )         :: mpceq(nmpc)                
  real( prec ), intent( in )    :: x(MAXCOR)                     
  real( prec ), intent( in )    :: utot(MAXDOF)                  
  real( prec ), intent( in )    :: du(MAXDOF)                    
  real( prec ), intent( in )    :: stnod(MAXSTN)                 
  real( prec ), intent( out )   :: rfor(MAXDOF)                  
  real( prec ), intent( inout ) :: eprop(MAXPRP)                 
  real( prec ), intent( inout ) :: svart(MAXVAR)                 
  real( prec ), intent( inout ) :: svaru(MAXVAR)                 
  real( prec ), intent( inout ) :: parmpc(maxpmc)             
  real( prec ), intent( in )    :: rmpc(nmpc)                 
  real( prec ), intent( in )    :: drmpc(nmpc)                
  real( prec ), intent( inout ) :: rhs(MAXEQ)                 
  real( prec ), intent( out )   :: alow(MAXSLO)               
  real( prec ), intent( out )   :: aupp(MAXSUP)               
  real( prec ), intent( out )   :: diag(MAXEQ)                
  integer,      intent( inout ) :: eqpoin(MAXEQ)
  integer,      intent( inout ) :: eqtoa(7,MAXEPN)
  integer,      intent( inout ) :: aur(MAXSUP)
  integer,      intent( inout ) :: auc(MAXSUP)

  ! Local Variables
  real( prec ), parameter :: thresh=0.d0
  real( prec ) :: drmult, duloc, dumpc, resid, resmpc,  &
       rmult, stfmpc, stif, stnloc
  real( prec ) :: utloc, utmpc, xloc
  integer      :: i, i1, i2, icol, id1, id2, idof1, idof2, irow, &
       is, iu, ix, j, j1, j2, jh
  integer      :: ldof, lmn,  mpc, mpctyp, n, n1, n2
  integer      :: nn, node, node1, node2, nodpl, nsc, nsr

  integer      :: eqtoatop,index,skip

  dimension ldof(2), dumpc(2), utmpc(2)
  dimension stfmpc(3, 3), resmpc(3)

  dimension nodpl(4, MAXNDL)
  dimension xloc(MAXCRL)
  dimension utloc(MAXDFL), duloc(MAXDFL)
  dimension stnloc(MAXSNL)
  dimension stif(MAXSTF, MAXSTF), resid(MAXSTF)

  !     Subroutine to assemble global stiffness matrix

  !     NELM           No. elements
  !     NOPS           No. nodal points
  !     NMPC           No. multi--point constraints
  !     IFL            Set to .TRUE. for unsymmetric matrix

  !     MAXCOR         Max no. coords (dimension)
  !     MAXDOF         Max no. DOF (dimension)
  !     MAXCON         Max size of connectivity array (dimension only)
  !     MAXVAR         Max no. state variables (dimension)
  !     MAXSTF         Max dimension of  element stiffness
  !     MAXSLO         Max size of lower stiffness matrix
  !     MAXSUP         Max size of upper stiffness matrix
  !     MAXEQ          Max no. equations

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

  !     ALOW          Bottom half of stiffness matrix
  !     AUPP          Upper half of stifness matrix
  !     DIAG          Diagonal of stiffness matrix
  !     IEQS(J)       Equation no. array.  Equation nos for DOF associated with Nth node
  !     begin at IEQS(NODPN(4,N)) and end at IEQS(NODPN(4,N)+NODPN(5,N))
  !     NEQ           Total no. equations in stiffness matrix

  !     EQPOIN(I)     Points to first entry in link-list EQTOA for
  !                   nonzero entries in Ith row of matrix
  !     EQTOA(I,J)    EQTOA(1,J)    >0 No. index entries in current data block
  !                                 <0 Current data block is full; 
  !                                    -eqtoa(1,j) gives index of next data
  !                                    block in link list
  !     EQTOA(2:MAXL1,J)  Index entries for nonzero entries in AUPP, ALOW
  !     AUPP()        Upper half of stiffness matrix, with indexed storage 
  !     AUR(I)        Row number of ath entry in AUPP, (col number of ath entry
  !                   in ALOW)
  !     AUC(I)        Column number of ath entry in AUPP, (row number of ath
  !                   entry in ALOW) 
  !     ALOW()        Lower half of stiffness matrix, with indexed storage
  !     DIAG()        Diagonal of stiffness matrix
  !    
  !     NODPL(I,J)  Local nodal pointer: NODPL(1,J) is a user--defined identification flag;
  !     NODPL(2,J) specifies no. coords associated
  !     with Jth node on an element; NODPL(3,J) specifies no. DOF associated
  !     with Jth node on an element; NODPL(4,J) specifies no. state vars/props
  !     associated with Jth node on element
  !     XLOC(j)     Array specifying local nodal coords on an element.
  !     Coords are stored so that XLOC(1) is first coord of first node,
  !     XLOC(2) is second coord of first node, etc
  !     DULOC(j)    Current approx increment in local DOF on an element.  Same storage
  !     scheme as for XLOC.
  !     UTLOC(j)    Current approx to accumulated DOF an element
  !     STNLOC(I)   Ith nodal state.  Storage scheme is the same as for XLOC.


  !     STIF(I,J) Element stiffness matrix (internal use)
  !     RESID(J)  Element residual (internal use)

  AUPP = 0.D0
  ALOW = 0.D0
  DIAG = 0.D0
  RHS = 0.D0
! Pointers to top of A array and eqtoa array
  atop = 0
  eqtoatop = 0
  eqpoin = 0
  eqtoa = 0

  if ( neq<0 .or. neq>MAXEQ ) then
    write (IOW, 99001) neq, MAXEQ
    stop
  end if

  do lmn = 1, nelm

    !     Extract local coords, DOF and nodal state/props for the element

    ix = 0
    iu = 0
    is = 0

    do j = 1, iep(3, lmn)
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      nodpl(3, j) = nodpn(5, node)
      nodpl(4, j) = nodpn(7, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        if (ix>MAXCRL) then
          write(IOW,*) ' Error detected in subroutine ASSTF_CG '
          write(IOW,*) ' Insufficient storage for nodal coords '
          write(IOW,*) ' Increase parameter MAXCRL in Paramsol.f90 '
          stop
        endif
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
      do n = 1, nodpn(5, node)
        iu = iu + 1
        if (iu>MAXDFL) then
          write(IOW,*) ' Error detected in subroutine ASSTF_CG '
          write(IOW,*) ' Insufficient storage for nodal DOF '
          write(IOW,*) ' Increase parameter MAXDFL in Paramsol.f90 '
          stop
        endif
        duloc(iu) = du(nodpn(4, node) + n - 1)
        utloc(iu) = utot(nodpn(4, node) + n - 1)
      end do
      do n = 1, nodpn(7, node)
        is = is + 1
        if (is>MAXSNL) then
          write(IOW,*) ' Error detected in subroutine ASSTF_CG '
          write(IOW,*) ' Insufficient storage for nodal state '
          write(IOW,*) ' Increase parameter MAXSNL in Paramsol.f90 '
          stop
        endif
        stnloc(is) = stnod(nodpn(6, node) + n - 1)
      end do
    end do

    !     Form element stiffness

    call elstif(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         duloc, utloc, iu, stnloc, is, eprop(iep(4, lmn)),  &
         iep(5, lmn), svart(iep(6, lmn)), svaru(iep(6, lmn)),  &
         iep(7, lmn), stif, resid, MAXSTF,ifail)

    if (ifail==1) return

    !     --   Add element stiffness and residual to global array

    skip = 0
    nsr = 0
    do i1 = 1, iep(3, lmn)
      node1 = icon(i1 + iep(2, lmn) - 1)
      do j1 = 1, nodpn(5, node1)
        irow = ieqs(j1 + nodpn(4, node1) - 1)
        nsr = nsr + 1
        rhs(irow) = rhs(irow) + resid(nsr)
        nsc = 0
        do i2 = 1, iep(3, lmn)
          node2 = icon(i2 + iep(2, lmn) - 1)
          do j2 = 1, nodpn(5, node2)
            icol = ieqs(j2 + nodpn(4, node2) - 1)
            nsc = nsc + 1
            if ( icol==irow ) then
              diag(irow) = diag(irow) + stif(nsr,nsc)
            else if ( icol>irow ) then
              if (abs(stif(nsr,nsc))+abs(stif(nsc,nsr))>thresh) then
                call getindex(irow,icol,eqpoin,MAXEQ,eqtoa,MAXEPN,eqtoatop,&
                                             aur,auc,MAXSUP,atop,index)
                aupp(index) = aupp(index) + stif(nsr,nsc)
                if ( ifl ) alow(index) = alow(index) + stif(nsc,nsr)
              else
                skip = skip + 1
              endif
            end if
          end do
        end do
      end do
    end do
  end do

  do mpc = 1, nmpc

    !     set up stiffness for multi--point constraint

    node1 = lstmpc(2, mpc)
    idof1 = lstmpc(3, mpc)
    dumpc(1) = du(idof1 + nodpn(4, node1) - 1)
    utmpc(1) = utot(idof1 + nodpn(4, node1) - 1)
    node2 = lstmpc(4, mpc)
    idof2 = lstmpc(5, mpc)
    dumpc(2) = du(idof2 + nodpn(4, node2) - 1)
    utmpc(2) = utot(idof2 + nodpn(4, node2) - 1)
    rmult = rmpc(mpc)
    drmult = drmpc(mpc)
    ldof(1) = idof1
    ldof(2) = idof2

    call cnstrn(mpc, mpctyp, ldof, parmpc(lstmpc(6, mpc)),  &
         lstmpc(7, mpc), utmpc, dumpc, rmult, drmult, stfmpc, resmpc)


    !     --   Add stiffness and residual to global array

    do i1 = 1, 3
      if ( i1<3 ) then
        n1 = lstmpc(2*i1, mpc)
        id1 = lstmpc(2*i1 + 1, mpc)
        irow = ieqs(id1 + nodpn(4, n1) - 1)
      else
        irow = mpceq(mpc)
      end if
      rhs(irow) = rhs(irow) + resmpc(i1)
      do i2 = 1, 3
        if ( i2<3 ) then
          n2 = lstmpc(2*i2, mpc)
          id2 = lstmpc(2*i2 + 1, mpc)
          icol = ieqs(id2 + nodpn(4, n2) - 1)
        else
          icol = mpceq(mpc)
        end if
        if ( icol==irow ) then
          diag(irow) = diag(irow) + stfmpc(i1, i2)
        else if ( icol>irow ) then
          if (abs(stfmpc(i1,i2))>thresh) then
            call getindex(irow,icol,eqpoin,MAXEQ,eqtoa,MAXEPN,eqtoatop, &
                                             aur,auc,MAXSUP,atop,index)
            aupp(index) = aupp(index) + stfmpc(i1, i2)
            if ( ifl ) alow(index) = alow(index) + stfmpc(i2, i1)
          endif
        end if
      end do
    end do
  end do

  do n = 1, nops
    do j = 1, nodpn(5, n)
      rfor(j + nodpn(4, n) - 1) = -rhs(ieqs(j + nodpn(4, n) - 1))
    end do
  end do


99001 format ( // '  ERROR DETECTED DURING STIFFNESS ASSEMBLY '/  &
       '     No. equations ', I10, ' Storage ', I10)

end subroutine asstif_cg

!====================Subroutine BCONS_CG =======================
subroutine bcons_cg(ifl, nops, nelm, MAXCOR, MAXDOF, MAXCON, MAXSLO,  &
     MAXSUP, MAXEQ, icon, iep, nodpn, x, utot, du,  &
     eprop, MAXPRP, nfix, lstfix, dofval, umag, nfor,  &
     lstfor, forval, fmag, ndload, lstlod,dlpars,MAXDPR,  dlmag, rhs,  &
     alow, aupp, diag, ieqs, neq,irow,icol,size)

  use Types
  use ParamIO
  use Paramsol
  use Globals, only: TIME,DTIME
  implicit none

  logical, intent( inout )      :: ifl                          
  integer, intent( inout )      :: nops                         
  integer, intent( inout )      :: nelm                         
  integer, intent( in )         :: MAXCOR                       
  integer, intent( in )         :: MAXDOF                       
  integer, intent( in )         :: MAXCON                       
  integer, intent( in )         :: MAXSLO                       
  integer, intent( in )         :: MAXSUP                       
  integer, intent( in )         :: MAXEQ                        
  integer, intent( in )         :: MAXPRP
  integer, intent( in )         :: MAXDPR                         
  integer, intent( in )         :: nfix                         
  integer, intent( in )         :: nfor                         
  integer, intent( in )         :: ndload                       
  integer, intent( inout )      :: neq                          
  integer, intent( inout )      :: size
  integer, intent( in )         :: icon(MAXCON)                 
  integer, intent( inout )      :: iep(7, nelm)                 
  integer, intent( in )         :: nodpn(7, nops)               
  integer, intent( in )         :: lstfix(2, nfix)              
  integer, intent( in )         :: lstfor(2, nfor)              
  integer, intent( in )         :: lstlod(5, ndload)            
  integer, intent( in )         :: ieqs(MAXDOF)                 
  real( prec ), intent( in )    :: umag                         
  real( prec ), intent( in )    :: fmag                         
  real( prec ), intent( in )    :: dlmag                        
  real( prec ), intent( in )    :: x(MAXCOR)                    
  real( prec ), intent( inout ) :: utot(MAXDOF)                 
  real( prec ), intent( in )    :: du(MAXDOF)                   
  real( prec ), intent( inout ) :: eprop(MAXPRP)                
  real( prec ), intent( in )    :: dofval(nfix)                 
  real( prec ), intent( in )    :: forval(nfor)
  real( prec ), intent( in )    :: dlpars(MAXDPR)                  
  real( prec ), intent( inout ) :: rhs(MAXEQ)                   
  real( prec ), intent( inout ) :: alow(MAXSLO)                 
  real( prec ), intent( inout ) :: aupp(size)                 
  real( prec ), intent( inout ) :: diag(MAXEQ)                  
  integer,      intent( inout ) :: irow(size)
  integer,      intent( inout ) :: icol(size)

  ! Local Variables
  real( prec ) :: resid, ucur, value, xloc
  integer      :: icount, idof, ifac, iflg, ix,i, j, l, lmn,  &
       n, nnode, node, nodpl, npresc, iopt

  dimension nodpl(4, MAXNDL)
  dimension resid(MAXSTF), xloc(MAXCRL)

  !     Subroutine to apply prescribed boundary conditions
  !     Magnitude of prescribed DOF is DOFVAL(N)*UMAG
  !     Magnitude of prescribed force is FORVAL(N)*FMAG
  !     Magnitude of distributed load is RESID(N)*DLMAG
  !     where RESID is element contribution to residual,
  !     computed in subroutine DLOAD

  !     LSTFIX    List of nodes with prescribed DOFs
  !     LSTFIX(1,N) node number
  !     LSTFIX(2,N) DOF number
  !     NFIX      Total no. of prescribed DOF
  !     DOFVAL(N) Value of Nth constrained doF

  !     LSTFOR    List of nodes with prescribed external forces
  !     LSTFOR(1,N) node number
  !     LSTFOR(2,N) Force direction
  !     NFOR      Total no. of prescribed forces
  !     FORVAL(N) Value of Nth prescribed force

  !     LSTLOD    List of elements with distributed loads
  !     LSTLOD(1,N) Element number
  !     LSTLOD(2,N) Face number of element
  !     LSTLOD(3,N) Pointer to parameter array
  !     LSTLOD(4,N) No. parameters
  !     LSTLOD(5,N) Flag controlling distributed load type

  !     NDLOAD    Total no. elements with distributed loads

  !     NODPL(I,J)  Local nodal pointer: NODPL(1,J) is a user--defined identification flag;
  !     NODPL(2,J) specifies no. coords associated
  !     with Jth node on an element; NODPL(3,J) specifies no. DOF associated
  !     with Jth node on an element.

  !     -- Distributed loads


  do l = 1, ndload
    lmn = lstlod(1, l)
    ifac = lstlod(2, l)
    nnode = iep(3, lmn)
    ix = 0
    do j = 1, nnode
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      nodpl(3, j) = nodpn(5, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
    end do

    call dload(lmn, iep(1, lmn), nnode, nodpl, eprop(iep(4, lmn)),  &
         iep(5, lmn), xloc, ix, ifac, lstlod(5,l), dlpars(lstlod(3,l)),lstlod(4,l), resid, MAXSTF)

    icount = 0
    do n = 1, nnode
      node = icon(n + iep(2, lmn) - 1)
      do j = 1, nodpn(5, node)
        icount = icount + 1
        npresc = ieqs(j + nodpn(4, node) - 1)
        rhs(npresc) = rhs(npresc) + resid(icount)*dlmag
      end do
    end do
  end do

  !     -- Prescribed nodal forces

  do n = 1, nfor
    node = lstfor(1, n)
    idof = lstfor(2, n)
    npresc = ieqs(idof + nodpn(4, node) - 1)
    rhs(npresc) = rhs(npresc) + forval(n)*fmag
  end do

  !     -- Prescribed DOFs
  do n = 1, nfix
    idof = iabs(lstfix(2, n))
    node = lstfix(1, n)
    if (lstfix(2,n)>0) then
      ucur = du(idof + nodpn(4, node) - 1) + utot(idof + nodpn(4, node) - 1)
    else
      ucur = du(idof + nodpn(4, node) - 1)
    endif
    value = umag*dofval(n) - ucur


    npresc = ieqs(idof + nodpn(4, node) - 1)
    do i = 1,size
      if (irow(i)==npresc) then
        if (ifl) then
!         Unsymmetric - take lower half of stiffness over to rhs
          rhs(icol(i)) = rhs(icol(i)) - value*alow(i)
          alow(i) = 0.D0
        else
!         Symmetric - use fact that aupp=alow to take column irow 
!         from lower half of stiffness over to rhs
          rhs(icol(i)) = rhs(icol(i)) - value*aupp(i)
        endif
!       Zero the row for DOF npresc (also column in lower half of stiffness)
        aupp(i) = 0.D0
      endif
      if (icol(i)==npresc)  then
!       Take column npresc from upper half of stiffness over to rhs
        rhs(irow(i)) = rhs(irow(i)) - value*aupp(i)
        aupp(i) = 0.D0 
!       zero row npresc in lower half of stiffness
        if (ifl) alow(i) = 0.D0
      endif
    end do
    diag(npresc) = 1.D0
    rhs(npresc) = value
  end do

end subroutine bcons_cg


!====================Subroutine INSTIF_CG =======================
subroutine instif_cg(dunorm, cnorm,rnorm, nops, nmpc, ifl, MAXDOF, MAXSLO,  &
     asize, nodpn, du, drmpc, rhs, alow,  &
     aupp, diag, irow,icol,ieqs, mpceq, neq,ifail)
  use Types
  implicit none

  integer, intent( in )         :: nops                           
  integer, intent( in )         :: nmpc                           
  integer, intent( in )         :: MAXDOF                         
  integer, intent( in )         :: MAXSLO                         
  integer, intent( in )         :: asize
  integer, intent( in )         :: neq                            
  integer, intent( in )         :: nodpn(7, nops)                 
  integer, intent( inout )      :: ieqs(MAXDOF)                   
  integer, intent( inout )      :: mpceq(nmpc)                    
  logical, intent( in )         :: ifl                            
  real( prec ), intent( out )   :: dunorm                         
  real( prec ), intent( out )   :: cnorm                          
  real( prec ), intent( out )   :: rnorm                          
  real( prec ), intent( inout ) :: du(MAXDOF)                     
  real( prec ), intent( inout ) :: drmpc(nmpc)                    
  real( prec ), intent( inout ) :: rhs(neq)                     
  real( prec ), intent( inout ) :: alow(MAXSLO)                   
  real( prec ), intent( inout ) :: aupp(asize)                   
  real( prec ), intent( inout ) :: diag(neq)                    
  integer, intent( in )         :: irow(asize)
  integer, intent( in )         :: icol(asize)
  integer, intent( inout )      :: ifail

  ! Local Variables
  integer :: ipoin, j, mpc,  n, i
  real( prec ) :: sol(neq)                    
  
  rnorm = 0.D0
  do n = 1, nops
    do j = 1, nodpn(5, n)
      ipoin = j + nodpn(4, n) - 1
      rnorm = rnorm + rhs(ieqs(ipoin))*rhs(ieqs(ipoin))
    end do
  end do
  do mpc = 1, nmpc
    rnorm = rnorm + rhs(mpceq(mpc))*rhs(mpceq(mpc))
  end do

  if ( ifl ) then
    call solv_cg(alow, aupp, diag, rhs,irow,icol,asize,neq,sol,ifail)
  else
    call solv_cg(aupp, aupp, diag, rhs,irow,icol,asize,neq,sol,ifail)
  end if

  if (ifail/=0) return

  dunorm = 0.D0
  cnorm = 0.D0
  do n = 1, nops
    do j = 1, nodpn(5, n)
      ipoin = j + nodpn(4, n) - 1
      du(ipoin) = du(ipoin) + sol(ieqs(ipoin))
      dunorm = dunorm + du(ipoin)*du(ipoin)
      cnorm = cnorm + sol(ieqs(ipoin))*sol(ieqs(ipoin))
    end do
  end do
  do mpc = 1, nmpc
    drmpc(mpc) = drmpc(mpc) + sol(mpceq(mpc))
    dunorm = dunorm + drmpc(mpc)*drmpc(mpc)
    cnorm = cnorm + sol(mpceq(mpc))*sol(mpceq(mpc))
  end do
  if ( neq==0 ) stop
  dunorm = dsqrt(dunorm)/dble(neq)
  cnorm = dsqrt(cnorm)/dble(neq)
  rnorm = dsqrt(rnorm)/dble(neq)

end subroutine instif_cg

!=====================Subroutine SOLV =========================
subroutine solv_cg(alow, aupp, diag, rhs,irow,icol,size,neq,sol,ifail)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: neq                      
  integer, intent( in )         :: size
  integer, intent( inout )      :: ifail
  real( prec ), intent( inout ) :: alow(size)                  
  real( prec ), intent( inout ) :: aupp(size)                  
  real( prec ), intent( in )    :: diag(neq)                  
  real( prec ), intent( inout ) :: rhs(neq)                   
  real( prec ), intent( inout ) :: sol(neq)                   
  integer, intent( in )         :: icol(size)
  integer, intent( in )         :: irow(size)

  real( prec ), parameter :: eps=1.0D-17
  real( prec ) :: ak, akden, bk, bkden, bknum, bnrm 
  real( prec ), dimension(50000) :: p, r, z, precon

  integer :: is,iter,maxit,i,k,j
  real (prec) :: err
!
! Conjugate gradient solver with indexed storage scheme
!
  if (neq>50000) then
      write(IOW,*) ' Insufficient storage for conjugate gradient solver in solv_cg'
      write(IOW,*) ' No. equations exceeds 50000'
      stop
  endif
  ifail = 0
  maxit = 50*neq
  err = 1.D0

  sol(1:neq) = 0.D0

  is = 0
  do 
    is = is + 1
    if (is>neq) then
      write (IOW, 99001)
      sol(1:neq) = 0.D0
      return
    endif
    if ( rhs(is) /= 0.D0 ) exit
   end do

   iter=0
!  Jacobi preconditioner
   precon(1:neq) = diag(1:neq)
   do i = 1,neq
      precon(i) = 1.d0/precon(i)
!      Uncomment for D-LU preconditioner
!      do k = 1,size
!         if(irow(k)==i) then
!             if(icol(k)>i) then
!                precon(icol(k)) = precon(icol(k)) - alow(k)*precon(i)*aupp(k)
!             endif
!         endif
!      end do
  end do
 
!
!  r = rhs - [A]*sol
!
   r(1:neq) = 0.D0
   do i = 1,size
     r(irow(i)) = r(irow(i)) + aupp(i)*sol(icol(i))
     r(icol(i)) = r(icol(i)) + alow(i)*sol(irow(i))        
   end do
   r(1:neq) = r(1:neq) + diag(1:neq)*sol(1:neq)

   r(1:neq) = rhs(1:neq) - r(1:neq)
   bnrm = dot_product(rhs(1:neq),rhs(1:neq))
   err = dot_product(r(1:neq),r(1:neq))/bnrm
   if (err<eps) then
     write(IOW,9901) iter,neq,size
     return
   endif
!

!
!  ~
! [A] = [I]diag([A]) = preconditioning matrix
!
!       ~ -1     ~ -1
!  z = [A]  r = [A]  (rhs - [A]*sol)
!
!     do i = 1,neq
!       if (diag(i)/=0.D0) then
!        z(i) = r(i)/diag(i)
!       else
!        z(i) = r(i)
!       endif
!     end do
    z(1:neq) = r(1:neq)*precon(1:neq)
!   D-LU preconditioner (slow - needs recoding if used for real)
!   z(1:neq) = r(1:neq)
!   do i = 1,neq
!      do j = 1,size
!         if (icol(j)==i) then
!            if (irow(j)<i) then
!              z(i) = z(i) - alow(j)*z(irow(j))
!            endif
!         endif
!       end do
!       z(i) = z(i)*precon(i)
!       end do
!       do i = neq,1,-1
!          do j = 1,size
!             if (irow(j) == i) then
!                if (icol(j)>i) then
!                  z(i) = z(i) - aupp(j)*z(icol(j))*precon(i)
!                endif
!              endif
!          end do
!       end do
!
!  iterate
!
   do while (err>eps)

     iter=iter+1
     if (iter>maxit) then
       write(IOW,9900) iter
9900   format(' Conjugate gradient solver failed to converge in ',i7,&
              ' iterations ')
       ifail = 1
       return
     endif
!
!  update search direction p
!
!  bk = z   dot r    / z dot r
!        k+1     k+1    k     k
!
     bknum=dot_product(z(1:neq),r(1:neq))
     if (iter == 1) then
       p(1:neq)=z(1:neq)
     else
       bk=bknum/bkden
       p(1:neq)=bk*p(1:neq)+z(1:neq)
      endif
      bkden=bknum
!
!  ak = r dot z / p dot ([A]p)
!
      z(1:neq) = 0.D0
      do i = 1,size
        z(irow(i)) = z(irow(i)) + aupp(i)*p(icol(i))
        z(icol(i)) = z(icol(i)) + alow(i)*p(irow(i))        
      end do
      z(1:neq) = z(1:neq) + diag(1:neq)*p(1:neq)
      akden=dot_product(z(1:neq),p(1:neq))
      ak=bknum/akden
!
!  update x and r
!
      sol(1:neq)=sol(1:neq)+ak*p(1:neq)
      r(1:neq)=r(1:neq)-ak*z(1:neq)
!
!         ~ -1
!  z   = [A]  r
!   k+1 
!     do i = 1,neq
!       if (diag(i)/=0.D0) then
!        z(i) = r(i)/diag(i)
!       else
!        z(i) = r(i)
!       endif
!     end do
     z(1:neq) = r(1:neq)*precon(1:neq)
!   D-LU preconditioner - needs recoding to speed up if used for real
!   z(1:neq) = r(1:neq)
!   do i = 1,neq
!      do j = 1,size
!         if (icol(j)==i) then
!            if (irow(j)<i) then
!              z(i) = z(i) - alow(j)*z(irow(j))
!            endif
!         endif
!       end do
!       z(i) = z(i)*precon(i)
!       end do
!       do i = neq,1,-1
!          do j = 1,size
!             if (irow(j) == i) then
!                if (icol(j)>i) then
!                  z(i) = z(i) - aupp(j)*z(icol(j))*precon(i)
!                endif
!              endif
!          end do
!       end do
!
!  check convergence tolerance
!
     err=dot_product(r(1:neq),r(1:neq))/bnrm
   enddo

   write(IOW,9901) iter,neq,size
9901 format(//'  Conjugate gradient solver converged in ',i7,' iterations'/ &
            '  No. equations:                           ',i7/ &
            '  Size of assembled stiffness matrix:      ',i10)


99001 format ( // ' ***** SOLVER WARNING ***** '/, &
           ' Zero RHS found in SOLV ')

end subroutine solv_cg
!
!========================== SUBROUTINE GETINDEX ===================
!
subroutine getindex(irow,icol,eqpoin,MAXEQ,eqtoa,MAXEPN,eqtoatop, &
                                              aur,auc,MAXSUP,atop,index)

  use Types
  use ParamIO
  implicit none

  integer, intent( in )            :: irow
  integer, intent( in )            :: icol
  integer, intent( in )            :: MAXEQ
  integer, intent( in )            :: MAXEPN
  integer, intent( in )            :: MAXSUP
  integer, intent( inout )         :: eqpoin(MAXEQ)
  integer, intent( inout )         :: eqtoa(7,MAXEPN)
  integer, intent( inout )         :: aur(MAXSUP)
  integer, intent( inout )         :: auc(MAXSUP)
  integer, intent( inout )         :: index
  integer, intent( inout )         :: eqtoatop
  integer, intent( inout )         :: atop

  integer :: i,j
!
! Routine to locate position AUPP(index) of location element(irow,icol)
! of stiffness matrix.  New storage is assigned if the index has not yet
! been assigned.
!
!     EQPOIN(I)     Points to first entry in link-list EQTOA for
!                   nonzero entries in Ith row of matrix
!     EQTOA(I,J)    EQTOA(1,J)    >0 No. index entries in current data block
!                                 <0 Current data block is full; 
!                                    -eqtoa(1,j) gives index of next data
!                                    block in link list
!     EQTOA(2:MAXL1,J)  Index entries for nonzero entries in AUPP, ALOW
!
! Search through link list to find entry icol
!

  i = eqpoin(irow)

!
! Check whether there are any existing entries for row irow
!
  if (i==0) then

!   If not, set the pointer to the top of the eqtoa link list
    eqtoatop = eqtoatop + 1
    if (eqtoatop>MAXEPN) then
      write(IOW,*) ' Error in subroutine getindex '
      write(IOW,*) ' Insufficient storage to assemble equation pointer'
      write(IOW,*) ' Increase parameter MAXEPN '
      stop
    endif
    i = eqtoatop
    eqpoin(irow) = eqtoatop
    atop = atop + 1
    if (atop>MAXSUP) THEN
      write(IOW,9900) MAXSUP
9900  format ( // ' *** Error detected in subroutine GETINDEX ***', /,  &
       '   Insufficient storage to assemble stiffness matrix ',  &
       /'   Parameter MAXSUP must be increased',  &
       /'   Its current value is ', I10)
      stop
    endif

    eqtoa(1,i) = 1
    eqtoa(2,i) = atop
    aur(atop) = irow
    auc(atop) = icol
    index = atop
    return

  endif

! Keep looping until we either find entry icol, or failing that create a
! new entry and quit
  do 

    if (eqtoa(1,i)>0) then
!     we're in the top data block
      do j = 2,eqtoa(1,i)+1
        if (auc(eqtoa(j,i))==icol) then
          index = eqtoa(j,i)
          return
        endif
      end do
!     Entry for column icol wasn't in the top data block.  Add it,
!     creating a new data block if necessary
      if (eqtoa(1,i)<6) then
        eqtoa(1,i) = eqtoa(1,i) + 1
        atop = atop + 1
        if (atop>MAXSUP) THEN
          write(IOW,9900) MAXSUP
          stop
        endif
        eqtoa(eqtoa(1,i)+1,i) = atop
        aur(atop) = irow
        auc(atop) = icol
      else
        atop = atop + 1
        if (atop>MAXSUP) THEN
          write(IOW,9900) MAXSUP
          stop
        endif
        eqtoatop = eqtoatop + 1
        if (eqtoatop>MAXEPN) then
          write(IOW,*) ' Error in subroutine getindex '
          write(IOW,*) ' Insufficient storage to assemble equation pointer'
          write(IOW,*) ' Increase parameter MAXEPN '
          stop
        endif
        eqtoa(1,i) = -eqtoatop
        eqtoa(1,eqtoatop) = 1
        eqtoa(2,eqtoatop) = atop
        aur(atop) = irow
        auc(atop) = icol
      endif
!     All done
      index = atop
      return
    else 
      do j = 2,7
        if (auc(eqtoa(j,i))==icol) then
          index = eqtoa(j,i)
          return
        endif
      end do
!     We didnt find column icol in the current data block - go to the next one
      i = -eqtoa(1,i)
    endif
  end do

end subroutine getindex
!  
!  Routines for solution by LU decomposition with skyline storage
!
!====================Subroutine ASSTIF ======================
subroutine asstif(nelm, nops, nmpc, ifl, MAXCOR, MAXDOF, MAXSTN,  &
     MAXCON, MAXVAR, MAXPRP, MAXSLO, MAXSUP, MAXEQ,  &
     iep, icon, nodpn, x, utot, du, stnod, rfor,  &
     eprop, svart, svaru, lstmpc, parmpc, maxpmc,  &
     rmpc, drmpc, rhs, alow, aupp, diag, ieqs, mpceq, jpoin, neq,ifail)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )         :: nelm                       
  integer, intent( in )         :: nops                       
  integer, intent( in )         :: nmpc                       
  logical, intent( in )         :: ifl                        
  integer, intent( in )         :: MAXCOR                     
  integer, intent( in )         :: MAXDOF                     
  integer, intent( in )         :: MAXSTN                     
  integer, intent( in )         :: MAXCON                     
  integer, intent( in )         :: MAXVAR                     
  integer, intent( in )         :: MAXPRP                     
  integer, intent( in )         :: MAXSLO                     
  integer, intent( in )         :: MAXSUP                     
  integer, intent( in )         :: MAXEQ                      
  integer, intent( in )         :: maxpmc                     
  integer, intent( in )         :: neq                        
  integer, intent( inout)       :: ifail
  integer, intent( inout )      :: iep(7, nelm)               
  integer, intent( in )         :: icon(MAXCON)               
  integer, intent( inout )      :: nodpn(7, nops)             
  integer, intent( in )         :: lstmpc(7, nmpc)            
  integer, intent( in )         :: ieqs(MAXDOF)               
  integer, intent( in )         :: mpceq(nmpc)                
  integer, intent( in )         :: jpoin(MAXEQ)               
  real( prec ), intent( in )    :: x(MAXCOR)                     
  real( prec ), intent( in )    :: utot(MAXDOF)                  
  real( prec ), intent( in )    :: du(MAXDOF)                    
  real( prec ), intent( in )    :: stnod(MAXSTN)                 
  real( prec ), intent( out )   :: rfor(MAXDOF)                  
  real( prec ), intent( inout ) :: eprop(MAXPRP)                 
  real( prec ), intent( inout ) :: svart(MAXVAR)                 
  real( prec ), intent( inout ) :: svaru(MAXVAR)                 
  real( prec ), intent( inout ) :: parmpc(maxpmc)             
  real( prec ), intent( in )    :: rmpc(nmpc)                 
  real( prec ), intent( in )    :: drmpc(nmpc)                
  real( prec ), intent( inout ) :: rhs(MAXEQ)                 
  real( prec ), intent( out )   :: alow(MAXSLO)               
  real( prec ), intent( out )   :: aupp(MAXSUP)               
  real( prec ), intent( out )   :: diag(MAXEQ)                

  ! Local Variables
  real( prec ) :: drmult, duloc, dumpc, resid, resmpc,  &
       rmult, stfmpc, stif, stnloc
  real( prec ) :: utloc, utmpc, xloc
  integer      :: i, i1, i2, icol, id1, id2, idof1, idof2, irow, &
       is, iu, ix, j, j1, j2, jh
  integer      :: ldof, lmn,  mpc, mpctyp, n, n1, n2
  integer      :: nn, node, node1, node2, nodpl, nsc, nsr

  dimension ldof(2), dumpc(2), utmpc(2)
  dimension stfmpc(3, 3), resmpc(3)

  dimension nodpl(4, MAXNDL)
  dimension xloc(MAXCRL)
  dimension utloc(MAXDFL), duloc(MAXDFL)
  dimension stnloc(MAXSNL)
  dimension stif(MAXSTF, MAXSTF), resid(MAXSTF)

  !     Subroutine to assemble global stiffness matrix

  !     NELM           No. elements
  !     NOPS           No. nodal points
  !     NMPC           No. multi--point constraints
  !     IFL            Set to .TRUE. for unsymmetric matrix

  !     MAXCOR         Max no. coords (dimension)
  !     MAXDOF         Max no. DOF (dimension)
  !     MAXCON         Max size of connectivity array (dimension only)
  !     MAXVAR         Max no. state variables (dimension)
  !     MAXSTF         Max dimension of  element stiffness
  !     MAXSLO         Max size of lower stiffness matrix
  !     MAXSUP         Max size of upper stiffness matrix
  !     MAXEQ          Max no. equations

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

  !     ALOW          Bottom half of stiffness matrix
  !     AUPP          Upper half of stifness matrix
  !     DIAG          Diagonal of stiffness matrix
  !     IEQS(J)       Equation no. array.  Equation nos for DOF associated with Nth node
  !     begin at IEQS(NODPN(4,N)) and end at IEQS(NODPN(4,N)+NODPN(5,N))
  !     JPOIN         Diagonal pointer array
  !     NEQ           Total no. equations in stiffness matrix

  !     Detailed description of storage:
  !     For array
  !     |  K11  K12   K13   0   0  |
  !     |  K21  K22   K23  K24  0  |
  !     |  K31  K32   K33  K34 K35 |
  !     |  0    K42   K43  K44 K45 |
  !     |  0    0     K53  K54 K55 |

  !     AUPP =  [K12   K13 K23   K24 K34   K35 K45]
  !     ALOW = [K21   K31 K32   K42 K43   K53 K54]
  !     DIAG = [K11 K22 K33 K44 K55]
  !     JPOIN = [0  1  3  5  7]

  !     NODPL(I,J)  Local nodal pointer: NODPL(1,J) is a user--defined identification flag;
  !     NODPL(2,J) specifies no. coords associated
  !     with Jth node on an element; NODPL(3,J) specifies no. DOF associated
  !     with Jth node on an element; NODPL(4,J) specifies no. state vars/props
  !     associated with Jth node on element
  !     XLOC(j)     Array specifying local nodal coords on an element.
  !     Coords are stored so that XLOC(1) is first coord of first node,
  !     XLOC(2) is second coord of first node, etc
  !     DULOC(j)    Current approx increment in local DOF on an element.  Same storage
  !     scheme as for XLOC.
  !     UTLOC(j)    Current approx to accumulated DOF an element
  !     STNLOC(I)   Ith nodal state.  Storage scheme is the same as for XLOC.


  !     STIF(I,J) Element stiffness matrix (internal use)
  !     RESID(J)  Element residual (internal use)

  do i = 1, MAXSUP
    aupp(i) = 0.D0
  end do
  do i = 1, MAXSLO
    alow(i) = 0.D0
  end do
  do i = 1, MAXEQ
    rhs(i) = 0.D0
    diag(i) = 0.D0
  end do

  if ( neq<0 .or. neq>MAXEQ ) then
    write (IOW, 99001) neq, MAXEQ
    stop
  end if

  !     Check profile for errors
  do j = 2, neq
    nn = jpoin(j)
    if ( nn>MAXSUP .or. nn<0 ) then
      write (IOW, 99002) nn, MAXSUP
      stop
    end if
    jh = jpoin(j) - jpoin(j - 1)
    if ( jh>j ) then
      write (IOW, 99003)
      stop
    end if
    if ( ifl ) then
      if ( nn>MAXSLO ) write (IOW, 99002) nn, MAXSLO
    end if
  end do

  do lmn = 1, nelm

    !     Extract local coords, DOF and nodal state/props for the element

    ix = 0
    iu = 0
    is = 0

    do j = 1, iep(3, lmn)
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      nodpl(3, j) = nodpn(5, node)
      nodpl(4, j) = nodpn(7, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
      do n = 1, nodpn(5, node)
        iu = iu + 1
        duloc(iu) = du(nodpn(4, node) + n - 1)
        utloc(iu) = utot(nodpn(4, node) + n - 1)
      end do
      do n = 1, nodpn(7, node)
        is = is + 1
        stnloc(is) = stnod(nodpn(6, node) + n - 1)
      end do
    end do

    !     Form element stiffness

    call elstif(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         duloc, utloc, iu, stnloc, is, eprop(iep(4, lmn)),  &
         iep(5, lmn), svart(iep(6, lmn)), svaru(iep(6, lmn)),  &
         iep(7, lmn), stif, resid, MAXSTF,ifail)

    if (ifail==1) return

    !     --   Add element stiffness and residual to global array

    nsr = 0
    do i1 = 1, iep(3, lmn)
      node1 = icon(i1 + iep(2, lmn) - 1)
      do j1 = 1, nodpn(5, node1)
        irow = ieqs(j1 + nodpn(4, node1) - 1)
        nsr = nsr + 1
        rhs(irow) = rhs(irow) + resid(nsr)
        nsc = 0
        do i2 = 1, iep(3, lmn)
          node2 = icon(i2 + iep(2, lmn) - 1)
          do j2 = 1, nodpn(5, node2)
            icol = ieqs(j2 + nodpn(4, node2) - 1)
            nsc = nsc + 1
            if ( icol==irow ) then
              diag(irow) = diag(irow) + stif(nsr,nsc)
            else if ( icol>irow ) then
              nn = jpoin(icol) + irow - (icol - 1)
              aupp(nn) = aupp(nn) + stif(nsr,nsc)
              if ( ifl ) alow(nn) = alow(nn) + stif(nsc,nsr)
            end if
          end do
        end do
      end do
    end do
  end do

  do mpc = 1, nmpc

    !     set up stiffness for multi--point constraint

    node1 = lstmpc(2, mpc)
    idof1 = lstmpc(3, mpc)
    dumpc(1) = du(idof1 + nodpn(4, node1) - 1)
    utmpc(1) = utot(idof1 + nodpn(4, node1) - 1)
    node2 = lstmpc(4, mpc)
    idof2 = lstmpc(5, mpc)
    dumpc(2) = du(idof2 + nodpn(4, node2) - 1)
    utmpc(2) = utot(idof2 + nodpn(4, node2) - 1)
    rmult = rmpc(mpc)
    drmult = drmpc(mpc)
    ldof(1) = idof1
    ldof(2) = idof2

    call cnstrn(mpc, mpctyp, ldof, parmpc(lstmpc(6, mpc)),  &
         lstmpc(7, mpc), utmpc, dumpc, rmult, drmult, stfmpc, resmpc)


    !     --   Add stiffness and residual to global array

    do i1 = 1, 3
      if ( i1<3 ) then
        n1 = lstmpc(2*i1, mpc)
        id1 = lstmpc(2*i1 + 1, mpc)
        irow = ieqs(id1 + nodpn(4, n1) - 1)
      else
        irow = mpceq(mpc)
      end if
      rhs(irow) = rhs(irow) + resmpc(i1)
      do i2 = 1, 3
        if ( i2<3 ) then
          n2 = lstmpc(2*i2, mpc)
          id2 = lstmpc(2*i2 + 1, mpc)
          icol = ieqs(id2 + nodpn(4, n2) - 1)
        else
          icol = mpceq(mpc)
        end if
        if ( icol==irow ) then
          diag(irow) = diag(irow) + stfmpc(i1, i2)
        else if ( icol>irow ) then
          nn = jpoin(icol) + irow - (icol - 1)
          aupp(nn) = aupp(nn) + stfmpc(i1, i2)
          if ( ifl ) alow(nn) = alow(nn) + stfmpc(i2, i1)
        end if
      end do
    end do
  end do
!  Force a cutback if NaN is found in RHS.
  do n = 1, nops
    do j = 1, nodpn(5, n)
      if (rhs(ieqs(j + nodpn(4, n) - 1))==rhs(ieqs(j + nodpn(4, n) - 1))+1.d0) then
          write(IOW,*) ' NaN detected in residual '
          ifail = 1
          return
      endif
    end do
  end do

  do n = 1, nops
    do j = 1, nodpn(5, n)
      rfor(j + nodpn(4, n) - 1) = -rhs(ieqs(j + nodpn(4, n) - 1))
    end do
  end do

99001 format ( // '  ERROR DETECTED DURING STIFFNESS ASSEMBLY '/  &
       '     No. equations ', I10, ' Storage ', I10)
99002 format ( // ' ERROR DETECTED DURING STIFFNESS ASSEMBLY '/  &
       '   Profile pointer exceeds storage or is negative '/  &
       '   Pointer value ', I10, ' Storage ', I10)
99003 format ( // ' ERROR DETECTED DURING STIFFNESS ASSEMBLY '/  &
       '   Invalid column height detected in profile ')

end subroutine asstif

!
!====================Subroutine ASSRESID ======================
subroutine assresid(nelm, nops, nmpc, ifl, MAXCOR, MAXDOF, MAXSTN,  &
     MAXCON, MAXVAR, MAXPRP, MAXSLO, MAXSUP, MAXEQ,  &
     iep, icon, nodpn, x, utot, du, stnod, rfor,  &
     eprop, svart, svaru, lstmpc, parmpc, maxpmc,  &
     rmpc, drmpc, rhs, ieqs, mpceq, neq,ifail)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )         :: nelm                       
  integer, intent( in )         :: nops                       
  integer, intent( in )         :: nmpc                       
  logical, intent( in )         :: ifl                        
  integer, intent( in )         :: MAXCOR                     
  integer, intent( in )         :: MAXDOF                     
  integer, intent( in )         :: MAXSTN                     
  integer, intent( in )         :: MAXCON                     
  integer, intent( in )         :: MAXVAR                     
  integer, intent( in )         :: MAXPRP                     
  integer, intent( in )         :: MAXSLO                     
  integer, intent( in )         :: MAXSUP                     
  integer, intent( in )         :: MAXEQ                      
  integer, intent( in )         :: maxpmc                     
  integer, intent( in )         :: neq                        
  integer, intent( inout)       :: ifail
  integer, intent( inout )      :: iep(7, nelm)               
  integer, intent( in )         :: icon(MAXCON)               
  integer, intent( inout )      :: nodpn(7, nops)             
  integer, intent( in )         :: lstmpc(7, nmpc)            
  integer, intent( in )         :: ieqs(MAXDOF)               
  integer, intent( in )         :: mpceq(nmpc)                
  real( prec ), intent( in )    :: x(MAXCOR)                     
  real( prec ), intent( in )    :: utot(MAXDOF)                  
  real( prec ), intent( in )    :: du(MAXDOF)                    
  real( prec ), intent( in )    :: stnod(MAXSTN)                 
  real( prec ), intent( out )   :: rfor(MAXDOF)                  
  real( prec ), intent( inout ) :: eprop(MAXPRP)                 
  real( prec ), intent( inout ) :: svart(MAXVAR)                 
  real( prec ), intent( inout ) :: svaru(MAXVAR)                 
  real( prec ), intent( inout ) :: parmpc(maxpmc)             
  real( prec ), intent( in )    :: rmpc(nmpc)                 
  real( prec ), intent( in )    :: drmpc(nmpc)                
  real( prec ), intent( inout ) :: rhs(MAXEQ)                 

  ! Local Variables
  real( prec ) :: drmult, duloc, dumpc, resid, resmpc,  &
       rmult, stfmpc, stif, stnloc
  real( prec ) :: utloc, utmpc, xloc
  integer      :: i, i1, i2, icol, id1, id2, idof1, idof2, irow, &
       is, iu, ix, j, j1, j2, jh
  integer      :: ldof, lmn,  mpc, mpctyp, n, n1, n2
  integer      :: nn, node, node1, node2, nodpl, nsc, nsr

  dimension ldof(2), dumpc(2), utmpc(2)
  dimension stfmpc(3, 3), resmpc(3)

  dimension nodpl(4, MAXNDL)
  dimension xloc(MAXCRL)
  dimension utloc(MAXDFL), duloc(MAXDFL)
  dimension stnloc(MAXSNL)
  dimension stif(MAXSTF, MAXSTF), resid(MAXSTF)

  !     Subroutine to assemble global residual force vector, without stiffness
  !     (useful for problems where the stiffness is constant and can be factored once)

  !     NELM           No. elements
  !     NOPS           No. nodal points
  !     NMPC           No. multi--point constraints
  !     IFL            Set to .TRUE. for unsymmetric matrix

  !     MAXCOR         Max no. coords (dimension)
  !     MAXDOF         Max no. DOF (dimension)
  !     MAXCON         Max size of connectivity array (dimension only)
  !     MAXVAR         Max no. state variables (dimension)
  !     MAXSTF         Max dimension of  element stiffness
  !     MAXSLO         Max size of lower stiffness matrix
  !     MAXSUP         Max size of upper stiffness matrix
  !     MAXEQ          Max no. equations

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

 
  !     IEQS(J)       Equation no. array.  Equation nos for DOF associated with Nth node
  !     begin at IEQS(NODPN(4,N)) and end at IEQS(NODPN(4,N)+NODPN(5,N))

  !     NODPL(I,J)  Local nodal pointer: NODPL(1,J) is a user--defined identification flag;
  !     NODPL(2,J) specifies no. coords associated
  !     with Jth node on an element; NODPL(3,J) specifies no. DOF associated
  !     with Jth node on an element; NODPL(4,J) specifies no. state vars/props
  !     associated with Jth node on element
  !     XLOC(j)     Array specifying local nodal coords on an element.
  !     Coords are stored so that XLOC(1) is first coord of first node,
  !     XLOC(2) is second coord of first node, etc
  !     DULOC(j)    Current approx increment in local DOF on an element.  Same storage
  !     scheme as for XLOC.
  !     UTLOC(j)    Current approx to accumulated DOF an element
  !     STNLOC(I)   Ith nodal state.  Storage scheme is the same as for XLOC.


  !     STIF(I,J) Element stiffness matrix (internal use)
  !     RESID(J)  Element residual (internal use)

  rhs(1:MAXEQ) = 0.d0

  if ( neq<0 .or. neq>MAXEQ ) then
    write (IOW, 99001) neq, MAXEQ
    stop
  end if

  
  do lmn = 1, nelm

    !     Extract local coords, DOF and nodal state/props for the element

    ix = 0
    iu = 0
    is = 0

    do j = 1, iep(3, lmn)
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      nodpl(3, j) = nodpn(5, node)
      nodpl(4, j) = nodpn(7, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
      do n = 1, nodpn(5, node)
        iu = iu + 1
        duloc(iu) = du(nodpn(4, node) + n - 1)
        utloc(iu) = utot(nodpn(4, node) + n - 1)
      end do
      do n = 1, nodpn(7, node)
        is = is + 1
        stnloc(is) = stnod(nodpn(6, node) + n - 1)
      end do
    end do

   !     Form element stiffness

    call elstif(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         duloc, utloc, iu, stnloc, is, eprop(iep(4, lmn)),  &
         iep(5, lmn), svart(iep(6, lmn)), svaru(iep(6, lmn)),  &
         iep(7, lmn), stif, resid, MAXSTF,ifail)

    if (ifail==1) return

    !     --   Add element stiffness and residual to global array

    nsr = 0
    do i1 = 1, iep(3, lmn)
      node1 = icon(i1 + iep(2, lmn) - 1)
      do j1 = 1, nodpn(5, node1)
        irow = ieqs(j1 + nodpn(4, node1) - 1)
        nsr = nsr + 1
        rhs(irow) = rhs(irow) + resid(nsr)
      end do
    end do
  end do
  
  do mpc = 1, nmpc

    !     set up stiffness for multi--point constraint

    node1 = lstmpc(2, mpc)
    idof1 = lstmpc(3, mpc)
    dumpc(1) = du(idof1 + nodpn(4, node1) - 1)
    utmpc(1) = utot(idof1 + nodpn(4, node1) - 1)
    node2 = lstmpc(4, mpc)
    idof2 = lstmpc(5, mpc)
    dumpc(2) = du(idof2 + nodpn(4, node2) - 1)
    utmpc(2) = utot(idof2 + nodpn(4, node2) - 1)
    rmult = rmpc(mpc)
    drmult = drmpc(mpc)
    ldof(1) = idof1
    ldof(2) = idof2

    call cnstrn(mpc, mpctyp, ldof, parmpc(lstmpc(6, mpc)),  &
         lstmpc(7, mpc), utmpc, dumpc, rmult, drmult, stfmpc, resmpc)

    !     --   Add stiffness and residual to global array

    do i1 = 1, 3
      if ( i1<3 ) then
        n1 = lstmpc(2*i1, mpc)
        id1 = lstmpc(2*i1 + 1, mpc)
        irow = ieqs(id1 + nodpn(4, n1) - 1)
      else
        irow = mpceq(mpc)
      end if
      rhs(irow) = rhs(irow) + resmpc(i1)
    end do
  end do

  do n = 1, nops
    do j = 1, nodpn(5, n)
      rfor(j + nodpn(4, n) - 1) = -rhs(ieqs(j + nodpn(4, n) - 1))
    end do
  end do

99001 format ( // '  ERROR DETECTED DURING STIFFNESS ASSEMBLY '/  &
       '     No. equations ', I10, ' Storage ', I10)
99002 format ( // ' ERROR DETECTED DURING STIFFNESS ASSEMBLY '/  &
       '   Profile pointer exceeds storage or is negative '/  &
       '   Pointer value ', I10, ' Storage ', I10)
99003 format ( // ' ERROR DETECTED DURING STIFFNESS ASSEMBLY '/  &
       '   Invalid column height detected in profile ')

end subroutine assresid

!====================Subroutine BCONS=======================
subroutine bcons(ifl, nops, nelm, MAXCOR, MAXDOF, MAXCON, MAXSLO,  &
     MAXSUP, MAXEQ, icon, iep, nodpn, x, utot, du,  &
     eprop, MAXPRP, nfix, lstfix, dofval, umag, nfor,  &
     lstfor, forval, fmag, ndload, lstlod, dlpars,MAXDPR,dlmag, rhs,  &
     alow, aupp, diag, ieqs, jpoin, neq)
  use Types
  use ParamIO
  use Paramsol
  use Globals, only: TIME,DTIME
  implicit none

  logical, intent( inout )      :: ifl                          
  integer, intent( inout )      :: nops                         
  integer, intent( inout )      :: nelm                         
  integer, intent( in )         :: MAXCOR                       
  integer, intent( in )         :: MAXDOF                       
  integer, intent( in )         :: MAXCON                       
  integer, intent( in )         :: MAXSLO                       
  integer, intent( in )         :: MAXSUP                       
  integer, intent( in )         :: MAXEQ                        
  integer, intent( in )         :: MAXPRP
  integer, intent( in )         :: MAXDPR                        
  integer, intent( in )         :: nfix                         
  integer, intent( in )         :: nfor                         
  integer, intent( in )         :: ndload                       
  integer, intent( inout )      :: neq                          
  integer, intent( in )         :: icon(MAXCON)                 
  integer, intent( inout )      :: iep(7, nelm)                 
  integer, intent( in )         :: nodpn(7, nops)               
  integer, intent( in )         :: lstfix(2, nfix)              
  integer, intent( in )         :: lstfor(2, nfor)              
  integer, intent( in )         :: lstlod(5, ndload)            
  integer, intent( in )         :: ieqs(MAXDOF)                 
  integer, intent( inout )      :: jpoin(MAXEQ)                 
  real( prec ), intent( in )    :: umag                         
  real( prec ), intent( in )    :: fmag                         
  real( prec ), intent( in )    :: dlmag                        
  real( prec ), intent( in )    :: x(MAXCOR)                    
  real( prec ), intent( inout ) :: utot(MAXDOF)                 
  real( prec ), intent( in )    :: du(MAXDOF)                   
  real( prec ), intent( inout ) :: eprop(MAXPRP)                
  real( prec ), intent( in )    :: dofval(nfix)                 
  real( prec ), intent( in )    :: forval(nfor)
  real( prec ), intent( in )    :: dlpars(MAXDPR)                 
  real( prec ), intent( inout ) :: rhs(MAXEQ)                   
  real( prec ), intent( inout ) :: alow(MAXSLO)                 
  real( prec ), intent( inout ) :: aupp(MAXSUP)                 
  real( prec ), intent( inout ) :: diag(MAXEQ)                  

  ! Local Variables
  real( prec ) :: resid, ucur, value, xloc
  integer      :: icount, idof, ifac, iflg, ix, j, l, lmn,  &
       n, nnode, node, nodpl, npresc, iopt

  dimension nodpl(4, MAXNDL)
  dimension resid(MAXSTF), xloc(MAXCRL)

  !     Subroutine to apply prescribed boundary conditions
  !     Magnitude of prescribed DOF is DOFVAL(N)*UMAG
  !     Magnitude of prescribed force is FORVAL(N)*FMAG
  !     Magnitude of distributed load is RESID(N)*DLMAG
  !     where RESID is element contribution to residual,
  !     computed in subroutine DLOAD

  !     LSTFIX    List of nodes with prescribed DOFs
  !     LSTFIX(1,N) node number
  !     LSTFIX(2,N) DOF number
  !     NFIX      Total no. of prescribed DOF
  !     DOFVAL(N) Value of Nth constrained doF

  !     LSTFOR    List of nodes with prescribed external forces
  !     LSTFOR(1,N) node number
  !     LSTFOR(2,N) Force direction
  !     NFOR      Total no. of prescribed forces
  !     FORVAL(N) Value of Nth prescribed force

  !     LSTLOD    List of elements with distributed loads
  !     LSTLOD(1,N) Element number
  !     LSTLOD(2,N) Face number of element.  Sign controls whether traction is computed using user subroutine
  !     LSTLOD(3,N) Pointer to properties controlling distributed load in array DLPARS.
  !     LSTLOD(4,N) Number of properties controlling distributed load
  !     LSTLOD(5,N) Flag controlling distributed load type

  !     NDLOAD    Total no. elements with distributed loads

  !     NODPL(I,J)  Local nodal pointer: NODPL(1,J) is a user--defined identification flag;
  !     NODPL(2,J) specifies no. coords associated
  !     with Jth node on an element; NODPL(3,J) specifies no. DOF associated
  !     with Jth node on an element.

  !     -- Distributed loads


  do l = 1, ndload
    lmn = lstlod(1, l)
    ifac = iabs(lstlod(2, l))
    nnode = iep(3, lmn)
    ix = 0
    do j = 1, nnode
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      nodpl(3, j) = nodpn(5, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
    end do



    call dload(lmn, iep(1, lmn), nnode, nodpl, eprop(iep(4, lmn)),  &
           iep(5, lmn), xloc, ix, ifac,lstlod(5,l), dlpars(iabs(lstlod(3,l))),lstlod(4,l), resid, MAXSTF)
 
    icount = 0
    do n = 1, nnode
      node = icon(n + iep(2, lmn) - 1)
      do j = 1, nodpn(5, node)
        icount = icount + 1
        npresc = ieqs(j + nodpn(4, node) - 1)
        rhs(npresc) = rhs(npresc) + resid(icount)*dlmag
      end do
    end do
  end do

  !     -- Prescribed nodal forces

  do n = 1, nfor
    node = lstfor(1, n)
    idof = lstfor(2, n)
    npresc = ieqs(idof + nodpn(4, node) - 1)
    rhs(npresc) = rhs(npresc) + forval(n)*fmag
  end do

  !     -- Prescribed DOFs
  do n = 1, nfix
    idof = iabs(lstfix(2, n))
    node = lstfix(1, n)
    if (lstfix(2,n)>0) then
      ucur = du(idof + nodpn(4, node) - 1) + utot(idof + nodpn(4, node) - 1)
    else
      ucur = du(idof + nodpn(4, node) - 1) 
    endif
    value = umag*dofval(n) - ucur
    call fixdof(idof, node, value, ifl, nops, MAXDOF, MAXSLO,  &
         MAXSUP, MAXEQ, rhs, alow, aupp, diag, nodpn, ieqs, jpoin, neq)
  end do

end subroutine bcons


!====================Subroutine FIXDOF =======================
subroutine fixdof(idof, node, value, ifl, nops, MAXDOF, MAXSLO,  &
     MAXSUP, MAXEQ, rhs, alow, aupp, diag, nodpn, ieqs, jpoin, neq)
  use Types
  implicit none

  integer, intent( inout )      :: idof                     
  integer, intent( inout )      :: node                     
  integer, intent( inout )      :: nops                     
  integer, intent( in )         :: MAXDOF                   
  integer, intent( in )         :: MAXSLO                   
  integer, intent( in )         :: MAXSUP                   
  integer, intent( in )         :: MAXEQ                    
  integer, intent( in )         :: neq                      
  integer, intent( in )         :: nodpn(7, nops)           
  integer, intent( in )         :: ieqs(MAXDOF)             
  integer, intent( in )         :: jpoin(MAXEQ)             
  logical, intent( in )         :: ifl                      
  real( prec ), intent( in )    :: value                    
  real( prec ), intent( inout ) :: rhs(MAXEQ)               
  real( prec ), intent( out )   :: alow(MAXSLO)             
  real( prec ), intent( inout ) :: aupp(MAXSUP)             
  real( prec ), intent( out )   :: diag(MAXEQ)              

  ! Local Variables
  integer :: i, idis, ihgt,  mod, n, ncol, nn

  !     Subroutine to modify stiffnes matrix so as to prescribe
  !     IDOFth DOF on node NODE

  !     -- Modify diagonal and RHS
  n = ieqs(idof + nodpn(4, node) - 1)
  !     --  Modify upper half of stiffness
  do ncol = n + 1, neq
    idis = ncol - n
    ihgt = jpoin(ncol) - jpoin(ncol - 1)
    if ( idis<=ihgt ) then
      nn = jpoin(ncol) - idis + 1
      if ( .not.ifl ) rhs(ncol) = rhs(ncol) - aupp(nn)*value
      aupp(nn) = 0.D0
    end if
  end do
  !     --  Modify lower half of stiffness, or...
  if ( ifl ) then
    if ( n>1 ) then
      do i = jpoin(n - 1) + 1, jpoin(n)
        alow(i) = 0.D0
      end do
    end if
    !     --  ... symmetrize equations
  else if ( n>1 ) then
    mod = n
    do i = jpoin(n), jpoin(n - 1) + 1, -1
      mod = mod - 1
      rhs(mod) = rhs(mod) - aupp(i)*value
      aupp(i) = 0.D0
    end do
  end if

  diag(n) = 1.D0
  rhs(n) = value

end subroutine fixdof

!====================Subroutine MODIFY_BCONS=======================
subroutine modify_bcons(ifl, nops, nelm, MAXCOR, MAXDOF, MAXCON, MAXSLO,  &
     MAXSUP, MAXEQ, icon, iep, nodpn, x, utot, du,  &
     eprop, MAXPRP, nfix, lstfix, dofval, umag, nfor,  &
     lstfor, forval, fmag, ndload, lstlod, dlpars,MAXDPR,dlmag, rhs,  &
     alow, aupp, diag, ieqs, jpoin, neq)
  use Types
  use ParamIO
  use Paramsol
  use Globals, only: TIME,DTIME
  implicit none

  logical, intent( inout )      :: ifl                          
  integer, intent( inout )      :: nops                         
  integer, intent( inout )      :: nelm                         
  integer, intent( in )         :: MAXCOR                       
  integer, intent( in )         :: MAXDOF                       
  integer, intent( in )         :: MAXCON                       
  integer, intent( in )         :: MAXSLO                       
  integer, intent( in )         :: MAXSUP                       
  integer, intent( in )         :: MAXEQ                        
  integer, intent( in )         :: MAXPRP
  integer, intent( in )         :: MAXDPR                      
  integer, intent( in )         :: nfix                         
  integer, intent( in )         :: nfor                         
  integer, intent( in )         :: ndload                       
  integer, intent( inout )      :: neq                          
  integer, intent( in )         :: icon(MAXCON)                 
  integer, intent( inout )      :: iep(7, nelm)                 
  integer, intent( in )         :: nodpn(7, nops)               
  integer, intent( in )         :: lstfix(2, nfix)              
  integer, intent( in )         :: lstfor(2, nfor)              
  integer, intent( in )         :: lstlod(5, ndload)            
  integer, intent( in )         :: ieqs(MAXDOF)                 
  integer, intent( inout )      :: jpoin(MAXEQ)              
  real( prec ), intent( in )    :: umag                         
  real( prec ), intent( in )    :: fmag                         
  real( prec ), intent( in )    :: dlmag                        
  real( prec ), intent( in )    :: x(MAXCOR)                    
  real( prec ), intent( inout ) :: utot(MAXDOF)                 
  real( prec ), intent( in )    :: du(MAXDOF)                   
  real( prec ), intent( inout ) :: eprop(MAXPRP)                
  real( prec ), intent( in )    :: dofval(nfix)                 
  real( prec ), intent( in )    :: forval(nfor)
  real( prec ), intent( in )    :: dlpars(MAXDPR)                 
  real( prec ), intent( inout ) :: rhs(MAXEQ)                   
  real( prec ), intent( inout ) :: alow(MAXSLO)                 
  real( prec ), intent( inout ) :: aupp(MAXSUP)                 
  real( prec ), intent( inout ) :: diag(MAXEQ)                  
  ! Local Variables
  real( prec ) :: resid, ucur, value, xloc
  integer      :: icount, idof, ifac, iflg, ix, j, l, lmn,  &
       n, nnode, node, nodpl, npresc, iopt, ipoin, lenccl

  dimension nodpl(4, MAXNDL)
  dimension resid(MAXSTF), xloc(MAXCRL)

  !     Subroutine to reapply prescribed boundary conditions, but without changing
  !     stiffness matrix
  !     Magnitude of prescribed DOF is DOFVAL(N)*UMAG
  !     Magnitude of prescribed force is FORVAL(N)*FMAG
  !     Magnitude of distributed load is RESID(N)*DLMAG
  !     where RESID is element contribution to residual,
  !     computed in subroutine DLOAD

  !     LSTFIX    List of nodes with prescribed DOFs
  !     LSTFIX(1,N) node number
  !     LSTFIX(2,N) DOF number
  !     NFIX      Total no. of prescribed DOF
  !     DOFVAL(N) Value of Nth constrained doF

  !     LSTFOR    List of nodes with prescribed external forces
  !     LSTFOR(1,N) node number
  !     LSTFOR(2,N) Force direction
  !     NFOR      Total no. of prescribed forces
  !     FORVAL(N) Value of Nth prescribed force

  !     LSTLOD    List of elements with distributed loads
  !     LSTLOD(1,N) Element number
  !     LSTLOD(2,N) Face number of element.  Sign controls whether traction is computed using user subroutine
  !     LSTLOD(3,N) Pointer to properties controlling distributed load in array DLPARS.
  !     LSTLOD(4,N) Number of properties controlling distributed load
  !     LSTLOD(5,N) Flag controlling distributed load type

  !     NDLOAD    Total no. elements with distributed loads

  !     NODPL(I,J)  Local nodal pointer: NODPL(1,J) is a user--defined identification flag;
  !     NODPL(2,J) specifies no. coords associated
  !     with Jth node on an element; NODPL(3,J) specifies no. DOF associated
  !     with Jth node on an element.

  !     -- Distributed loads

  do l = 1, ndload
    lmn = lstlod(1, l)
    ifac = iabs(lstlod(2, l))
    nnode = iep(3, lmn)
    ix = 0
    do j = 1, nnode
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      nodpl(3, j) = nodpn(5, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
    end do

    call dload(lmn, iep(1, lmn), nnode, nodpl, eprop(iep(4, lmn)),  &
           iep(5, lmn), xloc, ix, ifac,lstlod(5,l), dlpars(iabs(lstlod(3,l))),lstlod(4,l), resid, MAXSTF)
 
    icount = 0
    do n = 1, nnode
      node = icon(n + iep(2, lmn) - 1)
      do j = 1, nodpn(5, node)
        icount = icount + 1
        npresc = ieqs(j + nodpn(4, node) - 1)
        rhs(npresc) = rhs(npresc) + resid(icount)*dlmag
      end do
    end do
  end do

  !     -- Prescribed nodal forces

  do n = 1, nfor
    node = lstfor(1, n)
    idof = lstfor(2, n)
    npresc = ieqs(idof + nodpn(4, node) - 1)
    rhs(npresc) = rhs(npresc) + forval(n)*fmag
  end do

  if (.not.ifl) then
     write(IOW,*) ' Error detected in subroutine modify_bcons '
     write(IOW,*) ' Modifying BCs with fixed stiffness can only be done on an unsymmetric stiffness '
     stop
  endif

  !     -- Prescribed DOFs
  do n = 1, nfix
    idof = iabs(lstfix(2, n))
    node = lstfix(1, n)
    if (lstfix(2,n)>0) then
      ucur = du(idof + nodpn(4, node) - 1) + utot(idof + nodpn(4, node) - 1)
    else
      ucur = du(idof + nodpn(4, node) - 1) 
    endif
    value = umag*dofval(n) - ucur
    rhs(ieqs(idof + nodpn(4, node) - 1)) = value
 
  end do

end subroutine modify_bcons



!====================Subroutine INSTIF =======================
subroutine instif(dunorm, cnorm,rnorm, nops, nmpc, ifl, MAXDOF, MAXSLO,  &
     MAXSUP, MAXEQ, nodpn, du, drmpc, rhs, alow,  &
     aupp, diag, ieqs, mpceq, jpoin, neq)
  use Types
  implicit none

  integer, intent( in )         :: nops                           
  integer, intent( in )         :: nmpc                           
  integer, intent( in )         :: MAXDOF                         
  integer, intent( in )         :: MAXSLO                         
  integer, intent( in )         :: MAXSUP                         
  integer, intent( in )         :: MAXEQ                          
  integer, intent( in )         :: neq                            
  integer, intent( in )         :: nodpn(7, nops)                 
  integer, intent( inout )      :: ieqs(MAXDOF)                   
  integer, intent( inout )      :: mpceq(nmpc)                    
  integer, intent( inout )      :: jpoin(MAXEQ)                   
  logical, intent( in )         :: ifl                            
  real( prec ), intent( out )   :: dunorm                         
  real( prec ), intent( out )   :: cnorm                          
  real( prec ), intent( out )   :: rnorm                          
  real( prec ), intent( inout ) :: du(MAXDOF)                     
  real( prec ), intent( inout ) :: drmpc(nmpc)                    
  real( prec ), intent( inout ) :: rhs(MAXEQ)                     
  real( prec ), intent( inout ) :: alow(MAXSLO)                   
  real( prec ), intent( inout ) :: aupp(MAXSUP)                   
  real( prec ), intent( inout ) :: diag(MAXEQ)                    

  ! Local Variables
  integer :: ipoin, j, mpc,  n
  
  rnorm = 0.D0
  do n = 1, nops
    do j = 1, nodpn(5, n)
      ipoin = j + nodpn(4, n) - 1
      rnorm = rnorm + rhs(ieqs(ipoin))*rhs(ieqs(ipoin))
    end do
  end do
  do mpc = 1, nmpc
    rnorm = rnorm + rhs(mpceq(mpc))*rhs(mpceq(mpc))
  end do

  if ( ifl ) then
    call tri(ifl, alow, aupp, diag, jpoin, neq)
    call solv(alow, aupp, diag, rhs, jpoin, neq)
  else
    call tri(ifl, aupp, aupp, diag, jpoin, neq)
    call solv(aupp, aupp, diag, rhs, jpoin, neq)

  end if

  dunorm = 0.D0
  cnorm = 0.D0
  do n = 1, nops
    do j = 1, nodpn(5, n)
      ipoin = j + nodpn(4, n) - 1
      du(ipoin) = du(ipoin) + rhs(ieqs(ipoin))
      dunorm = dunorm + du(ipoin)*du(ipoin)
      cnorm = cnorm + rhs(ieqs(ipoin))*rhs(ieqs(ipoin))
    end do
  end do
  do mpc = 1, nmpc
    drmpc(mpc) = drmpc(mpc) + rhs(mpceq(mpc))
    dunorm = dunorm + drmpc(mpc)*drmpc(mpc)
    cnorm = cnorm + rhs(mpceq(mpc))*rhs(mpceq(mpc))
  end do
  if ( neq==0 ) stop
  dunorm = dsqrt(dunorm)/dble(neq)
  cnorm = dsqrt(cnorm)/dble(neq)
  rnorm = dsqrt(rnorm)/dble(neq)

end subroutine instif

!=====================Subroutine SOLV =========================
subroutine solv(alow, aupp, diag, rhs, jpoin, neq)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: neq                      
  integer, intent( in )         :: jpoin(1)                 
  real( prec ), intent( inout ) :: alow(1)                  
  real( prec ), intent( inout ) :: aupp(1)                  
  real( prec ), intent( in )    :: diag(1)                  
  real( prec ), intent( inout ) :: rhs(1)                   

  ! Local Variables
  real( prec )  dot, zero
  integer :: is, j, jh, jr

  data zero/0.D0/

  !     --- Solution of equations stored in profile form
  !     Coefficient matrix must be decomposed using TRI
  !     before calling SOLV

  !     --- Find first nonzero term in rhs

  do is = 1, neq
    if ( rhs(is) /= zero ) goto 100
  end do

  write (IOW, 99001)
  rhs = 0.D0
  return


  !     --- Reduce RHS

100 if ( is < neq ) then
    do j = is + 1, neq
      jr = jpoin(j - 1)
      jh = jpoin(j) - jr
      if ( jh > 0 ) rhs(j) = rhs(j) - dot_product(alow(jr + 1:jr+jh), rhs(j - jh:j-1))
    end do
  end if

  !     --- Multiply by inverse of diagonal elements

  do j = is, neq
    rhs(j) = rhs(j)*diag(j)
  end do

  !     --- Back substitution

  if ( neq > 1 ) then
    do j = neq, 2, -1
      jr = jpoin(j - 1)
      jh = jpoin(j) - jr
      if ( jh>0 ) call saxpb(aupp(jr + 1), rhs(j - jh), -rhs(j), jh,  &
           rhs(j - jh))
    end do
  end if

99001 format ( // ' ***** SOLVER WARNING ***** '/, &
           ' Zero RHS found in SOLV ')

end subroutine solv

!====================Subroutine RANTST =======================
subroutine rantst(aupp, jh, ranval)
  use Types
  implicit none

  integer, intent( in )         :: jh
  real( prec ), intent( out )   :: ranval
  real( prec ), intent( inout ) :: aupp(jh)

  ! Local Variables
  real( prec ) :: zero
  integer      :: j

  data zero/0.D0/

  !     TEST FOR RANK

  ranval = zero
  do j = 1, jh
    ranval = ranval + dabs(aupp(j))
  end do

end subroutine rantst


!=====================Subroutine TRI =========================
subroutine tri(ifl, alow, aupp, diag, jpoin, neq)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: neq                
  integer, intent( in )         :: jpoin(1)           
  logical, intent( in )         :: ifl                
  real( prec ), intent( inout ) :: alow(1)            
  real( prec ), intent( out )   :: aupp(1)            
  real( prec ), intent( inout ) :: diag(1)            

  ! Local Variables
  real( prec ) :: daval, dd, dfig, dimn, dimx, dot, one, tol, zero
  integer      :: i, id, idh, ie, ifig, ih, is, j, jd, jh, jr, jrh

  data zero, one/0.D0, 1.D0/, tol/0.5D-07/

  !     Triangular decomposition of a matrix stored in profile form
  !     A decomposed to A = LU

  !     ALOW(I)  Coefficients of stiffness matrix below diagonal,
  !     stored rowwise
  !     Replaced by factor DIAG . U on exit
  !     AUPP(I)   Coefficients above diagonal, stored columnwise
  !     Replaced by L on exit
  !     DIAG(I)  Diagonals of stiffness matrix, replaced by
  !     reciprocal diagonals of U
  !     JPOIN(I) Pointer to last element in each row/column
  !     of ALOW/AUPP respectively
  !     NEQ      No. of equations
  !     IFL      Set to .TRUE for unsymmetric matrices

  !     Detailed description of storage:
  !     For array
  !     |  K11  K12   K13   0   0  |
  !     |  K21  K22   K23  K24  0  |
  !     |  K31  K32   K33  K34 K35 |
  !     |  0    K42   K43  K44 K45 |
  !     |  0    0     K53  K54 K55 |

  !     AUPP =  [K12   K13 K23   K24 K34   K35 K45]
  !     ALOW = [K21   K31 K32   K42 K43   K53 K54]
  !     DIAG = [K11 K22 K33 K44 K55]
  !     JPOIN = [0  1  3  5  7]

  !     --- Set initial values for conditioning check
  dimx = zero
  dimn = zero
  dfig = zero
  do i = 1, neq
    dimn = max(dimn, dabs(diag(i)))
  end do

  !     --- Loop through columns to perform triangular decomposition
  jd = 1
  do j = 1, neq
    jr = jd + 1
    jd = jpoin(j)
    jh = jd - jr
    if ( jh > 0 ) then
      is = j - jh
      ie = j - 1

      !     ---  If diagonal is zero compute a norm for singularity test
      if ( diag(j) == zero ) call rantst(aupp(jr), jh, daval)
      do i = is, ie
        jr = jr + 1
        id = jpoin(i)
        ih = min(id - jpoin(i - 1), i - is + 1)
        if ( ih > 0 ) then
          jrh = jr - ih
          idh = id - ih + 1
!uncomment next lines 
!          aupp(jr) = aupp(jr) - dot(aupp(jrh), alow(idh), ih)
!          if ( ifl ) alow(jr) = alow(jr) - dot(alow(jrh), aupp(idh), ih)
          aupp(jr) = aupp(jr) - dot_product(aupp(jrh:jrh+ih-1), alow(idh:idh+ih-1))
          if ( ifl ) alow(jr) = alow(jr) - dot_product(alow(jrh:jrh+ih-1), aupp(idh:idh+ih-1))
        end if
      end do
    end if

    !     ---   Reduce the diagonal
    if ( jh >= 0 ) then
      dd = diag(j)
      jr = jd - jh
      jrh = j - jh - 1
      call dredu(alow(jr), aupp(jr), diag(jrh), jh + 1, ifl, diag(j) )

      !     ---   Check for conditioning errors and print warnings
      if ( dabs(diag(j)) < tol*dabs(dd) ) write (IOW, 99001) j
!      if ( dd < zero .and. diag(j) > zero ) write (IOW, 99002) j
!      if ( dd > zero .and. diag(j) < zero ) write (IOW, 99002) j
      if ( diag(j) == zero ) then
        if ( j/=neq ) write (IOW, 99003) j
      end if
      if ( dd == zero .and. jh > 0 ) then
        if ( dabs(diag(j)) < tol*daval ) write (IOW, 99004) j
      end if
    end if

    !     ---    Store reciprocal of diagonal, compute condition checks
    if ( diag(j) /= zero ) then
      dimx = max(dimx, dabs(diag(j)))
      dimn = min(dimn, dabs(diag(j)))
      dfig = max(dfig, dabs(dd/diag(j)))
      diag(j) = one/diag(j)
    else
      diag(j) = one
    end if

  end do

  !     ---  Print conditioning information
  dd = zero
  if ( dimn /= zero ) dd = dimx/dimn
  ifig = int(dlog10(dfig) + 0.6)
  if ( IWT == 1 ) write (IOW, 99005) dimx, dimn, dd, ifig


99001 format (/' **** SOLVER WARNING 1 **** '/  &
       '  Loss of at least 7 digits in reducing diagonal', ' of equation ', i5)
99002 format (/' **** SOLVER WARNING 2 **** '/  &
       '  Sign of diagonal changed when reducing equation', i5)
99003 format (/' **** SOLVER WARNING 3 **** '/  &
       '  Reduced diagonal is zero for equation ', i5)
99004 format (/' **** SOLVER WARNING 4 **** '/  &
       '  Rank failure for zero unreduced diagonal in ', 'equation', i5)
99005 format ( // ' SOLVER has completed stiffness decomposition '/  &
       '    Conditioning information: '/  &
       '      Max diagonal in reduced matrix:   ',  &
       e11.4/'      Min diagonal in reduced matrix:   ',  &
       e11.4/'      Ratio:                            ',  &
       e11.4/'      Maximum no. diagonal digits lost: ', i3)

end subroutine tri

!========================Subroutine DREDU =========================
subroutine dredu(alow, aupp, diag, jh, ifl, dj)
  use Types
  implicit none

  integer, intent( in )         :: jh
  logical, intent( in )         :: ifl
  real( prec ), intent( inout ) :: alow(1)
  real( prec ), intent( inout ) :: aupp(1)
  real( prec ), intent( in )    :: diag(1)
  real( prec ), intent( inout )   :: dj

  ! Local Variables
  real( prec ) :: ud
  integer      :: j

  !     Reduce diagonal element in triangular decomposition
  do j = 1, jh
    ud = aupp(j)*diag(j)
    dj = dj - alow(j)*ud
    aupp(j) = ud
  end do

  !     --- Finish computation of column of alow for unsymmetric matrices
  if ( ifl ) then
    do j = 1, jh
      alow(j) = alow(j)*diag(j)
    end do
  end if

end subroutine dredu

!=========================Function DOT ========================
function dot(a, b, n)
  use Types
  implicit none

  real( prec ), intent( in ) :: a(1)
  real( prec ), intent( in ) :: b(1)
  integer, intent( in )      :: n
  real( prec )               :: dot

  ! Local Variables
  real( prec ) :: zero
  integer      :: i

  data zero/0.D0/

  !     DOT PRODUCT OF A AND B
  dot = zero
  do i = 1, n
    dot = dot + a(i)*b(i)
  end do

end function dot


!=========================Subroutine SAXPB ======================
subroutine saxpb(a, b, x, n, c)
  use Types
  implicit none

  integer, intent( in )       :: n
  real( prec ), intent( in )  :: x                      
  real( prec ), intent( in )  :: a(1)                   
  real( prec ), intent( in )  :: b(1)                   
  real( prec ), intent( out ) :: c(1)

  ! Local Variables
  integer :: k

  !     SCALAR TIMES VECTOR ADDED TO SECOND VECTOR
  do k = 1, n
    c(k) = a(k)*x + b(k)
  end do

end subroutine saxpb

!========================Subroutine PROFIL ====================
subroutine profil(nops, nelm, nmpc, MAXDOF, MAXCON, MAXEQ,MAXNND, MAXSUP,  &
     MAXSLO, ifl,solvertype, icon, iep, numnod, nodpn, lstmpc, &
     ieqs, mpceq, jpoin, neq)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )    :: nops                           
  integer, intent( in )    :: nelm                           
  integer, intent( in )    :: nmpc                           
  integer, intent( in )    :: MAXDOF                         
  integer, intent( in )    :: MAXCON                         
  integer, intent( in )    :: MAXEQ
  integer, intent( in )    :: MAXNND                          
  integer, intent( in )    :: MAXSUP                         
  integer, intent( in )    :: MAXSLO                         
  integer, intent( in )    :: solvertype
  integer, intent( out )   :: neq                            
  integer, intent( in )    :: icon(MAXCON)                   
  integer, intent( inout ) :: iep(7, nelm)                   
  integer, intent( inout ) :: numnod(MAXNND)                   
  integer, intent( in )    :: nodpn(7, nops)                 
  integer, intent( in )    :: lstmpc(7, nmpc)                
  integer, intent( out )   :: ieqs(MAXDOF)                   
  integer, intent( out )   :: mpceq(nmpc)                    
  integer, intent( inout ) :: jpoin(MAXEQ)                   
  logical, intent( in )    :: ifl                            

  ! Local Variables
  real( prec ) :: bwmn, bwrms
  integer      :: i, ibwmax, ibwmn, ibwrms, ipn, istop, j, jeq, jpold, lmn
  integer      :: mineq, mpc, n, nnode, node

  !     Subroutine to initialize profile storage of global
  !     stiffness matrix

  !     NUMNOD(I)     Node numbers from bandwidth minimizer
  !     ICON(I)       Connectivity array.
  !     IEP(J,I)      Pointer array for connectivity.
  !     First node on an element starts at ICON(IEP(2,LMN))
  !     No. nodes on element is IEP(3,LMN)
  !     NODPN(I,J)    Nodal pointer for Jth node
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

  !     IEQS(J)       Global equation numbers
  !     JPOIN(I)   Pointer to last element in each row/column
  !     of ALOW/AUPP respectively
  !     LSTMPC(I,J)     List of multi--point constraints
  !     LSTMPC(1,J)  Flag for Jth constraint
  !     LSTMPC(2,J)  Node no. for first node in constraint
  !     LSTMPC(3,J)  DOF of first node
  !     LSTMPC(4,J)  Node no. for second constraint
  !     LSTMPC(5,J)  DOF of second node

  !     Compute profile of global arrays

  !     ---  Set up equation numbers; compute no. equations



  if (solvertype>1) then
!  CG or GMRES solver - only need to compute equation numbers for each DOF
    call isort(nops+nmpc, numnod, jpoin)
    neq = 0
    do node = 1, nops
      do j = 1, nodpn(5, node)
        neq = neq + 1
        ipn = nodpn(4, node) + j - 1
        ieqs(ipn) = neq
      end do
    end do
    do mpc = 1, nmpc
      neq = neq + 1
      mpceq(mpc) = neq
    end do

    if ( neq>MAXEQ ) then
      write (IOW, 99001) neq, MAXEQ
      stop
    end if
    return
  endif

!
!     Generate an index table specifying order of node numbers
!     Array JPOIN is used as temp storage for the index
  call isort(nops+nmpc, numnod, jpoin)
  neq = 0
  do i = 1, nops+nmpc
    node = jpoin(i)
	if (node<nops+1) then
      do j = 1, nodpn(5, node)
        neq = neq + 1
        ipn = nodpn(4, node) + j - 1
        ieqs(ipn) = neq
      end do
	else
	  neq = neq + 1
      mpceq(node-nops) = neq
	endif
  end do

 
  if ( neq>MAXEQ ) then
    write (IOW, 99001) neq, MAXEQ
    stop
  end if

  !     ---  Compute column heights

  jpoin(1:neq) = 0

  !     ---  Loop over elements
  do lmn = 1, nelm
    mineq = MAXEQ
    nnode = iep(3, lmn)
    !     ---    Loop over nodes on element

    do i = 1, nnode
      node = icon(i + iep(2, lmn) - 1)
      !     ---      Find smallest eqn. no. on current element
      do j = 1, nodpn(5, node)
        jeq = ieqs(j + nodpn(4, node) - 1)
        mineq = min(mineq, jeq)
      end do
    end do
    !     ---    Current column heights for all other eqs on same element
    do i = 1, nnode
      node = icon(i + iep(2, lmn) - 1)
      do j = 1, nodpn(5, node)
        jeq = ieqs(j + nodpn(4, node) - 1)
        jpold = jpoin(jeq)
        jpoin(jeq) = max(jpold, jeq - mineq)
      end do
    end do
  end do
  !     ---  Loop over MPCs
  do mpc = 1, nmpc
    mineq = MAXEQ
    !     ---    Loop over nodes on MPC
    do i = 1, 2
      node = lstmpc(2*i, mpc)
      j = lstmpc(2*i + 1, mpc)
      jeq = ieqs(j + nodpn(4, node) - 1)
      mineq = min(mineq, jeq)
    end do
    jeq = mpceq(mpc)
    mineq = min(mineq, jeq)
    !     ---    Current column heights for all other eqs on same MPC
    do i = 1, 2
      node = lstmpc(2*i, mpc)
      j = lstmpc(2*i + 1, mpc)
      jeq = ieqs(j + nodpn(4, node) - 1)
      jpold = jpoin(jeq)
      jpoin(jeq) = max(jpold, jeq - mineq)
    end do
    jeq = mpceq(mpc)
    jpold = jpoin(jeq)
    jpoin(jeq) = max(jpold, jeq - mineq)
  end do

  !     ---  Compute diagonal pointers for profile and measure of
  !     size of stiffness matrix

  ibwmax = 0
  bwmn = 0.D0
  bwrms = 0.D0
  jpoin(1) = 0
  do n = 2, neq
    ibwmax = max(ibwmax, jpoin(n))
    bwmn = bwmn + jpoin(n)
    bwrms = bwrms + jpoin(n)*jpoin(n)
    jpoin(n) = jpoin(n) + jpoin(n - 1)
  end do
  ibwmn = int(bwmn/dble(neq) + 0.5D0)
  ibwrms = int(dsqrt(bwrms/dble(neq)) + 0.5D0)

  if ( IWT==1 ) write (IOW, 99002) neq, ibwmax, ibwmn, ibwrms, jpoin(neq)

 

99001 format ( // ' *** Error detected in subroutine PROFIL ***', /,  &
       '   Insufficient storage to assemble stiffness matrix ',  &
       /'   Parameter MAXEQ must be increased to at least',  &
       I7/'   Its current value is ', I7)
99002 format ( // ' PROFIL has completed profile computation ', /,  &
         '     Total number of equations ', I10/,  &
         '     Maximum half bandwidth:   ', I10/,  &
         '     Mean half bandwidth:      ', I10/,  &
         '     RMS half bandwidth:       ', I10/,  &
         '     Size of stiffness matrix: ', I10)


end subroutine profil

!====================Subroutine INSTIF_gmres =======================
subroutine instif_gmres(dunorm, cnorm,rnorm, nops, nmpc, ifl, MAXDOF, MAXSLO,  &
     asize, nodpn, du, drmpc, rhs, alow,  &
     aupp, diag, irow,icol,ieqs, mpceq, neq,ifail,work,ldstrt,lwork)
  use Types
  implicit none

  integer, intent( in )         :: nops                           
  integer, intent( in )         :: nmpc                           
  integer, intent( in )         :: MAXDOF                         
  integer, intent( in )         :: MAXSLO                         
  integer, intent( in )         :: asize
  integer, intent( in )         :: neq                            
  integer, intent( in )         :: lwork
  integer, intent( in )         :: ldstrt
  integer, intent( in )         :: nodpn(7, nops)                 
  integer, intent( inout )      :: ieqs(MAXDOF)                   
  integer, intent( inout )      :: mpceq(nmpc)                    
  logical, intent( in )         :: ifl                            
  real( prec ), intent( out )   :: dunorm                         
  real( prec ), intent( out )   :: cnorm                          
  real( prec ), intent( out )   :: rnorm                          
  real( prec ), intent( inout ) :: du(MAXDOF)                     
  real( prec ), intent( inout ) :: drmpc(nmpc)                    
  real( prec ), intent( inout ) :: rhs(neq)                     
  real( prec ), intent( inout ) :: alow(MAXSLO)                   
  real( prec ), intent( inout ) :: aupp(asize)                   
  real( prec ), intent( inout ) :: diag(neq)                    
  real( prec ), intent( inout ) :: work(lwork) 
  integer, intent( in )         :: irow(asize)
  integer, intent( in )         :: icol(asize)
  integer, intent( inout )      :: ifail

  ! Local Variables
  integer :: ipoin, j, mpc,  n, i
  real( prec ) :: sol(neq)                    
  
  rnorm = 0.D0
  do n = 1, nops
    do j = 1, nodpn(5, n)
      ipoin = j + nodpn(4, n) - 1
      rnorm = rnorm + rhs(ieqs(ipoin))*rhs(ieqs(ipoin))
    end do
  end do
  do mpc = 1, nmpc
    rnorm = rnorm + rhs(mpceq(mpc))*rhs(mpceq(mpc))
  end do

  if ( ifl ) then
    call solv_gmres(alow, aupp, diag, rhs,irow,icol,asize,neq,sol,ifail,work,ldstrt,lwork)
  else
    call solv_gmres(aupp, aupp, diag, rhs,irow,icol,asize,neq,sol,ifail,work,ldstrt,lwork)
  end if

  if (ifail/=0) return

  dunorm = 0.D0
  cnorm = 0.D0
  do n = 1, nops
    do j = 1, nodpn(5, n)
      ipoin = j + nodpn(4, n) - 1
      du(ipoin) = du(ipoin) + sol(ieqs(ipoin))
      dunorm = dunorm + du(ipoin)*du(ipoin)
      cnorm = cnorm + sol(ieqs(ipoin))*sol(ieqs(ipoin))
    end do
  end do
  do mpc = 1, nmpc
    drmpc(mpc) = drmpc(mpc) + sol(mpceq(mpc))
    dunorm = dunorm + drmpc(mpc)*drmpc(mpc)
    cnorm = cnorm + sol(mpceq(mpc))*sol(mpceq(mpc))
  end do
  if ( neq==0 ) stop
  dunorm = dsqrt(dunorm)/dble(neq)
  cnorm = dsqrt(cnorm)/dble(neq)
  rnorm = dsqrt(rnorm)/dble(neq)

end subroutine instif_gmres

!
!=====================Subroutine SOLV_GMRES =========================
!
subroutine solv_gmres(alow, aupp, diag, rhs,irow,icol,size,neq,sol,ifail,work,ldstrt,lwork)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: neq                      
  integer, intent( in )         :: size
  integer, intent( inout )      :: ifail
  integer, intent( in )         :: lwork
  integer, intent( in )         :: ldstrt
  real( prec ), intent( inout ) :: alow(size)                  
  real( prec ), intent( inout ) :: aupp(size)                  
  real( prec ), intent( in )    :: diag(neq)                  
  real( prec ), intent( inout ) :: rhs(neq)                   
  real( prec ), intent( inout ) :: sol(neq)
  real( prec ), intent( inout ) :: work(lwork)                   
  integer, intent( in )         :: icol(size)
  integer, intent( in )         :: irow(size)

!      parameter (lda = 1000, ldstrt = 60)
!      parameter (lwork = ldstrt**2+ldstrt*(lda+5)+5*lda+1)
      integer :: i, j,k,  n, m
      integer :: revcom, colx, coly, colz, nbscal
      integer :: irc(5), icntl(8), info(3)
      integer :: matvec, precondLeft, precondRight,dotprod
      parameter(matvec=1, precondLeft=2)
      parameter(precondRight=3, dotProd=4) 
      real(prec) :: cntl(5), rinfo(2)
      real(prec) :: ZERO, ONE
      parameter (ZERO = 0.d0, ONE = 1.d0)
      real(prec) :: ddotc
      real(prec) :: precon(50000)
      external ddotc


!
!     GMRES equation solver
!
      ifail = 0
!      Initialize the matrix
      n = neq
      m = ldstrt

      work = 0.d0
!  the right-hand side b
      do i = 1,n
         work(i+n) = rhs(i)
      enddo


!  Jacobi preconditioner
   precon(1:neq) = diag(1:neq)
   do i = 1,neq
      precon(i) = 1.d0/precon(i)
!      Uncomment for D-LU preconditioner - this is just a test - needs recoding to speed up if used for real
!      do k = 1,size
!         if(irow(k)==i) then
!             if(icol(k)>i) then
!                precon(icol(k)) = precon(icol(k)) - alow(k)*precon(i)*aupp(k)
!             endif
!         endif
!      end do
  end do


! Initialize the control parameters to default values

      call init_dgmres(icntl,cntl)

! Tune some parameters for GMRES

! Tolerance
      cntl(1) = 1.d-11!*dsqrt(dfloat(size))
! Set to 1 to save the convergence history
      icntl(3) = 0
! Preconditioner flag
      icntl(4) = 1
! ICGS orthogonalization (3)
      icntl(5) = 3
! Maximum number of iterations
      icntl(7) = 1000
!
!****************************************
! reverse communication implementation
!****************************************
!
10     call drive_dgmres(n,n,m,lwork,work,irc,icntl,cntl,info,rinfo)
      revcom = irc(1)
      colx = irc(2)
      coly = irc(3)
      colz = irc(4)
      nbscal = irc(5)
!
      if (revcom.eq.matvec) then
! perform the matrix vector product
! work(colz) <-- A * work(colx)
         do i = 0,n-1
           work(colz+i) = 0.d0
         end do
         do i = 1,size
           work(colz+irow(i)-1) = work(colz+irow(i)-1) + aupp(i)*work(colx+icol(i)-1)
           work(colz+icol(i)-1) = work(colz+icol(i)-1) + alow(i)*work(colx+irow(i)-1)        
         end do
         do i = 0,n-1
           work(colz+i) = work(colz+i) + diag(i+1)*work(colx+i)
         end do
         
         goto 10
!
      else if (revcom.eq.precondLeft) then
! perform the left preconditioning
! work(colz) <-- M_1^{-1} * work(colx)
!         call dcopy(n,work(colx),1,work(colz),1)
!         D-LU preconditioner - just a test - needs recoding to speed up if used for real
!         work(colz:colz+neq) = work(colx:colx+neq)
!         do i = 1,n
!            do j = 1,size
!               if (icol(j)==i) then
!                 if (irow(j)<i) then
!                    work(colz+i-1) = work(colz+i-1) - alow(j)*work(colz+irow(j)-1)
!                 endif
!               endif
!            end do
!            work(colz+i-1) = work(colz+i-1)*precon(i)
!          end do
!          do i = n,1,-1
!            do j = 1,size
!             if (irow(j) == i) then
!                if (icol(j)>i) then
!                 work(colz+i-1) = work(colz+i-1) - aupp(j)*work(colz+icol(j)-1)*precon(i)
!                endif
!              endif
!            end do
!          end do            
         do i = 0,n-1
          work(colz+i) = work(colx+i)*precon(i+1)
         end do
         goto 10
!
      else if (revcom.eq.precondRight) then
! perform the right preconditioning
! work(colz) <-- M_2^{-1} * work(colx)
!         call dcopy(n,work(colx),1,work(colz),1)
         do i = 0,n-1
          work(colz+i) = work(colx+i)*precon(i+1)
         end do
         goto 10
       else if (revcom.eq.dotProd) then
! perform the scalar product
! work(colz) <-- work(colx) work(coly)
! statement to perform the dot products can be
! written in a compact form.
        call dgemv('C',n,nbscal,ONE,work(colx),n,work(coly),1,ZERO,work(colz),1)
! the sake of simplicity we write it as a do-loop
! do i=0,nbscal-1
! work(colz+i) = zdotc(n,work(colx+i*n),1,
! & work(coly),1)
! enddo
         goto 10
      endif
      if (info(1).eq.0) then
      
         sol(1:neq) = work(1:neq)
         write(IOW,*) ' GMRES solver has converged after', info(2),' iterations'
         write(IOW,*) ' Backward error - preconditioned system', rinfo(1)
         write(IOW,*) ' Backward error - unpreconditioned', rinfo(2)
         write(IOW,*) ' Optimal size for workspace ', info(3)
      else if (info(1).eq.-1) then
         write(IOW,*) ' Bad value of n'
         stop
      else if (info(1).eq.-2) then
         write(IOW,*) ' Bad value of m'
         stop
      else if (info(1).eq.-3) then
         write(IOW,*) ' Too small workspace. '
         write(IOW,*) ' Minimal value should be ', info(2)
         stop
      else if (info(1).eq.-4) then
          write(IOW,*) ' GMRES failed to converge after ', icntl(7),' iterations'
          ifail = 1
          return
      else if (info(1).eq.-5) then
          write(IOW,*) ' Type of preconditioner not specified'
          stop
      endif

      return
 end subroutine solv_gmres



!
!========================= subroutine drive_gmres ==========================
 subroutine drive_dgmres(n,nloc,m,lwork,work,irc,icntl,cntl,info,rinfo)
  use Types
  use ParamIO
  implicit none
       integer, intent(in) :: n
       integer, intent(in) :: nloc
       integer, intent(in) :: lwork
       integer, intent(inout) :: icntl(*)
       real(prec), intent(in) ::   cntl(*)
       
       integer, intent(out) ::  info(*)
       real(prec), intent(out) ::    rinfo(*)

       integer, intent(inout) ::  m
       integer, intent(inout) :: irc(*)
       real(prec), intent(inout) :: work(*)
! Local variables
       real(prec) ::  sA
       real(prec) ::  sb
       real(prec) :: sPA
       real(prec) :: sPb
       integer :: xptr, bptr, wptr, r0ptr, Vptr, Hptr, dotptr
       integer  :: yCurrent,rotSin, rotCos, xCurrent
       integer :: sizeWrk, newRestart
       integer :: iwarn, ierr, ihist, compRsd
       real (prec)    rn,rx,rc
       real (prec)  DZRO
       parameter (DZRO = 0.0d0)
!
       integer  :: icheck
       save icheck
       DATA icheck /0/
!
       intrinsic ifix, float

!
!  Purpose
!  =======
!    drive_dgmres is the driver routine for solving the linear system 
!  Ax = b using the *  Generalized Minimal Residual iterative method 
!  with preconditioning.
!  This solver is implemented with a reverse communication scheme: control
!  is returned to the user for computing the (preconditioned) 
!  matrix-vector product.
!  See the User's Guide for an example of use.
!
!
! Written : June 1996
! Authors : Luc Giraud, Serge Gratton, V. Fraysse
!             Parallel Algorithms - CERFACS
!
! Updated : April 1997
! Authors :  Valerie Fraysse, Luc Giraud, Serge Gratton
!             Parallel Algorithms - CERFACS
!
! Updated : June 1998
! Authors : Valerie Fraysse, Luc Giraud, Serge Gratton
!             Parallel Algorithms - CERFACS
! Purpose : Make clear that the warning and error messages come from the
!           dgmres modules.
!
! Updated : December 2002 - L. Giraud, J.Langou
! Purpose : Add the capability to avoid explicit residual calculation at restart
!
! Updated : March 2005 - L. Giraud
! Purpose : small bug in the computation of the restart if too large vs the
!           size of the workspace
!
!  Arguments
!  =========
!
!  n      (input) INTEGER.
!          On entry, the dimension of the problem.
!          Unchanged on exit.
!
!  nloc   (input) INTEGER.
!          On entry, the dimension of the local problem.
!          In a parallel distributed envirionment, this corresponds
!          to the size of the subset of entries of the right hand side
!          and solution allocated to the calling process.
!          Unchanged on exit.
!
!
!  m      (input) INTEGER
!          Restart parameter, <= N. This parameter controls the amount
!          of memory required for matrix H (see WORK and H).
!          Unchanged on exit.
!
!  lwork  (input) INTEGER
!          size of the workspace
!          if (icntl(5) = 0 or 1 )
!            lwork >= m*m + m*(n+5) + 5*n+2, if icntl(8) = 1
!            lwork >= m*m + m*(n+5) + 6*n+2, if icntl(8) = 0
!          if (icntl(5) = 2 or 3 )
!            lwork >= m*m + m*(n+5) + 5*n+m+1, if icntl(8) = 1
!            lwork >= m*m + m*(n+5) + 6*n+m+1, if icntl(8) = 0
!
!  work   (workspace) double precision/double precision array, length lwork
!          work contains the required vector and matrices stored in the 
!          following order :
!            x  (n,1)       : computed solution.
!            b  (n,1)       : right hand side.
!            r0 (n,1)       : vector workspace.
!            w  (n,1)       : vector workspace.
!            V  (n,m)       : Krylov basis.
!            H  (m+1,m+1)   : Hessenberg matrix (full storage).
!            yCurrent (m,1) : solution of the current LS
!            xCurrent (n,1) : current iterate
!            rotSin (m,1)   : Sine of the Givens rotation
!            rotCos (m,1)   : Cosine of the Givens rotation
!
!  irc     (input/output) INTEGER array. length 5
!            irc(1) : REVCOM   used for reverse communication
!                             (type of external operation)
!            irc(2) : COLX     used for reverse communication
!            irc(3) : COLY     used for reverse communication
!            irc(4) : COLZ     used for reverse communication
!            irc(5) : NBSCAL   used for reverse communication
!
!  icntl   (input) INTEGER array. length 7
!            icntl(1) : stdout for error messages
!            icntl(2) : stdout for warnings
!            icntl(3) : stdout for convergence history
!            icntl(4) : 0 - no preconditioning
!                       1 - left preconditioning
!                       2 - right preconditioning
!                       3 - double side preconditioning
!                       4 - error, default set in Init
!            icntl(5) : 0 - modified Gram-Schmidt
!                       1 - iterative modified Gram-Schmidt
!                       2 - classical Gram-Schmidt
!                       3 - iterative classical Gram-Schmidt
!            icntl(6) : 0 - default initial guess x_0 = 0 (to be set)
!                       1 - user supplied initial guess
!            icntl(7) : maximum number of iterations
!            icntl(8) : 0 - use recurence formula at restart
!                       1 - default compute the true residual at each restart
!
!  cntl    (input) double precision array, length 5
!            cntl(1) : tolerance for convergence
!            cntl(2) : scaling factor for normwise perturbation on A
!            cntl(3) : scaling factor for normwise perturbation on b
!            cntl(4) : scaling factor for normwise perturbation on the
!                      preconditioned matrix
!            cntl(5) : scaling factor for normwise perturbation on 
!                      preconditioned right hand side
!
!  info    (output) INTEGER array, length 3
!            info(1) :  0 - normal exit
!                      -1 - n < 1
!                      -2 - m < 1
!                      -3 - lwork too small
!                      -4 - convergence not achieved after icntl(7) iterations
!                      -5 - precondition type not set by user
!            info(2) : if info(1)=0 - number of iteration to converge
!                      if info(1)=-3 - minimum workspace size necessary
!            info(3) : optimal size for the workspace
!
!  rinfo   (output) double precision array, length 2
!            if info(1)=0 
!              rinfo(1) : backward error for the preconditioned system
!              rinfo(2) : backward error for the unpreconditioned system
!
!
!       Executable statements :
!
       ierr    = icntl(1)
       iwarn   = icntl(2)
       ihist   = icntl(3)
       compRsd = icntl(8)

       if (ierr.lt.0) ierr = 6

       if (compRsd.eq.1) then
          sizeWrk  = m*m + m*(nloc+5) + 5*nloc+ 1
       else
          sizeWrk  = m*m + m*(nloc+5) + 6*nloc+ 1
       endif

       if (icheck.eq.0) then
! Check the value of the arguments
         if ((n.lt.1).or.(nloc.lt.1)) then
            write(IOW,*)
            write(IOW,*)' ERROR GMRES : '
            write(IOW,*)'     N < 1 '
            write(IOW,*)
            info(1) = -1
            irc(1)  = 0
            return
         endif
         if (m.lt.1) then
            write(IOW,*)
            write(IOW,*)' ERROR GMRES :'
            write(IOW,*)'     M < 1 '
            write(IOW,*)
            info(1) = -2
            irc(1)  = 0
            return
         endif
         if ((icntl(4).ne.0).and.(icntl(4).ne.1).and. &
     &     (icntl(4).ne.2).and.(icntl(4).ne.3)) then
            write(IOW,*)
            write(IOW,*)' ERROR GMRES : '
            write(IOW,*)'     Undefined preconditioner '
            write(IOW,*)
            info(1) = -5
            irc(1)  = 0
            return
         endif
!
         if ((icntl(5).lt.0).or.(icntl(5).gt.3)) then
           icntl(5) = 0
           if (iwarn.ne.0) then
             write(IOW,*)
             write(IOW,*) ' WARNING  GMRES : '
             write(IOW,*) '       Undefined orthogonalisation '  
             write(IOW,*) '       Default MGS '
             write(IOW,*)
           endif
         endif
!
         if ((icntl(5).eq.2).or.(icntl(5).eq.3)) then
! the workspace should be large enough to store the m dot-products
            sizeWrk  = sizeWrk  + m
         else
            sizeWrk  = sizeWrk  + 1
         endif
!
         if (iwarn.ne.0) then
           write(IOW,*)
           write(IOW,*) ' WARNING GMRES : '
           write(IOW,*) '       For M = ',m,' optimal value '     
           write(IOW,*) '       for LWORK =  ', sizeWrk
           write(IOW,*)
         endif
!
         if ((icntl(6).ne.0).and.(icntl(6).ne.1)) then
           icntl(6) = 0
           if (iwarn.ne.0) then
             write(IOW,*)
             write(IOW,*) ' WARNING GMRES : '
             write(IOW,*) '       Undefined intial guess '
             write(IOW,*) '       Default x0 = 0 '
             write(IOW,*)
           endif
         endif
         if (icntl(7).le.0) then
           icntl(7) = n
           if (iwarn.ne.0) then
             write(IOW,*)
             write(IOW,*) ' WARNING GMRES :'
             write(IOW,*) '       Negative max number of iterations'  
             write(IOW,*) '       Default N '
             write(IOW,*)
           endif
         endif
         if ((icntl(8).ne.0).and.(icntl(8).ne.1)) then
           icntl(8) = 1
           write(IOW,*)
           write(IOW,*) ' WARNING GMRES :'
           write(IOW,*) '       Undefined strategy for the residual'
           write(IOW,*) '       at restart'
           write(IOW,*) '       Default 1 '
           write(IOW,*)
         endif
! Check if the restart parameter is correct and if the size of the
!  workspace is big enough for the restart.
! If not try to fix correctly the parameters
!
         if ((m .gt. n).or.(lwork.lt.sizeWrk)) then
           if (m .gt. n) then
             m = n
             if (iwarn.ne.0) then
               write(IOW,*)
               write(IOW,*) ' WARNING GMRES : '
               write(IOW,*) '       Parameter M bigger than N'  
               write(IOW,*) '       New value for M ',m
               write(IOW,*)
             endif
             if (compRsd.eq.1) then
               sizeWrk = m*m + m*(nloc+5) + 5*nloc+1
             else
               sizeWrk = m*m + m*(nloc+5) + 6*nloc+1
             endif
             if ((icntl(5).eq.2).or.(icntl(5).eq.3)) then
! the workspace should be large enough to store the m dot-products
                sizeWrk  = sizeWrk  + m
             else
                sizeWrk  = sizeWrk  + 1
             endif
           endif
           if ((lwork.lt.sizeWrk).and.(n.eq.nloc)) then
! Compute the maximum size of the m according to the memory space
             rn         = dfloat(n)
             rx         = rn + 5.d0
             rc         = 5.d0*rn + 1.d0 - dfloat(lwork)
!
! Update the linear part of the second order equation to be solved
             if ((icntl(5).eq.2).or.(icntl(5).eq.3)) then
               rx = rx + 1.d0
             endif
! Update the constant part of the second order equation to be solved
!             
             if (icntl(8).eq.0) then
               rc = rc + rn
             endif
! Solution of the the second order equation (MODIFIED IFIX->IDINT)
             newRestart = idint((-rx+sqrt(rx**2-4.0*rc))/2.0)
             if (newRestart.gt.0) then
               m = newRestart
               if (iwarn.ne.0) then
                 write(IOW,*)
                 write(IOW,*)' WARNING GMRES : '
                 write(IOW,*)'       Workspace too small for M'  
                 write(IOW,*)'       New value for M ',m
                 write(IOW,*)
               endif
             else
               write(IOW,*)
               write(IOW,*)' ERROR GMRES : '
               write(IOW,*)'     Not enough space for the problem'
               write(IOW,*)'     the space does not permit any m'
               write(IOW,*)
               info(1) = -3
               irc(1)  = 0
               return
             endif
           endif
           if ((lwork.lt.sizeWrk).and.(n.ne.nloc)) then
              write(IOW,*)
              write(IOW,*)' ERROR GMRES : '
              write(IOW,*)'     Not enough space for the problem'
              write(IOW,*)
              info(1) = -3
              irc(1)  = 0
              return
           endif
         endif
!
         info(3) = sizeWrk
         icheck = 1
!
! save the parameters the the history file
!
         if (ihist.ne.0) then
           write(IOW,'(10x,A39)') 'CONVERGENCE HISTORY FOR GMRES'
           write(IOW,*)
           write(IOW,'(A30,I2)') 'Errors are displayed in unit: ',ierr
           if (iwarn.eq.0) then
             write(IOW,'(A27)') 'Warnings are not displayed:'
           else
             write(IOW,'(A32,I2)') 'Warnings are displayed in unit: ', &
     &                               iwarn
           endif 
           write(IOW,'(A13,I7)') 'Matrix size: ',n
           write(IOW,'(A19,I7)') 'Local matrix size: ',nloc
           write(IOW,'(A9,I7)') 'Restart: ',m
           if (icntl(4).eq.0) then
             write(IOW,'(A18)') 'No preconditioning'
           elseif (icntl(4).eq.1) then
             write(IOW,'(A20)') 'Left preconditioning'
           elseif (icntl(4).eq.2) then
             write(IOW,'(A21)') 'Right preconditioning'
           elseif (icntl(4).eq.3) then
             write(IOW,'(A30)') 'Left and right preconditioning'
           endif
           if (icntl(5).eq.0) then
             write(IOW,'(A21)') 'Modified Gram-Schmidt'
           elseif (icntl(5).eq.1) then
             write(IOW,'(A31)') 'Iterative modified Gram-Schmidt'
           elseif (icntl(5).eq.2) then
             write(IOW,'(A22)') 'Classical Gram-Schmidt'
           else
             write(IOW,'(A32)') 'Iterative classical Gram-Schmidt'
           endif
           if (icntl(6).eq.0) then
             write(IOW,'(A29)') 'Default initial guess x_0 = 0'
           else
             write(IOW,'(A27)') 'User supplied initial guess'
           endif
           if (icntl(8).eq.1) then
             write(IOW,'(A33)') 'True residual computed at restart'
           else
             write(IOW,'(A30)') 'Recurrence residual at restart'
           endif
           write(IOW,'(A30,I5)') 'Maximum number of iterations: ', &
     &                              icntl(7)
           write(IOW,'(A27,E8.2)') 'Tolerance for convergence: ', &
     &                                cntl(1) 

           write(IOW,'(A53)') &
     &       'Backward error on the unpreconditioned system Ax = b:' 
           sA       = cntl(2)
           sb       = cntl(3)
           if ((sA.eq.DZRO).and.(sb.eq.DZRO)) then
             write(IOW,'(A39)') &
     &       '    the residual is normalised by ||b||'
           else
             write(IOW,1) sA,sb
1     format('    the residual is normalised by         ',E8.2, &
     &       ' * ||x|| + ',E8.2)
           endif
           sPA      = cntl(4)
           sPb      = cntl(5)
             write(IOW,2)
2     format('Backward error on the preconditioned system', &
     &        ' (P1)A(P2)y = (P1)b:')
           if ((sPA.eq.DZRO).and.(sPb.eq.DZRO)) then
             write(IOW,3)
3     format('    the preconditioned residual is normalised ', &
     &       'by ||(P1)b||')
           else
             write(IOW,4) sPA, sPb
4     format('    the preconditioned residual is normalised by ', E8.2, &
     &        ' * ||(P2)y|| + ',E8.2)
           endif

           write(IOW,5) info(3)
5     format('Optimal size for the local workspace:',I7)
           write(IOW,*) 
           write(IOW,6)
6     format('Convergence history: b.e. on the preconditioned system')
           write(IOW,7)
7     format(' Iteration   Arnoldi b.e.    True b.e.')
         endif

       endif
! setup some pointers on the workspace
       xptr     = 1
       bptr     = xptr + nloc
       r0ptr    = bptr + nloc
       wptr     = r0ptr + nloc
       Vptr     = wptr + nloc
       if (compRsd.eq.1) then
          Hptr     = Vptr + m*nloc
       else
          Hptr     = Vptr + (m+1)*nloc
       endif
       dotptr   = Hptr + (m+1)*(m+1)
       if ((icntl(5).eq.2).or.(icntl(5).eq.3)) then
          yCurrent = dotptr + m
       else
         yCurrent = dotptr + 1
       endif
       xCurrent = yCurrent + m
       rotSin   = xCurrent + nloc
       rotCos   = rotSin + m
!
       call dgmres(nloc,m,work(bptr),work(xptr), &
     &            work(Hptr),work(wptr),work(r0ptr),work(Vptr), &
     &            work(dotptr),work(yCurrent),work(xCurrent), &
     &            work(rotSin),work(rotCos),irc,icntl,cntl,info,rinfo)
!
       if (irc(1).eq.0) then
         icheck = 0
       endif
!
       return
end subroutine drive_dgmres
!
!======================================= Subroutine dgmres ===============================
!
subroutine dgmres(n,m,b,x,H,w,r0,V,dot,yCurrent,xCurrent,rotSin,rotCos,irc,icntl,cntl,info,rinfo)
  use Types
  use ParamIO
  implicit none

        integer, intent(in) ::  n
        integer, intent(in) ::  m
        integer, intent(in) :: icntl(*)
        real(prec), intent(in) :: b(*)
        real(prec), intent(in) ::    cntl(*)
!
       integer, intent(out) ::  info(*)
       real(prec), intent(out) ::    rinfo(*)
!
       integer, intent(inout) ::  irc(*)
       real(prec), intent(inout) :: x(*)
       real(prec), intent(inout) :: H(m+1,*)
       real(prec), intent(inout) :: w(*)
       real(prec), intent(inout) :: r0(*) 
       real(prec), intent(inout) :: V(n,*)
       real(prec), intent(inout) :: dot(*)
       real(prec), intent(inout) :: yCurrent(*)  
       real(prec), intent(inout) :: xCurrent(*)
       real(prec), intent(inout) :: rotSin(*)
       real(prec), intent(inout) :: rotCos(*)

       integer :: j, jH, iterOut, nOrtho, iterMax, initGuess, iOrthog
       integer :: xptr, bptr, wptr, r0ptr, Vptr, Hptr, yptr, xcuptr
       integer :: dotptr
       integer :: typePrec, leftPrec, rightPrec, dblePrec, noPrec
       integer :: iwarn, ihist
       integer :: compRsd
       real(prec) ::    beta, bn, sA, sb, sPA, sPb, bea, be, temp
       real(prec) ::    dloo, dnormw, dnormx, dnormres, trueNormRes
       real(prec) :: dVi, aux
       real(prec) :: auxHjj, auxHjp1j
!
       parameter (noPrec = 0, leftPrec = 1)
       parameter (rightPrec = 2, dblePrec = 3)  
!
       real(prec) :: ZERO, ONE
       parameter (ZERO = 0.0d0, ONE = 1.0d0)
       real(prec) :: DZRO,DONE
       parameter (DZRO = 0.0d0, DONE = 1.0d0)
!
!
! External functions
! ------------------
       real(prec) ::    dnrm2
       external dnrm2
!
! Saved variables
! ---------------
       save iterOut, jH, beta, bn, dnormres, retlbl, j
       save sA, sb, sPA, sPb, dnormx, trueNormRes, bea, be
       save dloo, nOrtho, compRsd
!
! Intrinsic function
! ------------------
       intrinsic dabs, dsqrt 
!
!
! Reverse communication variables
! -------------------------------
       integer :: matvec, precondLeft, precondRight, prosca
       parameter(matvec=1, precondLeft=2, precondRight=3, prosca=4)
       integer  :: retlbl
       DATA retlbl /0/

!
!
!  Purpose
!  =======
!  dgmres solves the linear system Ax = b using the
!  Generalized Minimal Residual iterative method
!
! When preconditioning is used we solve :
!     M_1^{-1} A M_2^{-1} y = M_1^{-1} b
!     x = M_2^{-1} y
!
!   Convergence test based on the normwise backward error for
!  the preconditioned system
!
! Written : June 1996
! Authors : Luc Giraud, Serge Gratton, V. Fraysse
!             Parallel Algorithms - CERFACS
!
! Updated : April 1997
! Authors :  Valerie Fraysse, Luc Giraud, Serge Gratton
!             Parallel Algorithms - CERFACS
!
! Updated : March 1998
! Purpose : Pb with F90 on DEC ws
!           cure : remove "ZDSCAL" when used to initialize vectors to zero
!
! Updated : May 1998
! Purpose : r0(1) <-- r0'r0 : pb when used with DGEMV for the dot product
!           cure : w(1) <--  r0'r0
!
! Updated : June 1998
! Purpose : Make clear that the warning and error messages come from the
!           dgmres modules.
!
! Updated : February 2001 - L. Giraud
! Purpose : In complex version, initializations to zero performed  in complex
!           arithmetic to avoid implicit conversion by the compiler.
!
! Updated : July 2001 - L. Giraud, J. Langou
! Purpose : Avoid to compute the approximate solution at each step of
!           the Krylov space construction when spA is zero.
!
! Updated : November 2002 - S. Gratton
! Purpose : Use Givens rotations conform to the classical definition.
!           No impact one the convergence history.
!
! Updated : November 2002 - L. Giraud
! Purpose : Properly handle the situation when the convergence is obtained
!           exactly at the "IterMax" iteration
!
! Updated : December 2002 - L. Giraud, J.Langou
! Purpose : Add the capability to avoid explicit residual calculation at restart
!
! Updated : January  2003 - L. Giraud, S. Gratton
! Purpose : Use Givens rotations from BLAS.
!
! Updated : March    2003 - L. Giraud
! Purpose : Set back retlbl to zero, if initial guess is solution
!           or right-hand side is zero
!
! Updated : September 2003 - L. Giraud
! Purpose : Include room in the workspace to store the results of the dot products
!           Fix the bugs that appeared when M > Nloc 
!
!  Arguments
!  =========
!
!  n       (input) INTEGER.
!           On entry, the dimension of the problem.
!           Unchanged on exit.
!
!  m        (input) INTEGER
!           Restart parameter, <= N. This parameter controls the amount
!           of memory required for matrix H (see WORK and H).
!           Unchanged on exit.
!
!  b        (input) double precision/double precision
!           Right hand side of the linear system.
!
!  x        (output) double precision/double precision
!           Computed solution of the linear system.
!
!  H        (workspace)  double precision/double precision
!           Hessenberg matrix built within dgmres
!
!  w        (workspace)  double precision/double precision
!           Vector used as temporary storage
!
!  r0       (workspace)  double precision/double precision
!           Vector used as temporary storage
!
!  V        (workspace)  double precision/double precision
!           Basis computed by the Arnoldi's procedure.
!  
!  dot      (workspace) double precision/double precision
!           Store the results of the dot product calculation
!
!  yCurrent (workspace) double precision/double precision
!           solution of the current LS
!
!  xCurrent (workspace) double precision/double precision
!           current iterate
!
!  rotSin   (workspace) double precision/double precision
!           Sine of the Givens rotation
!
!  rotCos   (workspace) double precision
!           Cosine of the Givens rotation
!
!  irc      (input/output) INTEGER array. length 3
!             irc(1) : REVCOM   used for reverse communication
!                              (type of external operation)
!             irc(2) : COLX     used for reverse communication
!             irc(3) : COLY     used for reverse communication
!             irc(4) : COLZ     used for reverse communication
!             irc(5) : NBSCAL   used for reverse communication
!
!  icntl    (input) INTEGER array. length 7
!             icntl(1) : stdout for error messages
!             icntl(2) : stdout for warnings
!             icntl(3) : stdout for convergence history
!             icntl(4) : 0 - no preconditioning
!                        1 - left preconditioning
!                        2 - right preconditioning
!                        3 - double side preconditioning
!                        4 - error, default set in Init
!             icntl(5) : 0 - modified Gram-Schmidt
!                        1 - iterative modified Gram-Schmidt
!                        2 - classical Gram-Schmidt
!                        3 - iterative classical Gram-Schmidt
!             icntl(6) : 0 - default initial guess x_0 = 0 (to be set)
!                        1 - user supplied initial guess
!             icntl(7) : maximum number of iterations
!             icntl(8) : 1 - default compute the true residual at each restart
!                        0 - use recurence formula at restart
!
!  cntl     (input) double precision array, length 5
!             cntl(1) : tolerance for convergence
!             cntl(2) : scaling factor for normwise perturbation on A
!             cntl(3) : scaling factor for normwise perturbation on b
!             cntl(4) : scaling factor for normwise perturbation on the
!                       preconditioned matrix
!             cntl(5) : scaling factor for normwise perturbation on
!                       preconditioned right hand side
!
!  info     (output) INTEGER array, length 2
!             info(1) :  0 - normal exit
!                       -1 - n < 1
!                       -2 - m < 1
!                       -3 - lwork too small
!                       -4 - convergence not achieved after icntl(7) iterations
!                       -5 - precondition type not set by user
!             info(2) : if info(1)=0 - number of iteration to converge
!                       if info(1)=-3 - minimum workspace size necessary
!             info(3) : optimal size for the workspace
!
! rinfo     (output) double precision array, length 2
!             if info(1)=0 
!               rinfo(1) : backward error for the preconditioned system
!               rinfo(2) : backward error for the unpreconditioned system
!

!
!       Executable statements
!
! setup some pointers on the workspace
       xptr     = 1
       bptr     = xptr + n
       r0ptr    = bptr + n
       wptr     = r0ptr + n
       Vptr     = wptr + n
       if (icntl(8).eq.1) then
         Hptr     = Vptr + m*n
       else
         Hptr     = Vptr + (m+1)*n
       endif
       dotptr   = Hptr + (m+1)*(m+1)
       if ((icntl(5).eq.2).or.(icntl(5).eq.3)) then
         yptr = dotptr + m
       else
         yptr = dotptr + 1
       endif
       xcuptr   = yptr + m

       iwarn      = icntl(2)
       ihist      = icntl(3)
       typePrec   = icntl(4)
       iOrthog    = icntl(5)
       initGuess  = icntl(6)
       iterMax    = icntl(7)

       if (retlbl.eq.0) then
         compRsd    = icntl(8)
       endif

      if (retlbl.ne.0) then
        if (retlbl.eq.5) then
          goto 5
        else if (retlbl.eq.6) then
          goto 6
        else if (retlbl.eq.8) then
          goto 8
        else if (retlbl.eq.11) then
          goto 11
        else if (retlbl.eq.16) then
          goto 16
        else if (retlbl.eq.18) then
          goto 18
        else if (retlbl.eq.21) then
          goto 21
        else if (retlbl.eq.26) then
          goto 26
        else if (retlbl.eq.31) then
          goto 31
        else if (retlbl.eq.32) then
          goto 32
        else if (retlbl.eq.33) then
          goto 33
        else if (retlbl.eq.34) then
          goto 34 
        else if (retlbl.eq.36) then
          goto 36
        else if (retlbl.eq.37) then
          goto 37
        else if (retlbl.eq.38) then
          goto 38
        else if (retlbl.eq.41) then
          goto 41
        else if (retlbl.eq.43) then
          goto 43
        else if (retlbl.eq.46) then
          goto 46
        else if (retlbl.eq.48) then
          goto 48
        else if (retlbl.eq.51) then
          goto 51
        else if (retlbl.eq.52) then
          goto 52
        else if (retlbl.eq.61) then
          goto 61
        else if (retlbl.eq.66) then
          goto 66
        else if (retlbl.eq.68) then
          goto 68
        endif
      endif
!
! intialization of various variables
!
      iterOut  = 0
      beta     = DZRO

      if (initGuess.eq.0) then
        do j=1,n
          x(j) = ZERO
        enddo
      endif
!
!        bn = dnrm2(n,b,1)
!
      irc(1) = prosca
      irc(2) = bptr
      irc(3) = bptr
      irc(4) = dotptr
      irc(5) = 1
      retlbl = 5
!      write(1,*) ' return #1'
      return
 5    continue
      bn = dsqrt((dot(1)))

      if (bn.eq.DZRO) then
        do j=1,n
          x(j) = ZERO
        enddo  
        if (iwarn.ne.0) then
          write(IOW,*)
          write(IOW,*) ' WARNING GMRES : '
          write(IOW,*) '       Null right hand side'
          write(IOW,*) '       solution set to zero'
          write(IOW,*)
        endif
        jH = 0
        bea = DZRO
        be  = DZRO
        write(IOW,'(I5,11x,E8.2,$)') jH,bea
        write(IOW,'(7x,E8.2)') be
        info(1)  = 0
        info(2)  = 0
        rinfo(1) = DZRO
        rinfo(2) = DZRO
        irc(1)   = 0
        retlbl = 0
!        write(1,*) ' return #2'
        return
      endif
!
! Compute the scaling factor for the backward error on the 
!  unpreconditioned sytem
!
      sA       = cntl(2)
      sb       = cntl(3)
      if ((sA.eq.DZRO).and.(sb.eq.DZRO)) then
        sb = bn
      endif
! Compute the scaling factor for the backward error on the
!  preconditioned sytem
!
       sPA      = cntl(4)
       sPb      = cntl(5)
       if ((sPA.eq.DZRO).and.(sPb.eq.DZRO)) then
         if ((typePrec.eq.noPrec).or.(typePrec.eq.rightPrec)) then
           sPb = bn
         else
           irc(1) = precondLeft
           irc(2) = bptr
           irc(4) = r0ptr
           retlbl = 6
 !          write(1,*) ' return #3'
           return
         endif
       endif
 6     continue
       if ((sPA.eq.DZRO).and.(sPb.eq.DZRO)) then
         if ((typePrec.eq.dblePrec).or.(typePrec.eq.leftPrec)) then
!
!           sPb = dnrm2(n,r0,1)
!
           irc(1) = prosca
           irc(2) = r0ptr
           irc(3) = r0ptr
           irc(4) = dotptr
           irc(5) = 1
           retlbl = 8
 !          write(1,*) 'return #4'
           return
         endif
       endif
 8     continue
       if ((sPA.eq.DZRO).and.(sPb.eq.DZRO)) then
         if ((typePrec.eq.dblePrec).or.(typePrec.eq.leftPrec)) then
           sPb = dsqrt((dot(1)))
 
         endif
       endif
!
!
! Compute the first residual
!           Y = AX : r0 <-- A x
!
! The residual is computed only if the initial guess is not zero
!
       if (initGuess.ne.0) then
         irc(1) = matvec
         irc(2) = xptr
         irc(4) = r0ptr
         retlbl = 11
 !        write(1,*) ' return #5'
         return
       endif
 11    continue
       if (initGuess.ne.0) then
         do j=1,n
           r0(j) = b(j)-r0(j)
         enddo
       else
         call dcopy(n,b,1,r0,1)
       endif 
!
! Compute the preconditioned residual if necessary
!      M_1Y = X : w <-- M_1^{-1} r0
!
       if ((typePrec.eq.noPrec).or.(typePrec.eq.rightPrec)) then
         call dcopy(n,r0,1,w,1)
       else
         irc(1) = precondLeft
         irc(2) = r0ptr
         irc(4) = wptr
         retlbl = 16
 !        write(1,*) ' return #6'
         return
       endif
 16    continue
!
!       beta = dnrm2(n,w,1)
!
!
       irc(1) = prosca
       irc(2) = wptr
       irc(3) = wptr
       irc(4) = dotptr
       irc(5) = 1
       retlbl = 18
    !   write(1,*) ' return #7'
       return
 18    continue
       beta = dsqrt((dot(1)))

       if (beta .eq. DZRO) then
!  The residual is exactly zero : x is the exact solution
         info(1) = 0
         info(2) = 0
         rinfo(1) = DZRO
         rinfo(2) = DZRO
         irc(1)   = 0
         retlbl = 0
         jH = 0
         bea = DZRO
         be  = DZRO
         write(IOW,'(I5,11x,E8.2,$)') jH,bea
         write(IOW,'(7x,E8.2)') be
         if (iwarn.ne.0) then
          write(IOW,*)
          write(IOW,*) ' WARNING GMRES : '
          write(IOW,*) '       Intial residual is zero'
          write(IOW,*) '       initial guess is solution'
          write(IOW,*)
         endif
    !     write(1,*) ' return #8'
         return
       endif

       aux = ONE/beta
       do j=1,n
         V(j,1) = ZERO
       enddo
       call daxpy(n,aux,w,1,V(1,1),1)
!
!       Most outer loop : dgmres iteration
!
!       REPEAT
 7     continue
!
!
       H(1,m+1)=beta
       do j=1,m
         H(j+1,m+1) = ZERO
       enddo
!
!        Construction of the hessenberg matrix WORK and of the orthogonal
!        basis V such that AV=VH 
!
       jH = 1
 10    continue
! Remark : this  do loop has been written with a while do
!          because the
!               " do jH=1,restart "
!         fails with the reverse communication.
!      do  jH=1,restart
!
!
! Compute the preconditioned residual if necessary
!
       if ((typePrec.eq.rightPrec).or.(typePrec.eq.dblePrec)) then  
!
!           Y = M_2^{-1}X : w <-- M_2^{-1} V(1,jH)
!
         irc(1) = precondRight
         irc(2) = vptr + (jH-1)*n
         irc(4) = wptr
         retlbl = 21
!         write(1,*) ' return #9'
         return
       else
         call dcopy(n,V(1,jH),1,w,1)
       endif
 21    continue
!
!           Y = AX : r0 <-- A w
!
       irc(1) = matvec
       irc(2) = wptr
       irc(4) = r0ptr
       retlbl = 26
!       write(1,*) ' return #10'
       return
 26    continue
!
!      MY = X : w <-- M_1^{-1} r0
!
       if ((typePrec.eq.noPrec).or.(typePrec.eq.rightPrec)) then
         call dcopy(n,r0,1,w,1)
       else
         irc(1) = precondLeft
         irc(2) = r0ptr
         irc(4) = wptr
         retlbl = 31
 !        write(1,*) ' return #11'
         return
       endif
 31    continue
!
! Orthogonalization using either MGS or IMGS
!  
! initialize the Hessenberg matrix to zero in order to be able to use
!     IMGS as orthogonalization procedure.
       do j=1,jH
         H(j,jH) = ZERO
       enddo
       nOrtho = 0
 19    continue
       nOrtho = nOrtho +1
       dloo   = DZRO
!
       if ((iOrthog.eq.0).or.(iOrthog.eq.1)) then
! MGS
!
!           do j=1,jH
!
         j = 1
!           REPEAT
       endif
 23    continue
       if ((iOrthog.eq.0).or.(iOrthog.eq.1)) then
!
!             dVi     = ddot(n,V(1,j),1,w,1)
!
         irc(1) = prosca
         irc(2) = vptr + (j-1)*n
         irc(3) = wptr
         irc(4) = dotptr
         irc(5) = 1
         retlbl = 32
  !       write(1,*) ' return #12'
         return
       endif
 32    continue
       if ((iOrthog.eq.0).or.(iOrthog.eq.1)) then
         dVi     = dot(1)
         H(j,jH) = H(j,jH) + dVi
         dloo    = dloo + dabs(dVi)**2
         aux = -ONE*dVi
         call daxpy(n,aux,V(1,j),1,w,1)
         j = j + 1
         if (j.le.jH) goto 23
!          enddo_j
       else
! CGS
! Gathered dot product calculation
!
!           call dgemv('C',n,jH,ONE,V(1,1),n,w,1,ZERO,r0,1)
!
         irc(1) = prosca
         irc(2) = vptr
         irc(3) = wptr
         irc(4) = dotptr
         irc(5) = jH
         retlbl = 34
  !       write(1,*) ' return #13'
         return
       endif
 34    continue
       if ((iOrthog.eq.2).or.(iOrthog.eq.3)) then
!
         call daxpy(jH,ONE,dot,1,H(1,jH),1)
         call dgemv('N',n,jH,-ONE,V(1,1),n,dot,1,ONE,w,1)
         dloo = dnrm2(jH,dot,1)**2
       endif
!
!         dnormw = dnrm2(n,w,1)
!
       irc(1) = prosca
       irc(2) = wptr
       irc(3) = wptr
       irc(4) = dotptr
       irc(5) = 1
       retlbl = 33
 !      write(1,*) ' return #14'
       return
 33    continue
       dnormw = dsqrt((dot(1)))
!
       if ((iOrthog.eq.1).or.(iOrthog.eq.3)) then
! IMGS / CGS orthogonalisation
         dloo = dsqrt(dloo)
! check the orthogonalization quality
         if (((2.0*dnormw).le.dloo).and.(nOrtho.lt.3)) then
           goto 19
         endif
       endif
!
       H(jH+1,jH) = dnormw
       if ((jH.lt.m).or.(icntl(8).eq.0)) then
         aux = ONE/dnormw
         do j=1,n
           V(j,jH+1) = ZERO
         enddo
         call daxpy(n,aux,w,1,V(1,jH+1),1)
       endif
! Apply previous Givens rotations to the new column of H
       do j=1,jH-1
         call drot(1, H(j,jH), 1, H(j+1,jH), 1,(rotCos(j)),rotSin(j))
       enddo
       auxHjj = H(jH,jH)
       auxHjp1j= H(jH+1,jH)
       call drotg(auxHjj, auxHjp1j,temp,rotSin(jH))
       rotCos(jH) = temp
! Apply current rotation to the rhs of the least squares problem
       call drot(1, H(jH,m+1), 1, H(jH+1,m+1), 1, (rotCos(jH)),rotSin(jH))
!
! zabs(H(jH+1,m+1)) is the residual computed using the least squares
!          solver
! Complete the QR factorisation of the Hessenberg matrix by apply the current
! rotation to the last entry of the collumn
       call drot(1, H(jH,jH), 1, H(jH+1,jH), 1, (rotCos(jH)),rotSin(jH))
       H(jH+1,jH) = ZERO
!
! Get the Least square residual
!
       dnormres = dabs(H(jH+1,m+1))
       if (sPa.ne.DZRO) then
!
! Compute the solution of the current linear least squares problem
!
         call dcopy(jH,H(1,m+1),1,yCurrent,1)
         call dtrsv('U','N','N',jH,H,m+1,yCurrent,1)
!
! Compute the value of the new iterate 
!
         call dgemv('N',n,jH,ONE,v,n,yCurrent,1,ZERO,xCurrent,1)
!
         if ((typePrec.eq.rightPrec).or.(typePrec.eq.dblePrec)) then  
!
!         Y = M_2^{-1}X : r0 <-- M_2^{-1} xCurrent
!
           irc(1) = precondRight
           irc(2) = xcuptr
           irc(4) = r0ptr
           retlbl = 36
     !      write(1,*) ' return #15'
           return
         else
           call dcopy(n,xCurrent,1,r0,1)
         endif
       endif
 36    continue
!
!
       if (sPa.ne.DZRO) then
! Update the current solution
         call dcopy(n,x,1,xCurrent,1)
         call daxpy(n,ONE,r0,1,xCurrent,1)
!
!         dnormx = dnrm2(n,xCurrent,1)
!
         irc(1) = prosca
         irc(2) = xcuptr
         irc(3) = xcuptr
         irc(4) = dotptr
         irc(5) = 1
         retlbl = 38
   !      write(1,*) ' return #16'
         return
       else
         dnormx    = DONE
       endif
 38    continue
       if (sPa.ne.DZRO) then
         dnormx = dsqrt((dot(1)))
       endif
!
       bea = dnormres/(sPA*dnormx+sPb)
!
! Check the convergence based on the Arnoldi Backward error for the
! preconditioned system
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then  
! 
! The Arnoldi Backward error indicates that dgmres might have converge
! enforce the calculation of the true residual at next restart
         compRsd = 1
!
!  If the update of X has not yet been performed
         if (sPA.eq.DZRO) then
!
! Compute the solution of the current linear least squares problem
!
           call dcopy(jH,H(1,m+1),1,yCurrent,1)
           call dtrsv('U','N','N',jH,H,m+1,yCurrent,1)
!
! Compute the value of the new iterate 
!
           call dgemv('N',n,jH,ONE,v,n,yCurrent,1,ZERO,xCurrent,1)
!
           if ((typePrec.eq.rightPrec).or.(typePrec.eq.dblePrec)) then
! 
!         Y = M_2^{-1}X : r0 <-- M_2^{-1} xCurrent
!
             irc(1) = precondRight
             irc(2) = xcuptr
             irc(4) = r0ptr 
             retlbl = 37
!             write(1,*) ' return #17'
             return
           else
             call dcopy(n,xCurrent,1,r0,1)
           endif
         endif
       endif
 37    continue
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then
         if (sPA.eq.DZRO) then
! Update the current solution
            call dcopy(n,x,1,xCurrent,1)
            call daxpy(n,ONE,r0,1,xCurrent,1)
         endif
!
         call dcopy(n,xCurrent,1,r0,1)
! Compute the true residual, the Arnoldi one may be unaccurate
!
!           Y = AX : w  <-- A r0
!
         irc(1) = matvec
         irc(2) = r0ptr
         irc(4) = wptr
         retlbl = 41
!         write(1,*) ' return #18'
         return
       endif
 41    continue
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then

         do j=1,n
           w(j) = b(j) - w(j)
         enddo
! Compute the norm of the unpreconditioned residual
!
!        trueNormRes = dnrm2(n,w,1)
!
         irc(1) = prosca
         irc(2) = wptr
         irc(3) = wptr
         irc(4) = dotptr
         irc(5) = 1
         retlbl = 43
!         write(1,*) ' return #19'
         return
       endif
 43    continue
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then
         trueNormRes = dsqrt((dot(1)))
!
         if ((typePrec.eq.leftPrec).or.(typePrec.eq.dblePrec)) then  
!
!      MY = X : r0 <-- M_1^{-1} w 
!
           irc(1) = precondLeft
           irc(2) = wptr
           irc(4) = r0ptr
           retlbl = 46
!           write(1,*) ' return #20'
           return
         else 
           call dcopy(n,w,1,r0,1)
         endif
       endif
 46    continue
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then
!
!        dnormres = dnrm2(n,r0,1) 
!
         irc(1) = prosca
         irc(2) = r0ptr
         irc(3) = r0ptr
         irc(4) = dotptr
         irc(5) = 1
         retlbl = 48
!         write(1,*) ' return #21'
         return
       endif
 48    continue
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then
         dnormres = dsqrt((dot(1)))
!
         be = dnormres/(sPA*dnormx+sPb)
! Save the backward error on a file if convergence history requested
         if (ihist.ne.0) then
           write(IOW,1000)iterOut*m+jH,bea,be
1000  format(I5,11x,E8.2,7x,E8.2)
         endif
!
       endif
!
!
! Check again the convergence
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then   
         if ((be.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then   
! The convergence has been achieved, we restore the solution in x
! and compute the two backward errors.
           call dcopy(n,xCurrent,1,x,1)
!
           if (sA.ne.DZRO) then
!
!            dnormx = dnrm2(n,x,1)
!
             irc(1) = prosca
             irc(2) = xptr
             irc(3) = xptr
             irc(4) = dotptr
             irc(5) = 1
             retlbl = 51
!             write(1,*) ' return #22'
             return
           endif
         endif
       endif
 51    continue
       if ((bea.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then
         if ((be.le.cntl(1)).or.(iterOut*m+jH.ge.iterMax)) then
           if (sA.ne.DZRO) then
             dnormx = dsqrt((dot(1)))
!
           else
             dnormx = DONE
           endif
! Return the backward errors
           rinfo(1) = be
           rinfo(2) = trueNormRes/(sA*dnormx+sb)
           if (be.le.cntl(1)) then
             info(1) = 0
             if (ihist.ne.0) then
               write(IOW,*)
               write(IOW,'(A20)') 'Convergence achieved'
             endif
           else if (be.gt.cntl(1)) then
             if (iwarn.ne.0) then
               write(IOW,*)
               write(IOW,*) ' WARNING GMRES : '
               write(IOW,*) '       No convergence after '
               write(IOW,*) iterOut*m+jH,' iterations '
               write(IOW,*)
             endif
             if (ihist.ne.0) then
               write(IOW,*)
               write(IOW,*) ' WARNING GMRES :'
               write(IOW,*) '       No convergence after '
               write(IOW,*) iterOut*m+jH,' iterations '
               write(IOW,*)
             endif
             info(1) = -4
           endif
           if (ihist.ne.0) then
             write(IOW,1010) rinfo(1)
             write(IOW,1011) rinfo(2)
1010  format('B.E. on the preconditioned system:   ',E8.2)
1011  format('B.E. on the unpreconditioned system: ',E8.2)
           endif
           info(2) = iterOut*m+jH
           if (ihist.ne.0) then
             write(IOW,'(A10,I2)') 'info(1) = ',info(1)
             write(IOW,'(A32,I5)') &
     &                'Number of iterations (info(2)): ',info(2)  
           endif
           irc(1)  = 0
           retlbl  = 0
!           write(1,*) ' return #23'
           return
         endif
       else
! Save the backward error on a file if convergence history requested
         if (ihist.ne.0) then
           write(IOW,1001)iterOut*m+jH,bea
1001  format(I5,11x,E8.2,7x,'--')
         endif
!
       endif  
!
       jH = jH + 1
       if (jH.le.m) then
         goto 10
       endif
!
       iterOut = iterOut + 1
!
! we have completed the Krylov space construction, we restart if
! we have not yet exceeded the maximum number of iterations allowed.
!
       if ((sPa.eq.DZRO).and.(bea.gt.cntl(1))) then
!
! Compute the solution of the current linear least squares problem
!
         jH = jH - 1
         call dcopy(jH,H(1,m+1),1,yCurrent,1)
         call dtrsv('U','N','N',jH,H,m+1,yCurrent,1)
!
! Compute the value of the new iterate
!
         call dgemv('N',n,jH,ONE,v,n,yCurrent,1,ZERO,xCurrent,1)
!
         if ((typePrec.eq.rightPrec).or.(typePrec.eq.dblePrec)) then
!
!         Y = M_2^{-1}X : r0 <-- M_2^{-1} xCurrent
!
           irc(1) = precondRight
           irc(2) = xcuptr
           irc(4) = r0ptr
           retlbl = 52
!           write(1,*) ' return #24'
           return
         else
           call dcopy(n,xCurrent,1,r0,1)
         endif
       endif
 52    continue
       if ((sPa.eq.DZRO).and.(bea.gt.cntl(1))) then
! Update the current solution
         call dcopy(n,x,1,xCurrent,1)
         call daxpy(n,ONE,r0,1,xCurrent,1)
       endif
!
       call dcopy(n,xCurrent,1,x,1)
!
       if (compRsd.eq.1) then
!
! Compute the true residual
!
         call dcopy(n,x,1,w,1)
         irc(1) = matvec
         irc(2) = wptr
         irc(4) = r0ptr
         retlbl = 61
!         write(1,*) ' return #25'
         return
       endif
 61    continue
       if (compRsd.eq.1) then
         do j=1,n
           r0(j) = b(j) - r0(j)
         enddo
!
! Precondition the new residual if necessary
!
         if ((typePrec.eq.leftPrec).or.(typePrec.eq.dblePrec)) then
!
!      MY = X : w <-- M_1^{-1} r0
!
           irc(1) = precondLeft
           irc(2) = r0ptr
           irc(4) = wptr
           retlbl = 66
!           write(1,*) ' return #26'
           return
         else
           call dcopy(n,r0,1,w,1)
         endif
       endif
 66    continue
!
!           beta = dnrm2(n,w,1)
!
       if (compRsd.eq.1) then
         irc(1) = prosca
         irc(2) = wptr
         irc(3) = wptr
         irc(4) = dotptr
         irc(5) = 1
         retlbl = 68
!         write(1,*)' return #27'
         return
       endif
 68    continue
       if (compRsd.eq.1) then
         beta = dsqrt((dot(1)))
!
       else
! Use recurrence to approximate the residual at restart
         beta = dabs(H(m+1,m+1))
! Apply the Givens rotation is the reverse order
         do j=m,1,-1
           H(j,m+1)   = ZERO
           call drot(1, H(j,m+1), 1, H(j+1,m+1), 1, (rotCos(j)), -rotSin(j))
         enddo
!
! On applique les vecteurs V.  Vive la France!
!
         call dgemv('N',n,m+1,ONE,v,n,H(1,m+1),1,ZERO,w,1)
!
       endif
       do j=1,n
         V(j,1) = ZERO
       enddo
       aux = ONE/beta
       call daxpy(n,aux,w,1,V(1,1),1)
!
       goto 7
!
 end subroutine dgmres
!
!============================== Subroutine init_dgmres =======================
!
 subroutine init_dgmres(icntl,cntl)
  use Types
  use ParamIO
  implicit none

       integer, intent(out) :: icntl(*)
       real(prec), intent(out) ::   cntl(*)
!
!  Purpose
!  =======
!    Set default values for the parameters defining the characteristics
! of the Gmres algorithm.
!  See the User's Guide for an example of use.
!
!
! Written : April 1997
! Authors :  Valerie Fraysse, Luc Giraud, Serge Gratton
!             Parallel Algorithms - CERFACS
!
!
!  Arguments
!  =========
!
! icntl    (input) INTEGER array. length 6
!            icntl(1) : stdout for error messages
!            icntl(2) : stdout for warnings
!            icntl(3) : stdout for convergence history
!            icntl(4) : 0 - no preconditioning
!                       1 - left preconditioning
!                       2 - right preconditioning
!                       3 - double side preconditioning
!                       4 - error, default set in Init
!            icntl(5) : 0 - modified Gram-Schmidt
!                       1 - iterative modified Gram-Schmidt
!                       2 - classical Gram-Schmidt
!                       3 - iterative classical Gram-Schmidt
!            icntl(6) : 0 - default initial guess x_0 = 0 (to be set)
!                       1 - user supplied initial guess
!            icntl(7) : maximum number of iterations
!            icntl(8) : 1 - default compute the true residual at each restart
!                       0 - use recurence formaula at restart
!
! cntl     (input) double precision array, length 5
!            cntl(1) : tolerance for convergence
!            cntl(2) : scaling factor for normwise perturbation on A
!            cntl(3) : scaling factor for normwise perturbation on b
!            cntl(4) : scaling factor for normwise perturbation on the
!                      preconditioned matrix
!            cntl(5) : scaling factor for normwise perturbation on 
!                      preconditioned right hand side
!

       icntl(1) = 6
       icntl(2) = 6
       icntl(3) = 0
       icntl(4) = 4
       icntl(5) = 0
       icntl(6) = 0
       icntl(7) = -1
       icntl(8) = 1
 
       cntl(1) = 1.0d-5
       cntl(2) = 0.0d0
       cntl(3) = 0.0d0
       cntl(4) = 0.0d0
       cntl(5) = 0.0d0

       return
end subroutine init_dgmres

!
!============================SUBROUTINE DAXPY===========================
!
 subroutine daxpy(N,DA,DX,INCX,DY,INCY)
  use Types
  use ParamIO
  implicit none

  real( prec ), intent(in) ::  DA
  integer, intent(in)      :: INCX
  integer, intent(in)      :: INCY
  integer, intent(in)      :: N

  real( prec ), intent(in)  :: DX(*)
  real( prec ), intent(out) :: DY(*)
!     ..
!
!  Purpose
!  =======
!
!     DAXPY constant times a vector plus a vector.
!     uses unrolled loops for increments equal to one.
!
!     .. Local Scalars ..
      integer :: I,IX,IY,M,MP1
!     ..
!     .. Intrinsic Functions ..
      INTRINSIC MOD
!     ..
      IF (N<=0) RETURN
      IF (DA==0.0d0) RETURN
      IF (INCX==1 .AND. INCY==1) THEN
!
!        code for both increments equal to 1
!
!        clean-up loop
!
         M = MOD(N,4)
         IF (M.NE.0) THEN
            DO I = 1,M
               DY(I) = DY(I) + DA*DX(I)
            END DO
         END IF
         IF (N.LT.4) RETURN
         MP1 = M + 1
         DO I = MP1,N,4
            DY(I) = DY(I) + DA*DX(I)
            DY(I+1) = DY(I+1) + DA*DX(I+1)
            DY(I+2) = DY(I+2) + DA*DX(I+2)
            DY(I+3) = DY(I+3) + DA*DX(I+3)
         END DO
      ELSE
!
!        code for unequal increments or equal increments
!          not equal to 1
!
         IX = 1
         IY = 1
         IF (INCX<0) IX = (-N+1)*INCX + 1
         IF (INCY<0) IY = (-N+1)*INCY + 1
         DO I = 1,N
          DY(IY) = DY(IY) + DA*DX(IX)
          IX = IX + INCX
          IY = IY + INCY
         END DO
      END IF
      return
 end subroutine daxpy
 !
 !================================ Subroutine dcopy ===============
 !
 subroutine DCOPY(N,DX,INCX,DY,INCY)
  use Types
  use ParamIO
  implicit none
!    .. Scalar Arguments ..
  integer, intent(in) ::  INCX
  integer, intent(in) ::  INCY
  integer, intent(in) ::  N
!     ..
!   .. Array Arguments ..
  real(prec), intent(in)  :: DX(*)
  real(prec), intent(out) :: DY(*)
!     ..
!  Purpose
!  =======
!
!     DCOPY copies a vector, x, to a vector, y.
!     uses unrolled loops for increments equal to one.
!  
    integer ::  I,IX,IY,M,MP1
!     ..
!     .. Intrinsic Functions ..
      INTRINSIC MOD
!     ..
      IF (N<=0) RETURN
      IF (INCX==1 .AND. INCY==1) THEN
!
!        code for both increments equal to 1
!        clean-up loop
!
         M = MOD(N,7)
         IF (M.NE.0) THEN
            DO I = 1,M
               DY(I) = DX(I)
            END DO
            IF (N<7) RETURN
         END IF   
         MP1 = M + 1
         DO I = MP1,N,7
            DY(I) = DX(I)
            DY(I+1) = DX(I+1)
            DY(I+2) = DX(I+2)
            DY(I+3) = DX(I+3)
            DY(I+4) = DX(I+4)
            DY(I+5) = DX(I+5)
            DY(I+6) = DX(I+6)
         END DO
      ELSE      
!
!        code for unequal increments or equal increments
!          not equal to 1
!
         IX = 1
         IY = 1
         IF (INCX.LT.0) IX = (-N+1)*INCX + 1
         IF (INCY.LT.0) IY = (-N+1)*INCY + 1
         DO I = 1,N
            DY(IY) = DX(IX)
            IX = IX + INCX
            IY = IY + INCY
         END DO
      END IF
      return
end subroutine dcopy
!
!============================Subroutine dgemv===========================
! 
subroutine DGEMV(TRANS,M,N,ALPHA,A,LDA,X,INCX,BETA,Y,INCY)
  use Types
  use ParamIO
  implicit none
!
  real(prec), intent(in) :: ALPHA
  real(prec), intent(in) :: BETA
  integer, intent(in) :: INCX
  integer, intent(in) :: INCY
  integer, intent(in) :: LDA
  integer, intent(in) :: M
  integer, intent(in) :: N
  character*1 TRANS
!
  real(prec), intent(in) ::  A(LDA,*)
  real(prec), intent(in) ::  X(*)
  real(prec), intent(out) :: Y(*)
!     ..
!
!  Purpose
!  =======
!
!  DGEMV  performs one of the matrix-vector operations
!
!     y := alpha*A*x + beta*y,   or   y := alpha*A**T*x + beta*y,
!
!  where alpha and beta are scalars, x and y are vectors and A is an
!  m by n matrix.
!
!  Arguments
!  ==========
!
!  TRANS  - CHARACTER*1.
!           On entry, TRANS specifies the operation to be performed as
!           follows:
!
!              TRANS = 'N' or 'n'   y := alpha*A*x + beta*y.
!
!              TRANS = 'T' or 't'   y := alpha*A**T*x + beta*y.
!
!              TRANS = 'C' or 'c'   y := alpha*A**T*x + beta*y.
!
!           Unchanged on exit.
!
!  M      - INTEGER.
!           On entry, M specifies the number of rows of the matrix A.
!           M must be at least zero.
!           Unchanged on exit.
!
!  N      - INTEGER.
!           On entry, N specifies the number of columns of the matrix A.
!           N must be at least zero.
!           Unchanged on exit.
!
!  ALPHA  - DOUBLE PRECISION.
!           On entry, ALPHA specifies the scalar alpha.
!           Unchanged on exit.
!
!  A      - DOUBLE PRECISION array of DIMENSION ( LDA, n ).
!           Before entry, the leading m by n part of the array A must
!           contain the matrix of coefficients.
!           Unchanged on exit.
!
!  LDA    - INTEGER.
!           On entry, LDA specifies the first dimension of A as declared
!           in the calling (sub) program. LDA must be at least
!           max( 1, m ).
!           Unchanged on exit.
!
!  X      - DOUBLE PRECISION array of DIMENSION at least
!           ( 1 + ( n - 1 )*abs( INCX ) ) when TRANS = 'N' or 'n'
!           and at least
!           ( 1 + ( m - 1 )*abs( INCX ) ) otherwise.
!           Before entry, the incremented array X must contain the
!           vector x.
!           Unchanged on exit.
!
!  INCX   - INTEGER.
!           On entry, INCX specifies the increment for the elements of
!           X. INCX must not be zero.
!           Unchanged on exit.
!
!  BETA   - DOUBLE PRECISION.
!           On entry, BETA specifies the scalar beta. When BETA is
!           supplied as zero then Y need not be set on input.
!           Unchanged on exit.
!
!  Y      - DOUBLE PRECISION array of DIMENSION at least
!           ( 1 + ( m - 1 )*abs( INCY ) ) when TRANS = 'N' or 'n'
!           and at least
!           ( 1 + ( n - 1 )*abs( INCY ) ) otherwise.
!           Before entry with BETA non-zero, the incremented array Y
!           must contain the vector y. On exit, Y is overwritten by the
!           updated vector y.
!
!  INCY   - INTEGER.
!           On entry, INCY specifies the increment for the elements of
!           Y. INCY must not be zero.
!           Unchanged on exit.
!
!
!     .. Parameters ..
      real (prec) :: ONE,ZERO
      PARAMETER (ONE=1.0D+0,ZERO=0.0D+0)
      real (prec) :: TEMP
      INTEGER :: I,INFO,IX,IY,J,JX,JY,KX,KY,LENX,LENY
!     ..
!     .. External Functions ..
      LOGICAL LSAME
      EXTERNAL LSAME
!     ..
!     .. External Subroutines ..
      EXTERNAL XERBLA
!     ..
!     .. Intrinsic Functions ..
      INTRINSIC MAX
!     ..
!
!     Test the input parameters.
!
      INFO = 0
      IF (.NOT.LSAME(TRANS,'N') .AND. .NOT.LSAME(TRANS,'T') .AND. .NOT.LSAME(TRANS,'C')) THEN
          INFO = 1
      ELSE IF (M.LT.0) THEN
          INFO = 2
      ELSE IF (N.LT.0) THEN
          INFO = 3
      ELSE IF (LDA.LT.MAX(1,M)) THEN
          INFO = 6
      ELSE IF (INCX.EQ.0) THEN
          INFO = 8
      ELSE IF (INCY.EQ.0) THEN
          INFO = 11
      END IF
      IF (INFO.NE.0) THEN
          CALL XERBLA('DGEMV ',INFO)
          RETURN
      END IF
!
!     Quick return if possible.
!
      IF ((M.EQ.0) .OR. (N.EQ.0) .OR.    ((ALPHA.EQ.ZERO).AND. (BETA.EQ.ONE))) RETURN
!
!     Set  LENX  and  LENY, the lengths of the vectors x and y, and set
!     up the start points in  X  and  Y.
!
      IF (LSAME(TRANS,'N')) THEN
          LENX = N
          LENY = M
      ELSE
          LENX = M
          LENY = N
      END IF
      IF (INCX.GT.0) THEN
          KX = 1
      ELSE
          KX = 1 - (LENX-1)*INCX
      END IF
      IF (INCY.GT.0) THEN
          KY = 1
      ELSE
          KY = 1 - (LENY-1)*INCY
      END IF
!
!     Start the operations. In this version the elements of A are
!     accessed sequentially with one pass through A.
!
!     First form  y := beta*y.
!
      IF (BETA.NE.ONE) THEN
          IF (INCY.EQ.1) THEN
              IF (BETA.EQ.ZERO) THEN
                  DO 10 I = 1,LENY
                      Y(I) = ZERO
   10             CONTINUE
              ELSE
                  DO 20 I = 1,LENY
                      Y(I) = BETA*Y(I)
   20             CONTINUE
              END IF
          ELSE
              IY = KY
              IF (BETA.EQ.ZERO) THEN
                  DO 30 I = 1,LENY
                      Y(IY) = ZERO
                      IY = IY + INCY
   30             CONTINUE
              ELSE
                  DO 40 I = 1,LENY
                      Y(IY) = BETA*Y(IY)
                      IY = IY + INCY
   40             CONTINUE
              END IF
          END IF
      END IF
      IF (ALPHA.EQ.ZERO) RETURN
      IF (LSAME(TRANS,'N')) THEN
!
!        Form  y := alpha*A*x + y.
!
          JX = KX
          IF (INCY.EQ.1) THEN
              DO 60 J = 1,N
                  IF (X(JX).NE.ZERO) THEN
                      TEMP = ALPHA*X(JX)
                      DO 50 I = 1,M
                          Y(I) = Y(I) + TEMP*A(I,J)
   50                 CONTINUE
                  END IF
                  JX = JX + INCX
   60         CONTINUE
          ELSE
              DO 80 J = 1,N
                  IF (X(JX).NE.ZERO) THEN
                      TEMP = ALPHA*X(JX)
                      IY = KY
                      DO 70 I = 1,M
                          Y(IY) = Y(IY) + TEMP*A(I,J)
                          IY = IY + INCY
   70                 CONTINUE
                  END IF
                  JX = JX + INCX
   80         CONTINUE
          END IF
      ELSE
!
!        Form  y := alpha*A**T*x + y.
!
          JY = KY
          IF (INCX.EQ.1) THEN
              DO 100 J = 1,N
                  TEMP = ZERO
                  DO 90 I = 1,M
                      TEMP = TEMP + A(I,J)*X(I)
   90             CONTINUE
                  Y(JY) = Y(JY) + ALPHA*TEMP
                  JY = JY + INCY
  100         CONTINUE
          ELSE
              DO 120 J = 1,N
                  TEMP = ZERO
                  IX = KX
                  DO 110 I = 1,M
                      TEMP = TEMP + A(I,J)*X(IX)
                      IX = IX + INCX
  110             CONTINUE
                  Y(JY) = Y(JY) + ALPHA*TEMP
                  JY = JY + INCY
  120         CONTINUE
          END IF
      END IF
!
      return

 end subroutine dgemv
!
!============================SUBROUTINE DNRM2====================
!
function DNRM2(N,X,INCX)
  use Types
  use ParamIO
  implicit none
!
      INTEGER, intent(in) :: INCX
      integer, intent(in) :: N
      real(prec), intent(in) :: X(*)
      real (prec) :: dnrm2
!
!  Purpose
!  =======
!
!  DNRM2 returns the euclidean norm of a vector via the function
!  name, so that
!
!     DNRM2 := sqrt( x'*x )

!
!     .. Parameters ..
      real(prec) :: ONE,ZERO
      PARAMETER (ONE=1.0D+0,ZERO=0.0D+0)
!     ..
!     .. Local Scalars ..
      real(prec) :: ABSXI,NORM,SCALE,SSQ
      INTEGER :: IX
!     ..
!     .. Intrinsic Functions ..
      INTRINSIC ABS,SQRT
!
      IF (N.LT.1 .OR. INCX.LT.1) THEN
          NORM = ZERO
      ELSE IF (N.EQ.1) THEN
          NORM = ABS(X(1))
      ELSE
          SCALE = ZERO
          SSQ = ONE
          DO IX = 1,1 + (N-1)*INCX,INCX
              IF (X(IX).NE.ZERO) THEN
                  ABSXI = ABS(X(IX))
                  IF (SCALE.LT.ABSXI) THEN
                      SSQ = ONE + SSQ* (SCALE/ABSXI)**2
                      SCALE = ABSXI
                  ELSE
                      SSQ = SSQ + (ABSXI/SCALE)**2
                  END IF
              END IF
          END DO
          NORM = SCALE*SQRT(SSQ)
      END IF
!
      DNRM2 = NORM
      RETURN

end function dnrm2
!
!================================ Subroutine DROT ========================
!

subroutine DROT(N,DX,INCX,DY,INCY,C,S)
  use Types
  use ParamIO
  implicit none
      real(prec), intent(in) :: C
      real(prec), intent(in) :: S
      integer, intent(in) :: INCX
      integer, intent(in) :: INCY
      integer, intent(in) :: N
      real(prec), intent(inout) :: DX(*)
      real(prec), intent(inout) :: DY(*)
!     ..
!
!  Purpose
!  =======
!
!     DROT applies a plane rotation.
!
!     .. Local Scalars ..
      real(prec) :: DTEMP
      integer :: I,IX,IY
!
      IF (N.LE.0) RETURN
      IF (INCX.EQ.1 .AND. INCY.EQ.1) THEN
!
!       code for both increments equal to 1
!
         DO I = 1,N
            DTEMP = C*DX(I) + S*DY(I)
            DY(I) = C*DY(I) - S*DX(I)
            DX(I) = DTEMP
         END DO
      ELSE
!
!       code for unequal increments or equal increments not equal
!         to 1
!
         IX = 1
         IY = 1
         IF (INCX.LT.0) IX = (-N+1)*INCX + 1
         IF (INCY.LT.0) IY = (-N+1)*INCY + 1
         DO I = 1,N
            DTEMP = C*DX(IX) + S*DY(IY)
            DY(IY) = C*DY(IY) - S*DX(IX)
            DX(IX) = DTEMP
            IX = IX + INCX
            IY = IY + INCY
         END DO
      END IF
      RETURN
end subroutine drot
!
!============================Subroutine DROTG===========================
!
subroutine DROTG(DA,DB,C,S)
  use Types
  use ParamIO
  implicit none
  
      real(prec), intent(inout) :: C
      real(prec), intent(inout) :: DA
      real(prec), intent(inout) :: DB
      real(prec), intent(inout) :: S
!
!  Purpose
!  =======
!
!     DROTG construct givens plane rotation.

      real(prec) :: R,ROE,SCALE,Z
!     ..
!     .. Intrinsic Functions ..
      INTRINSIC DABS,DSIGN,DSQRT
!     ..
      ROE = DB
      IF (DABS(DA).GT.DABS(DB)) ROE = DA
      SCALE = DABS(DA) + DABS(DB)
      IF (SCALE.EQ.0.0d0) THEN
         C = 1.0d0
         S = 0.0d0
         R = 0.0d0
         Z = 0.0d0
      ELSE
         R = SCALE*DSQRT((DA/SCALE)**2+ (DB/SCALE)**2)
         R = DSIGN(1.0d0,ROE)*R
         C = DA/R
         S = DB/R
         Z = 1.0d0
         IF (DABS(DA).GT.DABS(DB)) Z = S
         IF (DABS(DB).GE.DABS(DA) .AND. C.NE.0.0d0) Z = 1.0d0/C
      END IF
      DA = R
      DB = Z
      RETURN
 end subroutine drotg
!
!============================Subroutine dtsrv ==========================
!
subroutine DTRSV(UPLO,TRANS,DIAG,N,A,LDA,X,INCX)
  use Types
  use ParamIO
  implicit none
  
      INTEGER, intent(in) :: INCX
      integer, intent(in) :: LDA
      integer, intent(in) :: N
      CHARACTER*1, intent(in) :: DIAG
      character*1, intent(in) :: TRANS
      character*1, intent(in) :: UPLO
      real(prec), intent(in)  :: A(LDA,*)
      real(prec), intent(inout) :: X(*)
!
! Purpose
!  =======
!
!  DTRSV  solves one of the systems of equations
!
!     A*x = b,   or   A**T*x = b,
!
!  where b and x are n element vectors and A is an n by n unit, or
!  non-unit, upper or lower triangular matrix.
!
!  No test for singularity or near-singularity is included in this
!  routine. Such tests must be performed before calling this routine.
!
!  Arguments
!  ==========
!
!  UPLO   - CHARACTER*1.
!           On entry, UPLO specifies whether the matrix is an upper or
!           lower triangular matrix as follows:
!
!              UPLO = 'U' or 'u'   A is an upper triangular matrix.
!
!              UPLO = 'L' or 'l'   A is a lower triangular matrix.
!
!           Unchanged on exit.
!
!  TRANS  - CHARACTER*1.
!           On entry, TRANS specifies the equations to be solved as
!           follows:
!
!              TRANS = 'N' or 'n'   A*x = b.
!
!              TRANS = 'T' or 't'   A**T*x = b.
!
!              TRANS = 'C' or 'c'   A**T*x = b.
!
!           Unchanged on exit.
!
!  DIAG   - CHARACTER*1.
!           On entry, DIAG specifies whether or not A is unit
!           triangular as follows:
!
!              DIAG = 'U' or 'u'   A is assumed to be unit triangular.
!
!              DIAG = 'N' or 'n'   A is not assumed to be unit
!                                  triangular.
!
!           Unchanged on exit.
!
!  N      - INTEGER.
!           On entry, N specifies the order of the matrix A.
!           N must be at least zero.
!           Unchanged on exit.
!
!  A      - DOUBLE PRECISION array of DIMENSION ( LDA, n ).
!           Before entry with  UPLO = 'U' or 'u', the leading n by n
!           upper triangular part of the array A must contain the upper
!           triangular matrix and the strictly lower triangular part of
!           A is not referenced.
!           Before entry with UPLO = 'L' or 'l', the leading n by n
!           lower triangular part of the array A must contain the lower
!           triangular matrix and the strictly upper triangular part of
!           A is not referenced.
!           Note that when  DIAG = 'U' or 'u', the diagonal elements of
!           A are not referenced either, but are assumed to be unity.
!           Unchanged on exit.
!
!  LDA    - INTEGER.
!           On entry, LDA specifies the first dimension of A as declared
!           in the calling (sub) program. LDA must be at least
!           max( 1, n ).
!           Unchanged on exit.
!
!  X      - DOUBLE PRECISION array of dimension at least
!           ( 1 + ( n - 1 )*abs( INCX ) ).
!           Before entry, the incremented array X must contain the n
!           element right-hand side vector b. On exit, X is overwritten
!           with the solution vector x.
!
!  INCX   - INTEGER.
!           On entry, INCX specifies the increment for the elements of
!           X. INCX must not be zero.
!           Unchanged on exit.
!
!

      real(prec) :: ZERO
      PARAMETER (ZERO=0.0D+0)
!
      real(prec) :: TEMP
      INTEGER :: I,INFO,IX,J,JX,KX
      LOGICAL :: NOUNIT

      LOGICAL :: LSAME
      EXTERNAL :: LSAME
!
      EXTERNAL :: XERBLA
!
      INTRINSIC MAX
!     ..
!
!     Test the input parameters.
!
      INFO = 0
      IF (.NOT.LSAME(UPLO,'U') .AND. .NOT.LSAME(UPLO,'L')) THEN
          INFO = 1
      ELSE IF (.NOT.LSAME(TRANS,'N') .AND. .NOT.LSAME(TRANS,'T') .AND. .NOT.LSAME(TRANS,'C')) THEN
          INFO = 2
      ELSE IF (.NOT.LSAME(DIAG,'U') .AND. .NOT.LSAME(DIAG,'N')) THEN
          INFO = 3
      ELSE IF (N.LT.0) THEN
          INFO = 4
      ELSE IF (LDA.LT.MAX(1,N)) THEN
          INFO = 6
      ELSE IF (INCX.EQ.0) THEN
          INFO = 8
      END IF
      IF (INFO.NE.0) THEN
          CALL XERBLA('DTRSV ',INFO)
          RETURN
      END IF
!
!     Quick return if possible.
!
      IF (N.EQ.0) RETURN
!
      NOUNIT = LSAME(DIAG,'N')
!
!     Set up the start point in X if the increment is not unity. This
!     will be  ( N - 1 )*INCX  too small for descending loops.
!
      IF (INCX.LE.0) THEN
          KX = 1 - (N-1)*INCX
      ELSE IF (INCX.NE.1) THEN
          KX = 1
      END IF
!
!     Start the operations. In this version the elements of A are
!     accessed sequentially with one pass through A.
!
      IF (LSAME(TRANS,'N')) THEN
!
!        Form  x := inv( A )*x.
!
          IF (LSAME(UPLO,'U')) THEN
              IF (INCX.EQ.1) THEN
                  DO 20 J = N,1,-1
                      IF (X(J).NE.ZERO) THEN
                          IF (NOUNIT) X(J) = X(J)/A(J,J)
                          TEMP = X(J)
                          DO 10 I = J - 1,1,-1
                              X(I) = X(I) - TEMP*A(I,J)
   10                     CONTINUE
                      END IF
   20             CONTINUE
              ELSE
                  JX = KX + (N-1)*INCX
                  DO 40 J = N,1,-1
                      IF (X(JX).NE.ZERO) THEN
                          IF (NOUNIT) X(JX) = X(JX)/A(J,J)
                          TEMP = X(JX)
                          IX = JX
                          DO 30 I = J - 1,1,-1
                              IX = IX - INCX
                              X(IX) = X(IX) - TEMP*A(I,J)
   30                     CONTINUE
                      END IF
                      JX = JX - INCX
   40             CONTINUE
              END IF
          ELSE
              IF (INCX.EQ.1) THEN
                  DO 60 J = 1,N
                      IF (X(J).NE.ZERO) THEN
                          IF (NOUNIT) X(J) = X(J)/A(J,J)
                          TEMP = X(J)
                          DO 50 I = J + 1,N
                              X(I) = X(I) - TEMP*A(I,J)
   50                     CONTINUE
                      END IF
   60             CONTINUE
              ELSE
                  JX = KX
                  DO 80 J = 1,N
                      IF (X(JX).NE.ZERO) THEN
                          IF (NOUNIT) X(JX) = X(JX)/A(J,J)
                          TEMP = X(JX)
                          IX = JX
                          DO 70 I = J + 1,N
                              IX = IX + INCX
                              X(IX) = X(IX) - TEMP*A(I,J)
   70                     CONTINUE
                      END IF
                      JX = JX + INCX
   80             CONTINUE
              END IF
          END IF
      ELSE
!
!        Form  x := inv( A**T )*x.
!
          IF (LSAME(UPLO,'U')) THEN
              IF (INCX.EQ.1) THEN
                  DO 100 J = 1,N
                      TEMP = X(J)
                      DO 90 I = 1,J - 1
                          TEMP = TEMP - A(I,J)*X(I)
   90                 CONTINUE
                      IF (NOUNIT) TEMP = TEMP/A(J,J)
                      X(J) = TEMP
  100             CONTINUE
              ELSE
                  JX = KX
                  DO 120 J = 1,N
                      TEMP = X(JX)
                      IX = KX
                      DO 110 I = 1,J - 1
                          TEMP = TEMP - A(I,J)*X(IX)
                          IX = IX + INCX
  110                 CONTINUE
                      IF (NOUNIT) TEMP = TEMP/A(J,J)
                      X(JX) = TEMP
                      JX = JX + INCX
  120             CONTINUE
              END IF
          ELSE
              IF (INCX.EQ.1) THEN
                  DO 140 J = N,1,-1
                      TEMP = X(J)
                      DO 130 I = N,J + 1,-1
                          TEMP = TEMP - A(I,J)*X(I)
  130                 CONTINUE
                      IF (NOUNIT) TEMP = TEMP/A(J,J)
                      X(J) = TEMP
  140             CONTINUE
              ELSE
                  KX = KX + (N-1)*INCX
                  JX = KX
                  DO 160 J = N,1,-1
                      TEMP = X(JX)
                      IX = KX
                      DO 150 I = N,J + 1,-1
                          TEMP = TEMP - A(I,J)*X(IX)
                          IX = IX - INCX
  150                 CONTINUE
                      IF (NOUNIT) TEMP = TEMP/A(J,J)
                      X(JX) = TEMP
                      JX = JX - INCX
  160             CONTINUE
              END IF
          END IF
      END IF
!
      RETURN

end subroutine dtrsv
!
!================================= Subroutine LSAME ==========================
!
FUNCTION LSAME(CA,CB)
  use Types
  use ParamIO
  implicit none
  
      CHARACTER, intent(in) :: CA
      character, intent(in) :: CB
      logical :: lsame
!     ..
!
!  Purpose
!  =======
!
!  LSAME returns .TRUE. if CA is the same letter as CB regardless of
!  case.
!
!  Arguments
!  =========
!
!  CA      (input) CHARACTER*1
!
!  CB      (input) CHARACTER*1
!          CA and CB specify the single characters to be compared.
!
! =====================================================================
!
!    .. Intrinsic Functions ..
      INTRINSIC ICHAR
!     ..
!     .. Local Scalars ..
      INTEGER :: INTA,INTB,ZCODE
!     ..
!
!     Test if the characters are equal
!
      LSAME = CA .EQ. CB
      IF (LSAME) RETURN
!
!     Now test for equivalence if both characters are alphabetic.
!
      ZCODE = ICHAR('Z')
!
!     Use 'Z' rather than 'A' so that ASCII can be detected on Prime
!     machines, on which ICHAR returns a value with bit 8 set.
!     ICHAR('A') on Prime machines returns 193 which is the same as
!     ICHAR('A') on an EBCDIC machine.
!
      INTA = ICHAR(CA)
      INTB = ICHAR(CB)
!
      IF (ZCODE.EQ.90 .OR. ZCODE.EQ.122) THEN
!
!        ASCII is assumed - ZCODE is the ASCII code of either lower or
!        upper case 'Z'.
!
          IF (INTA.GE.97 .AND. INTA.LE.122) INTA = INTA - 32
          IF (INTB.GE.97 .AND. INTB.LE.122) INTB = INTB - 32
!
      ELSE IF (ZCODE.EQ.233 .OR. ZCODE.EQ.169) THEN
!
!        EBCDIC is assumed - ZCODE is the EBCDIC code of either lower or
!        upper case 'Z'.
!
          IF (INTA.GE.129 .AND. INTA.LE.137 .OR.  &
     &        INTA.GE.145 .AND. INTA.LE.153 .OR. &
     &        INTA.GE.162 .AND. INTA.LE.169) INTA = INTA + 64
          IF (INTB.GE.129 .AND. INTB.LE.137 .OR. &
     &        INTB.GE.145 .AND. INTB.LE.153 .OR. &
     &        INTB.GE.162 .AND. INTB.LE.169) INTB = INTB + 64
!
      ELSE IF (ZCODE.EQ.218 .OR. ZCODE.EQ.250) THEN
!
!        ASCII is assumed, on Prime machines - ZCODE is the ASCII code
!        plus 128 of either lower or upper case 'Z'.
!
          IF (INTA.GE.225 .AND. INTA.LE.250) INTA = INTA - 32
          IF (INTB.GE.225 .AND. INTB.LE.250) INTB = INTB - 32
      END IF
      LSAME = INTA .EQ. INTB
!
1     RETURN
!
!     End of LSAME
!
end function lsame
!
!======================== Subroutine xerbla ======================
!
SUBROUTINE XERBLA( SRNAME, INFO )
  use Types
  use ParamIO
  implicit none

!     .. Scalar Arguments ..
      CHARACTER*(*) ::      SRNAME
      INTEGER ::            INFO
!     ..
!
!  Purpose
!  =======
!
!  XERBLA  is an error handler for the LAPACK routines.
!  It is called by an LAPACK routine if an input parameter has an
!  invalid value.  A message is printed and execution stops.
!
!  Installers may consider modifying the STOP statement in order to
!  call system-specific exception-handling facilities.
!
!  Arguments
!  =========
!
!  SRNAME  (input) CHARACTER*(*)
!          The name of the routine which called XERBLA.
!
!  INFO    (input) INTEGER
!          The position of the invalid parameter in the parameter list
!          of the calling routine.
!
      INTRINSIC          LEN_TRIM

      WRITE( IOW, FMT = 9999 )SRNAME( 1:LEN_TRIM( SRNAME ) ), INFO
!
      STOP
!
 9999 FORMAT( ' ** On entry to ', A, ' parameter number ', I2, ' had ', &
     &      'an illegal value' )

end subroutine xerbla



!============================SUBROUTINE RENUM ==========================
subroutine renum(nops, nelm, MAXCON, icon, iep,nmpc,lstmpc, numnod)
  use Types
  use ParamIO
  use Parambw
  implicit none

  integer, intent( in )    :: nops                        
  integer, intent( inout ) :: nelm
  integer, intent( in )    :: nmpc                        
  integer, intent( in )    :: MAXCON                      
  integer, intent( inout ) :: icon(MAXCON)                
  integer, intent( inout ) :: iep(7, nelm)
  integer, intent( in )    :: lstmpc(7, nmpc)                    
  integer, intent( inout ) :: numnod(*)                   
  
  ! Local Variables
  integer :: iadj, ideg, ipair, iwumax, iwvmax, levl, levlu,  &
       levlv, levw, levwu, levwv, n, nlevu, nlevv, nodl, nodlu
  integer :: nodlv, nu, nv
  
  dimension ideg(MAXNBW), iadj(MAXAD, MAXNBW)
  dimension nodlv(MAXNBW), levlv(MAXWID, MAXLEV)
  dimension levwv(MAXLEV)
  dimension nodlu(MAXNBW), levlu(MAXWID, MAXLEV)
  dimension levwu(MAXLEV)
  dimension nodl(MAXNBW), levl(MAXWID, MAXLEV)
  dimension levw(MAXLEV)
  
  !     Bandwidth minimization algorithm of Gibbs et al,
  !     SIAM J NUMER ANAL 13 (2) 1976
  
  !     Input variables:
  
  !     NOPS         Total no. nodal points
  !     NELM         Total no. elements
  !     ICON(J)      Connectivity array
  !     IEP(J,I)   Pointer for connectivity array
  
  !     Retured on exit
  
  !     NUMNOD(I)  New number for Ith node
  !
  !     Extended 3/21/00 to handle meshes that contain nodes of zero degree.
  !     numnod(i) = 0 for zero degree nodes.
  
  if ( nops > MAXNBW ) then
    write (IOW, 99001) nops
    stop
  end if
  
  
  !     Generate list of adjacent nodes and degree for each node
  call adjgen(nops, nelm, MAXCON, icon, iep, nmpc,lstmpc, ideg, iadj)
  
  !     Find endpoints of pseudo-diameter
  call diam(nops+nmpc, ideg, iadj, nv, nlevv, nodlv, levlv, levwv,  &
       iwvmax, nu, nlevu, nodlu, levlu, levwu, iwumax)
  
  !     Generate new level structure of minimum width
  call widmin(nops+nmpc, ideg, iadj, nodlv, iwvmax, nlevu, nodlu, iwumax,  &
       nodl, levl, levw, ipair)
  
  !     Number nodes based on final level structure
  call numgen(nops+nmpc, ipair, nu, nv, levl, levw, nlevv, ideg, iadj, numnod)
  
  do n = 1, nops+nmpc
    if ( numnod(n)>nops+nmpc ) then
      write (IOW, 99002) n, numnod(n)
      stop
    end if
    if ( numnod(n)<1.and.ideg(n)>0 ) then
      write (IOW, 99003) n, numnod(n)
      stop
    end if
  end do


99001 format ( //, '  ERROR DETECTED DURING BANDWIDTH REDUCTION  ', /, &
           '  INSUFFICIENT STORAGE PARAMETER MAXNBW MUST BE GREATER THAN ', I4)
99002 format ( //, '    ***  ERROR DETECTED IN RENUM ', /, &
           '       Node ', I4, ' has number ', I4)
99003 format ( //, '    ***  ERROR DETECTED IN RENUM ', /, &
           '       Node ', I4, ' has number ', I4)

end subroutine renum

!====================SUBROUTINE ADJGEN ======================
subroutine adjgen(nops, nelm, MAXCON, icon, iep, nmpc, lstmpc, ideg, iadj)
  use Types
  use ParamIO
  use Parambw
  implicit none

  integer, intent( in )    :: nops                               
  integer, intent( in )    :: nelm                               
  integer, intent( in )    :: MAXCON
  integer, intent( in )    :: nmpc                             
  integer, intent( in )    :: icon(MAXCON)                       
  integer, intent( inout ) :: iep(7, nelm)
  integer, intent( in )    :: lstmpc(7, nmpc)                           
  integer, intent( out )   :: ideg(MAXNBW)                       
  integer, intent( out )   :: iadj(MAXAD, MAXNBW) 

  ! Local Variables
  integer :: i, j, l, lmn, n, node, mpc

  do i = 1, nops+nmpc
    ideg(i) = 0
    do j = 1, MAXAD
      iadj(j, i) = 0
    end do
  end do
  !     Loop over all elements
  do lmn = 1, nelm

    !     For each node on current element add other nodes
    !     on same element to adjacency list

    do i = 1, iep(3, lmn)
      node = icon(i + iep(2, lmn) - 1)
      do j = 1, iep(3, lmn)
        n = icon(j + iep(2, lmn) - 1)
        if ( n/=node ) then

          !     check whether node n is already in list

          do l = 1, ideg(node)
            if ( iadj(l, node)==n ) goto 20
          end do

          !     If not in list, add

          ideg(node) = ideg(node) + 1
          if ( ideg(node)>MAXAD ) then
            write (IOW, 99001) MAXAD
            stop
          end if
          iadj(ideg(node), node) = n
        end if
20    end do
    end do
  end do


 !     Loop over mpcs
  do mpc = 1, nmpc

    !     For each node on current element add other nodes
    !     on same element to adjacency list

    do i = 1, 2
      node = lstmpc(2*i,mpc)
      do j = 1, 2
        n = lstmpc(2*j,mpc)
        if ( n/=node ) then

          !     check whether node n is already in list

          do l = 1, ideg(node)
            if ( iadj(l, node)==n ) goto 25
          end do

          !     If not in list, add

          ideg(node) = ideg(node) + 1
          if ( ideg(node)>MAXAD ) then
            write (IOW, 99001) MAXAD
            stop
          end if
          iadj(ideg(node), node) = n
        end if
25    end do
      ideg(node) = ideg(node) + 1
	  iadj(ideg(node),node) = nops+mpc
	  ideg(nops+mpc) = ideg(nops+mpc)+1
	  iadj(ideg(nops+mpc),nops+mpc) = node
    end do
  end do

continue

99001 format (/, /, '  ERROR DETECTED DURING BANDWIDTH REDUCTION  ',  &
       /'  INSUFFICIENT STORAGE TO COMPUTE LEVEL STRUCTURE ',  &
       '  PARAMETER MAXAD MUST BE GREATER THAN ', I4)

end subroutine adjgen

!=====================SUBROUTINE DIAM ==========================
subroutine diam(nops, ideg, iadj, nv, nlevv, nodlv, levlv, levwv,  &
     iwvmax, nu, nlevu, nodlu, levlu, levwu, iwumax)
  use Types
  use Parambw
  implicit none

  integer, intent( in )    :: nops                                 
  integer, intent( out )   :: nv                                   
  integer, intent( out )   :: nlevv                                
  integer, intent( inout ) :: iwvmax                               
  integer, intent( out )   :: nu                                   
  integer, intent( out )   :: nlevu                                
  integer, intent( out )   :: iwumax                               
  integer, intent( in )    :: ideg(MAXNBW)                         
  integer, intent( inout ) :: iadj(MAXAD, MAXNBW)                  
  integer, intent( out )   :: nodlv(MAXNBW)                        
  integer, intent( inout ) :: levlv(MAXWID, MAXLEV)                
  integer, intent( inout ) :: levwv(MAXLEV)                        
  integer, intent( out )   :: nodlu(MAXNBW)                        
  integer, intent( out )   :: levlu(MAXWID, MAXLEV)                
  integer, intent( out )   :: levwu(MAXLEV)                        

  ! Local Variables
  integer :: i, id, index, iwsmax, j, k, levls, levws, maxit, mindeg,  &
       minnod, minrem
  integer :: n, nit, nlevs, nodls, ns

  dimension nodls(MAXNBW), levls(MAXWID, MAXLEV)
  dimension levws(MAXLEV)
  dimension index(MAXWID), id(MAXWID)

  !     Subroutine to find endpoints NV and NU of pseudo-diameter
  !     and associated level structures LU and LV

  !     Find an arbitrary node of smallest degree
  mindeg = nops
  do i = 1, nops
    if ( ideg(i)<mindeg.and.ideg(i)>0 ) then
      mindeg = ideg(i)
      minnod = i
    end if
  end do

  !     Generate a level structure starting at node of lowest degree
  nv = minnod
  call levgen(nops, nv, ideg, iadj, nodlv, levlv, levwv, nlevv, iwvmax)

  !     Loop over nodes in highest level in order of increasing degree.  For each node, generate
  !     a new level structure.

  nit = 0
  maxit = 30

  !---  Generate index table for nodes in highest level
100 do i = 1, levwv(nlevv)
    id(i) = ideg(levlv(i, nlevv))
  end do
  n = levwv(nlevv)
  call isort(n, id, index)

  i = 0
  minrem = nops

200 i = i + 1
  ns = levlv(index(i), nlevv)
  call levgen(nops, ns, ideg, iadj, nodls, levls, levws, nlevs, iwsmax)

  !     If depth of new level structure
  !     is greater than that of old one, swap over and start again

  if ( nlevs>nlevv ) then
    nv = ns
    do j = 1, nops
      nodlv(j) = nodls(j)
    end do
    do j = 1, nlevs
      do k = 1, levws(j)
        levlv(k, j) = levls(k, j)
      end do
      levwv(j) = levws(j)
    end do
    nlevv = nlevs
    if ( nit<maxit ) goto 100
  end if

  !     Store level structure with minimum width
  if ( iwsmax<=minrem ) then
    minrem = iwsmax
    nu = ns
    do j = 1, nops
      nodlu(j) = nodls(j)
    end do
    do j = 1, nlevs
      do k = 1, levws(j)
        levlu(k, j) = levls(k, j)
      end do
      levwu(j) = levws(j)
    end do
    iwumax = iwsmax
    nlevu = nlevs

  end if

  !     Repeat for next node in highest level of v
  if ( i<levwv(nlevv) ) goto 200

end subroutine diam

!====================SUBROUTINE WIDMIN =======================
subroutine widmin(nops, ideg, iadj, nodlv, iwvmax, nlevu, nodlu,  &
     iwumax, nodl, levl, levw, ipair)
  use Types
  use ParamIO
  use Parambw
  implicit none

  integer, intent( in )    :: nops                                
  integer, intent( inout ) :: iwvmax                              
  integer, intent( in )    :: nlevu                               
  integer, intent( inout ) :: iwumax                              
  integer, intent( out )   :: ipair                               
  integer, intent( in )    :: ideg(MAXNBW)                        
  integer, intent( inout ) :: iadj(MAXAD, MAXNBW)                 
  integer, intent( in )    :: nodlv(MAXNBW)                       
  integer, intent( in )    :: nodlu(MAXNBW)                       
  integer, intent( out )   :: nodl(MAXNBW)                        
  integer, intent( out )   :: levl(MAXWID, MAXLEV)                
  integer, intent( out )   :: levw(MAXLEV)                        

  ! Local Variables
  integer :: i, icount, ideg2, ih, ihmax, il, ilev, ilmax,  &
       index, iwsmax, j, jcount, levls
  integer :: levwh, levwl, levws, liscon, m, n, ncon, nlevs, nn,  &
       node, nodls, nstrt, numc

  dimension ideg2(MAXNBW)
  dimension nodls(MAXNBW), levls(MAXWID, MAXLEV)
  dimension levws(MAXLEV)
  dimension levwh(MAXLEV), levwl(MAXLEV)
  dimension numc(MAXLEV), liscon(MAXNBW, MAXLEV)
  dimension index(MAXLEV)

  !     Subroutine to assemble nodes into new level
  !     structure to minimize level width

  !     Extract nodes from Lu and Lv with identical level pairs
  do i = 1, MAXLEV
    levw(i) = 0
  end do
  icount = 0
  do i = 1,nops
    if (ideg(i) > 0) icount = icount + 1
  end do
  ideg2 = ideg
  do i = 1, nops
   if (ideg(i) > 0) then
    if ( nodlv(i)==nlevu + 1 - nodlu(i) ) then
      n = nodlv(i)
      nodl(i) = n
      m = levw(n)
      levw(n) = m + 1
      levl(m + 1, n) = i
      icount = icount - 1
      ideg2(i) = 0
    else
      ideg2(i) = ideg(i)
    end if
   endif
  end do

  if ( icount==0 ) return

  !     Collect nodes into disjoint connected components
  ncon = 0
  do i = 1, nops
    if ( ideg2(i)/=0 ) then
      nstrt = i
      !     ---   Find all nodes connected to current one by generating levels
      call levgen(nops, nstrt, ideg2, iadj, nodls, levls, levws, nlevs, iwsmax)
      !     ---   Add nodes in level structure to connected component
      ncon = ncon + 1
      if ( ncon>MAXLEV ) then
        write (IOW, 99001) MAXLEV

        stop
      end if
      jcount = 0
      do n = 1, nlevs
        do j = 1, levws(n)
          jcount = jcount + 1
          liscon(jcount, ncon) = levls(j, n)
          ideg2(liscon(jcount, ncon)) = 0
        end do
      end do
      numc(ncon) = jcount
    end if
  end do


  !     Sort connected components by size
  call isort(ncon, numc, index)


  !     Loop over connected components
  do i = 1, ncon
    n = index(ncon + 1 - i)

    !     Compute estimates of level width based on u and v structures
    do j = 1, MAXLEV
      levwh(j) = levw(j)
      levwl(j) = levw(j)
    end do
    do j = 1, numc(n)
      node = liscon(j, n)
      ih = nodlv(node)
      il = nlevu + 1 - nodlu(node)
      levwh(ih) = levwh(ih) + 1
      levwl(il) = levwl(il) + 1
    end do

    ihmax = 0
    ilmax = 0
    do j = 1, nlevu
      if ( levwh(j)>ihmax .and. levwh(j)>levw(j) ) ihmax = levwh(j)
      if ( levwl(j)>ilmax .and. levwl(j)>levw(j) ) ilmax = levwl(j)
    end do

    !     Assign nodes to levels based on calculated widths
    if ( ilmax>ihmax ) then
      !---  Put nodes in levels of v
      if ( i==1 ) ipair = 1
      do j = 1, numc(n)
        node = liscon(j, n)
        ilev = nodlv(node)
        nodl(node) = ilev
        levw(ilev) = levw(ilev) + 1
        nn = levw(ilev)
        levl(nn, ilev) = node
      end do
    else if ( ilmax<ihmax ) then
      !---  Put nodes in levels of u
      if ( i==1 ) ipair = 2
      do j = 1, numc(n)
        node = liscon(j, n)
        ilev = nlevu + 1 - nodlu(node)
        nodl(node) = ilev
        levw(ilev) = levw(ilev) + 1
        nn = levw(ilev)
        levl(nn, ilev) = node
      end do
    else if ( iwvmax<=iwumax ) then
      !---  Put nodes in levels of v
      if ( i==1 ) ipair = 1
      do j = 1, numc(n)
        node = liscon(j, n)
        ilev = nodlv(node)
        nodl(node) = ilev
        levw(ilev) = levw(ilev) + 1
        nn = levw(ilev)
        levl(nn, ilev) = node
      end do
    else
      if ( i==1 ) ipair = 2
      do j = 1, numc(n)
        node = liscon(j, n)
        ilev = nlevu + 1 - nodlu(node)
        nodl(node) = ilev
        levw(ilev) = levw(ilev) + 1
        nn = levw(ilev)
        levl(nn, ilev) = node
      end do
    end if

  end do

99001 format (/, /, ' **** ERROR DETECTED BY SUBROUTINE WIDMIN *** ',  &
       /'  Parameter MAXLEV must be greater than ', I4)

end subroutine widmin

!======================SUBROUTINE NUMGEN ======================
subroutine numgen(nops, ipair, nu, nv, levl, levw, nlev, ideg, iadj, numnod)
  use Types
  use Parambw
  implicit none

  integer, intent( in )    :: nops                                 
  integer, intent( inout ) :: ipair                                
  integer, intent( inout ) :: nu                                   
  integer, intent( inout ) :: nv                                   
  integer, intent( in )    :: nlev                                 
  integer, intent( in )    :: levl(MAXWID, MAXLEV)                 
  integer, intent( in )    :: levw(MAXLEV)                         
  integer, intent( in )    :: ideg(MAXNBW)                         
  integer, intent( inout ) :: iadj(MAXAD, MAXNBW)                  
  integer, intent( inout ) :: numnod(*)                            

  ! Local Variables
  integer :: i, index, irev, l, l1, lcount, ldeg,  &
       lend, linc, list, lstart, mindeg, n, node
  integer :: nodrem, number

  dimension list(MAXWID), ldeg(MAXWID), index(MAXWID)

  !     Subroutine to assign node numbers based on final level
  !     structure

  do i = 1, nops
    numnod(i) = 0
  end do

  if ( ideg(nv)<=ideg(nu) ) then
    numnod(nv) = 1
    irev = 0
  else
    numnod(nu) = 1
    irev = 1
  end if
  number = 1

  !     Number nodes in first (last) level

  l = 1
  if ( irev==1 ) l = nlev
  do while ( .true. )

    call lowfnd(levl(1, l), levw(l), levl(1, l), levw(l), ideg,  &
         iadj, numnod, list, ldeg, lcount)

    if ( lcount>0 ) then
      call isort(lcount, ldeg, index)

      do i = 1, lcount
        n = index(i)
        node = list(n)
        number = number + 1
        numnod(node) = number
      end do
      cycle
    end if

    !     Check for unnumbered nodes in first level

    nodrem = 0
    mindeg = nops
    do i = 1, levw(l)
      node = levl(i, l)
      if ( numnod(node)==0 ) then
        if ( ideg(node)<mindeg.and.ideg(node)>0 ) then
          mindeg = ideg(node)
          nodrem = node
        end if
      end if
    end do

    if ( nodrem>0 ) then
      number = number + 1
      numnod(nodrem) = number
      cycle
    end if

    if ( irev==0 ) then
      lstart = 2
      lend = nlev
      linc = 1
    else
      lstart = nlev - 1
      lend = 1
      linc = -1
    end if

    !     Number nodes in remaining levels

    do l = lstart, lend, linc

      l1 = l - linc
      do while ( .true. )

        call lowfnd(levl(1, l1), levw(l1), levl(1, l), levw(l),  &
             ideg, iadj, numnod, list, ldeg, lcount)

        if ( lcount>0 ) then
          call isort(lcount, ldeg, index)

          do i = 1, lcount
            n = index(i)
            node = list(n)
            number = number + 1
            numnod(node) = number
          end do
          cycle
        end if

        !     Check for unnumbered nodes in current level

        nodrem = 0
        mindeg = nops
        do i = 1, levw(l)
          node = levl(i, l)
          if ( numnod(node)==0 ) then
            if ( ideg(node)<=mindeg.and.ideg(node)>0 ) then
              mindeg = ideg(node)
              nodrem = node
            end if
          end if
        end do

        if ( nodrem>0 ) then
          number = number + 1
          numnod(nodrem) = number
          cycle
        end if
        exit
      end do

    end do

    !     Reverse numbering if appropriate

    nodrem = 0
    do i = 1,nops
      if (ideg(i)>0) nodrem = nodrem + 1
    end do

    if ( ((irev==1.) .and. (ipair==2)) .or.  &
         ((irev==0.) .and. (ipair==1)) ) then
      do i = 1, nops
        if (ideg(i) > 0) numnod(i) = nodrem + 1 - numnod(i)
      end do
    end if

    return
  end do

end subroutine numgen


!=======================Subroutine LOWFND ======================
subroutine lowfnd(lev1, levw1, lev2, levw2, ideg, iadj, numnod,  &
     list, ldeg, lcount)
  use Types
  use Parambw
  implicit none

  integer, intent( in )    :: levw1                                
  integer, intent( in )    :: levw2                                
  integer, intent( out )   :: lcount                               
  integer, intent( in )    :: lev1(MAXWID)                         
  integer, intent( in )    :: lev2(MAXWID)                         
  integer, intent( in )    :: ideg(MAXNBW)                         
  integer, intent( in )    :: iadj(MAXAD, MAXNBW)                  
  integer, intent( inout ) :: numnod(*)                            
  integer, intent( out )   :: list(MAXWID)                         
  integer, intent( out )   :: ldeg(MAXWID)                         

  ! Local Variables
  integer :: j, k, lctemp,  low, ltemp, n, nbr, node1, node2

  dimension  ltemp(MAXWID)

  !     Function to find lowest numbered node
  !     of level LEV1 which has unnumbered nodes
  !     in level LEV2 adjacent to it, and return list
  !     of adjacent unnumbered nodes

  low = MAXNBW + 1
  lcount = 0
  !     ---Loop over nodes in level LEV1
  do n = 1, levw1
    node1 = lev1(n)
    !     -- If current node has lower number, then...
    if ( (numnod(node1)<low) .and. (numnod(node1)>0) ) then
      lctemp = 0
      !     --  Check all adjoining nodes
      do j = 1, ideg(node1)
        nbr = iadj(j, node1)
        if ( numnod(nbr)==0 ) then
          !     --    If adjoining node is in level LEV2, then...
          do k = 1, levw2
            node2 = lev2(k)
            !     --   add adjoining unnumbered node to list
            if ( node2==nbr ) then
              lctemp = lctemp + 1
              ltemp(lctemp) = node2
            end if
          end do
        end if
      end do
      if ( lctemp>0 ) then
        low = numnod(node1)
        lcount = lctemp
        do j = 1, lcount
          list(j) = ltemp(j)
          ldeg(j) = ideg(list(j))
        end do
      end if
    end if
  end do

end subroutine lowfnd

!======================Subroutine LEVGEN ================
subroutine levgen(nops, nstrt, ideg, iadj, nodlev, levlst, levwid,  &
     nlev, iwidth)
  use Types
  use ParamIO
  use Parambw
  implicit none

  integer, intent( in )  :: nops                                    
  integer, intent( in )  :: nstrt                                   
  integer, intent( out ) :: nlev                                    
  integer, intent( out ) :: iwidth                                  
  integer, intent( in )  :: ideg(MAXNBW)                            
  integer, intent( in )  :: iadj(MAXAD, MAXNBW)                     
  integer, intent( out ) :: nodlev(MAXNBW)                          
  integer, intent( out ) :: levlst(MAXWID, MAXLEV)                  
  integer, intent( out ) :: levwid(MAXLEV)                          

  ! Local Variables
  integer :: i, j, nbr, nl1, nn, node

  !     Subroutine to generate a level structure starting at
  !     node NSTRT
  !     NOPS        Total no. nodal points
  !     NSTRT       Index of start node
  !     IDEG(I)     Degree of Ith node
  !     IADJ(I,J)   Adjacency list for Jth node
  !     NODLEV(I)   Level for Ith node
  !     LEVLST(I,J) List of nodes in Jth level
  !     NLEV        Total no. levels
  !     LEVWID(I)   Width of Ith level

  do i = 1, nops
    nodlev(i) = 0
  end do
  do i = 1, MAXLEV
    levwid(i) = 0
  end do

  !     Fist level contains only start node

  nodlev(nstrt) = 1
  levwid(1) = 1
  levlst(1, 1) = nstrt
  nlev = 1
  iwidth = 0
  do while ( .true. )

    nl1 = nlev
    nlev = nlev + 1
    if ( nlev>MAXLEV ) then
      write (IOW, 99001) MAXLEV
      stop
    end if

    !     Loop over nodes in preceding level, adding
    !     adjoining nodes to next level

    do i = 1, levwid(nl1)
      node = levlst(i, nl1)
      !     --- Loop over adjoining nodes
      do j = 1, ideg(node)
        nbr = iadj(j, node)
        !     ---   If adjoining node has not been assigned a level, add to next level
        if ( nodlev(nbr)==0 .and. ideg(nbr)>0 ) then
          levwid(nlev) = levwid(nlev) + 1
          if ( levwid(nlev)>MAXWID ) then
            write (IOW, 99002) MAXWID
            stop
          end if
          nn = levwid(nlev)
          if ( nn>iwidth ) iwidth = nn
          levlst(nn, nlev) = nbr
          nodlev(nbr) = nlev
        end if
      end do
    end do

    if ( levwid(nlev)<=0 ) exit
  end do

  nlev = nlev - 1

99001 format (/, /, '  ERROR DETECTED DURING BANDWIDTH REDUCTION  ',  &
       /'  INSUFFICIENT STORAGE TO COMPUTE LEVEL STRUCTURE ',  &
       '  PARAMETER MAXLEV MUST BE GREATER THAN ', I4)
99002 format (/, /, '  ERROR DETECTED DURING BANDWIDTH REDUCTION  ', /,  &
       '  INSUFFICIENT STORAGE TO COMPUTE LEVEL STRUCTURE ',  &
       '  PARAMETER MAXWID MUST BE GREATER THAN ', I4)

end subroutine levgen

!=======================SUBROUTINE ISORT ========================
subroutine isort(n, in, index)
  use Types
  implicit none

  integer, intent( in )  :: n                         
  integer, intent( in )  :: in(*)                     
  integer, intent( out ) :: index(*)                  

  ! Local Variables
  integer :: i, indxt, ir, j, k, l

  !     Subroutine to generate an index listing
  !     elements of IN in increasing magnitude
  do j = 1, n
    index(j) = j
  end do

  if ( n==1 ) return
  l = n/2 + 1
  ir = n
100 if ( l>1 ) then
    l = l - 1
    indxt = index(l)
    k = in(indxt)
  else
    indxt = index(ir)
    k = in(indxt)
    index(ir) = index(1)
    ir = ir - 1
    if ( ir==1 ) then
      index(1) = indxt
      return
    end if
  end if
  i = l
  j = l + l
  do while ( .true. )
    if ( j<=ir ) then
      if ( j<ir ) then
        if ( in(index(j))<in(index(j + 1)) ) j = j + 1
      end if
      if ( k<in(index(j)) ) then
        index(i) = index(j)
        i = j
        j = j + j
      else
        j = ir + 1
      end if
      cycle
    end if
    index(i) = indxt
    goto 100
  end do

end subroutine isort

!============================== Subroutine ASSFORC =============================

subroutine assforc(nzone, izplmn, nelm, nops,  MAXCOR, MAXDOF, MAXSTN,  &
     MAXCON, MAXVAR, MAXPRP, iep, icon, nodpn, x, utot, du, stnod,  &
     density, eprop, svart, svaru, forc, neq)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )                    :: MAXCOR
  integer, intent( in )                    :: MAXDOF
  integer, intent( in )                    :: MAXSTN
  integer, intent( in )                    :: MAXVAR
  integer, intent( in )                    :: nzone
  integer, intent( inout )                 :: nops
  integer, intent( in )                    :: nelm
  integer, intent( in )                    :: MAXCON
  integer, intent( in )                    :: MAXPRP
  integer, intent( in )                    :: neq
  integer, intent( in )                    :: izplmn(2,nzone)
  integer, intent( in )                    :: nodpn(7, nops)
  integer, intent( in )                    :: icon(MAXCON)
  integer, intent( inout )                 :: iep(7, nelm)
  real( prec ), intent( in )               :: density(nzone)
  real( prec ), intent( in )               :: x(MAXCOR)
  real( prec ), intent( inout )            :: eprop(MAXPRP)
  real( prec ), intent( in )               :: utot(MAXDOF)
  real( prec ), intent( in )               :: du(MAXDOF)
  real( prec ), intent( in )               :: stnod(MAXSTN) 
  real( prec ), intent( inout )            :: svart(MAXVAR)                 
  real( prec ), intent( inout )            :: svaru(MAXVAR) 
  real( prec ), intent( out )              :: forc(neq)
    ! Local Variables

  integer      :: i,  ix, iu, j, lmn
  integer      :: n, is, node,  iof, icount

  integer :: nodpl(4, MAXNDL)
  real ( prec ) ::  xloc(MAXCRL), duloc(MAXDFL), utloc(MAXDFL), stnloc(MAXSNL)
  real ( prec ) :: resid(MAXSTF)


!
!        Subroutine to assemble force vector for explicit dynamic analysis
!

 do lmn = 1, nelm

    !     Extract local coords, DOF and nodal state/props for the element

    ix = 0
    iu = 0
    is = 0

    do j = 1, iep(3, lmn)
      node = icon(iep(2, lmn) + j - 1)
      nodpl(1, j) = nodpn(1, node)
      nodpl(2, j) = nodpn(3, node)
      nodpl(3, j) = nodpn(5, node)
      nodpl(4, j) = nodpn(7, node)
      do n = 1, nodpn(3, node)
        ix = ix + 1
        if (ix>MAXCRL) then
          write(IOW,*) ' Error detected in subroutine ASSFORC '
          write(IOW,*) ' Insufficient storage for nodal coords '
          write(IOW,*) ' Increase parameter MAXSTT in Paramsol.f90 '
          stop
        endif
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
      do n = 1, nodpn(5, node)
        iu = iu + 1
        if (iu>MAXDFL) then
          write(IOW,*) ' Error detected in subroutine ASSFORC '
          write(IOW,*) ' Insufficient storage for nodal DOF '
          write(IOW,*) ' Increase parameter MAXDFL in Paramsol.f90 '
          stop
        endif
        duloc(iu) = du(nodpn(4, node) + n - 1)
        utloc(iu) = utot(nodpn(4, node) + n - 1)
      end do
      do n = 1, nodpn(7, node)
        is = is + 1
        if (is>MAXSNL) then
          write(IOW,*) ' Error detected in subroutine ASSFORC '
          write(IOW,*) ' Insufficient storage for nodal state '
          write(IOW,*) ' Increase parameter MAXSNL in Paramsol.f90 '
          stop
        endif
        stnloc(is) = stnod(nodpn(6, node) + n - 1)
      end do
    end do

    !     Form element force vector

    call elforc(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         duloc, utloc, iu, stnloc, is, eprop(iep(4, lmn)),  &
         iep(5, lmn), svart(iep(6, lmn)), svaru(iep(6, lmn)),  &
         iep(7, lmn), resid, MAXSTF)

    icount = 0
    do j = 1,iep(3,lmn)
	   node = icon(iep(2,lmn)+j-1)
	   iof = nodpn(4,node)
	   do n = 1,nodpn(5,node)
	      icount = icount + 1
	      forc(iof+n-1) = forc(iof+n-1) + resid(icount)
	   end do
    end do


   end do

   return
   end subroutine assforc


!============================== Subroutine ASSLMASS =============================

subroutine asslmass(nzone, izplmn, nelm, nops,  MAXCOR, MAXDOF, MAXSTN,  &
     MAXCON, MAXVAR, MAXPRP, iep, icon, nodpn, x, utot, du, stnod,  &
     density, eprop, svart, svaru, lmass, neq)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )                    :: MAXCOR
  integer, intent( in )                    :: MAXDOF
  integer, intent( in )                    :: MAXSTN
  integer, intent( in )                    :: MAXVAR
  integer, intent( in )                    :: nzone
  integer, intent( inout )                 :: nops
  integer, intent( in )                    :: nelm
  integer, intent( in )                    :: MAXCON
  integer, intent( in )                    :: MAXPRP
  integer, intent( in )                    :: neq
  integer, intent( in )                    :: izplmn(2,nzone)
  integer, intent( in )                    :: nodpn(7, nops)
  integer, intent( in )                    :: icon(MAXCON)
  integer, intent( inout )                 :: iep(7, nelm)
  real( prec ), intent( in )               :: density(nzone)
  real( prec ), intent( in )               :: x(MAXCOR)
  real( prec ), intent( inout )            :: eprop(MAXPRP)
  real( prec ), intent( in )               :: utot(MAXDOF)
  real( prec ), intent( in )               :: du(MAXDOF)
  real( prec ), intent( in )               :: stnod(MAXSTN) 
  real( prec ), intent( inout )            :: svart(MAXVAR)                 
  real( prec ), intent( inout )            :: svaru(MAXVAR) 
  real( prec ), intent( out )              :: lmass(neq)
    ! Local Variables

  integer      :: i,j, lmn
  integer      :: n,ix,is,iu,iz,iof, node, nodpl,icount

  dimension nodpl(4, MAXNDL)
  real ( prec ) ::  xloc(MAXCRL), duloc(MAXDFL), utloc(MAXDFL), stnloc(MAXSNL)
  real ( prec ) :: dmloc(MAXDFL)

  !     Assemble a lumped mass matrix

  lmass = 0.d0

  do iz = 1,nzone

    do lmn = izplmn(1,iz), izplmn(2,iz)

     !     Extract local coords, DOF and nodal state/props for the element

      ix = 0
      iu = 0
      is = 0

      do j = 1, iep(3, lmn)
        node = icon(iep(2, lmn) + j - 1)
        nodpl(1, j) = nodpn(1, node)
        nodpl(2, j) = nodpn(3, node)
        nodpl(3, j) = nodpn(5, node)
        nodpl(4, j) = nodpn(7, node)
        do n = 1, nodpn(3, node)
          ix = ix + 1
          xloc(ix) = x(nodpn(2, node) + n - 1)
        end do
        do n = 1, nodpn(5, node)
          iu = iu + 1
          duloc(iu) = du(nodpn(4, node) + n - 1)
         utloc(iu) = utot(nodpn(4, node) + n - 1)
        end do
        do n = 1, nodpn(7, node)
          is = is + 1
          stnloc(is) = stnod(nodpn(6, node) + n - 1)
        end do
      end do

    !     Form element lumped mass matrix

     call elmass(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         duloc, utloc, iu, stnloc, is, density(iz), eprop(iep(4, lmn)),  &
         iep(5, lmn), svart(iep(6, lmn)), svaru(iep(6, lmn)),  &
         iep(7, lmn), dmloc,maxdfl)

    !     --   Add element lumped mass matrix to global lumped mass matrix

     icount = 0
      do j = 1,iep(3,lmn)
	     node = icon(iep(2,lmn)+j-1)
	     iof = nodpn(4,node)
	     do n = 1,nodpn(5,node)
	        icount = icount + 1
	        lmass(iof+n-1) = lmass(iof+n-1) + dmloc(icount)
	     end do
      end do

	end do


  end do


  
end subroutine asslmass

!
!==============================SUBROUTINE SETBCS_EXPLICIT ==============================================
!
subroutine bcons_explicit(nhist,MAXHST,histvals,MAXHVL,histpoin,&
	 nbcnset,MAXNST,nsetbcpoin,nsetlst,MAXNSL, &
	 nbclset,MAXLST,lsetbcpoin,lsetlst,MAXLSL, &
     MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals, &
     MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals, &
	 nops, nelm, MAXCOR, MAXDOF,  &
     MAXCON, icon, &
     iep,nodpn, x, utot, du, eprop, MAXPRP, forc)
  use Types
  use ParamIO
  use Paramsol
  use Globals, only : TIME, DTIME, BTEMP, BTINC
  implicit none
!
! Subroutine to impose BCs and distributed loads for an explicit dynamic analysis
!
!
! Data structures to store load histories
! 
  integer, intent( in )                :: MAXHST
  integer, intent( in )                :: MAXHVL                      
  integer, intent( inout )             :: nhist
               
  integer, intent( inout )             :: histpoin(2,MAXHST)          
  real( prec ), intent(inout)          :: histvals(MAXHVL)
      

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
! FE data structures
!
  integer, intent( inout )      :: nops                         
  integer, intent( inout )      :: nelm                         
  integer, intent( in )         :: MAXCOR                       
  integer, intent( in )         :: MAXDOF                       
  integer, intent( in )         :: MAXCON                                          
  integer, intent( in )         :: MAXPRP
  integer, intent( in )                    :: nodpn(7, nops)                      
  integer, intent( in )         :: icon(MAXCON)                 
  integer, intent( inout )      :: iep(7, nelm)                                   
  real( prec ), intent( in )    :: x(MAXCOR)                    
  real( prec ), intent( inout ) :: utot(MAXDOF)                 
  real( prec ), intent( inout ) :: du(MAXDOF)                   
  real( prec ), intent( inout ) :: eprop(MAXPRP)                 
  real( prec ), intent( inout ) :: forc(MAXDOF)   


! Local Variables
  integer :: i,j,k,n,nset,nnodes,ipoin,npar,ndlprops,itpdlprops,iopt,ihist
  integer :: lset,nlmn,icount, node,lmn,ifac,nnode,ix,iof
  real (prec) :: value, nx, ny, nz
  real (prec) :: dlprops(10)

  integer :: nodpl(4, MAXNDL)
  real ( prec ) ::  xloc(MAXCRL), duloc(MAXDFL), utloc(MAXDFL), stnloc(MAXSNL)
  real ( prec ) :: dmloc(MAXDFL), resid(MAXSTF)


! Loop over DOF definitions
  do i = 1,ndofdef
    nset = dofdefpoin(1,i)
	nnodes = nsetbcpoin(2,nset)
!
!   get DOF or force value
!
    if (dofdefpoin(3,i)>0) then
	   value = dofdefvals(dofdefpoin(3,i))    ! Value prescribed by user
	else
!      Value to be defined by interpolating history array
       ipoin = histpoin(1,-dofdefpoin(3,i))
       npar = histpoin(2,-dofdefpoin(3,i))/2
       call loadval(histvals(ipoin),npar,TIME+DTIME,value)    
    endif

	if (dofdefpoin(2,i) > 0) then  ! Apply nodal displacement

  	  do j = 1,nnodes
	    node = nsetlst(nsetbcpoin(1,nset)+j-1)
		du(nodpn(4,node) + dofdefpoin(2,i)-1) = value - utot(nodpn(4,node) + dofdefpoin(2,i)-1)
	  end do
	else                           ! apply nodal forces
	  do j = 1,nnodes
	    node = nsetlst(nsetbcpoin(1,nset)+j-1)
		forc(nodpn(4,node) + dofdefpoin(2,i)-1) = forc(nodpn(4,node) + dofdefpoin(2,i)-1)+value
	  end do
	endif
  end do

!  Loop over distributed load definitions
  do i = 1,ndldef 
    lset = iabs(dldefpoin(1,i))
	nlmn = lsetbcpoin(2,lset)
 
	if (dldefpoin(5,i)==1) then  ! Tractions supplied directly
	    do j = 1,dldefpoin(4,i)
		  dlprops(j) = dldefvals(dldefpoin(3,i)+j-1)
	    end do

        ndlprops = dldefpoin(4,i)
		iopt = 1

	else if (dldefpoin(5,i) == 2) then  ! Interpolate history table

       ihist = int(dldefvals(dldefpoin(3,i)))
       ipoin = histpoin(1,ihist)
       npar = histpoin(2,ihist)/2
       call loadval(histvals(ipoin),npar,TIME+DTIME,value)
       if (dldefpoin(4,i)<3) then
	     write(IOW,*) ' Error in subroutine setbcs '
		 write(IOW,*) ' Insufficient parameters were provided to define traction direction '
		 stop
  	   endif
	   nx = dldefvals(dldefpoin(3,i)+1)
	   ny = dldefvals(dldefpoin(3,i)+2)
	   nz = 0.d0
	   if (dldefpoin(4,i)==4) then
	      nz = dldefvals(dldefpoin(3,i)+3)
       endif
       dlprops(1) = nx*value/dsqrt(nx*nx+ny*ny+nz*nz)
	   dlprops(2) = ny*value/dsqrt(nx*nx+ny*ny+nz*nz)
	   ndlprops = 2
	   if (dldefpoin(4,i)==4) then
	     dlprops(3) = nz*value/sqrt(nx*nx+ny*ny+nz*nz)
	 	 ndlprops = 3
       endif

	   iopt = 1

	 else if (dldefpoin(5,i) == 3) then! Traction is applied normal to element face
        ihist = dldefpoin(3,i)
        ipoin = histpoin(1,ihist)
        npar = histpoin(2,ihist)/2
        call loadval(histvals(ipoin),npar,TIME+DTIME,value)
	    dlprops(1) = value
	    ndlprops = 1
	    iopt = 2
	 else if (dldefpoin(5,i) ==4) then ! Traction is controlled by user subroutine
	    do j = 1,dldefpoin(4,i)
		  dlprops(j) = dldefvals(dldefpoin(3,i)+j-1)
	    end do

        ndlprops = dldefpoin(4,i)
		iopt = 3
	 endif
	 
	 do j = 1,nlmn
	    lmn = lsetlst(lsetbcpoin(1,lset)+j-1)
	    ifac = dldefpoin(2,i)    ! Face number. 
		
		nnode = iep(3, lmn)
        ix = 0
        do k = 1, nnode
          node = icon(iep(2, lmn) + k - 1)
          nodpl(1, k) = nodpn(1, node)
          nodpl(2, k) = nodpn(3, node)
          nodpl(3, k) = nodpn(5, node)
          do n = 1, nodpn(3, node)
            ix = ix + 1
            xloc(ix) = x(nodpn(2, node) + n - 1)
          end do
        end do

        call dload(lmn, iep(1, lmn), nnode, nodpl, eprop(iep(4, lmn)),  &
           iep(5, lmn), xloc, ix, ifac,iopt, dlprops,ndlprops, resid, MAXSTF)
 
        icount = 0
        do k = 1,iep(3,lmn)
	      node = icon(iep(2,lmn)+k-1)
	      iof = nodpn(4,node)
	      do n = 1,nodpn(5,node)
	        icount = icount + 1
	        forc(iof+n-1) = forc(iof+n-1) + resid(icount)
	      end do
        end do

     end do
  end do

  return

end subroutine bcons_explicit
!
!==============================SUBROUTINE SETBCS_STATIC ==============================================
!
subroutine setbcs_static(nhist,MAXHST,histvals,MAXHVL,histpoin,&
	 nbcnset,MAXNST,nsetbcpoin,nsetlst,MAXNSL, &
	 nbclset,MAXLST,lsetbcpoin,lsetlst,MAXLSL, &
     MAXDDF,ndofdef,dofdefpoin,MAXDVL,dofdefvals, &
     MAXDLF,ndldef,dldefpoin,MAXDLV,dldefvals, &
     nfix,MAXFIX,lstfix,dofval, &
	 nfor,MAXFOR,lstfor,forval, &
	 ndload,MAXDLD,lstlod,dlprops,MAXDLPR, &
	 utot,du,rfor,nodpn,MAXU,MAXNOD)
  use Types
  use ParamIO
  use Globals, only : TIME, DTIME, BTEMP, BTINC
  implicit none

!
! Data structures to store load histories
! 
  integer, intent( in )                :: MAXHST
  integer, intent( in )                :: MAXHVL                      
  integer, intent( inout )             :: nhist
               
  integer, intent( inout )             :: histpoin(2,MAXHST)          
  real( prec ), intent(inout)          :: histvals(MAXHVL)
      

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
!      dofdefpoin(1,i)  abs value gives Node set for DOF definition
!                       <0 means call user subroutine to determine load magnitude
!                       >0 means interpolate load history table
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

  integer, intent(in)                 :: MAXU
  integer, intent(in)                 :: MAXNOD
  integer, intent(in)                 :: nodpn(7,MAXNOD)
  
  real ( prec ), intent (in)          :: utot(MAXU)
  real ( prec ), intent (in)          :: du(MAXU)
  real ( prec ), intent (in)          :: rfor(MAXU)
!
! BC data structures assigned in this routine
!
  integer, intent( in )               :: MAXFIX
  integer, intent( in )               :: MAXFOR
  integer, intent( in )               :: MAXDLD
  integer, intent( in )               :: MAXDLPR
  integer, intent( inout )            :: nfix
  integer, intent( inout )            :: nfor
  integer, intent( inout )            :: ndload
  integer, intent( inout )            :: lstfix(2, MAXFIX)
  integer, intent( inout )            :: lstfor(2, MAXFOR)
  integer, intent( inout )            :: lstlod(5, MAXDLD)

  real( prec ), intent( inout )       :: dofval(MAXFIX)
  real( prec ), intent( inout )       :: forval(MAXFOR)
  real( prec ), intent( inout )        :: dlprops(MAXDLPR)   


! Local Variables
  integer :: i,j,nset,nnodes,ipoin,npar,ndlprops,itpdlprops,iopt,ihist,kk
  integer :: lset,nlmn, node
  real (prec) :: value, nx, ny, nz
  real (prec) ::  tracdir(10)
 
  nfix = 0
  nfor = 0
  ndload = 0
  ndlprops = 0
  itpdlprops = 0

! Loop over DOF definitions
  do i = 1,ndofdef
    nset = iabs(dofdefpoin(1,i))
	nnodes = nsetbcpoin(2,nset)
!
!   get DOF or force value
!
    if (dofdefpoin(3,i)>0) then
	   value = dofdefvals(dofdefpoin(3,i))    ! Value prescribed by user
	else
	   if (dofdefpoin(1,i)>0) then
!      Value to be defined by interpolating history array
         ipoin = histpoin(1,-dofdefpoin(3,i))
         npar = histpoin(2,-dofdefpoin(3,i))/2
         call loadval(histvals(ipoin),npar,TIME+DTIME,value)    
       endif
    endif

	if (dofdefpoin(2,i) > 0) then

  	  do j = 1,nnodes
	    nfix = nfix + 1
        if (NFIX>MAXFIX) then
		   write(IOW,*) ' *** ERROR IN SUBROUTINE SETBCS *** '
		   write(IOW,*) ' Insufficient storage for BCs *** '
		   write(IOW,*) ' Parameter MAXFIX must be increased '
		   stop
		endif
	    lstfix(1,nfix) = nsetlst(nsetbcpoin(1,nset)+j-1)
		lstfix(2,nfix) = dofdefpoin(2,i)
		if (dofdefpoin(1,i)<0) then
!      Value to be defined by user subroutine
          ipoin = histpoin(1,-dofdefpoin(3,i))
          npar = histpoin(2,-dofdefpoin(3,i))
          node = lstfix(1,nfix)
          call DOF_user_sub(lstfix(2,nfix),histvals(ipoin),npar,&
          utot(nodpn(4,node)),du(nodpn(4,node)),rfor(nodpn(4,node)),nodpn(5,node),value)
        endif
		dofval(nfix) = value
	  end do
	else
	  do j = 1,nnodes
	    nfor = nfor + 1
        if (NFOR>MAXFOR) then
		   write(IOW,*) ' *** ERROR IN SUBROUTINE SETBCS *** '
		   write(IOW,*) ' Insufficient storage for BCs *** '
		   write(IOW,*) ' Parameter MAXFOR must be increased '
		   stop
		endif
		lstfor(1,nfor) = nsetlst(nsetbcpoin(1,nset)+j-1)
		lstfor(2,nfor) = -dofdefpoin(2,i)
		if (dofdefpoin(1,i)<0) then
!      Value to be defined by user subroutine
          ipoin = histpoin(1,-dofdefpoin(3,i))
          npar = histpoin(2,-dofdefpoin(3,i))
          node = lstfor(1,nfor)
          call FOR_user_sub(lstfor(2,nfor),histvals(ipoin),npar,&
          utot(nodpn(4,node)),du(nodpn(4,node)),rfor(nodpn(4,node)),nodpn(5,node),value)
        endif
		forval(nfor) = value
	  end do
	endif
  end do

!  Loop over distributed load definitions
  do i = 1,ndldef 
    lset = iabs(dldefpoin(1,i))
	nlmn = lsetbcpoin(2,lset)
 
	if (dldefpoin(5,i)==1) then  ! Tractions supplied directly
	    do j = 1,dldefpoin(4,i)
		  if (itpdlprops+j>MAXDLV) then
		    write(IOW,*) ' Error in subroutine setbcs '
		    write(IOW,*) ' Insufficient storage for distributed loads '
		    write(IOW,*) ' Increase parameter MAXDLV '
		    stop
	  	  endif
		  dlprops(itpdlprops+j) = dldefvals(dldefpoin(3,i)+j-1)
	    end do

        ndlprops = dldefpoin(4,i)
		iopt = 1

	else if (dldefpoin(5,i) == 2) then  ! Interpolate history table

       ihist = int(dldefvals(dldefpoin(3,i)))
       ipoin = histpoin(1,ihist)
       npar = histpoin(2,ihist)/2
       call loadval(histvals(ipoin),npar,TIME+DTIME,value)
       if (dldefpoin(4,i)<3) then
	     write(IOW,*) ' Error in subroutine setbcs '
		 write(IOW,*) ' Insufficient parameters were provided to define traction direction '
		 stop
  	   endif
  	   tracdir = 0.d0
       do kk =1,dldefpoin(4,i)-1
	     tracdir(kk) = dldefvals(dldefpoin(3,i)+kk)
	   end do
	   tracdir = tracdir/dsqrt(dot_product(tracdir,tracdir))
	   ndlprops = 0
	   do kk = 1,dldefpoin(4,i)-1
         dlprops(itpdlprops+kk) = tracdir(kk)*value
         ndlprops = ndlprops + 1
	   end do

	   iopt = 1

	 else if (dldefpoin(5,i) == 3) then! Traction is applied normal to element face
        ihist = dldefpoin(3,i)
        ipoin = histpoin(1,ihist)
        npar = histpoin(2,ihist)/2
        call loadval(histvals(ipoin),npar,TIME+DTIME,value)
	    dlprops(itpdlprops+1) = value
	    ndlprops = 1
	    iopt = 2
	 else if (dldefpoin(5,i) ==4) then ! Traction is controlled by user subroutine
	    do j = 1,dldefpoin(4,i)
		  if (itpdlprops+j>MAXDLV) then
		    write(IOW,*) ' Error in subroutine setbcs '
		    write(IOW,*) ' Insufficient storage for distributed loads '
		    write(IOW,*) ' Increase parameter MAXDLV '
		    stop
	  	  endif
		  dlprops(itpdlprops+j) = dldefvals(dldefpoin(3,i)+j-1)
	    end do

        ndlprops = dldefpoin(4,i)
		iopt = 3
	 endif
	 
	  do j = 1,nlmn
	    ndload = ndload + 1
        if (ndload>MAXDLD) then
		   write(IOW,*) ' *** ERROR IN SUBROUTINE SETBCS *** '
		   write(IOW,*) ' Insufficient storage for BCs *** '
		   write(IOW,*) ' Parameter MAXDLD must be increased '
		   stop
		endif
	    lstlod(1,ndload) = lsetlst(lsetbcpoin(1,lset)+j-1)
	    lstlod(2,ndload) = dldefpoin(2,i)    ! Face number. 
        lstlod(3,ndload) = itpdlprops+1
	    lstlod(4,ndload) = ndlprops
		lstlod(5,ndload) = iopt

 
  	  end do

	  itpdlprops = itpdlprops + ndlprops

  end do

  return

end subroutine setbcs_static



