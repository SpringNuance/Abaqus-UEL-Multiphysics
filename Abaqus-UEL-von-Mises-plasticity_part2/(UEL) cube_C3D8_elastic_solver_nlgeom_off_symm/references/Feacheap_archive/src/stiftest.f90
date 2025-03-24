! stiftest.f90                                                  
! 
! Subroutine to check consistency of stiffness matrix with residual vector
!
!====================Subroutine stiftest ======================
subroutine stiftest(nelm, nops, nmpc, elflag, MAXCOR, MAXDOF, MAXSTN,  &
     MAXCON, MAXVAR, MAXPRP,  &
     iep, icon, nodpn, x, utot, du, stnod,  &
     eprop, svart, svaru, lstmpc, parmpc, maxpmc,  &
     rmpc, drmpc,ifail)
  use Types
  use ParamIO
  use Paramsol
  implicit none

  integer, intent( in )         :: nelm
  integer, intent( in )         :: nops
  integer, intent( in )         :: nmpc                       
  integer, intent( in )         :: elflag                        
  integer, intent( in )         :: MAXCOR                     
  integer, intent( in )         :: MAXDOF                     
  integer, intent( in )         :: MAXSTN                     
  integer, intent( in )         :: MAXCON                     
  integer, intent( in )         :: MAXVAR                     
  integer, intent( in )         :: MAXPRP                     
  integer, intent( in )         :: maxpmc                     
  integer, intent( inout)       :: ifail
  integer, intent( inout )      :: iep(7, nelm)               
  integer, intent( in )         :: icon(MAXCON)               
  integer, intent( inout )      :: nodpn(7, nops)             
  integer, intent( in )         :: lstmpc(7, nmpc)            
  real( prec ), intent( in )    :: x(MAXCOR)                     
  real( prec ), intent( in )    :: utot(MAXDOF)                  
  real( prec ), intent( in )    :: du(MAXDOF)                    
  real( prec ), intent( in )    :: stnod(MAXSTN)                 
  real( prec ), intent( inout ) :: eprop(MAXPRP)                 
  real( prec ), intent( inout ) :: svart(MAXVAR)                 
  real( prec ), intent( inout ) :: svaru(MAXVAR)                 
  real( prec ), intent( inout ) :: parmpc(maxpmc)             
  real( prec ), intent( in )    :: rmpc(nmpc)                 
  real( prec ), intent( in )    :: drmpc(nmpc)                

  ! Local Variables
  real( prec ), parameter :: thresh=1.0D-12

  real( prec ) :: drmult, duloc, dumpc, resmpc,  &
       rmult, stfmpc, stnloc,err
  real( prec ) :: utloc, utmpc, xloc
  integer      :: i,j,k,icount,icount2,ix,iu,is 
  integer      :: ldof, lmn,  mpc, mpctyp, n
  integer      :: nn, node, node1, node2, nodpl, nsc, nsr

  integer      :: eqtoatop,index,skip

  dimension ldof(2), dumpc(2), utmpc(2)
  dimension stfmpc(3, 3), resmpc(3)

  dimension nodpl(4, MAXNDL)
  dimension xloc(MAXCRL)
  dimension utloc(MAXDFL), duloc(MAXDFL)
  dimension stnloc(MAXSNL)
  real (prec) stif(MAXSTF, MAXSTF),stif_num(MAXSTF,MAXSTF), resid0(MAXSTF),resid1(MAXSTF)

  !     Subroutine to check consistency between residual and stiffness matrix
  !     by computing numerical derivative of residual

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



!
! Find an element of type elflag
  do lmn = 1, nelm
    if (iep(1,lmn)==elflag) exit
  end do
  if (lmn>nelm) then
     write(IOW,*) ' *** ERROR IN SUBROUTINE STIFTEST *** '
	 write(IOW,*) ' No element of type ',elflag,' was found in mesh '
	 stop
  endif



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
          write(IOW,*) ' Error detected in subroutine stiftest '
          write(IOW,*) ' Insufficient storage for nodal coords '
          write(IOW,*) ' Increase parameter MAXCRL in Paramsol.f90 '
          stop
        endif
        xloc(ix) = x(nodpn(2, node) + n - 1)
      end do
      do n = 1, nodpn(5, node)
        iu = iu + 1
        if (iu>MAXDFL) then
          write(IOW,*) ' Error detected in subroutine stiftest '
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
          write(IOW,*) ' Error detected in subroutine stiftest '
          write(IOW,*) ' Insufficient storage for nodal coords '
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
         iep(7, lmn), stif, resid0, MAXSTF,ifail)

    !     Compute numerical derivative of stiffness

    icount = 0
    do n = 1,iep(3,lmn)
	  do i = 1,nodpl(3,n)
	    icount = icount + 1
		duloc(icount) = duloc(icount) + 1.D-07

        call elstif(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
         duloc, utloc, iu, stnloc, is, eprop(iep(4, lmn)),  &
         iep(5, lmn), svart(iep(6, lmn)), svaru(iep(6, lmn)),  &
         iep(7, lmn), stif, resid1, MAXSTF,ifail)		 

         stif_num(1:MAXSTF,icount) = -(resid1(1:MAXSTF)-resid0(1:MAXSTF))/1.D-07

         write(IOW,*) 
         write(IOW,*) ' Column ',icount, ' node ',n,' DOF ',i
         
	 icount2 = 0
	 do j = 1,iep(3,lmn)
	    do k = 1,nodpl(3,j)
	      icount2 = icount2 + 1
	      write(IOW,1000) icount2,j,k,stif(icount2,icount),stif_num(icount2,icount)
1000	      format( ' Row ',i4,' node ',i4,' DOF ',i4, &
                      ' Stiffness ',d15.5,' Numerical deriv ',d15.5 )
             end do
	 end do
         duloc(icount) = duloc(icount) - 1.D-07
       end do
     end do

     err = 0.D0
     do i = 1,MAXSTF
	   do j = 1,MAXSTF
	     err = err + (stif(i,j)-stif_num(i,j))**2
	   end do
	 end do


	 if (sqrt(err)>MAXSTF**2*1.d-06) then
	    write(IOW,*)
	    write(IOW,*) ' Error detected in stiffness matrix '
	 else
	    write(IOW,*)
	    write(IOW,*) ' Stiffness matrix is consistent with residual '
	 endif
     err = 0.D0
	 do i = 1,MAXSTF
	   do j = 1,MAXSTF
	      err = stif(i,j)-stif(j,i)
          if (err*err>1.D-06*(stif(i,j)+stif(j,i))**2) then
		     write(IOW,*) ' Stiffness is unsymmetric at col, row ',i,j
		  endif
	      err = stif_num(i,j)-stif_num(j,i)
          if (err*err>1.D-06*(stif_num(i,j)+stif_num(j,i))**2) then
		     write(IOW,*) ' Numerical stiffness is unsymmetric at col, row ',i,j
		  endif

		end do
	  end do    
     return

end subroutine stiftest
