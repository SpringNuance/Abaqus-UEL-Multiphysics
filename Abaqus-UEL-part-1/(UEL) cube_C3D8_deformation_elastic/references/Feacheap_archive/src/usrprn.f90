!     Subroutines to allow user access to all FEM variables for data processing and printing.

!     ====================== SUBROUTINE USRPRN ===============================
  subroutine usrprn(iunlst, nupiun, parprn, nprpar,  &
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
  Use Types
  use ParamIO
  use Paramsol
  use Globals, only : TIME, DTIME, BTEMP, BTINC
  implicit none

  integer, intent( inout )                 :: nupiun
  integer, intent( in )                    :: nprpar  
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
  integer, intent( in )                    :: MAXSLO  
  integer, intent( in )                    :: MAXSUP  
  integer, intent( in )                    :: MAXEQ   
  integer, intent( in )                    :: MAXLMP  
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
  
  real( prec ), intent( inout )            :: parprn(nprpar)
  real( prec ), intent( inout )            :: eprop(MAXPRP)
  real( prec ), intent( in )               :: svart(MAXVAR)
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
  real( prec ), intent( inout )            :: alow(MAXSLO)
  real( prec ), intent( inout )            :: aupp(MAXSUP)
  real( prec ), intent( inout )            :: diag(MAXEQ)
  real( prec ), intent( inout )            :: rhs(MAXEQ)

  real( prec ) :: zone_mean_state(MAXSTT,30)
  real( prec ) :: total_mean_state(MAXSTT)
  integer :: nmstat,voltage_node
  real( prec ) :: V,curr,conconv
  real( prec ) :: ycoord(1000),stloc(7),conc
  integer :: index(1000)
  integer :: node,ipn,ns,i,k

  !     Parameters to control user printing.
  !     IUNLST(I)        Ith unit number for output files to contain user data
  !     NUPIUN           No. user controlled files
  !     PARPRN(I)        Ith user supplied control parameter to govern printing
  !     NPRPAR           No. user supplied control parameters to govern printing.

  if (nzone>30) then
     Write(IOW,*) ' Error in subroutine usrprn.f90 '
     Write(IOW,*) ' Local storage available for only 30 zones '
     write(IOW,*) ' No. zones ',nzone
     Stop
  endif

  nmstat = 5


  call compute_average_state( parprn, nprpar,  &
                nelm, nops, nodpn, icon, iep,  &
                eprop, svart, svaru,  &
                 x, utot, du, stnod,  &
                stlump, lumpn, nstat, nzone,izplmn, &
                MAXNOD,  &
                MAXCOR, MAXDOF, MAXSTN, MAXLMN, MAXCON, MAXPRP,  &
                MAXVAR,  MAXLMP,  MAXZON, &
                zone_mean_state,total_mean_state,nmstat)
   if (nprpar>0) then
      voltage_node = parprn(1)
      V = utot(nodpn(4,voltage_node))+du(nodpn(4,voltage_node))
      curr = rfor(nodpn(4,voltage_node))
    else
      V = 0.d0
      curr = 0.d0
    endif

!    Conversion of capacity in mAh/g into concentration mol(Li)/mol(Si)
     conconv = 60.d0*60.d0*1.d0/1000.d0*2.2d0*100.d0**3.d0/(7.874d04)*1.d0/96485.d0
!  Print capacity, time, current, voltage, and mean concnetration and stress to output file
   if (nupiun>0) then
      Write(iunlst(1),100) total_mean_state(1)/conconv,Time+dtime,curr,V,total_mean_state(1:nmstat)
   endif
 
 
 !  Print through-thickness variation of   
   if (nupiun>1) then
      write(iunlst(2),*) ' ZONE '
      do node = 1,nops-1
           ycoord(node) = x(3*(node-1)+2)
      end do
      call dsort(nops-1,ycoord,index)  ! Generate index table listing coords in increasing order
      do k = 1,(nops-1)
         node = index(k)
         ipn = lumpn(2,node,1)
         do ns = 1, nstat
                stloc(ns) = stlump(ipn + ns - 1) 
         end do
         conc = utot(5*(node-1)+4) + du(5*(node-1)+4)
         write(iunlst(2),200) ycoord(index(k))/ycoord(index(nops-1)),conc,stloc(1),stloc(7)
      end do
   end if
            
      
   
   
100   format(d12.4, 8(', ',d12.4))
200   format(d12.4, 3(', ',d12.4))
  
   return 


end subroutine usrprn


!=======================SUBROUTINE dSORT ========================
subroutine dsort(n, in, index)
  use Types
  implicit none

  integer, intent( in )  :: n                         
  real(prec), intent( in )  :: in(*)                     
  integer, intent( out ) :: index(*)                  

  ! Local Variables
  integer :: i, indxt, ir, j, l
  real (prec) k

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

end subroutine dsort

!================================SUBROUTINE PRNSTT ============================
subroutine prnstt(iun,nzone,nops,nelm,izplmn,nodpn,iep,x,MAXCOR,  &
     icon, MAXCON, utot, du, MAXDOF, stlump, MAXLMP, lumpn)
  use Types
  use ParamIO
  use Globals, only : TIME, DTIME, n_state_prints
  implicit none

  integer, intent( inout )      :: iun                      
  integer, intent( in )         :: nops                                    
  integer, intent( in )         :: nelm                     
  integer, intent( in )         :: nzone
  integer, intent( in )         :: MAXCOR                   
  integer, intent( in )         :: MAXCON                   
  integer, intent( in )         :: MAXDOF                   
  integer, intent( in )         :: MAXLMP                   
  integer, intent( in )         :: izplmn(2,nzone)
  integer, intent( in )         :: nodpn(7, nops)           
  integer, intent( in )         :: iep(7, nelm)             
  integer, intent( inout )      :: icon(MAXCON)             
  integer, intent( in )         :: lumpn(2,nops,nzone)              
  real( prec ), intent( inout ) :: x(MAXCOR)                
  real( prec ), intent( inout ) :: utot(MAXDOF)             
  real( prec ), intent( inout ) :: du(MAXDOF)               
  real( prec ), intent( inout ) :: stlump(MAXLMP)           

  ! Local Variables
  integer      :: j, jp, js, ju, jx, k, l, lmn, n, ndof,npstat,iz
  integer      :: nelpr3,nelpr4, nelpr6, nelpr8,nelpr9, nelprn, nodpr2d,nodpr3d,nodprn, nst, node
  character ( len = 80 ) :: vout
  character ( len = 12 ) :: string
  real(prec) :: x1,x2

  integer, allocatable :: nodenum(:,:)

  dimension vout(18)

  vout(1) = 'V1'
  vout(2) = 'V1,V2'
  vout(3) = 'V1,V2,V3'
  vout(4) = 'V1,V2,V3,V4'
  vout(5) = 'V1,V2,V3,V4,V5'
  vout(6) = 'V1,V2,V3,V4,V5,V6'
  vout(7) = 'V1,V2,V3,V4,V5,V6,V7'
  vout(8) = 'V1,V2,V3,V4,V5,V6,V7,V8'
  vout(9) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9'
  vout(10) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10'
  vout(11) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11'
  vout(12) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12'
  vout(13) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13'
  vout(14) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14'
  vout(15) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15'
  vout(16) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16'
  vout(17) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17'
  vout(18) = 'V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18'
  ! Print diffusion solution to a file that may be read by TECPLOT

  !     Check the no. DOFs and no. states associated with the first node.
  ndof = nodpn(5, 1)
  nst = lumpn(1,1,1)

  allocate(nodenum(nops,nzone))

  nodenum = 0
  nodprn = 0
  nelpr3 = 0
  nelpr4 = 0
  nelpr6 = 0
  nelpr8 = 0
  nelpr9 = 0
  nodpr2d = 0
  nodpr3d = 0


  do n = 1, nops
    if ( nodpn(3, n)==2 ) nodpr2d = nodpr2d + 1
	if ( nodpn(3, n)==3 ) nodpr3d = nodpr3d + 1
  end do
  if (nodpr3d==0) nodprn = nodpr2d
  if (nodpr2d==0) nodprn = nodpr3d
  if (nodpr3d>0.and.nodpr2d>0) then
     write(IOW,*) ' WARNING: subroutine PRNSTT found both 2D and 3D nodes '
	 write(IOW,*) ' Only 3d nodes will be printed '
     nodprn = nodpr3d
	 nodpr2d = 0
  endif

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
        if (iep(3,lmn) == 4) nelpr4 = nelpr4 + 1
        if (iep(3,lmn) == 6) nelpr6 = nelpr6 + 1
      endif
	  if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
	    if (iep(3,lmn) == 8) nelpr8 = nelpr8 + 1
	    if (iep(3,lmn) == 4) nelpr4 = nelpr4 + 1
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

  nelprn = 4*nelpr6 + nelpr3 + nelpr4 + nelpr8 + 4*nelpr9

      npstat = ndof+nst
	  if (npstat>18) then
	     write(IOW,*) ' *** Warning - only 15 of ',ndof+nst,' nodal vars were printed *** '
		 npstat = 18
	  endif
      if (nodpr3d==0) then
	    write (iun, '(A16,A80)') 'VARIABLES = X,Y,', vout(npstat)
         write (iun, *) ' ZONE, T="',TIME+DTIME,'" F=FEPOINT, I=', nodprn, ' J=', nelprn      
	  else if (nodpr2d==0) then
	     write (iun,'(A18,A80)') 'VARIABLES = X,Y,Z,', vout(npstat)
         write (iun,'(A10,D10.4,A15,I5,A3,I5,A9)') ' ZONE, T="',TIME+DTIME, &
		                    '" F=FEPOINT, I=', nodprn, ' J=', nelprn, ' ET=BRICK'
      endif


! Print the nodes

  do iz = 1,nzone                             ! Loop over zones
    do lmn = izplmn(1,iz),izplmn(2,iz)        ! Loop over elements in zone
      do n = 1,iep(3,lmn)                     ! loop over nodes on element
        node = icon(iep(2,lmn)+n-1)
        if (nodenum(node,iz) < 0) then           ! If not yet printed, print

          nodenum(node,iz) = -nodenum(node,iz)  ! prevents more prints

          jx = nodpn(2, node)
          ju = nodpn(4, node)
          js = lumpn(2,node,iz)
		  if (nodpr3d==0) then
            if (ndof>=2) then
              x1 = x(jx)+ utot(ju)+du(ju)
              x2 = x(jx+1)+ utot(ju+1)+du(ju+1)
            else
              x1 = x(jx)
              x2 = x(jx+1)
            endif
            write (iun, '(20(1X,E18.10))') x1, x2,  &
         (utot(ju+j)+du(ju + j), j = 0, ndof - 1), (stlump(js + j), j = 0, npstat-ndof - 1)
          else if (nodpr2d==0) then
              write (iun, '(20(1X,E18.10))') (x(jx+k) &
               + (utot(ju+k)+du(ju+k)), k=0,2),  &
			   (utot(ju+j)+du(ju + j), j = 0, ndof - 1),  &
                 (stlump(js + j), j = 0, npstat-ndof - 1)
		  endif
        endif
      end do
    end do
  end do

! Print the elements

  do iz = 1,nzone
   do lmn = izplmn(1,iz),izplmn(2,iz)
     jp = iep(2, lmn)
     if (iep(1,lmn)<100) then
        if ( iep(3, lmn)==9 ) then
              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 1),iz), nodenum(icon(jp + 4),iz), nodenum(icon(jp + 3),iz)
              write (iun, *) nodenum(icon(jp + 1),iz), nodenum(icon(jp + 2),iz),  &
                   nodenum(icon(jp + 5),iz), nodenum(icon(jp + 4),iz)
              write (iun, *) nodenum(icon(jp + 3),iz), nodenum(icon(jp + 4),iz),  &
                   nodenum(icon(jp + 7),iz), nodenum(icon(jp + 6),iz)
              write (iun, *) nodenum(icon(jp + 4),iz), nodenum(icon(jp + 5),iz),  &
                   nodenum(icon(jp + 8),iz), nodenum(icon(jp + 7),iz)
        else if ( iep(3, lmn)==6 ) then
              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 3),iz), nodenum(icon(jp + 5),iz), nodenum(icon(jp + 5),iz)
              write (iun, *) nodenum(icon(jp + 3),iz), nodenum(icon(jp + 1),iz),  &
                   nodenum(icon(jp + 4),iz), nodenum(icon(jp + 4),iz)
              write (iun, *) nodenum(icon(jp + 4),iz), nodenum(icon(jp + 2),iz),  &
                   nodenum(icon(jp + 5),iz), nodenum(icon(jp + 5),iz)
              write (iun, *) nodenum(icon(jp + 3),iz), nodenum(icon(jp + 4),iz),  &
                   nodenum(icon(jp + 5),iz), nodenum(icon(jp + 5),iz)
        else if ( iep(3, lmn)==4 ) then
              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 1),iz), nodenum(icon(jp + 2),iz), nodenum(icon(jp + 3),iz)
        else if ( iep(3, lmn)==3 ) then             
              write (iun, *) nodenum(icon(jp),iz), nodenum(icon(jp + 1),iz), nodenum(icon(jp + 2),iz), nodenum(icon(jp + 2),iz)
        endif
      else if (iep(1,lmn)>1000.and.iep(1,lmn)<2000) then
	     if (iep(3,lmn)==8) then
	       write(iun,'(8(1x,i5))') (nodenum(icon(jp+k),iz), k=0,7)
         end if
         if (iep(3,lmn) ==4) then
            write(iun,'(4(1x,i5))') (nodenum(icon(jp+k),iz), k=0,3)
         endif
      endif
   end do
 end do

