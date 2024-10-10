! mesh_routines.f90                                                    
! Miscellaneous bookkeeping routines for searching and interpolating within a mesh

!=======================SUBROUTINE LMNFND_2D =====================
subroutine lmnfnd_2d(x, lmntin, xmesh, nops, lquad, MAXQAD, xsq,  &
     llpelm, llselm, MAXLLN, icon, MAXCON, iep, iadj,  &
     nelm, acnod, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC, lmnbg, ifail)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: lmntin                        
  integer, intent( inout )      :: nops                          
  integer, intent( in )         :: MAXQAD                        
  integer, intent( in )         :: MAXLLN                        
  integer, intent( in )         :: MAXCON                        
  integer, intent( inout )      :: nelm                          
  integer, intent( in )         :: MAXLSX                        
  integer, intent( in )         :: MAXSRC                        
  integer, intent( out )        :: lmnbg                         
  integer, intent( inout )      :: ifail                         
  integer, intent( inout )      :: lquad(7, MAXQAD)              
  integer, intent( in )         :: llpelm(nops)                  
  integer, intent( in )         :: llselm(7, MAXLLN)             
  integer, intent( inout )      :: icon(MAXCON)                  
  integer, intent( in )         :: iep(7, nelm)                  
  integer, intent( in )         :: iadj(6, nelm)                 
  integer, intent( inout )      :: listn(MAXLSX)                 
  integer, intent( inout )      :: lstsrc(MAXSRC)                
  real( prec ), intent( inout ) :: x(2)                          
  real( prec ), intent( in )    :: xmesh(2, nops)                
  real( prec ), intent( in )    :: xsq(2, 2)                     
  real( prec ), intent( inout ) :: distn(MAXLSX)                 
  real( prec ), intent( inout ) :: xsrc(2, 2, MAXSRC)            
  logical, intent( out )        :: acnod(nops)                   

  ! Local Variables
  real( prec ) :: c1, c2, siz, xreg, dist, dmin, xcen(2)
  integer      :: i, icount, idbg, ip, jjp, k,j,  lmntry,  &
       n1, n2, nerr, npts, ntry, lmnprev, start_lmn, kmin, nbr,kk

  integer, parameter :: MAXERR = 2

  dimension xreg(2, 2)

  !     Function to find the element in a 2D mesh that point X falls into

  !     X(J)        Coords of specified point
  !     LMNTRY      Initial guess for the element (optional.  Set to zero if unknown)
  !     XMESH(J,N)  Jth coord of Nth node in mesh
  !     MAXNOD      Max no. of nodes (used to dimension arrays)
  !     LQUAD       Quadtree array for mesh (See subroutine ADDQAD)
  !     XSQ         Coords of corners of superquad (See subroutine addqad)
  !     LLPELM      Pointer array for link list of elements (see subroutine ADLINK)
  !     LLSELM      Link list of elements (see subroutine ADLINK)
  !     ICON        Connectivity array
  !     IEP         Pointer array for connectivity
  !     IADJ(I,J)   Element adjacent to Ith face on element J
  !     MAXLMN      Max no. elements (used to dimension arrays)
  !     ACNOD       Logical array of dimension MAXNOD.  Used to flag nodes
  !     LISTN(I)    Integer array of dimension MAXLSX.  Used to store nodes close to X
  !     DISTX(I)    REAL( PREC ) array of dimension MAXLSX.  Stores square of distance to X
  !     MAXLSX      Dimension of list of neighboring nodes
  !     LSTSRC(I)   Integer array used to store quads.  See subroutines FNDNBR and QSCHRG.
  !     XSRC(I,J,K) REAL( PREC ) array used to store quad corners. See FNDNBR and QSCHRG.
  !     MAXSRC      Dimension of LSTSRC and XSRC
  !     IFAIL       Flag controlling behavIOR of routine if the point falls outside the mesh.
  !     If (IFAIL=0) on entry, the routine will print an error and stop if point is not in mesh
  !     If (IFAIL.=1) on entry, the routine will exit with IFAIL=1 if the point is not in mesh
  !     If (IFAIL=2) on entry the routine will find and return the element whose centroid is closest to x
  !                  if x does not lie inside the mesh and will exit with IFAIL=2
  !     In all cases the routine will exit with IFAIL=0 if the search was successful.


  nerr = 0
  if (lmntin<nelm+1) lmntry = lmntin
  idbg = 0
  if ( lmntry==0 ) then
    !     If no guess for the element was given, then get an initial guess
    !     Find some nodes near to the current point from the quadtree
    call fndnpt_2d(x, xmesh, nops, lquad, MAXQAD, xsq, npts, listn,  &
         distn, MAXLSX, lstsrc, xsrc, MAXSRC)

    !     Get an initial guess for the element from the elements attached to the
    !     first node in the list
    ntry = 1
    ip = llpelm(listn(ntry))
    lmntry = llselm(1, ip)

    if ( idbg==1 ) jjp = iep(2, lmntry)
  else
    !     Otherwise, start search from LMNTRY
    npts = 0
  end if

  start_lmn = lmntry

  do k = 1, nops
    acnod(k) = .true.
  end do


  !     Try to get correct element using adjacency table

  icount = 0
  do while ( .true. )

    do i = 1, 3
      !     See if the point falls in element LMNTRY
      n1 = icon(iep(2, lmntry) + i - 1)
      n2 = icon(iep(2, lmntry) + mod(i, 3))
      c1 = (xmesh(2, n1) - x(2))*(xmesh(1, n2) - x(1))
      c2 = (xmesh(1, n1) - x(1))*(xmesh(2, n2) - x(2))
      if ( c1>c2 ) then
        icount = icount + 1
        !     It didnt.  Try the adjacent element.
        if ( iadj(i, lmntry)==lmntry ) then
          write (IOW, 99001) lmntry
          stop
        end if
        if ( iadj(i, lmntry)>nelm ) then
          write (IOW, 99002) iadj(i, lmntry)
          stop
        end if
        if ( iadj(i, lmntry)<0 ) then
          write (IOW, 99003) iadj(i, lmntry)
          Stop
        end if
	    lmnprev = lmntry    ! Remember the current element just in case...
        lmntry = iadj(i, lmntry)
        if ( lmntry==0 .or. icount>nelm ) then

          !     There is no adjacent element in the right place.  We have to try something else...
          !     If we started with a user supplied element, replace it with an element from the quadtree
          if ( npts==0 ) then
            !     Get some nodes near X
            call fndnpt_2d(x, xmesh, nops, lquad, MAXQAD, xsq, npts,  &
                 listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
            !     Try an element connected to the first node in the list as start for the search
            ntry = 1
            ip = llpelm(listn(ntry))
            lmntry = llselm(1, ip)
            goto 100
          end if

          !     Otherwise, try an element connected to the  next node in the list

          ntry = ntry + 1

          if ( ntry>npts ) then
            do while ( .true. )
              !     We couldn't get to the element from any node in the list. This calls for desperate
              !     measures.  Try finding some more nodes
              nerr = nerr + 1

              if ( nerr>MAXERR ) then
                !     We tried as hard as we could - give up!
                !     If Ifail was zero on entry, we print error message and stop
                if ( ifail==0 ) then
                  write (IOW, 99004) x(1), x(2)
                  stop
                else if (ifail==1) then
		  lmnbg = lmntin
		  return
		else
                  !     Otherwise, we look for the element that has its centroid closest to x
		  !     and then exit with IFAIL=1
                  ifail = 1
                  lmntry = start_lmn
		  do kk=1,10
		    xcen = 0.D0
		    do j = 1,3
                      xcen(1:2) = xcen(1:2) +  xmesh(1:2,icon(iep(2,lmntry)+j-1) )
                    end do
		    xcen = xcen/3.D0
		    dmin = (x(1)-xcen(1))**2 + (x(2)-xcen(2))**2
		    kmin = 0
		    do k = 1,3
	              if (iadj(k,lmntry)>0) then
  	  	        nbr = iadj(k,lmntry)
		        xcen = 0.D0
  	                do j = 1,3
                          xcen(1:2) = xcen(1:2) +  xmesh(1:2,icon(iep(2,nbr)+j-1)  ) 
                        end do
	                xcen = xcen/3.D0				    
                        dist = (x(1)-xcen(1))**2 + (x(2)-xcen(2))**2
		        if (dist<dmin) then
			  kmin = k
       	                  dmin = dist
	 	        endif
		      endif
		    end do
                  
		    if (kmin==0) exit                  

  		    lmntry = iadj(kmin,lmntry)

                  end do
 				
		  lmnbg = lmntry
		  return

		end if
              end if


              siz = 5.D0*dble(nerr)*dsqrt(distn(1))
              xreg(1, 1) = x(1) - siz
              xreg(2, 1) = x(2) - siz
              xreg(1, 2) = x(1) + siz
              xreg(2, 2) = x(2) + siz

              !     Don't bother to extract nodes that we already used
              do k = 1, npts
                acnod(listn(k)) = .false.
              end do

              call qschrg_2d(x, xreg, xmesh, acnod, nops, lquad,  &
                   MAXQAD, xsq, npts, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
              !     If we didnt find any nodes, enlarge the search region and try again
              if ( npts/=0 ) then
                ntry = 1
                exit
              end if
            end do
          end if

          ip = llpelm(listn(ntry))
          lmntry = llselm(1, ip)
        end if
        goto 100
      end if
    end do

    lmnbg = lmntry
    ifail = 0

    return
100 end do

99001 format ( // ' *** Error detected in subroutine LMNFND ***'/  &
           ' The adjacency table is inconsistent:'/' Element ', I5,  &
           ' is adjacent to itself! ')
99002 format ( // ' *** Error detected in subroutine LMNFND ***'/  &
           ' The adjacency table is inconsistent:'/' Element number '  &
           , I5, ' is greater than the no. of elements ')
99003 format ( // ' *** Error detected in subroutine LMNFND ***'/  &
           ' The adjacency table is inconsistent:'/' Element number ', I5, &
           ' is less than zero ')
99004 format ( // ' *** ERROR DETECTED IN FUNCTION LMNFND ***'/  &
           '  Unable to locate point (', 2(1x, D13.5), ') in mesh', /, &
           '  Possible causes:'/  &
           '     (1)  The point is outside the mesh;'/  &
           '     (2)  Error in element connectivity;'/  &
           '     (3)  Error in element adjacency;'/  &
           '     (4)  Parameter MAXERR in LMNFND too small')

end subroutine lmnfnd_2d

!=======================FUNCTION NODFND_2D =====================
function nodfnd_2d(x, xmesh, nops, nqad, lquad, MAXQAD, xsq, nzone,  &
     llpelm, llselm, MAXLLN, icon, MAXCON, iep, iadj,  &
     nelm, acnod, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: nops                           
  integer, intent( in )         :: MAXQAD
  integer, intent( in )         :: nzone                          
  integer, intent( in )         :: MAXLLN                         
  integer, intent( in )         :: MAXCON                         
  integer, intent( inout )      :: nelm                           
  integer, intent( in )         :: MAXLSX                         
  integer, intent( in )         :: MAXSRC                         
  integer, intent( in )         :: nqad(nzone)                    
  integer, intent( inout )      :: lquad(7, MAXQAD)               
  integer, intent( inout )      :: llpelm(nops)                   
  integer, intent( inout )      :: llselm(7, MAXLLN)              
  integer, intent( inout )      :: icon(MAXCON)                   
  integer, intent( in )         :: iep(7, nelm)                   
  integer, intent( inout )      :: iadj(6, nelm)                  
  integer, intent( inout )      :: listn(MAXLSX)                  
  integer, intent( inout )      :: lstsrc(MAXSRC)                 
  real( prec ), intent( inout ) :: x(2)                           
  real( prec ), intent( in )    :: xmesh(2, nops)                 
  real( prec ), intent( in )    :: xsq(2, 2, nzone)               
  real( prec ), intent( inout ) :: distn(MAXLSX)                  
  real( prec ), intent( inout ) :: xsrc(2, 2, MAXSRC)             
  logical, intent( inout )      :: acnod(nops)                    
  integer                       :: nodfnd_2d

  ! Local Variables
  real( prec ) :: dis, dismin, xreg
  integer      :: ifail, iszqad, izone, jp, k,  lmn, lmntry, node

  dimension xreg(2, 2)

  !     Find the number of the node closest to a given point X

  !     First find which zone the point falls in

  do izone = 1, nzone
    if ( xsq(1, 1, izone)<x(1) .and. xsq(2, 1, izone)<x(2) .and.  &
         xsq(1, 2, izone)>x(1) .and. xsq(2, 2, izone)>x(2) ) exit
  end do
  if ( izone>nzone ) izone = nzone

  !     Find the element that the point falls in

  lmntry = 0
  iszqad = MAXQAD - nqad(izone)
  ifail = 0
  call lmnfnd_2d(x, lmntry, xmesh, nops, lquad(1, nqad(izone)), iszqad,  &
       xsq(1, 1, izone), llpelm, llselm, MAXLLN, icon,  &
       MAXCON, iep, iadj, nelm, acnod, listn, distn, MAXLSX,  &
       lstsrc, xsrc, MAXSRC, lmn, ifail)

  !     Find the closest node from the element connectivity. Midside nodes are included in search.

  jp = iep(2, lmn)
  dismin = (x(1) - xmesh(1, icon(jp))) **2 + (x(2) - xmesh(2, icon(jp)))**2
  node = icon(jp)
  do k = 2, iep(3, lmn)
    dis = (x(1) - xmesh(1, icon(jp + k - 1)))  &
         **2 + (x(2) - xmesh(2, icon(jp + k - 1)))**2
    if ( dis<dismin ) then
      dismin = dis
      node = icon(jp + k - 1)
    end if
  end do

  nodfnd_2d = node

end function nodfnd_2d

!=======================SUBROUTINE LMNFND_3D =====================
subroutine lmnfnd_3d(x, lmntin, xmesh, nops, lquad, MAXQAD, xsq,  &
     nod2lmn,MAXDEG, icon, MAXCON, iep, nbrlmn,  &
     nelm, acnod, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC, lmnbg, ifail)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: lmntin                        
  integer, intent( inout )      :: nops                          
  integer, intent( in )         :: MAXQAD                        
  integer, intent( in )         :: MAXDEG                     
  integer, intent( in )         :: MAXCON                        
  integer, intent( inout )      :: nelm                          
  integer, intent( in )         :: MAXLSX                        
  integer, intent( in )         :: MAXSRC                        
  integer, intent( out )        :: lmnbg                         
  integer, intent( inout )      :: ifail                         
  integer, intent( inout )      :: lquad(7, MAXQAD)              
  integer, intent( in )         :: nod2lmn(MAXDEG,nops)                               
  integer, intent( inout )      :: icon(MAXCON)                  
  integer, intent( in )         :: iep(7, nelm)                  
  integer, intent( in )         :: nbrlmn(6, nelm)                 
  integer, intent( inout )      :: listn(MAXLSX)                 
  integer, intent( inout )      :: lstsrc(MAXSRC)                
  real( prec ), intent( inout ) :: x(3)                          
  real( prec ), intent( in )    :: xmesh(3, nops)                
  real( prec ), intent( in )    :: xsq(3, 2)                     
  real( prec ), intent( inout ) :: distn(MAXLSX)                 
  real( prec ), intent( inout ) :: xsrc(3, 2, MAXSRC)            
  logical, intent( inout )      :: acnod(nops)                   

  ! Local Variables
  real( prec ) :: c1, c2, siz, xreg, dist, dmin, xcen(3), r1(3), r2(3), r3(3)
  integer :: list(8)
  integer      :: i, icount, idbg, ip, jjp, k,j,  lmntry,  &
       n1, n2, n3, nerr, npts, ntry, lmnprev, start_lmn, kmin, nbr,kk
  integer :: nfaces,nelnodes,nfacenodes

  integer, parameter :: MAXERR = 2

  dimension xreg(3, 2)

  !     Function to find the element in a 3D mesh that point X falls into

  !     X(J)        Coords of specified point
  !     LMNTRY      Initial guess for the element (optional.  Set to zero if unknown)
  !     XMESH(J,N)  Jth coord of Nth node in mesh
  !     MAXNOD      Max no. of nodes (used to dimension arrays)
  !     LQUAD       Quadtree array for mesh (See subroutine ADDQAD)
  !     XSQ         Coords of corners of superquad (See subroutine addqad)
  !     LLPELM      Pointer array for link list of elements (see subroutine ADLINK)
  !     LLSELM      Link list of elements (see subroutine ADLINK)
  !     ICON        Connectivity array
  !     IEP         Pointer array for connectivity
  !     NBRLMN(I,J) Element adjacent to Ith face on element J
  !     MAXLMN      Max no. elements (used to dimension arrays)
  !     ACNOD       Logical array of dimension MAXNOD.  Used to flag nodes
  !     LISTN(I)    Integer array of dimension MAXLSX.  Used to store nodes close to X
  !     DISTX(I)    REAL( PREC ) array of dimension MAXLSX.  Stores square of distance to X
  !     MAXLSX      Dimension of list of neighboring nodes
  !     LSTSRC(I)   Integer array used to store quads.  See subroutines FNDNBR and QSCHRG.
  !     XSRC(I,J,K) REAL( PREC ) array used to store quad corners. See FNDNBR and QSCHRG.
  !     MAXSRC      Dimension of LSTSRC and XSRC
  !     IFAIL       Flag controlling behavIOR of routine if the point falls outside the mesh.
  !     If (IFAIL=0) on entry, the routine will print an error and stop if point is not in mesh
  !     If (IFAIL.=1) on entry, the routine will exit with IFAIL=1 if the point is not in mesh
  !     If (IFAIL=2) on entry the routine will find and return the element whose centroid is closest to x
  !                  if x does not lie inside the mesh and will exit with IFAIL=2
  !     In all cases the routine will exit with IFAIL=0 if the search was successful.


  nerr = 0
  if (lmntin<nelm+1) lmntry = lmntin
  idbg = 0
  if ( lmntry==0 ) then
    !     If no guess for the element was given, then get an initial guess
    !     Find some nodes near to the current point from the quadtree
    call fndnpt_3d(x, xmesh, nops, lquad, MAXQAD, xsq, npts, listn,  &
         distn, MAXLSX, lstsrc, xsrc, MAXSRC)

    !     Get an initial guess for the element from the elements attached to the
    !     first node in the list
    ntry = 1
    lmntry = nod2lmn(1,listn(ntry))

    if ( idbg==1 ) jjp = iep(2, lmntry)
  else
    !     Otherwise, start search from LMNTRY
    npts = 0
  end if

  start_lmn = lmntry

  acnod(1:nops) = .true.

  !     Try to get correct element using adjacency table

  icount = 0
  do while ( .true. )
    if (iep(3,lmntry)==4.or.iep(3,lmntry)==10) nfaces = 4
    if (iep(3,lmntry)==8.or.iep(3,lmntry)==20) nfaces = 6
    do i = 1, nfaces
      call facenodes_3d(iep(3,lmntry),i,list,nfacenodes)
      !     See if the point falls in element LMNTRY
      n1 = icon(iep(2, lmntry) + list(1)-1)
      n2 = icon(iep(2, lmntry) + list(2)-1)
      n3 = icon(iep(2, lmntry) + list(3)-1)
      r1 = xmesh(1:3,n1) - xmesh(1:3,n2)
      r2 = xmesh(1:3,n3) - xmesh(1:3,n2)
      r3 = x(1:3) - xmesh(1:3,n2)
      c1 = r3(1)*(r1(2)*r2(3)-r1(3)*r2(2)) - r3(2)*(r1(1)*r2(3)-r1(3)*r2(1)) + r3(3)*(r1(1)*r2(2)-r1(2)*r2(1)) 
      if ( c1>1.d-08 ) then
        icount = icount + 1
        !     It didnt.  Try the adjacent element.
        if ( nbrlmn(i, lmntry)==lmntry ) then
          write (IOW, 99001) lmntry
          stop
        end if
        if ( nbrlmn(i, lmntry)>nelm ) then
          write (IOW, 99002) nbrlmn(i, lmntry)
          stop
        end if
        if ( nbrlmn(i, lmntry)<0 ) then
          write (IOW, 99003) nbrlmn(i, lmntry)
          Stop
        end if
	    lmnprev = lmntry    ! Remember the current element just in case...
        lmntry = nbrlmn(i, lmntry)
        if ( lmntry==0 .or. icount>nelm ) then

          !     There is no adjacent element in the right place.  We have to try something else...
          !     If we started with a user supplied element, replace it with an element from the quadtree
          if ( npts==0 ) then
            !     Get some nodes near X
            call fndnpt_3d(x, xmesh, nops, lquad, MAXQAD, xsq, npts,  &
                 listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
            !     Try an element connected to the first node in the list as start for the search
            ntry = 1
            lmntry = nod2lmn(1,listn(ntry))
            goto 100
          end if

          !     Otherwise, try an element connected to the  next node in the list
          
          ntry = ntry + 1
          do while(nod2lmn(1,listn(ntry))==0)
            ntry = ntry + 1
            if (ntry>npts) exit
          end do

          if ( ntry>npts ) then
            do while ( .true. )
              !     We couldn't get to the element from any node in the list. This calls for desperate
              !     measures.  Try finding some more nodes
              nerr = nerr + 1

              if ( nerr>MAXERR ) then
                !     We tried as hard as we could - give up!
                !     If Ifail was zero on entry, we print error message and stop
                if ( ifail==0 ) then
                  write (IOW, 99004) x(1), x(2), x(3)
                  stop
                else if (ifail==1) then
		  lmnbg = lmntin
		  return
		else
          !     Otherwise, we look for the element that has its centroid closest to x
		  !     and then exit with IFAIL=1
          ifail = 1
          lmntry = start_lmn
		  do kk=1,10
		    xcen = 0.D0
		    do j = 1,iep(3,lmntry)
                 xcen(1:3) = xcen(1:3) +  xmesh(1:3,icon(iep(2,lmntry)+j-1) )
            end do
		    xcen = xcen/iep(3,lmntry)
		    dmin = (x(1)-xcen(1))**2 + (x(2)-xcen(2))**2 + (x(3)-xcen(3))**2
		    kmin = 0
            if (iep(3,lmntry)==4.or.iep(3,lmntry)==10) nfaces = 4
            if (iep(3,lmntry)==8.or.iep(3,lmntry)==20) nfaces = 6
		    do k = 1,nfaces
	          if (nbrlmn(k,lmntry)>0) then
  	  	        nbr = nbrlmn(k,lmntry)
		        xcen = 0.D0
                do j = 1,iep(3,nbr)
                   xcen(1:2) = xcen(1:2) +  xmesh(1:2,icon(iep(2,nbr)+j-1)  ) 
                end do
                xcen = xcen/iep(3,nbr)				    
                dist = (x(1)-xcen(1))**2 + (x(2)-xcen(2))**2 + (x(3)-xcen(3))**2
		        if (dist<dmin) then
			      kmin = k
       	          dmin = dist
	 	        endif
		      endif
		    end do
                  
		    if (kmin==0) exit                  

  		    lmntry = nbrlmn(kmin,lmntry)

          end do
 				
		  lmnbg = lmntry
		  return

		end if
      end if


              siz = 5.D0*dble(nerr)*dsqrt(distn(1))
              xreg(1, 1) = x(1) - siz
              xreg(2, 1) = x(2) - siz
              xreg(3, 1) = x(3) - siz
              xreg(1, 2) = x(1) + siz
              xreg(2, 2) = x(2) + siz
              xreg(3, 2) = x(3) + siz

              !     Don't bother to extract nodes that we already used
              do k = 1, npts
                acnod(listn(k)) = .false.
              end do

              call qschrg_3d(x, xreg, xmesh, acnod, nops, lquad,  &
                   MAXQAD, xsq, npts, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
              !     If we didnt find any nodes, enlarge the search region and try again
              if ( npts/=0 ) then
                ntry = 1
                exit
              end if
            end do
          end if

          lmntry = nod2lmn(1, listn(ntry))
        end if
        goto 100
      end if
    end do

    lmnbg = lmntry
    ifail = 0

    return
100 end do

99001 format ( // ' *** Error detected in subroutine LMNFND_3D ***'/  &
           ' The adjacency table is inconsistent:'/' Element ', I5,  &
           ' is adjacent to itself! ')
99002 format ( // ' *** Error detected in subroutine LMNFND_3D ***'/  &
           ' The adjacency table is inconsistent:'/' Element number '  &
           , I5, ' is greater than the no. of elements ')
99003 format ( // ' *** Error detected in subroutine LMNFND_3D ***'/  &
           ' The adjacency table is inconsistent:'/' Element number ', I5, &
           ' is less than zero ')
99004 format ( // ' *** ERROR DETECTED IN FUNCTION LMNFND_3D ***'/  &
           '  Unable to locate point (', 2(1x, D13.5), ') in mesh', /, &
           '  Possible causes:'/  &
           '     (1)  The point is outside the mesh;'/  &
           '     (2)  Error in element connectivity;'/  &
           '     (3)  Error in element adjacency;'/  &
           '     (4)  Parameter MAXERR in LMNFND too small')

end subroutine lmnfnd_3d

!=======================FUNCTION NODFND_3D =====================
function nodfnd_3d(x, xmesh, nops, nqad, lquad, MAXQAD, xsq, nzone,  &
     llpelm, llselm, MAXLLN, icon, MAXCON, iep, iadj,  &
     nelm, acnod, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: nops                           
  integer, intent( in )         :: MAXQAD
  integer, intent( in )         :: nzone                          
  integer, intent( in )         :: MAXLLN                         
  integer, intent( in )         :: MAXCON                         
  integer, intent( inout )      :: nelm                           
  integer, intent( in )         :: MAXLSX                         
  integer, intent( in )         :: MAXSRC                         
  integer, intent( in )         :: nqad(nzone)                    
  integer, intent( inout )      :: lquad(7, MAXQAD)               
  integer, intent( inout )      :: llpelm(nops)                   
  integer, intent( inout )      :: llselm(7, MAXLLN)              
  integer, intent( inout )      :: icon(MAXCON)                   
  integer, intent( in )         :: iep(7, nelm)                   
  integer, intent( inout )      :: iadj(6, nelm)                  
  integer, intent( inout )      :: listn(MAXLSX)                  
  integer, intent( inout )      :: lstsrc(MAXSRC)                 
  real( prec ), intent( inout ) :: x(2)                           
  real( prec ), intent( in )    :: xmesh(2, nops)                 
  real( prec ), intent( in )    :: xsq(2, 2, nzone)               
  real( prec ), intent( inout ) :: distn(MAXLSX)                  
  real( prec ), intent( inout ) :: xsrc(2, 2, MAXSRC)             
  logical, intent( inout )      :: acnod(nops)                    
  integer                       :: nodfnd_3d

  ! Local Variables
  real( prec ) :: dis, dismin, xreg
  integer      :: ifail, iszqad, izone, jp, k,  lmn, lmntry, node

  dimension xreg(2, 2)

  !     Find the number of the node closest to a given point X

  !     First find which zone the point falls in

  do izone = 1, nzone
    if ( xsq(1, 1, izone)<x(1) .and. xsq(2, 1, izone)<x(2) .and.  &
         xsq(1, 2, izone)>x(1) .and. xsq(2, 2, izone)>x(2) ) exit
  end do
  if ( izone>nzone ) izone = nzone

  !     Find the element that the point falls in

  lmntry = 0
  iszqad = MAXQAD - nqad(izone)
  ifail = 0
!  call lmnfnd_3d(x, lmntry, xmesh, nops, lquad(1, nqad(izone)), iszqad,  &
!       xsq(1, 1, izone), llpelm, llselm, MAXLLN, icon,  &
!       MAXCON, iep, iadj, nelm, acnod, listn, distn, MAXLSX,  &
!       lstsrc, xsrc, MAXSRC, lmn, ifail)

  !     Find the closest node from the element connectivity. Midside nodes are included in search.

  jp = iep(2, lmn)
  dismin = (x(1) - xmesh(1, icon(jp))) **2 + (x(2) - xmesh(2, icon(jp)))**2
  node = icon(jp)
  do k = 2, iep(3, lmn)
    dis = (x(1) - xmesh(1, icon(jp + k - 1)))  &
         **2 + (x(2) - xmesh(2, icon(jp + k - 1)))**2
    if ( dis<dismin ) then
      dismin = dis
      node = icon(jp + k - 1)
    end if
  end do

  nodfnd_3d = node

end function nodfnd_3d


!========================SUBROUTINE ADQUAD_2d ===================
subroutine adquad_2d(node, x, xmesh, maxx, nquad, lquad, MAXQAD, xsq)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: node                          
  integer, intent( in )         :: maxx                          
  integer, intent( inout )      :: nquad                         
  integer, intent( in )         :: MAXQAD                        
  integer, intent( inout )      :: lquad(7, MAXQAD)              
  real( prec ), intent( inout ) :: x(2)                          
  real( prec ), intent( in )    :: xmesh(2, maxx)                
  real( prec ), intent( in )    :: xsq(2, 2)                     

  ! Local Variables
  integer      :: iq, k,  nsub
  real( prec ) :: xcen, xl, xlo, xup

  integer, parameter :: MAXSUB = 40
  dimension xup(2), xlo(2), xcen(2), xl(2)

  !     Subroutine to add new node to a two--dimensional quadtree

  !     NODE        Number of node to be added
  !     X(J)        Jth coord of new node
  !     XMESH(I,J)  Ith coord of Jth node already in quadtree
  !     MAXX        Dimension of XMESH - must exceed max no. points
  !     NQUAD       No. quads
  !     LQUAD(I,J)  Quadtree array
  !     LQUAD(7,J)  <0   Quad is full
  !     =0   Quad is empty
  !     >0   No. points in quad
  !     LQUAD(6,J)  >0   The quad that the Jth quad came from
  !     LQUAD(5,J)  >0   The position in the quad that the Jth quad came from
  !     LQUAD(1:4)  For LQUAD(7,J)>0 the points stored in Jth quad
  !     For LQUAD(7,J)<0 the quads into which the present quad was divided
  !     MAXQAD     Dimension of LQUAD
  !     XSQ(I,1)   Ith coord of lower left corner of superquad (square containing all points)
  !     XSQ(I,2)   Ith coord of upper right corner of superquad

  !     Local Quad numbering is
  !     3 4
  !     1 2

  !     Start search in superquad

  if ( nquad<=0 ) nquad = 1
  nsub = 0
  iq = 1
  xlo(1) = xsq(1, 1)
  xlo(2) = xsq(2, 1)
  xup(1) = xsq(1, 2)
  xup(2) = xsq(2, 2)
  do while ( .true. )


    !     --  Center of current quad
    xcen(1) = 0.5D0*(xup(1) + xlo(1))
    xcen(2) = 0.5D0*(xup(2) + xlo(2))

    if ( lquad(7, iq)<0 ) then
      !     --    If quad IQ is full, goto next branch of tree
      if ( x(1)<=xcen(1) ) then
        if ( x(2)<=xcen(2) ) then
          iq = lquad(1, iq)
          xup(1) = xcen(1)
          xup(2) = xcen(2)
        else
          iq = lquad(3, iq)
          xlo(2) = xcen(2)
          xup(1) = xcen(1)
        end if
      else if ( x(2)<=xcen(2) ) then
        iq = lquad(2, iq)
        xlo(1) = xcen(1)
        xup(2) = xcen(2)
      else
        iq = lquad(4, iq)
        xlo(1) = xcen(1)
        xlo(2) = xcen(2)
      end if
      cycle
    else if ( lquad(7, iq)<4 ) then
      !     --    If quad IQ is not yet full, add new point to IQ
      lquad(7, iq) = lquad(7, iq) + 1
      lquad(lquad(7, iq), iq) = node
    else
      !     --    If quad IQ has just been filled, subdivide into four new quads

      nsub = nsub + 1
      if ( nsub>MAXSUB ) then
        write (IOW, 99001) MAXSUB
        stop
      end if
      if ( nquad + 4>MAXQAD ) then
        write (IOW, 99002) MAXQAD
        stop
      end if

      do k = 1, 4
        !     --      Put all points in current quad into appropriate new quads

        xl(1) = xmesh(1, lquad(k, iq))
        xl(2) = xmesh(2, lquad(k, iq))
        if ( xl(1)<=xcen(1) ) then
          if ( xl(2)<=xcen(2) ) then
            lquad(7, nquad + 1) = lquad(7, nquad + 1) + 1
            lquad(lquad(7, nquad + 1), nquad + 1) = lquad(k, iq)
          else
            lquad(7, nquad + 3) = lquad(7, nquad + 3) + 1
            lquad(lquad(7, nquad + 3), nquad + 3) = lquad(k, iq)
          end if
        else if ( xl(2)<=xcen(2) ) then
          lquad(7, nquad + 2) = lquad(7, nquad + 2) + 1
          lquad(lquad(7, nquad + 2), nquad + 2) = lquad(k, iq)
        else
          lquad(7, nquad + 4) = lquad(7, nquad + 4) + 1
          lquad(lquad(7, nquad + 4), nquad + 4) = lquad(k, iq)
        end if
      end do
      do k = 1, 4
        lquad(k, iq) = nquad + k
        lquad(6, nquad + k) = iq
        lquad(5, nquad + k) = k
      end do
      lquad(7, iq) = -1
      if ( x(1)<=xcen(1) ) then
        if ( x(2)<=xcen(2) ) then
          iq = nquad + 1
          xup(1) = xcen(1)
          xup(2) = xcen(2)
        else
          iq = nquad + 3
          xlo(2) = xcen(2)
          xup(1) = xcen(1)
        end if
      else if ( x(2)<=xcen(2) ) then
        iq = nquad + 2
        xlo(1) = xcen(1)
        xup(2) = xcen(2)
      else
        iq = nquad + 4
        xlo(1) = xcen(1)
        xlo(2) = xcen(2)
      end if
      nquad = nquad + 4
      cycle
    end if

    return
  end do

99001 format ('  **** ERROR DETECTED IN SUBROUTINE ADQUAD **** '/  &
           '    Quadtree subdivided more than ', I4,  &
           ' times '/'    Possible causes:  (1) superquad too large '  &
           , '(2) at least 5 coincident nodes in input mesh ')
99002 format ('  **** ERROR DETECTED IN SUBROUTINE ADQUAD **** ', /,  &
           '    Insufficient storage to form quadtree ',  &
           '    Parameter MAXQAD must be increased. ', /,  &
           '    Its current value is  ', I4)

end subroutine adquad_2d


!========================SUBROUTINE QSCHRG ===================
subroutine qschrg_2d(x, xreg, xmesh, acnod, maxx, lquad, MAXQAD, xsq,  &
     npts, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: maxx                         
  integer, intent( in )         :: MAXQAD                       
  integer, intent( out )        :: npts                         
  integer, intent( in )         :: MAXLSX                       
  integer, intent( in )         :: MAXSRC                       
  integer, intent( in )         :: lquad(7, MAXQAD)             
  integer, intent( out )        :: listn(MAXLSX)                
  integer, intent( out )        :: lstsrc(MAXSRC)               
  real( prec ), intent( inout ) :: x(2)                         
  real( prec ), intent( in )    :: xreg(2, 2)                   
  real( prec ), intent( in )    :: xmesh(2, maxx)               
  real( prec ), intent( in )    :: xsq(2, 2)                    
  real( prec ), intent( out )   :: distn(MAXLSX)                
  real( prec ), intent( out )   :: xsrc(2, 2, MAXSRC)           
  logical, intent( in )         :: acnod(*)                     

  ! Local Variables
  real( prec ) d, xcen, xlo, xup
  integer :: i, iq, ir, j, k, l, lst,  node, nsrc
  logical :: lap0_2d

  dimension xup(2), xlo(2), xcen(2)

  !     Subroutine to find all points which fall within a specified rectangular search region.
  !     Points are returned in a list LISTN(I), numbered according to their distance from
  !     a user specified point point X

  !     X(I)       Ith coord of point to be used to rank list
  !     XREG(I,J)  Ith coord of lower left (J=1) and upper right (J=2) corners of search region.
  !     XMESH(I,J) Coords of points defining quadtree
  !     ACNOD(J)   Flag for Jth node - node is extracted only if ACNOD is set to .TRUE.
  !     (flag is used to distinguish frontal nodes)
  !     MAXX       Max dimension of XMESH
  !     LQUAD      Quadtree array (described in subroutine ADQUAD)
  !     MAXQAD     Max dimension of quadtree array
  !     XSQ        Coords of superquad
  !     LSTSRC(I)  List of quads that must be checked for overlap with search region
  !     XSRC(J,K,I)Lower left & upper right corners of Ith quad in list of quads to be searched
  !     MAXSRC     Dimension of array LSTSRC and XSRC
  !     NPTS       Total no. points found in search region
  !     LISTN      List of points in search region
  !     MAXLSX     Dimension of LISTN

  npts = 0
  nsrc = 1
  lstsrc(1) = 1
  xsrc(1, 1, 1) = xsq(1, 1)
  xsrc(2, 1, 1) = xsq(2, 1)
  xsrc(1, 2, 1) = xsq(1, 2)
  xsrc(2, 2, 1) = xsq(2, 2)
  k = 0
  do while ( .true. )
    k = k + 1
    iq = lstsrc(k)
    xlo(1) = xsrc(1, 1, k)
    xlo(2) = xsrc(2, 1, k)
    xup(1) = xsrc(1, 2, k)
    xup(2) = xsrc(2, 2, k)
    xcen(1) = 0.5D0*(xup(1) + xlo(1))
    xcen(2) = 0.5D0*(xup(2) + xlo(2))
    if ( lquad(7, iq)<0 ) then
      if ( nsrc + 1>MAXSRC ) then
        write (IOW, 99001) MAXSRC
        stop
      end if
      if ( lap0_2d(xlo(1), xlo(2), xcen(1), xcen(2), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(1, iq)
        xsrc(1, 1, nsrc) = xlo(1)
        xsrc(2, 1, nsrc) = xlo(2)
        xsrc(1, 2, nsrc) = xcen(1)
        xsrc(2, 2, nsrc) = xcen(2)
      end if
      if ( lap0_2d(xcen(1), xlo(2), xup(1), xcen(2), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(2, iq)
        xsrc(1, 1, nsrc) = xcen(1)
        xsrc(2, 1, nsrc) = xlo(2)
        xsrc(1, 2, nsrc) = xup(1)
        xsrc(2, 2, nsrc) = xcen(2)
      end if
      if ( lap0_2d(xlo(1), xcen(2), xcen(1), xup(2), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(3, iq)
        xsrc(1, 1, nsrc) = xlo(1)
        xsrc(2, 1, nsrc) = xcen(2)
        xsrc(1, 2, nsrc) = xcen(1)
        xsrc(2, 2, nsrc) = xup(2)
      end if
      if ( lap0_2d(xcen(1), xcen(2), xup(1), xup(2), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(4, iq)
        xsrc(1, 1, nsrc) = xcen(1)
        xsrc(2, 1, nsrc) = xcen(2)
        xsrc(1, 2, nsrc) = xup(1)
        xsrc(2, 2, nsrc) = xup(2)
      end if
    else if ( lquad(7, iq)>0 ) then
      do j = 1, lquad(7, iq)
        node = lquad(j, iq)
        if ( acnod(node) ) then
          if ( (xmesh(1, node)<xreg(1, 2)) .and.  &
               (xmesh(2, node)<xreg(2, 2)) .and.  &
               (xmesh(1, node)>xreg(1, 1)) .and. (xmesh(2, node)>xreg(2, 1)) ) then
            npts = npts + 1
            if ( npts>MAXLSX ) then
              write (IOW, 99002) MAXLSX
              stop
            end if
            listn(npts) = node
          end if
        end if
      end do
    end if
    if ( k>=nsrc ) then


      !     Sort nodes according to distance to given point
      !     (this is the HEAPSORT algorithm from Numerical Recepies)

      do k = 1, npts
        node = listn(k)
        distn(k) = (xmesh(1, node) - x(1)) **2 + (xmesh(2, node) - x(2))**2
      end do

      if ( npts<=1 ) return

      l = npts/2 + 1
      ir = npts
      exit
    end if
  end do
100 if ( l>1 ) then
    l = l - 1
    d = distn(l)
    lst = listn(l)
  else
    d = distn(ir)
    lst = listn(ir)
    distn(ir) = distn(1)
    listn(ir) = listn(1)
    ir = ir - 1
    if ( ir==1 ) then
      distn(1) = d
      listn(1) = lst
      return
    end if
  end if
  i = l
  j = l + l
  do while ( .true. )
    if ( j<=ir ) then
      if ( j<ir ) then
        if ( distn(j)<distn(j + 1) ) j = j + 1
      end if
      if ( d<distn(j) ) then
        distn(i) = distn(j)
        listn(i) = listn(j)
        i = j
        j = j + j
      else
        j = ir + 1
      end if
      cycle
    end if
    distn(i) = d
    listn(i) = lst
    goto 100
  end do

99001 format ('  **** ERROR DETECTED IN SUBROUTINE QSCHRG-2D **** ', /,  &
           '    Insufficient storage to assemble list of quads ',  &
           '    Parameter MAXSRC must be increased. ', /,  &
           '    Its current value is  ', I4)
99002 format ( // '  **** ERROR DETECTED IN SUBROUTINE QSCHRG_2D **** '/  &
           '    Insufficient storage to assemble list of nodes '/  &
           '    Parameter MAXLSX must be increased. '/ &
           '    Its current value is  ', I4)
  
end subroutine qschrg_2d


!==============================FUNCTION LAP0_2D ==============================
function lap0_2d(xqlo1, xqlo2, xqup1, xqup2, xreg)
  use Types
  implicit none

  real( prec ), intent( in )    :: xqlo1                      
  real( prec ), intent( in )    :: xqlo2                      
  real( prec ), intent( inout ) :: xqup1                      
  real( prec ), intent( inout ) :: xqup2                      
  real( prec ), intent( in )    :: xreg(2, 2)                 
  logical                       :: lap0_2d

  !     Function to determine whether any part of search region XREG lies within a quad.

  !     XQLO(I)     Ith coord of lower left corner of quad
  !     XQUP(I)     Ith coord of upper right corner of quad
  !     XREG(I,1)   Ith coord of lower left corner of search region
  !     XREG(I,2)   Ith coord of upper right corner of search region

  lap0_2d = .true.
  if ( xreg(1, 2)<xqlo1 ) lap0_2d = .false.
  if ( xreg(1, 1)>xqup1 ) lap0_2d = .false.
  if ( xreg(2, 1)>xqup2 ) lap0_2d = .false.
  if ( xreg(2, 2)<xqlo2 ) lap0_2d = .false.

end function lap0_2d


!==============================SUBROUTINE FNDNPT ===========================
subroutine fndnpt_2d(x, xmesh, maxx, lquad, MAXQAD, xsq, npts, listn,  &
     distn, MAXLSX, lstsrc, xsrc, MAXSRC)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: maxx                         
  integer, intent( in )         :: MAXQAD                       
  integer, intent( out )        :: npts                         
  integer, intent( in )         :: MAXLSX                       
  integer, intent( in )         :: MAXSRC                       
  integer, intent( in )         :: lquad(7, MAXQAD)             
  integer, intent( out )        :: listn(MAXLSX)                
  integer, intent( out )        :: lstsrc(MAXSRC)               
  real( prec ), intent( inout ) :: x(2)                         
  real( prec ), intent( in )    :: xmesh(2, maxx)               
  real( prec ), intent( in )    :: xsq(2, 2)                    
  real( prec ), intent( out )   :: distn(MAXLSX)                
  real( prec ), intent( out )   :: xsrc(2, 2, MAXSRC)           

  ! Local Variables
  real( prec ) :: d, xcen, xlo, xup
  integer      :: i, iq, ir, istrt, j, k, l, lst,  node, nsrc

  dimension xup(2), xlo(2), xcen(2)

  !     Subroutine to return a list of points near a given point X

  !     X(I)       Ith coord of given point
  !     LQUAD      Quadtree array (described in subroutine ADQUAD)
  !     MAXQAD     Max dimension of quadtree array
  !     XSQ        Coords of superquad

  !     Go down the quadtree and look for the first empty quad we find

  iq = 1
  istrt = 1
  xlo(1) = xsq(1, 1)
  xlo(2) = xsq(2, 1)
  xup(1) = xsq(1, 2)
  xup(2) = xsq(2, 2)
  if ( x(1)==0.D0 .and. x(2)==0.D0 ) then
  end if
  do while ( .true. )


    !     --  Center of current quad
    xcen(1) = 0.5D0*(xup(1) + xlo(1))
    xcen(2) = 0.5D0*(xup(2) + xlo(2))
    if ( lquad(7, iq)<0 ) then
      !     --    This is the quad to extract points from
      istrt = iq
      xsrc(1, 1, 1) = xlo(1)
      xsrc(2, 1, 1) = xlo(2)
      xsrc(1, 2, 1) = xup(1)
      xsrc(2, 2, 1) = xup(2)
      !     --    If quad IQ is full, goto next branch of tree
      if ( x(1)<=xcen(1) ) then
        if ( x(2)<=xcen(2) ) then
          iq = lquad(1, iq)
          xup(1) = xcen(1)
          xup(2) = xcen(2)
        else
          iq = lquad(3, iq)
          xlo(2) = xcen(2)
          xup(1) = xcen(1)
        end if
      else if ( x(2)<=xcen(2) ) then
        iq = lquad(2, iq)
        xlo(1) = xcen(1)
        xup(2) = xcen(2)
      else
        iq = lquad(4, iq)
        xlo(1) = xcen(1)
        xlo(2) = xcen(2)
      end if
      cycle
    end if

    !     Get all the points in the chosen quad

    npts = 0
    nsrc = 1
    lstsrc(1) = istrt
    k = 0
    exit
  end do
  do while ( .true. )
    k = k + 1
    iq = lstsrc(k)
    xlo(1) = xsrc(1, 1, k)
    xlo(2) = xsrc(2, 1, k)
    xup(1) = xsrc(1, 2, k)
    xup(2) = xsrc(2, 2, k)
    xcen(1) = 0.5D0*(xup(1) + xlo(1))
    xcen(2) = 0.5D0*(xup(2) + xlo(2))
    if ( lquad(7, iq)<0 ) then
      !     --      If quad is full, add its subdivisions to the list of quads to be searched
      if ( nsrc + 1>MAXSRC ) then
        write (IOW, 99001) MAXSRC
        stop
      end if
      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(1, iq)
      xsrc(1, 1, nsrc) = xlo(1)
      xsrc(2, 1, nsrc) = xlo(2)
      xsrc(1, 2, nsrc) = xcen(1)
      xsrc(2, 2, nsrc) = xcen(2)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(2, iq)
      xsrc(1, 1, nsrc) = xcen(1)
      xsrc(2, 1, nsrc) = xlo(2)
      xsrc(1, 2, nsrc) = xup(1)
      xsrc(2, 2, nsrc) = xcen(2)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(3, iq)
      xsrc(1, 1, nsrc) = xlo(1)
      xsrc(2, 1, nsrc) = xcen(2)
      xsrc(1, 2, nsrc) = xcen(1)
      xsrc(2, 2, nsrc) = xup(2)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(4, iq)
      xsrc(1, 1, nsrc) = xcen(1)
      xsrc(2, 1, nsrc) = xcen(2)
      xsrc(1, 2, nsrc) = xup(1)
      xsrc(2, 2, nsrc) = xup(2)

    else if ( lquad(7, iq)>0 ) then
      do j = 1, lquad(7, iq)
        node = lquad(j, iq)
        npts = npts + 1
        if ( npts>MAXLSX ) then
          write (IOW, 99002) MAXLSX
          stop
        end if
        listn(npts) = node
      end do
    end if
    if ( k>=nsrc ) then


      !     Sort nodes according to distance to given point
      !     (this is the HEAPSORT algorithm from Numerical Recepies)

      do k = 1, npts
        node = listn(k)
        distn(k) = (xmesh(1, node) - x(1)) **2 + (xmesh(2, node) - x(2))**2
      end do

      if ( npts<=1 ) then
        node = listn(1)
        if ( x(1)==0.D0 .and. x(2)==0.D0 ) then
        end if
        return
      end if

      l = npts/2 + 1
      ir = npts
      exit
    end if
  end do
100 if ( l>1 ) then
    l = l - 1
    d = distn(l)
    lst = listn(l)
  else
    d = distn(ir)
    lst = listn(ir)
    distn(ir) = distn(1)
    listn(ir) = listn(1)
    ir = ir - 1
    if ( ir==1 ) then
      distn(1) = d
      listn(1) = lst
      return
    end if
  end if
  i = l
  j = l + l
  do while ( .true. )
    if ( j<=ir ) then
      if ( j<ir ) then
        if ( distn(j)<distn(j + 1) ) j = j + 1
      end if
      if ( d<distn(j) ) then
        distn(i) = distn(j)
        listn(i) = listn(j)
        i = j
        j = j + j
      else
        j = ir + 1
      end if
      cycle
    end if
    distn(i) = d
    listn(i) = lst
    goto 100
  end do

99001 format ('  **** ERROR DETECTED IN SUBROUTINE FNDNPT **** '/  &
           '    Insufficient storage to assemble list of quads '/  &
           '    Parameter MAXSRC must be increased. '/ &
           '    Its current value is  ', I4)
99002 format ( // '  **** ERROR DETECTED IN SUBROUTINE FNDNPT **** '/  &
           '    Insufficient storage to assemble list of nodes '/  &
           '    Parameter MAXLSX must be increased. '/ &
           '    Its current value is  ', I4)
  
end subroutine fndnpt_2d


!========================SUBROUTINE ADQUAD_3d ===================
subroutine adquad_3d(node, x, xmesh, maxx, nquad, lquad, MAXQAD, xsq)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: node                          
  integer, intent( in )         :: maxx                          
  integer, intent( inout )      :: nquad                         
  integer, intent( in )         :: MAXQAD                        
  integer, intent( inout )      :: lquad(11, MAXQAD)              
  real( prec ), intent( inout ) :: x(3)                          
  real( prec ), intent( in )    :: xmesh(3, maxx)                
  real( prec ), intent( in )    :: xsq(3, 2)                     

  ! Local Variables
  integer      :: iq, k,  nsub
  real( prec ) :: xcen, xl, xlo, xup

  integer, parameter :: MAXSUB = 40
  dimension xup(3), xlo(3), xcen(3), xl(3)

  !     Subroutine to add new node to a three--dimensional quadtree

  !     NODE        Number of node to be added
  !     X(J)        Jth coord of new node
  !     XMESH(I,J)  Ith coord of Jth node already in quadtree
  !     MAXX        Dimension of XMESH - must exceed max no. points
  !     NQUAD       No. quads
  !     LQUAD(I,J)  Quadtree array
  !     LQUAD(11,J)  <0   Quad is full
  !     =0   Quad is empty
  !     >0   No. points in quad
  !     LQUAD(10,J)  >0   The quad that the Jth quad came from
  !     LQUAD(9,J)  >0   The position in the quad that the Jth quad came from
  !     LQUAD(1:8)  For LQUAD(11,J)>0 the points stored in Jth quad
  !     For LQUAD(11,J)<0 the quads into which the present quad was divided
  !     MAXQAD     Dimension of LQUAD
  !     XSQ(I,1)   Ith coord of lower left corner of superquad (square containing all points)
  !     XSQ(I,2)   Ith coord of upper right corner of superquad

  !     Local Quad numbering is
  !     7 8
  !     5 6
  !     ---
  !     3 4
  !     1 2

  !     Start search in superquad

  if ( nquad<=0 ) nquad = 1
  nsub = 0
  iq = 1
  xlo(1:3) = xsq(1:3, 1)
  xup(1:3) = xsq(1:3, 2)
  do while ( .true. )


    !     --  Center of current quad
    xcen(1:3) = 0.5D0*(xup(1:3) + xlo(1:3))

    if ( lquad(11, iq)<0 ) then
      !     --    If quad IQ is full, goto next branch of tree
      if ( x(3) <= xcen(3) ) then
        if ( x(1)<=xcen(1) ) then
          if ( x(2)<=xcen(2) ) then
            iq = lquad(1, iq)
            xup(1) = xcen(1)
            xup(2) = xcen(2)
            xup(3) = xcen(3)
          else
            iq = lquad(3, iq)
            xlo(2) = xcen(2)
            xup(1) = xcen(1)
            xup(3) = xcen(3)
          end if
        else
          if ( x(2)<=xcen(2) ) then
            iq = lquad(2, iq)
            xlo(1) = xcen(1)
            xup(2) = xcen(2)
            xup(3) = xcen(3)
          else
            iq = lquad(4, iq)
            xlo(1) = xcen(1)
            xlo(2) = xcen(2)
            xup(3) = xcen(3)
          end if
        endif
      else
        if ( x(1)<=xcen(1) ) then
          if ( x(2)<=xcen(2) ) then
            iq = lquad(5, iq)
            xup(1) = xcen(1)
            xup(2) = xcen(2)
            xlo(3) = xcen(3)
          else
            iq = lquad(7, iq)
            xlo(2) = xcen(2)
            xup(1) = xcen(1)
            xlo(3) = xcen(3)
          end if
        else
          if ( x(2)<=xcen(2) ) then
            iq = lquad(6, iq)
            xlo(1) = xcen(1)
            xup(2) = xcen(2)
            xlo(3) = xcen(3)
          else
            iq = lquad(8, iq)
            xlo(1) = xcen(1)
            xlo(2) = xcen(2)
            xlo(3) = xcen(3)
          end if      
        endif
      endif
      cycle
    else if ( lquad(11, iq)<8 ) then
      !     --    If quad IQ is not yet full, add new point to IQ
      lquad(11, iq) = lquad(11, iq) + 1
      lquad(lquad(11, iq), iq) = node
    else
      !     --    If quad IQ has just been filled, subdivide into four new quads

      nsub = nsub + 1
      if ( nsub>MAXSUB ) then
        write (IOW, 99001) MAXSUB
        stop
      end if
      if ( nquad + 8>MAXQAD ) then
        write (IOW, 99002) MAXQAD
        stop
      end if

      do k = 1, 8
        !     --      Put all points in current quad into appropriate new quads

        xl(1:3) = xmesh(1:3, lquad(k, iq))
        if ( xl(3)<=xcen(3) ) then
          if ( xl(1)<=xcen(1) ) then
            if ( xl(2)<=xcen(2) ) then
              lquad(11, nquad + 1) = lquad(11, nquad + 1) + 1
              lquad(lquad(11, nquad + 1), nquad + 1) = lquad(k, iq)
            else
              lquad(11, nquad + 3) = lquad(11, nquad + 3) + 1
              lquad(lquad(11, nquad + 3), nquad + 3) = lquad(k, iq)
            end if
          else
            if ( xl(2)<=xcen(2) ) then
              lquad(11, nquad + 2) = lquad(11, nquad + 2) + 1
              lquad(lquad(11, nquad + 2), nquad + 2) = lquad(k, iq)
            else
              lquad(11, nquad + 4) = lquad(11, nquad + 4) + 1
              lquad(lquad(11, nquad + 4), nquad + 4) = lquad(k, iq)
            end if
          endif
        else
          if ( xl(1)<=xcen(1) ) then
            if ( xl(2)<=xcen(2) ) then
              lquad(11, nquad + 5) = lquad(11, nquad + 5) + 1
              lquad(lquad(11, nquad + 5), nquad + 5) = lquad(k, iq)
            else
              lquad(11, nquad + 7) = lquad(11, nquad + 7) + 1
              lquad(lquad(11, nquad + 7), nquad + 7) = lquad(k, iq)
            end if
          else
            if ( xl(2)<=xcen(2) ) then
              lquad(11, nquad + 6) = lquad(11, nquad + 6) + 1
              lquad(lquad(11, nquad + 6), nquad + 6) = lquad(k, iq)
            else
              lquad(11, nquad + 8) = lquad(11, nquad + 8) + 1
              lquad(lquad(11, nquad + 8), nquad + 8) = lquad(k, iq)
            end if
          endif        
      
        endif
      end do
      do k = 1, 8
        lquad(k, iq) = nquad + k
        lquad(10, nquad + k) = iq
        lquad(9, nquad + k) = k
      end do
      lquad(11, iq) = -1
      if ( x(3)<=xcen(3) ) then
        if ( x(1)<=xcen(1) ) then
          if ( x(2)<=xcen(2) ) then
            iq = nquad + 1
            xup(1) = xcen(1)
            xup(2) = xcen(2)
            xup(3) = xcen(3)
          else
            iq = nquad + 3
            xlo(2) = xcen(2)
            xup(1) = xcen(1)
            xup(3) = xcen(3)
          end if
        else
          if ( x(2)<=xcen(2) ) then
            iq = nquad + 2
            xlo(1) = xcen(1)
            xup(2) = xcen(2)
            xup(3) = xcen(3)
          else
            iq = nquad + 4
            xlo(1) = xcen(1)
            xlo(2) = xcen(2)
            xup(3) = xcen(3)
          end if
        endif
      else
        if ( x(1)<=xcen(1) ) then
          if ( x(2)<=xcen(2) ) then
            iq = nquad + 5
            xup(1) = xcen(1)
            xup(2) = xcen(2)
            xlo(3) = xcen(3)
          else
            iq = nquad + 7
            xlo(2) = xcen(2)
            xup(1) = xcen(1)
            xlo(3) = xcen(3)
          end if
        else
          if ( x(2)<=xcen(2) ) then
            iq = nquad + 6
            xlo(1) = xcen(1)
            xup(2) = xcen(2)
            xlo(3) = xcen(3)
          else
            iq = nquad + 8
            xlo(1) = xcen(1)
            xlo(2) = xcen(2)
            xlo(3) = xcen(3)
          end if
        endif      
      endif
      nquad = nquad + 8
      cycle
    end if

    return
  end do

99001 format ('  **** ERROR DETECTED IN SUBROUTINE ADQUAD_3D **** '/  &
           '    Quadtree subdivided more than ', I4,  &
           ' times '/'    Possible causes:  (1) superquad too large '  &
           , '(2) at least 9 coincident nodes in input mesh ')
99002 format ('  **** ERROR DETECTED IN SUBROUTINE ADQUAD_3d **** ', /,  &
           '    Insufficient storage to form quadtree ',  &
           '    Parameter MAXQAD must be increased. ', /,  &
           '    Its current value is  ', I4)

end subroutine adquad_3d


!========================SUBROUTINE QSCHRG ===================
subroutine qschrg_3d(x, xreg, xmesh, acnod, maxx, lquad, MAXQAD, xsq,  &
     npts, listn, distn, MAXLSX, lstsrc, xsrc, MAXSRC)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: maxx                         
  integer, intent( in )         :: MAXQAD                       
  integer, intent( out )        :: npts                         
  integer, intent( in )         :: MAXLSX                       
  integer, intent( in )         :: MAXSRC                       
  integer, intent( in )         :: lquad(11, MAXQAD)             
  integer, intent( out )        :: listn(MAXLSX)                
  integer, intent( out )        :: lstsrc(MAXSRC)               
  real( prec ), intent( inout ) :: x(3)                         
  real( prec ), intent( in )    :: xreg(3, 2)                   
  real( prec ), intent( in )    :: xmesh(3, maxx)               
  real( prec ), intent( in )    :: xsq(3, 2)                    
  real( prec ), intent( out )   :: distn(MAXLSX)                
  real( prec ), intent( out )   :: xsrc(3, 2, MAXSRC)           
  logical, intent( in )         :: acnod(*)                     

  ! Local Variables
  real( prec ) d, xcen, xlo, xup
  integer :: i, iq, ir, j, k, l, lst,  node, nsrc
  logical :: lap0_3d

  dimension xup(3), xlo(3), xcen(3)

  !     Subroutine to find all points which fall within a specified rectangular search region.
  !     Points are returned in a list LISTN(I), numbered according to their distance from
  !     a user specified point point X

  !     X(I)       Ith coord of point to be used to rank list
  !     XREG(I,J)  Ith coord of lower left (J=1) and upper right (J=2) corners of search region.
  !     XMESH(I,J) Coords of points defining quadtree
  !     ACNOD(J)   Flag for Jth node - node is extracted only if ACNOD is set to .TRUE.
  !     (flag is used to distinguish frontal nodes)
  !     MAXX       Max dimension of XMESH
  !     LQUAD      Quadtree array (described in subroutine ADQUAD)
  !     MAXQAD     Max dimension of quadtree array
  !     XSQ        Coords of superquad
  !     LSTSRC(I)  List of quads that must be checked for overlap with search region
  !     XSRC(J,K,I)Lower left & upper right corners of Ith quad in list of quads to be searched
  !     MAXSRC     Dimension of array LSTSRC and XSRC
  !     NPTS       Total no. points found in search region
  !     LISTN      List of points in search region
  !     MAXLSX     Dimension of LISTN

  npts = 0
  nsrc = 1
  lstsrc(1) = 1
  xsrc(1:3, 1, 1) = xsq(1:3, 1)
  xsrc(1:3, 2, 1) = xsq(1:3, 2)
  k = 0
  do while ( .true. )
    k = k + 1
    iq = lstsrc(k)
    xlo(1:3) = xsrc(1:3, 1, k)
    xup(1:3) = xsrc(1:3, 2, k)
    xcen(1:3) = 0.5D0*(xup(1:3) + xlo(1:3))
    if ( lquad(11, iq)<0 ) then
      if ( nsrc + 1>MAXSRC ) then
        write (IOW, 99001) MAXSRC
        stop
      end if
      if ( lap0_3d(xlo(1), xlo(2), xlo(3), xcen(1), xcen(2), xcen(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(1, iq)
        xsrc(1, 1, nsrc) = xlo(1)
        xsrc(2, 1, nsrc) = xlo(2)
        xsrc(3, 1, nsrc) = xlo(3)
        xsrc(1, 2, nsrc) = xcen(1)
        xsrc(2, 2, nsrc) = xcen(2)
        xsrc(3, 2, nsrc) = xcen(3)
      end if
      if ( lap0_3d(xcen(1), xlo(2), xlo(3), xup(1), xcen(2), xcen(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(2, iq)
        xsrc(1, 1, nsrc) = xcen(1)
        xsrc(2, 1, nsrc) = xlo(2)
        xsrc(3, 1, nsrc) = xlo(3)
        xsrc(1, 2, nsrc) = xup(1)
        xsrc(2, 2, nsrc) = xcen(2)
        xsrc(3, 2, nsrc) = xcen(3)
      end if
      if ( lap0_3d(xlo(1), xcen(2), xlo(3), xcen(1), xup(2), xcen(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(3, iq)
        xsrc(1, 1, nsrc) = xlo(1)
        xsrc(2, 1, nsrc) = xcen(2)
        xsrc(3, 1, nsrc) = xlo(3)
        xsrc(1, 2, nsrc) = xcen(1)
        xsrc(2, 2, nsrc) = xup(2)
        xsrc(3, 2, nsrc) = xcen(3)
      end if
      if ( lap0_3d(xcen(1), xcen(2), xlo(3), xup(1), xup(2), xcen(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(4, iq)
        xsrc(1, 1, nsrc) = xcen(1)
        xsrc(2, 1, nsrc) = xcen(2)
        xsrc(3, 1, nsrc) = xlo(3)
        xsrc(1, 2, nsrc) = xup(1)
        xsrc(2, 2, nsrc) = xup(2)
        xsrc(3, 2, nsrc) = xcen(3)
      end if
      
      if ( lap0_3d(xlo(1), xlo(2), xcen(3), xcen(1), xcen(2), xup(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(1, iq)
        xsrc(1, 1, nsrc) = xlo(1)
        xsrc(2, 1, nsrc) = xlo(2)
        xsrc(3, 1, nsrc) = xcen(3)
        xsrc(1, 2, nsrc) = xcen(1)
        xsrc(2, 2, nsrc) = xcen(2)
        xsrc(3, 2, nsrc) = xup(3)
      end if
      if ( lap0_3d(xcen(1), xlo(2), xcen(3), xup(1), xcen(2), xup(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(2, iq)
        xsrc(1, 1, nsrc) = xcen(1)
        xsrc(2, 1, nsrc) = xlo(2)
        xsrc(3, 1, nsrc) = xcen(3)
        xsrc(1, 2, nsrc) = xup(1)
        xsrc(2, 2, nsrc) = xcen(2)
        xsrc(3, 2, nsrc) = xup(3)
      end if
      if ( lap0_3d(xlo(1), xcen(2), xcen(3), xcen(1), xup(2), xup(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(3, iq)
        xsrc(1, 1, nsrc) = xlo(1)
        xsrc(2, 1, nsrc) = xcen(2)
        xsrc(3, 1, nsrc) = xcen(3)
        xsrc(1, 2, nsrc) = xcen(1)
        xsrc(2, 2, nsrc) = xup(2)
        xsrc(3, 2, nsrc) = xup(3)
      end if
      if ( lap0_3d(xcen(1), xcen(2), xcen(3), xup(1), xup(2), xup(3), xreg) ) then
        nsrc = nsrc + 1
        lstsrc(nsrc) = lquad(4, iq)
        xsrc(1, 1, nsrc) = xcen(1)
        xsrc(2, 1, nsrc) = xcen(2)
        xsrc(3, 1, nsrc) = xcen(3)
        xsrc(1, 2, nsrc) = xup(1)
        xsrc(2, 2, nsrc) = xup(2)
        xsrc(3, 2, nsrc) = xup(3)
      end if      
      
      
    else if ( lquad(11, iq)>0 ) then
      do j = 1, lquad(11, iq)
        node = lquad(j, iq)
        if ( acnod(node) ) then
          if ( (xmesh(1, node)<xreg(1, 2)) .and.  &
               (xmesh(2, node)<xreg(2, 2)) .and.  &
               (xmesh(3, node)<xreg(3, 2)) .and.  &
               (xmesh(1, node)>xreg(1, 1)) .and.  &
               (xmesh(2, node)>xreg(2, 1)) .and.  &
               (xmesh(3, node)>xreg(3, 1)) ) then
            npts = npts + 1
            if ( npts>MAXLSX ) then
              write (IOW, 99002) MAXLSX
              stop
            end if
            listn(npts) = node
          end if
        end if
      end do
    end if
    if ( k>=nsrc ) then


      !     Sort nodes according to distance to given point
      !     (this is the HEAPSORT algorithm from Numerical Recepies)

      do k = 1, npts
        node = listn(k)
        distn(k) = (xmesh(1, node) - x(1)) **2 + (xmesh(2, node) - x(2))**2 + (xmesh(3, node) - x(3))**2
      end do

      if ( npts<=1 ) return

      l = npts/2 + 1
      ir = npts
      exit
    end if
  end do
100 if ( l>1 ) then
    l = l - 1
    d = distn(l)
    lst = listn(l)
  else
    d = distn(ir)
    lst = listn(ir)
    distn(ir) = distn(1)
    listn(ir) = listn(1)
    ir = ir - 1
    if ( ir==1 ) then
      distn(1) = d
      listn(1) = lst
      return
    end if
  end if
  i = l
  j = l + l
  do while ( .true. )
    if ( j<=ir ) then
      if ( j<ir ) then
        if ( distn(j)<distn(j + 1) ) j = j + 1
      end if
      if ( d<distn(j) ) then
        distn(i) = distn(j)
        listn(i) = listn(j)
        i = j
        j = j + j
      else
        j = ir + 1
      end if
      cycle
    end if
    distn(i) = d
    listn(i) = lst
    goto 100
  end do

99001 format ('  **** ERROR DETECTED IN SUBROUTINE QSCHRG_3D **** ', /,  &
           '    Insufficient storage to assemble list of quads ',  &
           '    Parameter MAXSRC must be increased. ', /,  &
           '    Its current value is  ', I4)
99002 format ( // '  **** ERROR DETECTED IN SUBROUTINE QSCHRG_3D **** '/  &
           '    Insufficient storage to assemble list of nodes '/  &
           '    Parameter MAXLSX must be increased. '/ &
           '    Its current value is  ', I4)
  
end subroutine qschrg_3d


!==============================FUNCTION LAP0 ==============================
function lap0_3d(xqlo1, xqlo2, xqlo3, xqup1, xqup2, xqup3, xreg)
  use Types
  implicit none

  real( prec ), intent( in )    :: xqlo1                      
  real( prec ), intent( in )    :: xqlo2                      
  real( prec ), intent( in )    :: xqlo3
  real( prec ), intent( inout ) :: xqup1                      
  real( prec ), intent( inout ) :: xqup2                      
  real( prec ), intent( inout ) :: xqup3 
  real( prec ), intent( in )    :: xreg(3, 2)                 
  logical                       :: lap0_3d

  !     Function to determine whether any part of search region XREG lies within a quad.

  !     XQLO(I)     Ith coord of lower left corner of quad
  !     XQUP(I)     Ith coord of upper right corner of quad
  !     XREG(I,1)   Ith coord of lower left corner of search region
  !     XREG(I,2)   Ith coord of upper right corner of search region

  lap0_3d = .true.
  if ( xreg(1, 2)<xqlo1 ) lap0_3d = .false.
  if ( xreg(1, 1)>xqup1 ) lap0_3d = .false.
  if ( xreg(2, 1)>xqup2 ) lap0_3d = .false.
  if ( xreg(2, 2)<xqlo2 ) lap0_3d = .false.
  if ( xreg(3, 1)>xqup3 ) lap0_3d = .false.
  if ( xreg(3, 2)<xqlo3 ) lap0_3d = .false.

end function lap0_3d


!==============================SUBROUTINE FNDNPT ===========================
subroutine fndnpt_3d(x, xmesh, maxx, lquad, MAXQAD, xsq, npts, listn,  &
     distn, MAXLSX, lstsrc, xsrc, MAXSRC)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: maxx                         
  integer, intent( in )         :: MAXQAD                       
  integer, intent( out )        :: npts                         
  integer, intent( in )         :: MAXLSX                       
  integer, intent( in )         :: MAXSRC                       
  integer, intent( in )         :: lquad(11,MAXQAD)             
  integer, intent( out )        :: listn(MAXLSX)                
  integer, intent( out )        :: lstsrc(MAXSRC)               
  real( prec ), intent( inout ) :: x(3)                         
  real( prec ), intent( in )    :: xmesh(3, maxx)               
  real( prec ), intent( in )    :: xsq(3, 2)                    
  real( prec ), intent( out )   :: distn(MAXLSX)                
  real( prec ), intent( out )   :: xsrc(3, 2, MAXSRC)           

  ! Local Variables
  real( prec ) :: d, xcen, xlo, xup
  integer      :: i, iq, ir, istrt, j, k, l, lst,  node, nsrc

  dimension xup(3), xlo(3), xcen(3)

  !     Subroutine to return a list of points near a given point X

  !     X(I)       Ith coord of given point
  !     LQUAD      Quadtree array (described in subroutine ADQUAD)
  !     MAXQAD     Max dimension of quadtree array
  !     XSQ        Coords of superquad

  !     Go down the quadtree and look for the first empty quad we find

  iq = 1
  istrt = 1
  xlo(1:3) = xsq(1:3, 1)
  xup(1:3) = xsq(1:3, 2)

  do while ( .true. )


    !     --  Center of current quad
    xcen(1:3) = 0.5D0*(xup(1:3) + xlo(1:3))
    if ( lquad(11, iq)<0 ) then
      !     --    This is the quad to extract points from
      istrt = iq
      xsrc(1:3, 1, 1) = xlo(1:3)
      xsrc(1:3, 2, 1) = xup(1:3)
      !     --    If quad IQ is full, goto next branch of tree
      if ( x(3)<= xcen(3) ) then
        if ( x(1)<=xcen(1) ) then
          if ( x(2)<=xcen(2) ) then
            iq = lquad(1, iq)
            xup(1) = xcen(1)
            xup(2) = xcen(2)
            xup(3) = xcen(3)
          else
            iq = lquad(3, iq)
            xlo(2) = xcen(2)
            xup(1) = xcen(1)
            xup(3) = xcen(3)
          end if
        else
          if ( x(2)<=xcen(2) ) then
            iq = lquad(2, iq)
            xlo(1) = xcen(1)
            xup(2) = xcen(2)
            xup(3) = xcen(3)
          else
            iq = lquad(4, iq)
            xlo(1) = xcen(1)
            xlo(2) = xcen(2)
            xup(3) = xcen(3)
          end if
        endif
      else
        if ( x(1)<=xcen(1) ) then
          if ( x(2)<=xcen(2) ) then
            iq = lquad(5, iq)
            xup(1) = xcen(1)
            xup(2) = xcen(2)
            xlo(3) = xcen(3)
          else
            iq = lquad(7, iq)
            xlo(2) = xcen(2)
            xup(1) = xcen(1)
            xlo(3) = xcen(3)
          end if
        else
          if ( x(2)<=xcen(2) ) then
            iq = lquad(6, iq)
            xlo(1) = xcen(1)
            xup(2) = xcen(2)
            xlo(3) = xcen(3)
          else
            iq = lquad(8, iq)
            xlo(1) = xcen(1)
            xlo(2) = xcen(2)
            xlo(3) = xcen(3)
          end if
        endif
      endif
      
      cycle
    end if

    !     Get all the points in the chosen quad

    npts = 0
    nsrc = 1
    lstsrc(1) = istrt
    k = 0
    exit
  end do
  do while ( .true. )
    k = k + 1
    iq = lstsrc(k)
    xlo(1:3) = xsrc(1:3, 1, k)
    xup(1:3) = xsrc(1:3, 2, k)
    xcen(1:3) = 0.5D0*(xup(1:3) + xlo(1:3))
    if ( lquad(11, iq)<0 ) then
      !     --      If quad is full, add its subdivisions to the list of quads to be searched
      if ( nsrc + 1>MAXSRC ) then
        write (IOW, 99001) MAXSRC
        stop
      end if
      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(1, iq)
      xsrc(1, 1, nsrc) = xlo(1)
      xsrc(2, 1, nsrc) = xlo(2)
      xsrc(3, 1, nsrc) = xlo(3)
      xsrc(1, 2, nsrc) = xcen(1)
      xsrc(2, 2, nsrc) = xcen(2)
      xsrc(3, 2, nsrc) = xcen(3)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(2, iq)
      xsrc(1, 1, nsrc) = xcen(1)
      xsrc(2, 1, nsrc) = xlo(2)
      xsrc(3, 1, nsrc) = xlo(3)
      xsrc(1, 2, nsrc) = xup(1)
      xsrc(2, 2, nsrc) = xcen(2)
      xsrc(3, 2, nsrc) = xcen(3)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(3, iq)
      xsrc(1, 1, nsrc) = xlo(1)
      xsrc(2, 1, nsrc) = xcen(2)
      xsrc(3, 1, nsrc) = xlo(3)
      xsrc(1, 2, nsrc) = xcen(1)
      xsrc(2, 2, nsrc) = xup(2)
      xsrc(3, 1, nsrc) = xcen(3)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(4, iq)
      xsrc(1, 1, nsrc) = xcen(1)
      xsrc(2, 1, nsrc) = xcen(2)
      xsrc(3, 1, nsrc) = xlo(3)
      xsrc(1, 2, nsrc) = xup(1)
      xsrc(2, 2, nsrc) = xup(2)
      xsrc(3, 2, nsrc) = xcen(3)
      
      
      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(5, iq)
      xsrc(1, 1, nsrc) = xlo(1)
      xsrc(2, 1, nsrc) = xlo(2)
      xsrc(3, 1, nsrc) = xcen(3)
      xsrc(1, 2, nsrc) = xcen(1)
      xsrc(2, 2, nsrc) = xcen(2)
      xsrc(3, 2, nsrc) = xup(3)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(6, iq)
      xsrc(1, 1, nsrc) = xcen(1)
      xsrc(2, 1, nsrc) = xlo(2)
      xsrc(3, 1, nsrc) = xcen(3)
      xsrc(1, 2, nsrc) = xup(1)
      xsrc(2, 2, nsrc) = xcen(2)
      xsrc(3, 2, nsrc) = xup(3)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(7, iq)
      xsrc(1, 1, nsrc) = xlo(1)
      xsrc(2, 1, nsrc) = xcen(2)
      xsrc(3, 1, nsrc) = xcen(3)
      xsrc(1, 2, nsrc) = xcen(1)
      xsrc(2, 2, nsrc) = xup(2)
      xsrc(3, 1, nsrc) = xup(3)

      nsrc = nsrc + 1
      lstsrc(nsrc) = lquad(8, iq)
      xsrc(1, 1, nsrc) = xcen(1)
      xsrc(2, 1, nsrc) = xcen(2)
      xsrc(3, 1, nsrc) = xcen(3)
      xsrc(1, 2, nsrc) = xup(1)
      xsrc(2, 2, nsrc) = xup(2)
      xsrc(3, 2, nsrc) = xup(3)
            
      
      

    else if ( lquad(11, iq)>0 ) then
      do j = 1, lquad(11, iq)
        node = lquad(j, iq)
        npts = npts + 1
        if ( npts>MAXLSX ) then
          write (IOW, 99002) MAXLSX
          stop
        end if
        listn(npts) = node
      end do
    end if
    if ( k>=nsrc ) then


      !     Sort nodes according to distance to given point
      !     (this is the HEAPSORT algorithm from Numerical Recepies)

      do k = 1, npts
        node = listn(k)
        distn(k) = (xmesh(1, node) - x(1)) **2 + (xmesh(2, node) - x(2))**2 + (xmesh(3, node) - x(3))**2
      end do

      if ( npts<=1 ) then
        node = listn(1)
        return
      end if

      l = npts/2 + 1
      ir = npts
      exit
    end if
  end do
100 if ( l>1 ) then
    l = l - 1
    d = distn(l)
    lst = listn(l)
  else
    d = distn(ir)
    lst = listn(ir)
    distn(ir) = distn(1)
    listn(ir) = listn(1)
    ir = ir - 1
    if ( ir==1 ) then
      distn(1) = d
      listn(1) = lst
      return
    end if
  end if
  i = l
  j = l + l
  do while ( .true. )
    if ( j<=ir ) then
      if ( j<ir ) then
        if ( distn(j)<distn(j + 1) ) j = j + 1
      end if
      if ( d<distn(j) ) then
        distn(i) = distn(j)
        listn(i) = listn(j)
        i = j
        j = j + j
      else
        j = ir + 1
      end if
      cycle
    end if
    distn(i) = d
    listn(i) = lst
    goto 100
  end do

99001 format ('  **** ERROR DETECTED IN SUBROUTINE FNDNPT_3D **** '/  &
           '    Insufficient storage to assemble list of quads '/  &
           '    Parameter MAXSRC must be increased. '/ &
           '    Its current value is  ', I4)
99002 format ( // '  **** ERROR DETECTED IN SUBROUTINE FNDNPT_3D **** '/  &
           '    Insufficient storage to assemble list of nodes '/  &
           '    Parameter MAXLSX must be increased. '/ &
           '    Its current value is  ', I4)
  
end subroutine fndnpt_3d

!====================SUBROUTINE SET_NOD2LMN ======================
subroutine set_nod2lmn(nops, nelm,lmn_start, lmn_stop, MAXCON, icon, iep, ideg, nod2lmn,MAXDEG)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )    :: nops                               
  integer, intent( in )    :: nelm
  integer, intent( in )    :: lmn_start
  integer, intent( in )    :: lmn_stop                               
  integer, intent( in )    :: MAXCON
  integer, intent( in )    :: MAXDEG                             
  integer, intent( in )    :: icon(MAXCON)                       
  integer, intent( inout ) :: iep(7, nelm)                           
  integer, intent( out )   :: ideg(nops)                       
  integer, intent( out )   :: nod2lmn(MAXDEG,nops) 

  ! Local Variables
  integer :: i, j, l, lmn, n, node

  nod2lmn = 0
  ideg = 0
  !     Loop over all elements
  do lmn = lmn_start, lmn_stop

    !     Add current element to node-element map for all nodes on the element

    do i = 1, iep(3, lmn)
      node = icon(i + iep(2, lmn) - 1)
      ideg(node) = ideg(node) + 1
      if ( ideg(node)>MAXDEG ) then
        write (IOW, 99001) MAXDEG
        stop
      end if
      nod2lmn(ideg(node), node) = lmn
    end do
  end do

continue

99001 format (/, /, '  ERROR DETECTED IN SUBROUTINE SET_NOD2LMN  ',  &
       '  PARAMETER MAXDEG MUST BE GREATER THAN ', I4)

end subroutine set_nod2lmn


!====================SUBROUTINE SET_NBRLMN_3d ======================

subroutine set_nbrlmn_3d(nops, nelm,lmn_start, lmn_stop, MAXCON, icon, iep, ideg, nod2lmn,MAXDEG,nbrlmn,MAXNBR)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )    :: nops                               
  integer, intent( in )    :: nelm
  integer, intent( in )    :: lmn_start
  integer, intent( in )    :: lmn_stop                               
  integer, intent( in )    :: MAXCON 
  integer, intent( in )    :: MAXDEG
  integer, intent( in )    :: MAXNBR                            
  integer, intent( in )    :: icon(MAXCON)                       
  integer, intent( in )    :: iep(7, nelm)                           
  integer, intent( in )    :: ideg(nops)                       
  integer, intent( in )    :: nod2lmn(MAXDEG,nops) 
  integer, intent( out )   :: nbrlmn(MAXNBR,nelm)
!  Function to compute neigbor list for elements in a 3D mesh.
  
  integer :: lmn,nface1,face1,node1,node2,node3,count,j,lmn2,k
  integer :: nelnodes1,nfacenodes
  integer :: list(8)
  
  nbrlmn = 0
  do lmn = lmn_start,lmn_stop
     nelnodes1 = iep(3,lmn)
     nface1 = 6
     if (nelnodes1 == 4.or.nelnodes1==10) nface1 = 4
     do face1 = 1,nface1
       if (nbrlmn(face1,lmn)==0) then
         call facenodes_3d(nelnodes1,face1,list,nfacenodes)
         node1 = icon(iep(2,lmn)+list(1)-1)
         node2 = icon(iep(2,lmn)+list(2)-1)
         node3 = icon(iep(2,lmn)+list(3)-1)
         do j = 1,ideg(node1)  ! Loop over elements connected to node1
           count = 1
           lmn2 = nod2lmn(j,node1)
           if (lmn2==lmn) cycle
           do k = 1,iep(3,lmn2)  ! Look for at least 3 shared nodes
              if (icon(iep(2,lmn2)+k-1) == node2) count = count + 1
              if (icon(iep(2,lmn2)+k-1) == node3) count = count + 1           
              if (count==3) then
                nbrlmn(face1,lmn) = lmn2
                exit
              endif
           end do
           if (count==3) exit
         end do
       endif
     end do
  end do
  
  
  return
  end subroutine set_nbrlmn_3d
  