!  write (iun, *) 'TEXT,M=WINDOW,X=0.25,Y=0.91,H=6.0,F=TIMES-ITALIC'
!  write (iun, *) 'ZN=', n_state_prints, ',BX=FILLED,BXF=WHITE,BXO=BLACK'
!  write (iun, *) 'BXM=40.,T="t/t_0 = ', string, '"'


  deallocate(nodenum)

end subroutine prnstt
!
!======================================= Subroutine Compute_average_state ===============================
!
 subroutine compute_average_state( parprn, nprpar,  &
                nelm, nops, nodpn, icon, iep,  &
                eprop, svart, svaru,  &
                 x, utot, du, stnod,  &
                stlump, lumpn, nstat, nzone,izplmn, &
                MAXNOD,  &
                MAXCOR, MAXDOF, MAXSTN, MAXLMN, MAXCON, MAXPRP,  &
                MAXVAR,  MAXLMP,  MAXZON, &
                zone_mean_state,total_mean_state,nmstat)

  Use Types
  use ParamIO
  use Paramsol
  use Globals, only : TIME, DTIME, BTEMP, BTINC
  implicit none

  integer, intent( in )                    :: nprpar  
  integer, intent( in )                    :: nstat  
  integer, intent( in )                    :: MAXNOD  
  integer, intent( in )                    :: MAXCOR  
  integer, intent( in )                    :: MAXDOF  
  integer, intent( in )                    :: MAXSTN  
  integer, intent( in )                    :: MAXLMN  
  integer, intent( in )                    :: MAXCON  
  integer, intent( in )                    :: MAXPRP  
  integer, intent( in )                    :: MAXVAR  
  integer, intent( in )                    :: MAXLMP  
  integer, intent( in )                    :: MAXZON  

  integer, intent( inout )                 :: nelm
  integer, intent( inout )                 :: nops
  integer, intent( inout )                 :: icon(MAXCON)
  integer, intent( inout )                 :: iep(7, MAXLMN)
  integer, intent( inout )                 :: nodpn(7, MAXNOD)
  integer, intent( inout )                 :: lumpn(2,nops,nzone)
  integer, intent( inout )                 :: nzone
  integer, intent( inout )                 :: nmstat

  integer, intent( inout )                 :: izplmn(2, MAXZON)
  
  real( prec ), intent( inout )            :: parprn(nprpar)
  real( prec ), intent( inout )            :: eprop(MAXPRP)
  real( prec ), intent( in )               :: svart(MAXVAR)
  real( prec ), intent( inout )            :: svaru(MAXVAR)
  real( prec ), intent( inout )            :: x(MAXCOR)
  real( prec ), intent( inout )            :: utot(MAXDOF)
  real( prec ), intent( inout )            :: du(MAXDOF)
  real( prec ), intent( inout )            :: stnod(MAXSTN)
  real( prec ), intent( inout )            :: stlump(MAXLMP)
  real( prec ), intent( inout )            :: zone_mean_state(MAXSTT,nzone)
  real( prec ), intent( inout )            :: total_mean_state(MAXSTT)

  integer :: nodpl(3, MAXNDL)
  real( prec ) :: xloc(MAXCRL)
  real( prec ) :: utloc(MAXDFL), duloc(MAXDFL)
  real( prec ) :: stloc(MAXSTT), mean_state_el(MAXSTT)
  
  real( prec ) :: el_vol,total_vol,zone_vol
  integer :: iz,lmn,ix,iu,j,node,n,ic,ipn,ns


  total_vol = 0.d0
  zone_mean_state = 0.d0
  total_mean_state = 0.d0
  do iz = 1,nzone
  
       !     Set up RHS for projected state.  Stored in STLUMP.

    zone_vol = 0.d0

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
      
      ic = 0
      do j = 1, iep(3, lmn)
        node = icon(iep(2, lmn) + j - 1)
        ipn = lumpn(2,node,iz)
        do ns = 1, nstat
          ic = ic + 1
          stloc(ic) = stlump(ipn + ns - 1) 
        end do
      end do
      
      call el_mean_state(lmn, iep(1, lmn), iep(3, lmn), nodpl, xloc, ix,  &
           duloc, utloc, iu, eprop(iep(4, lmn)), iep(5, lmn),  &
           svart(iep(6, lmn)), svaru(iep(6, lmn)), iep(7, lmn), &
           stloc, nstat,mean_state_el,el_vol,nmstat)

      zone_vol = zone_vol + el_vol
      zone_mean_state(1:nmstat,iz) = zone_mean_state(1:nmstat,iz) + mean_state_el(1:nmstat)
      total_vol = total_vol + el_vol
      total_mean_state(1:nmstat) = total_mean_state(1:nmstat) + mean_state_el(1:nmstat)
      
    end do
    if (zone_vol>0.d0) then
      zone_mean_state(1:nmstat,iz) = zone_mean_state(1:nmstat,iz)/zone_vol
    endif
  end do

  total_mean_state(1:nmstat) = total_mean_state(1:nmstat)/total_vol

  end subroutine compute_average_state