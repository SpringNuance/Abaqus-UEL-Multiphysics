!
!     Subroutines to assemble element level matrices for FEA analysis

!===========================SUBROUTINE ELSTIF ===================
subroutine elstif(lmn, iep, numnod, nodpn, xloc, maxx, duloc,  &
     utloc, maxu, stnloc, maxs, eprop, MAXPRP, svart,  &
     svaru, MAXVAR, stif, resid, MAXSTF,ifail)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                             
  integer, intent( inout )      :: iep                             
  integer, intent( inout )      :: numnod                          
  integer, intent( in )         :: maxx                            
  integer, intent( in )         :: maxu                            
  integer, intent( in )         :: maxs                            
  integer, intent( in )         :: MAXPRP                          
  integer, intent( in )         :: MAXVAR                          
  integer, intent( in )         :: MAXSTF                          
  integer, intent( inout )      :: ifail
  integer, intent( inout )      :: nodpn(4, numnod)                
  real( prec ), intent( inout ) :: xloc(maxx)                      
  real( prec ), intent( inout ) :: duloc(maxu)                     
  real( prec ), intent( inout ) :: utloc(maxu)                     
  real( prec ), intent( inout ) :: stnloc(maxs)                    
  real( prec ), intent( inout ) :: eprop(MAXPRP)                   
  real( prec ), intent( in )    :: svart(MAXVAR)                   
  real( prec ), intent( out )   :: svaru(MAXVAR)                   
  real( prec ), intent( inout ) :: stif(MAXSTF, MAXSTF)            
  real( prec ), intent( inout ) :: resid(MAXSTF)                   


  !     Element stiffness routine

  !     LMN         Element number
  !     IEP         Element property flag.  Used to flag element types
  !     NUMNOD      No. nodes on the element
  !     NODPN(I,J)  Nodal property flag.  NODPN(1,J)   User flag for Jth node on element
  !     NODPN(2,J)   No. coordinates for the node
  !     NODPN(3,J)   No. DOF for the node
  !     NODPN(4,J)   No. state vars/props for the node
  !     XLOC(I)     Array of nodal coords
  !     MAXX        Total no. coords
  !     DULOC(I)    Array of increment in nodal DOF
  !     UTLOC(I)    Array of total accumulated DOF
  !     MAXU        Total no. DOF
  !     STNLOC(I)   Ith nodal state var
  !     STNLMP(I)   Ith lumped nodal state var

  !     EPROP(I)    Ith user defined material or element property
  !     MAXPRP      Total no. element properties
  !     SVART(I)    Ith state variable for the element at the start of the step
  !     SVARU(I)    Ith state variable for the element at the end of the step.  Must be
  !     updated by ELSTIF
  !     MAXVAR      Total no. state variables
  !     STIF(I,J)   Element stiffness matrix
  !     RESID(J)    Element residual
  !     ifail       Set to 1 if unable to compute any element stiffness (
  !                 will force timestep cutback )

  !     New element types should be added below
  !     2D solid elements should have 0<iep<100
  !     3D solid elements should have 1000<iep<2000
  !     Other element types (contact, cohesive zones, etc) should have numbers outside these ranges

  stif = 0.d0
  resid = 0.d0

   ifail = 0


  if ( iep == 1001 ) then              ! Basic fully integrated 3D linear elastic element

         call elstif_linelast_3Dbasic(lmn,iep,numnod, eprop, MAXPRP, xloc, utloc, duloc, svart,  &
             svaru, MAXVAR, stif, resid, MAXSTF)



  
  else 

    write (IOW, 99001) iep
    stop

  end if

99001 format ( // ' **** ERROR DETECTED IN SUBROUTINE ELSTIF ****'/  &
       '   Invalid element type was specified '/, &
       '   Current element types are: '/  &
       '     IEP=1001     Basic fully integrated 3D linear elastic element       '/&
       '    Subroutine called with IEP = ', I10)

end subroutine elstif

!==========================SUBROUTINE DLOAD ================================
subroutine dload(lmn, iep, numnod, nodpn, eprop, MAXPRP, xloc,  &
     maxx, iface,iopt, dlprop,ndlprp, resid, MAXSTF)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                        
  integer, intent( inout )      :: iep                        
  integer, intent( inout )      :: numnod                     
  integer, intent( in )         :: MAXPRP                     
  integer, intent( in )         :: maxx                       
  integer, intent( inout )      :: iface
  integer, intent( in )         :: iopt                        
  integer, intent( inout )      :: ndlprp                       
  integer, intent( in )         :: MAXSTF                     
  integer, intent( inout )      :: nodpn(4, numnod)           
  real( prec ), intent( inout ) :: eprop(MAXPRP)              
  real( prec ), intent( inout ) :: xloc(maxx)
  real( prec ), intent (in )    :: dlprop(ndlprp)                 
  real( prec ), intent( inout ) :: resid(MAXSTF)              

  

  !     Subroutine to compute contribution to residual due to
  !     distributed traction acting on face IFACE of element LMN

  !     LMN          Element number
  !     IEP          User defined element property flag
  !     NUMNOD       No. nodes on the element
  !     NODPN        Nodal pointer array
  !     NODPN(1,I)  User defined flag for Ith node on element
  !     NODPN(2,I)  No. coords associated with Ith node on element
  !     NODPN(3,I)  No. DOF associated with Ith node on element
  !     XLOC(J)      Coordinate array
  !     MAXX         Dimension of coord array
  !     IFACE        Face number of element subjeted to traction
  !     IOPT         Flag controlling nature of tractions
  !                  IOPT=1   tx,ty,(tz) supplied directly in array dlprop
  !                  IOPT=2   Apply pressure normal to element face.  Value given in dlprop
  !                  IOPT=3   Call user subroutine btract to compute tractions.
  !     DLPROP       List of user-supplied properties controlling value of traction
  !     NDLPRP       Number of user supplied properties
  !     RESID(I)     Residual (must be assembled and returned by the routine)


  if ( iep == 65 ) then

     call dload_2d(lmn, iep, numnod, nodpn, eprop, MAXPRP, xloc,  &
     maxx, iface,iopt, dlprop,ndlprp, resid, MAXSTF)

  else if (iep == 1001) then

      call dload_3d(lmn, iep, numnod, nodpn, eprop, MAXPRP, xloc,  &
     maxx, iface,iopt, dlprop,ndlprp, resid, MAXSTF)

  
  else
 
      write(IOW,99001) iep
	  stop

  end if

  return


99001 format ( // ' **** ERROR DETECTED IN SUBROUTINE ELSTIF ****'/  &
       '   Invalid element type was specified '/, &
       '   Current element types are: '/  &
       '     IEP=1001     Basic fully integrated 3D linear elastic element       '/&
       '    Subroutine called with IEP = ', I10)

end subroutine dload

!===========================SUBROUTINE ELSTAT ===================
subroutine elstat(lmn, iep, numnod, nodpn, xloc, maxx, duloc,  &
     utloc, maxu, eprop, MAXPRP, svart, svaru, MAXVAR, stat, nstat)
  use Types
  implicit none

  integer, intent( inout )      :: lmn                           
  integer, intent( inout )      :: iep                           
  integer, intent( in )         :: numnod                        
  integer, intent( inout )      :: maxx                          
  integer, intent( inout )      :: maxu                          
  integer, intent( inout )      :: MAXPRP                        
  integer, intent( inout )      :: MAXVAR                        
  integer, intent( in )         :: nstat                         
  integer, intent( inout )      :: nodpn(4, numnod)              
  real( prec ), intent( inout ) :: xloc(maxx)                    
  real( prec ), intent( inout ) :: duloc(maxu)                   
  real( prec ), intent( inout ) :: utloc(maxu)                   
  real( prec ), intent( inout ) :: eprop(MAXPRP)                 
  real( prec ), intent( in )    :: svart(MAXVAR)                 
  real( prec ), intent( inout ) :: svaru(MAXVAR)                 
  real( prec ), intent( out )   :: stat(nstat, numnod)           

 
  !     Routine to assemble element contribution to projected nodal state.

  !     LMN         Element number
  !     IEP         Element property flag.  Used to flag element types
  !     NUMNOD      No. nodes on the element
  !     NODPN(I,J)  Nodal property flag.  NDOPN(1,J)   User flag for Jth node on element
  !     NODPN(2,J)   No. coordinates for the node
  !     NODPN(3,J)   No. DOF for the node
  !     XLOC(I)     Array of nodal coords
  !     MAXX        Total no. coords
  !     DULOC(I)    Array of increment in nodal DOF
  !     UTLOC(I)    Array of total accumulated DOF
  !     MAXU        Total no. DOF

  !     EPROP(I)    Ith user defined material or element property
  !     MAXPRP      Total no. element properties
  !     SVART(I)    Ith state variable for the element at the start of the step
  !     SVARU(I)    Ith state variable for the element at the end of the step.  Must be
  !     updated by ELSTIF
  !     MAXVAR      Total no. state variables
  !     STAT(I,N)   Ith state at Nth node on element
  !     NSTAT       No. states to be computed

 
  !     New element types should be added below
  !     2D solid elements should have 0<iep<100
  !     3D solid elements should have 1000<iep<2000
  !     Other element types (contact, cohesive zones, etc) should have numbers outside these ranges


 

  if ( iep == 1001 ) then              ! Basic fully integrated linear elastic element

         call state_linelast_3dbasic(lmn,iep,numnod, eprop, MAXPRP, xloc, utloc, duloc, svart,  &
     svaru, MAXVAR, stat, nstat)


  else 
 
    stat = 0.d0

  end if

  return

end subroutine elstat


!===========================SUBROUTINE EL_MEAN_STATE ===================
subroutine el_mean_state(lmn, iep, numnod, nodpn, xloc, maxx, duloc,  &
     utloc, maxu, eprop, MAXPRP, svart, svaru, MAXVAR, stat, nstat,mean_state_el,el_vol,nmstat)
  use Types
  implicit none

  integer, intent( inout )      :: lmn                           
  integer, intent( inout )      :: iep                           
  integer, intent( in )         :: numnod                        
  integer, intent( inout )      :: maxx                          
  integer, intent( inout )      :: maxu                          
  integer, intent( inout )      :: MAXPRP                        
  integer, intent( inout )      :: MAXVAR                        
  integer, intent( in )         :: nstat  
  integer, intent( in )         :: nmstat                       
  integer, intent( inout )      :: nodpn(4, numnod)              
  real( prec ), intent( inout ) :: xloc(maxx)                    
  real( prec ), intent( inout ) :: duloc(maxu)                   
  real( prec ), intent( inout ) :: utloc(maxu)                   
  real( prec ), intent( inout ) :: eprop(MAXPRP)                 
  real( prec ), intent( in )    :: svart(MAXVAR)                 
  real( prec ), intent( inout ) :: svaru(MAXVAR)                 
  real( prec ), intent( inout )   :: stat(nstat, numnod)
  real( prec ), intent( inout )   :: mean_state_el(nmstat)
  real( prec ), intent( inout )   :: el_vol           

 
  !     Routine to assemble element contribution to projected nodal state.

  !     LMN         Element number
  !     IEP         Element property flag.  Used to flag element types
  !     NUMNOD      No. nodes on the element
  !     NODPN(I,J)  Nodal property flag.  NDOPN(1,J)   User flag for Jth node on element
  !     NODPN(2,J)   No. coordinates for the node
  !     NODPN(3,J)   No. DOF for the node
  !     XLOC(I)     Array of nodal coords
  !     MAXX        Total no. coords
  !     DULOC(I)    Array of increment in nodal DOF
  !     UTLOC(I)    Array of total accumulated DOF
  !     MAXU        Total no. DOF

  !     EPROP(I)    Ith user defined material or element property
  !     MAXPRP      Total no. element properties
  !     SVART(I)    Ith state variable for the element at the start of the step
  !     SVARU(I)    Ith state variable for the element at the end of the step.  Must be
  !     updated by ELSTIF
  !     MAXVAR      Total no. state variables
  !     STAT(I,N)   Ith state at Nth node on element
  !     NSTAT       No. states to be computed

 
  !     New element types should be added below
  !     2D solid elements should have 0<iep<100
  !     3D solid elements should have 1000<iep<2000
  !     Other element types (contact, cohesive zones, etc) should have numbers outside these ranges



 

  return

end subroutine el_mean_state




!=========================SUBROUTINE ELPROJ ====================
subroutine elproj(lmn, iep, numnod, nodpn, xloc, maxx, eprop,  &
     nprop, dmloc, MAXSTF)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                             
  integer, intent( inout )      :: iep                             
  integer, intent( in )         :: numnod                          
  integer, intent( inout )      :: maxx                            
  integer, intent( inout )      :: nprop                           
  integer, intent( in )         :: MAXSTF
  integer, intent( inout )      :: nodpn(2, numnod)                
  real( prec ), intent( in )    :: xloc(maxx)                      
  real( prec ), intent( inout ) :: eprop(nprop)                    
  real( prec ), intent( out )   :: dmloc(MAXSTF, MAXSTF)           

  ! Local Variables
  real( prec ) :: det, scal
  integer      :: ncoord, i, j, k, nintp, a,b

  real (prec)  ::  xi3(3,27), w3(27)
  real (prec)  ::  xi2(2,9), w2(9)
  real (prec)  ::  N3(20), dNdxi3(20,3)
  real (prec)  ::  N2(9), dNdxi2(9,2)
  real (prec)  ::  dxdxi(3,3),dtm


  !     Compute the element contribution to the state projection matrix

  !     LMN          Element number
  !     IEP          Flag identifying element type
  !     NUMNOD       No. nodes on the element
  !     NODPN(I,J)   Nodal property flag: NDOPN(1,J)   User flag for Jth node on element
  !     NODPN(2,J)   No. coordinates for the node
  !     XLOC(J)      Array of nodal coords, numbered such that
  !     XLOC(1) is first coord of first node, XLOC(2) is second coord of first node...
  !     XLOC(NCOOR+1) is first coord of 2nd node, etc.
  !     MAXX         Dimension of array XLOC
  !     EPROP        Element property array.
  !     NPROP        No. element properties
  !     DMLOC        Element mass matrix.  Must be computed and returned in this subroutine.

  dmloc = 0.D0

  ncoord = int(maxx/numnod)

  if ( ncoord==2 ) then


    if (numnod == 3) nintp = 4
    if (numnod == 4) nintp = 4
    if (numnod == 6) nintp = 7
    if (numnod == 8) nintp = 9
    if (numnod == 9) nintp = 9

     call intpts_2d(xi2,w2,numnod,nintp)

!     --  Loop over integration points
    do k = 1, nintp

 
      call dshape_2d(numnod,xi2(1,k),dNdxi2)

       do i = 1,2
         do j = 1,2
           dxdxi(i,j) = 0.
           do a = 1,numnod
              dxdxi(i,j) = dxdxi(i,j) + xloc(2*(a-1)+i)*dNdxi2(a,j)
            end do
         end do
       end do
 
       dtm = dxdxi(1,1)*dxdxi(2,2)-dxdxi(1,2)*dxdxi(2,1)

      call shape_2d(numnod,xi2(1,k),N2)


      do a = 1,numnod
	     do b = 1,numnod
		   dmloc(a,b) = dmloc(a,b) + N2(a)*N2(b)*dtm*w2(k)
		 end do
	  end do

    end do

  else if (ncoord==3) then

  
    if (numnod == 4) nintp = 4
    if (numnod == 10) nintp = 5
    if (numnod == 8) nintp = 27
    if (numnod == 20) nintp = 27

     call intpts_3d(xi3,w3,numnod,nintp)

!     --  Loop over integration points
    do k = 1, nintp

 
      call dshape_3d(numnod,xi3(1,k),dNdxi3)

       do i = 1,3
         do j = 1,3
           dxdxi(i,j) = 0.
           do a = 1,numnod
              dxdxi(i,j) = dxdxi(i,j) + xloc(3*(a-1)+i)*dNdxi3(a,j)
            end do
         end do
       end do
 
       dtm = dxdxi(1,1)*(dxdxi(2,2)*dxdxi(3,3)-dxdxi(3,2)*dxdxi(2,3)) &
	       - dxdxi(1,2)*(dxdxi(2,1)*dxdxi(3,3)-dxdxi(2,3)*dxdxi(3,1)) &
		   + dxdxi(1,3)*(dxdxi(2,1)*dxdxi(3,2)-dxdxi(3,1)*dxdxi(2,2))

      call shape_3d(numnod,xi3(1,k),N3)


      do a = 1,numnod
	     do b = 1,numnod
		   dmloc(a,b) = dmloc(a,b) + N3(a)*N3(b)*dtm*w3(k)
		 end do
	  end do

    end do

	return

  endif


  return

99001 format ( // ' *** ERROR DETECTED IN SUBROUTINE ELPROJ ***'/  &
       ' Element ', I4, ' has determinant ', D15.4)
end subroutine elproj

!
!=========================SUBROUTINE ELLMPROJ ====================
!
subroutine ellmproj(lmn, iep, numnod, nodpn, xloc, maxx, eprop,  &
     nprop, lproj, MAXSTF)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                             
  integer, intent( inout )      :: iep                             
  integer, intent( in )         :: numnod                          
  integer, intent( inout )      :: maxx                            
  integer, intent( inout )      :: nprop                           
  integer, intent( in )         :: MAXSTF
  integer, intent( inout )      :: nodpn(2, numnod)                
  real( prec ), intent( in )    :: xloc(maxx)                      
  real( prec ), intent( inout ) :: eprop(nprop)                    
  real( prec ), intent( out )   :: lproj(MAXSTF)           

  ! Local Variables
  real( prec ) :: det, scal, c
  integer      :: ncoord, i, j, k, nintp, a,b

  real (prec)  ::  xi3(3,27), w3(27)
  real (prec)  ::  xi2(2,9), w2(9)
  real (prec)  ::  N3(20), dNdxi3(20,3)
  real (prec)  ::  N2(9), dNdxi2(9,2)
  real (prec)  ::  dxdxi(3,3),dtm
  real (prec)  ::  dmloc(20,20)


  !     Compute the element contribution to the lumped state projection matrix

  !     LMN          Element number
  !     IEP          Flag identifying element type
  !     NUMNOD       No. nodes on the element
  !     NODPN(I,J)   Nodal property flag: NDOPN(1,J)   User flag for Jth node on element
  !     NODPN(2,J)   No. coordinates for the node
  !     XLOC(J)      Array of nodal coords, numbered such that
  !     XLOC(1) is first coord of first node, XLOC(2) is second coord of first node...
  !     XLOC(NCOOR+1) is first coord of 2nd node, etc.
  !     MAXX         Dimension of array XLOC
  !     EPROP        Element property array.
  !     NPROP        No. element properties
  !     DMLOC        Element mass matrix.  Must be computed and returned in this subroutine.

  dmloc = 0.D0
  lproj = 0.d0

  ncoord = int(maxx/numnod)

  if ( ncoord==2 ) then


    if (numnod == 3) nintp = 4
    if (numnod == 4) nintp = 4
    if (numnod == 6) nintp = 7
    if (numnod == 8) nintp = 9
    if (numnod == 9) nintp = 9

     call intpts_2d(xi2,w2,numnod,nintp)

!     --  Loop over integration points
    do k = 1, nintp

 
      call dshape_2d(numnod,xi2(1,k),dNdxi2)

       do i = 1,2
         do j = 1,2
           dxdxi(i,j) = 0.
           do a = 1,numnod
              dxdxi(i,j) = dxdxi(i,j) + xloc(2*(a-1)+i)*dNdxi2(a,j)
            end do
         end do
       end do
 
       dtm = dxdxi(1,1)*dxdxi(2,2)-dxdxi(1,2)*dxdxi(2,1)

      call shape_2d(numnod,xi2(1,k),N2)


      do a = 1,numnod
	     do b = 1,numnod
		   dmloc(a,b) = dmloc(a,b) + N2(a)*N2(b)*dtm*w2(k)
		 end do
	  end do

    end do

  else if (ncoord==3) then

  
    if (numnod == 4) nintp = 4
    if (numnod == 10) nintp = 5
    if (numnod == 8) nintp = 27
    if (numnod == 20) nintp = 27

     call intpts_3d(xi3,w3,numnod,nintp)

!     --  Loop over integration points
    do k = 1, nintp

 
      call dshape_3d(numnod,xi3(1,k),dNdxi3)

       do i = 1,3
         do j = 1,3
           dxdxi(i,j) = 0.
           do a = 1,numnod
              dxdxi(i,j) = dxdxi(i,j) + xloc(3*(a-1)+i)*dNdxi3(a,j)
            end do
         end do
       end do
 
       dtm = dxdxi(1,1)*(dxdxi(2,2)*dxdxi(3,3)-dxdxi(3,2)*dxdxi(2,3)) &
	       - dxdxi(1,2)*(dxdxi(2,1)*dxdxi(3,3)-dxdxi(2,3)*dxdxi(3,1)) &
		   + dxdxi(1,3)*(dxdxi(2,1)*dxdxi(3,2)-dxdxi(3,1)*dxdxi(2,2))

      call shape_3d(numnod,xi3(1,k),N3)


      do a = 1,numnod
	     do b = 1,numnod
		   dmloc(a,b) = dmloc(a,b) + N3(a)*N3(b)*dtm*w3(k)
		 end do
	  end do

    end do

  endif

!
!   projection matrix is lumped using row sum method
!
    do a = 1,numnod
	   c = 0.d0
	   do b = 1,numnod
	      c = c+dmloc(a,b)
	   end do
      lproj(a) = lproj(a) + c
	end do




  return

99001 format ( // ' *** ERROR DETECTED IN SUBROUTINE ELLMPROJ ***'/  &
       ' Element ', I4, ' has determinant ', D15.4)
end subroutine ellmproj

!===========================SUBROUTINE ELFORC ===================
subroutine elforc(lmn, iep, numnod, nodpn, xloc, maxx, duloc,  &
     utloc, maxu, stnloc, maxs, eprop, MAXPRP, svart,  &
     svaru, MAXVAR, resid, MAXFOR)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                             
  integer, intent( inout )      :: iep                             
  integer, intent( inout )      :: numnod                          
  integer, intent( in )         :: maxx                            
  integer, intent( in )         :: maxu                            
  integer, intent( in )         :: maxs                            
  integer, intent( in )         :: MAXPRP                          
  integer, intent( in )         :: MAXVAR                          
  integer, intent( in )         :: MAXFOR                          
  integer, intent( inout )      :: nodpn(4, numnod)                
  real( prec ), intent( inout ) :: xloc(maxx)                      
  real( prec ), intent( inout ) :: duloc(maxu)                     
  real( prec ), intent( inout ) :: utloc(maxu)                     
  real( prec ), intent( inout ) :: stnloc(maxs)                    
  real( prec ), intent( inout ) :: eprop(MAXPRP)                   
  real( prec ), intent( in )    :: svart(MAXVAR)                   
  real( prec ), intent( out )   :: svaru(MAXVAR)                            
  real( prec ), intent( inout ) :: resid(MAXFOR)                   


  !     Element force vector for explicit dynamics

  !     LMN         Element number
  !     IEP         Element property flag.  Used to flag element types
  !     NUMNOD      No. nodes on the element
  !     NODPN(I,J)  Nodal property flag.  NODPN(1,J)   User flag for Jth node on element
  !     NODPN(2,J)   No. coordinates for the node
  !     NODPN(3,J)   No. DOF for the node
  !     NODPN(4,J)   No. state vars/props for the node
  !     XLOC(I)     Array of nodal coords
  !     MAXX        Total no. coords
  !     DULOC(I)    Array of increment in nodal DOF
  !     UTLOC(I)    Array of total accumulated DOF
  !     MAXU        Total no. DOF
  !     STNLOC(I)   Ith nodal state var
  !     STNLMP(I)   Ith lumped nodal state var

  !     EPROP(I)    Ith user defined material or element property
  !     MAXPRP      Total no. element properties
  !     SVART(I)    Ith state variable for the element at the start of the step
  !     SVARU(I)    Ith state variable for the element at the end of the step.  Must be
  !     updated by ELSTIF
  !     MAXVAR      Total no. state variables
  !     RESID(J)    Element residual force vector

  !     New element types should be added below
  !     2D solid elements should have 0<iep<100
  !     3D solid elements should have 1000<iep<2000
  !     Other element types (contact, cohesive zones, etc) should have numbers outside these ranges

  resid = 0.d0



  

  if ( iep == 1001 ) then              ! Basic fully integrated 3D linear elastic element

         call elforc_linelast_3Dbasic(lmn,iep,numnod, eprop, MAXPRP, xloc, utloc, duloc, svart,  &
             svaru, MAXVAR, resid, MAXFOR)

  else 

    write (IOW, 99001) iep
    stop

  end if

99001 format ( // ' **** ERROR DETECTED IN SUBROUTINE ELSTIF ****'/  &
       '   Invalid element type was specified '/, &
       '   Current element types are: '/  &
       '     IEP=1        Simple constant strain triangle elastic element '/  &
       '     IEP=1001     Basic fully integrated 3D linear elastic element       '/&
       '    Subroutine called with IEP = ', I10)

end subroutine elforc

!================================ SUBROUTINE ELMASS ======================

subroutine elmass(lmn, iep, numnod, nodpn, xloc, maxx, duloc,  &
     utloc, maxu, stnloc, maxs, density, eprop, MAXPRP, svart,  &
     svaru, MAXVAR, lumpedmass, MAXM)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                             
  integer, intent( inout )      :: iep                             
  integer, intent( inout )      :: numnod                          
  integer, intent( in )         :: maxx                            
  integer, intent( in )         :: maxu                            
  integer, intent( in )         :: maxs                            
  integer, intent( in )         :: MAXPRP                          
  integer, intent( in )         :: MAXVAR                                                
  integer, intent( in )         :: MAXM
  integer, intent( inout )      :: nodpn(4, numnod)                
  real( prec ), intent( inout ) :: xloc(maxx)                      
  real( prec ), intent( inout ) :: duloc(maxu)                     
  real( prec ), intent( inout ) :: utloc(maxu)                     
  real( prec ), intent( inout ) :: stnloc(maxs)
  real( prec ), intent( in )    :: density                    
  real( prec ), intent( inout ) :: eprop(MAXPRP)                   
  real( prec ), intent( in )    :: svart(MAXVAR)                   
  real( prec ), intent( in )    :: svaru(MAXVAR)                   
  real( prec ), intent( inout ) :: lumpedmass(MAXM)                           


  !     Element lumped mass matrix

  !     LMN         Element number
  !     IEP         Element property flag.  Used to flag element types
  !     NUMNOD      No. nodes on the element
  !     NODPN(I,J)  Nodal property flag.  NODPN(1,J)   User flag for Jth node on element
  !     NODPN(2,J)   No. coordinates for the node
  !     NODPN(3,J)   No. DOF for the node
  !     NODPN(4,J)   No. state vars/props for the node
  !     XLOC(I)     Array of nodal coords
  !     MAXX        Total no. coords
  !     DULOC(I)    Array of increment in nodal DOF
  !     UTLOC(I)    Array of total accumulated DOF
  !     MAXU        Total no. DOF
  !     STNLOC(I)   Ith nodal state var
  !     STNLMP(I)   Ith lumped nodal state var

  !     EPROP(I)    Ith user defined material or element property
  !     MAXPRP      Total no. element properties
  !     SVART(I)    Ith state variable for the element at the start of the step
  !     SVARU(I)    Ith state variable for the element at the end of the step.
  !     MAXVAR      Total no. state variables
  !     DMLOC(I)    Element lumped mass matrix

  !     New element types should be added below
  !     2D solid elements should have 0<iep<100
  !     3D solid elements should have 1000<iep<2000
  !     Other element types (plates, shells, cohesive zones, etc) should have numbers outside these ranges

  ! Local Variables
  real( prec ) :: det, scal, c
  integer      :: ncoord, i, j, k, nintp, a,b, col

  real (prec)  ::  xi3(3,27), w3(27)
  real (prec)  ::  xi2(2,9), w2(9)
  real (prec)  ::  N3(20), dNdxi3(20,3)
  real (prec)  ::  N2(9), dNdxi2(9,2)
  real (prec)  ::  dxdxi(3,3),dtm
  real (prec)  ::  dmloc(20,20)

 

  dmloc = 0.D0
  lumpedmass = 0.d0

  if ( 0<iep.and.iep<200 ) then


    if (numnod == 3) nintp = 4
    if (numnod == 4) nintp = 9
    if (numnod == 6) nintp = 7
    if (numnod == 8) nintp = 9
    if (numnod == 9) nintp = 9

     call intpts_2d(xi2,w2,numnod,nintp)

!     --  Loop over integration points
    do k = 1, nintp

 
      call dshape_2d(numnod,xi2(1,k),dNdxi2)

       do i = 1,2
         do j = 1,2
           dxdxi(i,j) = 0.
           do a = 1,numnod
              dxdxi(i,j) = dxdxi(i,j) + xloc(2*(a-1)+i)*dNdxi2(a,j)
            end do
         end do
       end do
 
       dtm = dxdxi(1,1)*dxdxi(2,2)-dxdxi(1,2)*dxdxi(2,1)

       call shape_2d(numnod,xi2(1,k),N2)


       do a = 1,numnod
	     do b = 1,numnod
		   dmloc(a,b) = dmloc(a,b) + density*N2(a)*N2(b)*dtm*w2(k)
		 end do
 	   end do
 
    end do



  else if (iep>1000.and.iep<2000) then

  
    if (numnod == 4) nintp = 4
    if (numnod == 10) nintp = 5
    if (numnod == 8) nintp = 27
    if (numnod == 20) nintp = 27

     call intpts_3d(xi3,w3,numnod,nintp)

!     --  Loop over integration points
    do k = 1, nintp

 
      call dshape_3d(numnod,xi3(1,k),dNdxi3)

       do i = 1,3
         do j = 1,3
           dxdxi(i,j) = 0.
           do a = 1,numnod
              dxdxi(i,j) = dxdxi(i,j) + xloc(3*(a-1)+i)*dNdxi3(a,j)
            end do
         end do
       end do
 
       dtm = dxdxi(1,1)*(dxdxi(2,2)*dxdxi(3,3)-dxdxi(3,2)*dxdxi(2,3)) &
	       - dxdxi(1,2)*(dxdxi(2,1)*dxdxi(3,3)-dxdxi(2,3)*dxdxi(3,1)) &
		   + dxdxi(1,3)*(dxdxi(2,1)*dxdxi(3,2)-dxdxi(3,1)*dxdxi(2,2))

      call shape_3d(numnod,xi3(1,k),N3)


      do a = 1,numnod
	     do b = 1,numnod
		   dmloc(a,b) = dmloc(a,b) + density*N3(a)*N3(b)*dtm*w3(k)
		 end do
	  end do

    end do

  endif
!
!   Mass is lumped using row sum method
!
   col = 0
    do a = 1,numnod
	   c = 0.d0
	   do b = 1,numnod
	      c = c+dmloc(a,b)
	   end do
	   do i = 1,nodpn(3,a)
	   	  col = col + 1
	      lumpedmass(col) = lumpedmass(col) + c
	   end do
	end do

	return
end subroutine elmass

!========================Subroutine intpts_1d ========================
subroutine intpts_1d(qgaus, wgaus, ngaus)
  use Types
  implicit none

  real( prec ), intent( out ) :: qgaus(10)
  real( prec ), intent( out ) :: wgaus(10)
  integer, intent( inout )    :: ngaus

  !     Subroutine to initialize Gaussian integration points and
  !     weights for 1D line integration.

  if ( ngaus > 10 ) ngaus = 10
  select case ( ngaus )
  case (2)
    qgaus(1) = .5773502691896257D+00
    qgaus(2) = -.5773502691896257D+00
    wgaus(1) = .1000000000000000D+01
    wgaus(2) = .1000000000000000D+01
    return
  case (3)
    qgaus(1) = .7745966692414834D+00
    qgaus(2) = .0000000000000000D+00
    qgaus(3) = -.7745966692414834D+00
    wgaus(1) = .5555555555555556D+00
    wgaus(2) = .8888888888888888D+00
    wgaus(3) = .5555555555555556D+00
    return
  case (4)
    qgaus(1) = .8611363115940526D+00
    qgaus(2) = .3399810435848563D+00
    qgaus(3) = -.3399810435848563D+00
    qgaus(4) = -.8611363115940526D+00
    wgaus(1) = .3478548451374538D+00
    wgaus(2) = .6521451548625461D+00
    wgaus(3) = .6521451548625461D+00
    wgaus(4) = .3478548451374538D+00
    return
  case (5)
    qgaus(1) = .9061798459386640D+00
    qgaus(2) = .5384693101056831D+00
    qgaus(3) = .0000000000000000D+00
    qgaus(4) = -.5384693101056831D+00
    qgaus(5) = -.9061798459386640D+00
    wgaus(1) = .2369268850561891D+00
    wgaus(2) = .4786286704993665D+00
    wgaus(3) = .5688888888888889D+00
    wgaus(4) = .4786286704993665D+00
    wgaus(5) = .2369268850561891D+00
    return
  case (6)
    qgaus(1) = .9324695142031521D+00
    qgaus(2) = .6612093864662645D+00
    qgaus(3) = .2386191860831969D+00
    qgaus(4) = -.2386191860831969D+00
    qgaus(5) = -.6612093864662645D+00
    qgaus(6) = -.9324695142031521D+00
    wgaus(1) = .1713244923791703D+00
    wgaus(2) = .3607615730481386D+00
    wgaus(3) = .4679139345726910D+00
    wgaus(4) = .4679139345726910D+00
    wgaus(5) = .3607615730481386D+00
    wgaus(6) = .1713244923791703D+00
    return
  case (7)
    ngaus = 8
  case (8)
  case (9)
    ngaus = 10
    goto 100
  case (10)
    goto 100
  case DEFAULT
    qgaus(1) = .0000000000000000D+00
    wgaus(1) = .2000000000000000D+01
    return
  end select

  qgaus(1) = .9602898564975362D+00
  qgaus(2) = .7966664774136267D+00
  qgaus(3) = .5255324099163290D+00
  qgaus(4) = .1834346424956498D+00
  qgaus(5) = -.1834346424956498D+00
  qgaus(6) = -.5255324099163290D+00
  qgaus(7) = -.7966664774136267D+00
  qgaus(8) = -.9602898564975362D+00
  wgaus(1) = .1012285362903762D+00
  wgaus(2) = .2223810344533745D+00
  wgaus(3) = .3137066458778873D+00
  wgaus(4) = .3626837833783620D+00
  wgaus(5) = .3626837833783620D+00
  wgaus(6) = .3137066458778873D+00
  wgaus(7) = .2223810344533745D+00
  wgaus(8) = .1012285362903762D+00
  return


100 qgaus(1) = .9739065285171717D+00
  qgaus(2) = .8650633666889845D+00
  qgaus(3) = .6794095682990244D+00
  qgaus(4) = .4333953941292472D+00
  qgaus(5) = .1488743389816312D+00
  qgaus(6) = -.1488743389816312D+00
  qgaus(7) = -.4333953941292472D+00
  qgaus(8) = -.6794095682990244D+00
  qgaus(9) = -.8650633666889845D+00
  qgaus(10) = -.9739065285171717D+00
  wgaus(1) = .6667134430868814D-01
  wgaus(2) = .1494513491505806D+00
  wgaus(3) = .2190863625159820D+00
  wgaus(4) = .2692667193099963D+00
  wgaus(5) = .2955242247147529D+00
  wgaus(6) = .2955242247147529D+00
  wgaus(7) = .2692667193099963D+00
  wgaus(8) = .2190863625159820D+00
  wgaus(9) = .1494513491505806D+00
  wgaus(10) = .6667134430868814D-01

  return
end subroutine intpts_1d



!==========================SUBROUTINE INTPTS_2d =================================
subroutine intpts_2d(pq, w, knode, NINTP)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )       :: knode
  integer, intent( in )       :: NINTP
  real( prec ), intent( out ) :: pq(2, 9)
  real( prec ), intent( out ) :: w(9)

  ! Local Variables
  real( prec ) cn, w1, w11, w12, w2, w22

  !     Subroutine to initialize integration points PQ and weights W
  !     NINTP = No. integration points
  !     KNODE = No. of nodes on element

  !     Shape functions for 2D axisymmetric or plane elements

  if ( knode>9) then
    write (IOW, 99001) knode
    stop
  end if
  if ( NINTP>9 ) then
    write (IOW, 99002) NINTP

    stop
  end if

  if ( NINTP==1 ) then

    !     One integration point

    !     ---   4 or 9 noded quad
    if ( knode==4 .or. knode==9 ) then
      pq(1, 1) = 0.D0
      pq(2, 1) = 0.D0
      w(1) = 4.D0
      !     ---   3 or 6 noded triangle
    else if ( knode==3 .or. knode==6 ) then
      pq(1, 1) = 1.D0/3.D0
      pq(2, 1) = 1.D0/3.D0
      w(1) = 1.D0/2.D0
    end if

  else if ( NINTP==3 ) then

    !     PQ integration points for triangle

    pq(1, 1) = 0.5D0
    pq(2, 1) = 0.5D0
    w(1) = 1.D0/6.D0
    pq(1, 2) = 0.D0
    pq(2, 2) = 0.5D0
    w(2) = w(1)
    pq(1, 3) = 0.5D0
    pq(2, 3) = 0.D0
    w(3) = w(1)


  else if ( NINTP==4 ) then

    if ( knode==4 .or. knode==9 ) then

      !     2X2 GAUSS INTEGRATION POINTS FOR QUADRILATERAL

      !     43
      !     12

      cn = 0.5773502691896260D0
      pq(1, 1) = -cn
      pq(1, 2) = cn
      pq(1, 3) = cn
      pq(1, 4) = -cn
      pq(2, 1) = -cn
      pq(2, 2) = -cn
      pq(2, 3) = cn
      pq(2, 4) = cn
      w(1) = 1.D0
      w(2) = 1.D0
      w(3) = 1.D0
      w(4) = 1.D0

    else if ( knode==3 .or. knode==6 ) then

      !     PQ integration points for triangle

      pq(1, 1) = 1.D0/3.D0
      pq(2, 1) = pq(1, 1)
      w(1) = -27.D0/96.D0
      pq(1, 2) = 0.6D0
      pq(2, 2) = 0.2D0
      w(2) = 25.D0/96.D0
      pq(1, 3) = 0.2D0
      pq(2, 3) = 0.6D0
      w(3) = w(2)
      pq(1, 4) = 0.2D0
      pq(2, 4) = 0.2D0
      w(4) = w(2)

    end if

  else if ( NINTP==7 ) then

     ! Quintic integration for triangle

	 pq(1,1) = 1.d0/3.d0
	 pq(2,1) = pq(1,1)
	 w(1) = 0.1125d0
	 pq(1,2) = 0.0597158717d0
	 pq(2,2) = 0.4701420641d0
	 w(2) = 0.0661970763d0
     pq(1,3) = pq(2,2)
	 pq(2,3) = pq(1,2)
	 w(3) = w(2)
	 pq(1,4) = pq(2,2)
	 pq(2,4) = pq(2,2)
	 w(4) = w(2)
	 pq(1,5) = 0.7974269853d0
	 pq(2,5) = 0.1012865073d0
	 w(5) = 0.0629695902d0
	 pq(1,6) = pq(2,5)
	 pq(2,6) = pq(1,5)
	 w(6) = w(5)
	 pq(1,7) = pq(2,5)
	 pq(2,7) = pq(2,5)
	 w(7) = w(5)

  else if ( NINTP==9 ) then

    !     3X3 GAUSS INTEGRATION POINTS IN PSI-ETA COORDINATES

    !     789
    !     456
    !     123

    cn = 0.7745966692414830D0
    pq(1, 1) = -cn
    pq(1, 2) = 0.D0
    pq(1, 3) = cn
    pq(1, 4) = -cn
    pq(1, 5) = 0.D0
    pq(1, 6) = cn
    pq(1, 7) = -cn
    pq(1, 8) = 0.D0
    pq(1, 9) = cn
    pq(2, 1) = -cn
    pq(2, 2) = -cn
    pq(2, 3) = -cn
    pq(2, 4) = 0.D0
    pq(2, 5) = 0.D0
    pq(2, 6) = 0.D0
    pq(2, 7) = cn
    pq(2, 8) = cn
    pq(2, 9) = cn
    w1 = 0.5555555555555560D0
    w2 = 0.8888888888888890D0
    w11 = w1*w1
    w12 = w1*w2
    w22 = w2*w2
    w(1) = w11
    w(2) = w12
    w(3) = w11
    w(4) = w12
    w(5) = w22
    w(6) = w12
    w(7) = w11
    w(8) = w12
    w(9) = w11

  end if

99001 format ( // ' *** ERROR ***'/  &
           '  Number of nodes on 2d element is greater ',  &
           'than parameter 9 '/'  No. nodes = ', I5)
99002 format ( // ' *** ERROR ***'/,  &
           '  Number of int. pts on element is greater ',  &
           'than 9 '/'  No. int pts. = ', I5)

end subroutine intpts_2d


!===========================SUBROUTINE SHAPE_1D ===============================
subroutine shape_1d(knode, pq, f)
  use Types
  use ParamIO 
  implicit none

  integer, intent( in )       :: knode
  real( prec ), intent( in )  :: pq
  real( prec ), intent( out ) :: f(*)
  
  if (knode==2) then
     f(1) = 0.5d0*(1.d0-pq)
     f(2) = 0.5d0*(1.d0+pq)
  else if (knode==3) then
      f(1) = -0.5*pq*(1.-pq)
      f(2) =  0.5*pq*(1.+pq)
      f(3) = (1.-pq)*(1.+pq)
  endif

  return
  
  end subroutine shape_1d
  
  
  !===========================SUBROUTINE DSHAPE_1D ===============================
subroutine dshape_1d(knode, pq, f)
  use Types
  use ParamIO 
  implicit none

  integer, intent( in )       :: knode
  real( prec ), intent( in )  :: pq
  real( prec ), intent( out ) :: f(*)
  
  if (knode==2) then
     f(1) = -0.5d0
     f(2) =  0.5d0
  else if (knode==3) then
      f(1) = -0.5+pq
      f(2) =  0.5+pq
      f(3) = -2.d0*pq
  endif

  return
  
  end subroutine dshape_1d

!===========================SUBROUTINE SHAPE ===============================
subroutine shape_2d(knode, pq, f)
  use Types
  use ParamIO 
  implicit none

  integer, intent( in )       :: knode
  real( prec ), intent( in )  :: pq(*)
  real( prec ), intent( out ) :: f(*)

  ! Local Variables
  real( prec ) :: g1, g2, g3, h1, h2, h3, z

  !     PQ(I)  Ith local co-ord
  !     F(J)   Jth shape function at current local co-ord

  if ( knode>9 ) then
    write (IOW, 99001) knode
    stop
  end if

  if ( knode==3 ) then

    !     SHAPE FUNCTIONS FOR 3 NODED TRIANGLE

    z = 1.D0 - pq(1) - pq(2)
    f(1) = pq(1)
    f(2) = pq(2)
    f(3) = z

  else if ( knode==4 ) then

    !     SHAPE FUNCTIONS FOR 4 NODED QUADRILATERAL

    !     43
    !     12

    g1 = 0.5D0*(1.D0 - pq(1))
    g2 = 0.5D0*(1.D0 + pq(1))
    h1 = 0.5D0*(1.D0 - pq(2))
    h2 = 0.5D0*(1.D0 + pq(2))
    f(1) = g1*h1
    f(2) = g2*h1
    f(3) = g2*h2
    f(4) = g1*h2

  else if ( knode==6 ) then

    !     SHAPE FUNCTIONS FOR 6 NODED TRIANGLE
    !          3

    !       6      5

    !     1    4     2

    !     P = L1
    !     Q = L2
    !     Z = 1 - P - Q = L3

    z = 1.D0 - pq(1) - pq(2)
    f(1) = (2.D0*pq(1) - 1.D0)*pq(1)
    f(2) = (2.D0*pq(2) - 1.D0)*pq(2)
    f(3) = (2.D0*z - 1.D0)*z
    f(4) = 4.D0*pq(1)*pq(2)
    f(5) = 4.D0*pq(2)*z
    f(6) = 4.D0*pq(1)*z


  else if ( knode==9 ) then

    !     SHAPE FUNCTIONS FOR 9 NODED LAGRANGIAN ELEMENT


    !     789
    !     456
    !     123

    g1 = -.5D0*pq(1)*(1.D0 - pq(1))
    g2 = (1.D0 - pq(1))*(1.D0 + pq(1))
    g3 = .5D0*pq(1)*(1.D0 + pq(1))
    h1 = -.5D0*pq(2)*(1.D0 - pq(2))
    h2 = (1.D0 - pq(2))*(1.D0 + pq(2))
    h3 = .5D0*pq(2)*(1.D0 + pq(2))
    f(1) = g1*h1
    f(2) = g2*h1
    f(3) = g3*h1
    f(4) = g1*h2
    f(5) = g2*h2
    f(6) = g3*h2
    f(7) = g1*h3
    f(8) = g2*h3
    f(9) = g3*h3
  end if

99001 format ( // ' *** ERROR ***'/  &
           '  Number of nodes on element is greater ',  &
           'than 9 '/'  No. nodes = ', I5)

end subroutine shape_2d

!==============================SUBROUTINE DSHAPE ====================
subroutine dshape_2d(knode, pq, df)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )       :: knode
  real( prec ), intent( in )  :: pq(2)
  real( prec ), intent( out ) :: df(9, 2)

  ! Local Variables
  real( prec ) :: dg1, dg2, dg3, dh1, dh2, dh3, dzdp, dzdq, &
       g1, g2, g3, h1, h2, h3, z

  !     PQ(I)    Ith local co-ord
  !     DF(I,J)  Derivative of Ith shape function wrt Jth PQ co-ord

  if ( knode>9 ) then
    write (IOW, 99001) knode
    stop
  end if
  if ( knode==3 ) then

    !     SHAPE FUNCTIONS FOR 3 NODED TRIANGLE

    df(1, 1) = 1.D0
    df(1, 2) = 0.D0
    df(2, 1) = 0.D0
    df(2, 2) = 1.D0
    df(3, 1) = -1.D0
    df(3, 2) = -1.D0

  else if ( knode==4 ) then

    !     SHAPE FUNCTIONS FOR 4 NODED QUADRILATERAL

    !     43
    !     12

    g1 = 0.5D0*(1.D0 - pq(1))
    dg1 = -0.5D0
    g2 = 0.5D0*(1.D0 + pq(1))
    dg2 = 0.5D0
    h1 = 0.5D0*(1.D0 - pq(2))
    dh1 = -0.5D0
    h2 = 0.5D0*(1.D0 + pq(2))
    dh2 = 0.5D0
    df(1, 1) = dg1*h1
    df(2, 1) = dg2*h1
    df(3, 1) = dg2*h2
    df(4, 1) = dg1*h2
    df(1, 2) = g1*dh1
    df(2, 2) = g2*dh1
    df(3, 2) = g2*dh2
    df(4, 2) = g1*dh2

  else if ( knode==6 ) then

    !     SHAPE FUNCTIONS FOR 6 NODED TRIANGLE
    !          3

    !       6      5

    !     1    4     2
    !     P = L1
    !     Q = L2
    !     Z = 1 - P - Q = L3

    z = 1.D0 - pq(1) - pq(2)
    dzdp = -1.D0
    dzdq = -1.D0
    df(1, 1) = 4.D0*pq(1) - 1.D0
    df(2, 1) = 0.D0
    df(3, 1) = 4.D0*z*dzdp - dzdp
    df(4, 1) = 4.D0*pq(2)
    df(5, 1) = 4.D0*pq(2)*dzdp
    df(6, 1) = 4.D0*z + 4.D0*pq(1)*dzdp
    df(1, 2) = 0.D0
    df(2, 2) = 4.D0*pq(2) - 1.D0
    df(3, 2) = 4.D0*z*dzdq - dzdq
    df(4, 2) = 4.D0*pq(1)
    df(5, 2) = 4.D0*z + 4.D0*pq(2)*dzdq
    df(6, 2) = 4.D0*pq(1)*dzdq

  else if ( knode==9 ) then


    !     LAG-2 SHAPE FUNCTIONS


    !     789
    !     456
    !     123

    g1 = -.5D0*pq(1)*(1.D0 - pq(1))
    g2 = (1.D0 - pq(1))*(1.D0 + pq(1))
    g3 = .5D0*pq(1)*(1.D0 + pq(1))
    h1 = -.5D0*pq(2)*(1.D0 - pq(2))
    h2 = (1.D0 - pq(2))*(1.D0 + pq(2))
    h3 = .5D0*pq(2)*(1.D0 + pq(2))
    dg1 = -.5D0 + pq(1)
    dg2 = -2.D0*pq(1)
    dg3 = .5D0 + pq(1)
    dh1 = -.5D0 + pq(2)
    dh2 = -2.D0*pq(2)
    dh3 = .5D0 + pq(2)
    df(1, 1) = dg1*h1
    df(2, 1) = dg2*h1
    df(3, 1) = dg3*h1
    df(4, 1) = dg1*h2
    df(5, 1) = dg2*h2
    df(6, 1) = dg3*h2
    df(7, 1) = dg1*h3
    df(8, 1) = dg2*h3
    df(9, 1) = dg3*h3
    df(1, 2) = g1*dh1
    df(2, 2) = g2*dh1
    df(3, 2) = g3*dh1
    df(4, 2) = g1*dh2
    df(5, 2) = g2*dh2
    df(6, 2) = g3*dh2
    df(7, 2) = g1*dh3
    df(8, 2) = g2*dh3
    df(9, 2) = g3*dh3
  end if

99001 format ( // ' *** ERROR ***'/  &
           '  Number of nodes on 2D element is greater ',  &
           'than 9 '/'  No. nodes = ', I5)

end subroutine dshape_2d

!
!======================== shape_3d ==================================
!
!        Calculates shape functions for various element types
!
subroutine shape_3d(knode,xi,N)
  use Types
  use ParamIO
  implicit none

  integer,      intent( in )  :: knode
  real( prec ), intent( in )  :: xi(3)
  real( prec ), intent( out ) :: N(20)

  real (prec) :: xi3,xi4

 
  if (knode == 4) then
        N(1) = xi(1)
        N(2) = xi(2)
        N(3) = xi(3)
        N(4) = 1.-xi(1)-xi(2)-xi(3)
  else if (knode == 10) then
        xi4 = 1.-xi(1)-xi(2)-xi(3)
        N(1) = (2.*xi(1)-1.)*xi(1)
        N(2) = (2.*xi(2)-1.)*xi(2)
        N(3) = (2.*xi(3)-1.)*xi(3)
        N(4) = (2.*xi4-1.)*xi4
        N(5) = 4.*xi(1)*xi(2)
        N(6) = 4.*xi(2)*xi(3)
        N(7) = 4.*xi(3)*xi(1)
        N(8) = 4.*xi(1)*xi4
        N(9) = 4.*xi(2)*xi4
        N(10) = 4.*xi(3)*xi4
   else if (knode == 8) then
        N(1) = (1.-xi(1))*(1.-xi(2))*(1.-xi(3))/8.
        N(2) = (1.+xi(1))*(1.-xi(2))*(1.-xi(3))/8.
        N(3) = (1.+xi(1))*(1.+xi(2))*(1.-xi(3))/8.
        N(4) = (1.-xi(1))*(1.+xi(2))*(1.-xi(3))/8.
        N(5) = (1.-xi(1))*(1.-xi(2))*(1.+xi(3))/8.
        N(6) = (1.+xi(1))*(1.-xi(2))*(1.+xi(3))/8.
       N(7) = (1.+xi(1))*(1.+xi(2))*(1.+xi(3))/8.
        N(8) = (1.-xi(1))*(1.+xi(2))*(1.+xi(3))/8.
    else if (knode == 20) then
        N(1) = (1.-xi(1))*(1.-xi(2))*(1.-xi(3))*(-xi(1)-xi(2)-xi(3)-2.)/8.
        N(2) = (1.+xi(1))*(1.-xi(2))*(1.-xi(3))*(xi(1)-xi(2)-xi(3)-2.)/8.
        N(3) = (1.+xi(1))*(1.+xi(2))*(1.-xi(3))*(xi(1)+xi(2)-xi(3)-2.)/8.
        N(4) = (1.-xi(1))*(1.+xi(2))*(1.-xi(3))*(-xi(1)+xi(2)-xi(3)-2.)/8.
        N(5) = (1.-xi(1))*(1.-xi(2))*(1.+xi(3))*(-xi(1)-xi(2)+xi(3)-2.)/8.
        N(6) = (1.+xi(1))*(1.-xi(2))*(1.+xi(3))*(xi(1)-xi(2)+xi(3)-2.)/8.
        N(7) = (1.+xi(1))*(1.+xi(2))*(1.+xi(3))*(xi(1)+xi(2)+xi(3)-2.)/8.
        N(8) = (1.-xi(1))*(1.+xi(2))*(1.+xi(3))*(-xi(1)+xi(2)+xi(3)-2.)/8.
        N(9)  = (1.-xi(1)**2.)*(1.-xi(2))*(1.-xi(3))/4.
        N(10) = (1.+xi(1))*(1.-xi(2)**2.)*(1.-xi(3))/4.
        N(11) = (1.-xi(1)**2.)*(1.+xi(2))*(1.-xi(3))/4.
        N(12) = (1.-xi(1))*(1.-xi(2)**2.)*(1.-xi(3))/4.
        N(13) = (1.-xi(1)**2.)*(1.-xi(2))*(1.+xi(3))/4.
        N(14) = (1.+xi(1))*(1.-xi(2)**2.)*(1.+xi(3))/4.
        N(15) = (1.-xi(1)**2.)*(1.+xi(2))*(1.+xi(3))/4.
        N(16) = (1.-xi(1))*(1.-xi(2)**2.)*(1.+xi(3))/4.
        N(17) = (1.-xi(1))*(1.-xi(2))*(1.-xi(3)**2.)/4.
        N(18) = (1.+xi(1))*(1.-xi(2))*(1.-xi(3)**2.)/4.
        N(19) = (1.+xi(1))*(1.+xi(2))*(1.-xi(3)**2.)/4.
        N(20) = (1.-xi(1))*(1.+xi(2))*(1.-xi(3)**2.)/4.
  endif
  
  return
end subroutine shape_3d

!
!================= Subroutine dshape_3d ======================
!
subroutine dshape_3d(knode,xi,dNdxi)
   use Types
   use ParamIO
   implicit none


   integer,  intent(in)           :: knode
   real (prec),   intent(in)      :: xi(3)
   real (prec),   intent(inout)   :: dNdxi(20,3)

   real (prec) :: xi3,xi4

   dNdxi = 0.D0


   if (knode == 4) then
        dNdxi(1,1) = 1.
        dNdxi(2,2) = 1.
        dNdxi(3,3) = 1.
        dNdxi(4,1) = -1.
        dNdxi(4,2) = -1.
        dNdxi(4,3) = -1.
   else if (knode == 10) then
        xi4 = 1.-xi(1)-xi(2)-xi(3)
        dNdxi(1,1) = (4.*xi(1)-1.)
        dNdxi(2,2) = (4.*xi(2)-1.)
        dNdxi(3,3) = (4.*xi(3)-1.)
        dNdxi(4,1) = -(4.*xi4-1.)
        dNdxi(4,2) = -(4.*xi4-1.)
        dNdxi(4,3) = -(4.*xi4-1.)
        dNdxi(5,1) = 4.*xi(2)
        dNdxi(5,2) = 4.*xi(1)
        dNdxi(6,2) = 4.*xi(3)
        dNdxi(6,3) = 4.*xi(2)
        dNdxi(7,1) = 4.*xi(3)
        dNdxi(7,3) = 4.*xi(1) 
        dNdxi(8,1) = 4.*(xi4-xi(1))
        dNdxi(8,2) = -4.*xi(1)
        dNdxi(8,3) = -4.*xi(1)
        dNdxi(9,1) = -4.*xi(2)
        dNdxi(9,2) = 4.*(xi4-xi(2))
        dNdxi(9,3) = -4.*xi(2)
        dNdxi(10,1) = -4.*xi(3)*xi4
        dNdxi(10,2) = -4.*xi(3)
        dNdxi(10,3) = 4.*(xi4-xi(3))
   else if (knode == 8) then
        dNdxi(1,1) = -(1.-xi(2))*(1.-xi(3))/8.
        dNdxi(1,2) = -(1.-xi(1))*(1.-xi(3))/8.
        dNdxi(1,3) = -(1.-xi(1))*(1.-xi(2))/8.
        dNdxi(2,1) = (1.-xi(2))*(1.-xi(3))/8.
		dNdxi(2,2) = -(1.+xi(1))*(1.-xi(3))/8.
        dNdxi(2,3) = -(1.+xi(1))*(1.-xi(2))/8.
        dNdxi(3,1) = (1.+xi(2))*(1.-xi(3))/8.
        dNdxi(3,2) = (1.+xi(1))*(1.-xi(3))/8.
        dNdxi(3,3) = -(1.+xi(1))*(1.+xi(2))/8.
        dNdxi(4,1) = -(1.+xi(2))*(1.-xi(3))/8.
        dNdxi(4,2) = (1.-xi(1))*(1.-xi(3))/8.
        dNdxi(4,3) = -(1.-xi(1))*(1.+xi(2))/8.
        dNdxi(5,1) = -(1.-xi(2))*(1.+xi(3))/8.
        dNdxi(5,2) = -(1.-xi(1))*(1.+xi(3))/8.
        dNdxi(5,3) = (1.-xi(1))*(1.-xi(2))/8.
        dNdxi(6,1) = (1.-xi(2))*(1.+xi(3))/8.
        dNdxi(6,2) = -(1.+xi(1))*(1.+xi(3))/8.
        dNdxi(6,3) = (1.+xi(1))*(1.-xi(2))/8.
        dNdxi(7,1) = (1.+xi(2))*(1.+xi(3))/8.
        dNdxi(7,2) = (1.+xi(1))*(1.+xi(3))/8.
        dNdxi(7,3) = (1.+xi(1))*(1.+xi(2))/8.
        dNdxi(8,1) = -(1.+xi(2))*(1.+xi(3))/8.
        dNdxi(8,2) = (1.-xi(1))*(1.+xi(3))/8.
        dNdxi(8,3) = (1.-xi(1))*(1.+xi(2))/8.
   else if (knode == 20) then
        dNdxi(1,1) = (-(1.-xi(2))*(1.-xi(3))*(-xi(1)-xi(2)-xi(3)-2.)-(1.-xi(1))*(1.-xi(2))*(1.-xi(3)))/8.
        dNdxi(1,2) = (-(1.-xi(1))*(1.-xi(3))*(-xi(1)-xi(2)-xi(3)-2.)-(1.-xi(1))*(1.-xi(2))*(1.-xi(3)))/8.
        dNdxi(1,3) = (-(1.-xi(1))*(1.-xi(2))*(-xi(1)-xi(2)-xi(3)-2.)-(1.-xi(1))*(1.-xi(2))*(1.-xi(3)))/8.
 
        dNdxi(2,1) = ((1.-xi(2))*(1.-xi(3))*(xi(1)-xi(2)-xi(3)-2.)+(1.+xi(1))*(1.-xi(2))*(1.-xi(3)))/8.
        dNdxi(2,2) = (-(1.+xi(1))*(1.-xi(3))*(xi(1)-xi(2)-xi(3)-2.)-(1.+xi(1))*(1.-xi(2))*(1.-xi(3)))/8.
        dNdxi(2,3) = (-(1.+xi(1))*(1.-xi(2))*(xi(1)-xi(2)-xi(3)-2.)-(1.+xi(1))*(1.-xi(2))*(1.-xi(3)))/8.
 
        dNdxi(3,1) = ((1.+xi(2))*(1.-xi(3))*(xi(1)+xi(2)-xi(3)-2.)+(1.+xi(1))*(1.+xi(2))*(1.-xi(3)))/8.
        dNdxi(3,2) = ((1.+xi(1))*(1.-xi(3))*(xi(1)+xi(2)-xi(3)-2.)+(1.+xi(1))*(1.+xi(2))*(1.-xi(3)))/8.
        dNdxi(3,3) = (-(1.+xi(1))*(1.+xi(2))*(xi(1)+xi(2)-xi(3)-2.)-(1.+xi(1))*(1.+xi(2))*(1.-xi(3)))/8.
 
        dNdxi(4,1) = (-(1.+xi(2))*(1.-xi(3))*(-xi(1)+xi(2)-xi(3)-2.)-(1.-xi(1))*(1.+xi(2))*(1.-xi(3)))/8.
        dNdxi(4,2) = ((1.-xi(1))*(1.-xi(3))*(-xi(1)+xi(2)-xi(3)-2.)+(1.-xi(1))*(1.+xi(2))*(1.-xi(3)))/8.
        dNdxi(4,3) = (-(1.-xi(1))*(1.+xi(2))*(-xi(1)+xi(2)-xi(3)-2.)-(1.-xi(1))*(1.+xi(2))*(1.-xi(3)))/8.
        dNdxi(5,1) = (-(1.-xi(2))*(1.+xi(3))*(-xi(1)-xi(2)+xi(3)-2.)-(1.-xi(1))*(1.-xi(2))*(1.+xi(3)))/8.
        dNdxi(5,2) = (-(1.-xi(1))*(1.+xi(3))*(-xi(1)-xi(2)+xi(3)-2.)-(1.-xi(1))*(1.-xi(2))*(1.+xi(3)))/8.
        dNdxi(5,3) = ((1.-xi(1))*(1.-xi(2))*(-xi(1)-xi(2)+xi(3)-2.)+(1.-xi(1))*(1.-xi(2))*(1.+xi(3)))/8.
        dNdxi(6,1) = ((1.-xi(2))*(1.+xi(3))*(xi(1)-xi(2)+xi(3)-2.)+(1.+xi(1))*(1.-xi(2))*(1.+xi(3)))/8.
        dNdxi(6,2) = (-(1.+xi(1))*(1.+xi(3))*(xi(1)-xi(2)+xi(3)-2.)-(1.+xi(1))*(1.-xi(2))*(1.+xi(3)))/8.
        dNdxi(6,3) = ((1.+xi(1))*(1.-xi(2))*(xi(1)-xi(2)+xi(3)-2.)+(1.+xi(1))*(1.-xi(2))*(1.+xi(3)))/8.
        dNdxi(7,1) = ((1.+xi(2))*(1.+xi(3))*(xi(1)+xi(2)+xi(3)-2.)+(1.+xi(1))*(1.+xi(2))*(1.+xi(3)))/8.
        dNdxi(7,2) = ((1.+xi(1))*(1.+xi(3))*(xi(1)+xi(2)+xi(3)-2.)+(1.+xi(1))*(1.+xi(2))*(1.+xi(3)))/8.
        dNdxi(7,3) = ((1.+xi(1))*(1.+xi(2))*(xi(1)+xi(2)+xi(3)-2.)+(1.+xi(1))*(1.+xi(2))*(1.+xi(3)))/8.
        dNdxi(8,1) = (-(1.+xi(2))*(1.+xi(3))*(-xi(1)+xi(2)+xi(3)-2.)-(1.-xi(1))*(1.+xi(2))*(1.+xi(3)))/8.
        dNdxi(8,2) = ((1.-xi(1))*(1.+xi(3))*(-xi(1)+xi(2)+xi(3)-2.)+(1.-xi(1))*(1.+xi(2))*(1.+xi(3)))/8.
        dNdxi(8,3) = ((1.-xi(1))*(1.+xi(2))*(-xi(1)+xi(2)+xi(3)-2.)+(1.-xi(1))*(1.+xi(2))*(1.+xi(3)))/8.
        dNdxi(9,1)  = -2.*xi(1)*(1.-xi(2))*(1.-xi(3))/4.
        dNdxi(9,2)  = -(1.-xi(1)**2.)*(1.-xi(3))/4.
        dNdxi(9,3)  = -(1.-xi(1)**2.)*(1.-xi(2))/4.
        dNdxi(10,1)  = (1.-xi(2)**2.)*(1.-xi(3))/4.
        dNdxi(10,2)  = -2.*xi(2)*(1.+xi(1))*(1.-xi(3))/4.
        dNdxi(10,3)  = -(1.-xi(2)**2.)*(1.+xi(1))/4.
        dNdxi(11,1)  = -2.*xi(1)*(1.-xi(2))*(1.-xi(3))/4.
        dNdxi(11,2)  = -(1.-xi(1)**2.)*(1.-xi(3))/4.
        dNdxi(11,3)  = -(1.-xi(1)**2.)*(1.-xi(2))/4.
        dNdxi(12,1)  = -(1.-xi(2)**2.)*(1.-xi(3))/4.
        dNdxi(12,2)  = -2.*xi(2)*(1.-xi(1))*(1.-xi(3))/4.
        dNdxi(12,3)  = -(1.-xi(2)**2.)*(1.-xi(1))/4.
        dNdxi(13,1)  = -2.*xi(1)*(1.-xi(2))*(1.+xi(3))/4.
        dNdxi(13,2)  = -(1.-xi(1)**2.)*(1.+xi(3))/4.
        dNdxi(13,3)  = (1.-xi(1)**2.)*(1.-xi(2))/4.
        dNdxi(14,1)  = (1.-xi(2)**2.)*(1.+xi(3))/4.
        dNdxi(14,2)  = -2.*xi(2)*(1.+xi(1))*(1.+xi(3))/4.
        dNdxi(14,3)  = (1.-xi(2)**2.)*(1.+xi(1))/4.
        dNdxi(15,1)  = 2.*xi(1)*(1.+xi(2))*(1.+xi(3))/4.
        dNdxi(15,2)  = (1.-xi(1)**2.)*(1.+xi(3))/4.
        dNdxi(15,3)  = (1.-xi(1)**2.)*(1.+xi(2))/4.
        dNdxi(16,1)  = -(1.-xi(2)**2.)*(1.+xi(3))/4.
        dNdxi(16,2)  = -2.*xi(2)*(1.-xi(1))*(1.+xi(3))/4.
        dNdxi(16,3)  = (1.-xi(2)**2.)*(1.-xi(1))/4.
        dNdxi(17,1) = -(1.-xi(2))*(1.-xi(3)**2.)/4.
        dNdxi(17,2) = -(1.-xi(1))*(1.-xi(3)**2.)/4.
        dNdxi(17,3) = -xi(3)*(1.-xi(1))*(1.-xi(2))/2.
        dNdxi(18,1) = (1.-xi(2))*(1.-xi(3)**2.)/4.
        dNdxi(18,2) = -(1.+xi(1))*(1.-xi(3)**2.)/4.
        dNdxi(18,3) = -xi(3)*(1.+xi(1))*(1.-xi(2))/2.
        dNdxi(19,1) = (1.+xi(2))*(1.-xi(3)**2.)/4.
        dNdxi(19,2) = (1.+xi(1))*(1.-xi(3)**2.)/4.
        dNdxi(19,3) = -xi(3)*(1.+xi(1))*(1.+xi(2))/2.
        dNdxi(20,1) = -(1.+xi(2))*(1.-xi(3)**2.)/4.
        dNdxi(20,2) = (1.-xi(1))*(1.-xi(3)**2.)/4.
        dNdxi(20,3) = -xi(3)*(1.-xi(1))*(1.+xi(2))/2.
   endif

   return

end subroutine dshape_3d

!
!======================= subroutine facenodes_2d =============
!
subroutine facenodes_2d(nelnodes,face,list,nfacenodes)
   use Types
   use ParamIO
   implicit none

   integer, intent (in)      :: nelnodes
   integer, intent (in)      :: face
   integer, intent (out)     :: list(3)
   integer, intent (out)     :: nfacenodes

   integer :: i3(3), i4(4)

!
!  Subroutine to return list of nodes on an element face
!
   i3(1:3) = [2,3,1]
   i4(1:4) = [2,3,4,1] 

   if (nelnodes == 3) then 
     nfacenodes = 2
   endif
   if (nelnodes == 4) then
     nfacenodes = 2
   endif
   if (nelnodes == 6) then
     nfacenodes = 3
   endif
   if (nelnodes == 8) then
     nfacenodes = 3
   endif
   if (nelnodes == 9) then
     nfacenodes = 3 
   endif

    if (nelnodes == 3) then
       list(1) = face
       list(2) = i3(face)
     elseif (nelnodes == 6)  then 
       list(1) = face
       list(2) = i3(face)
       list(3) = face+3
     elseif (nelnodes==4) then
       list(1) = face
       list(2) = i4(face)
     elseif (nelnodes==8) then
       list(1) = face
       list(2) = i4(face)
       list(3) = face+4
     endif
  
end subroutine facenodes_2d


 !
!================================== subroutine dload_2d ==============================
!
subroutine dload_2d(lmn, iep, numnod, nodpn, eprop, MAXPRP, xloc,  &
     maxx, iface,iopt, dlprop,ndlprp, resid, MAXSTF)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                        
  integer, intent( inout )      :: iep                        
  integer, intent( inout )      :: numnod                     
  integer, intent( in )         :: MAXPRP                     
  integer, intent( in )         :: maxx                       
  integer, intent( inout )      :: iface
  integer, intent( in )         :: iopt                       
  integer, intent( inout )      :: ndlprp                       
  integer, intent( in )         :: MAXSTF                     
  integer, intent( inout )      :: nodpn(4, numnod)           
  real( prec ), intent( inout ) :: eprop(MAXPRP)              
  real( prec ), intent( inout ) :: xloc(maxx)
  real( prec ), intent( in )    :: dlprop(ndlprp)                 
  real( prec ), intent( inout ) :: resid(MAXSTF)              

  ! Local Variables
  real (prec)  :: xi(10),w(10)           ! Integration pts and weights
  real (prec)  :: N(3),dNdxi(3)      ! Shape functions and derivatives
  real (prec)  :: dxdxi(2)                          ! natural basis vectors
  real (prec)  :: norm(2)                             ! Normal vector to face
  real (prec)  :: traction(10)                         ! Traction vector
  real (prec)  :: x(2)                                ! coords of point
  real (prec)  :: det                                 ! Determinant
  integer :: nfacenodes,list(3)
  integer :: nintp,intpt,i,j,a,row

  !     Subroutine to compute contribution to residual due to
  !     distributed traction acting on face IFACE of element LMN

  !     LMN          Element number
  !     IEP          User defined element property flag
  !     NUMNOD       No. nodes on the element
  !     NODPN        Nodal pointer array
  !     NODPN(1,I)  User defined flag for Ith node on element
  !     NODPN(2,I)  No. coords associated with Ith node on element
  !     NODPN(3,I)  No. DOF associated with Ith node on element
  !     XLOC(J)      Coordinate array
  !     MAXX         Dimension of coord array
  !     IFACE       Abs value gives face number of element; sign controls whether
  !                 user subroutine is called to calculate traction value.
  !     IOPT         Option controlling distributed load type
  !                 IOPT=1    Traction values provided directly
  !                 IOPT=2    Traction applied normal to element face
  !                 IOPT=3    Traction controlled by user subroutine
  !     NDLPRP       No. parameters controlling distributed loads
  !     RESID(I)     Residual (must be assembled and returned by the routine)

    resid = 0.D0

    if (numnod == 3.or.numnod==4) nintp = 2
    if (numnod == 6.or.numnod==8) nintp = 3


    call facenodes_2d(numnod,iabs(iface),list,nfacenodes)
    call intpts_1d(xi,w,nintp)                  

    do intpt = 1,nintp
      call shape_1d(nfacenodes,xi(intpt), N)         
      call dshape_1d(nfacenodes,xi(intpt),dNdxi)     
!
!     global coords of integration point
!
      do i = 1,2
        x(i) = 0.D0
        do a = 1,nfacenodes
           x(i) = x(i) + xloc(2*(list(a)-1)+i)*N(a)
        end do
      end do
!
!     Compute the jacobian matrix and its determinant
!
     do i = 1,2
       dxdxi(i) = 0.D0
       do a = 1,nfacenodes
         dxdxi(i) = dxdxi(i) + xloc(2*(list(a)-1)+i)*dNdxi(a)
       end do
     end do
!    normal vector
	 norm(1) = dxdxi(2)
	 norm(2) = -dxdxi(1)
	 det = sqrt(dot_product(norm,norm))
	 if (det==0.D0) then
	   write(IOW,1001) lmn
1001   format(/' *** Error detected in subroutine dload_2d *** '/ &
               ' element ',i4,' has zero determinant ')
	   stop
	 endif
	 norm = norm/det

     if (iopt==1)then        ! Traction magnitude supplied directly
	    if (ndlprp<nodpn(3,1)) then
		   write(IOW,*) ' Error in subroutine dload_3d '
		   write(IOW,*) ' Insufficitent traction components were provided '
		   stop
		endif
	    traction(1:nodpn(3,1)) = dlprop(1:nodpn(3,1))
	 else if (iopt==2) then
	    if (nodpn(3,1) /= 3) then
	       write(IOW,*) ' Error in subroutine DLOAD_2d '
	       write(IOW,*) ' Traction acting normal to element face was specified in input file '
	       write(IOW,*) ' but this element has ',nodpn(3,1),' degrees of freedom at each node '
	       stop
	    endif
	    traction(1:2) = dlprop(1)*norm(1:2)
        
	 else                     ! Traction value computed by user subroutine
	    call btract_2d(dlprop,ndlprp,x,norm,traction)
	 endif

     do a = 1,nfacenodes
       do i = 1,nodpn(3,a)
	     row = nodpn(3,1)*(list(a)-1) + i
         resid(row) = resid(row) + N(a)*traction(i)*w(intpt)*det
       end do
     end do
   end do

   return
end subroutine dload_2d
!
!======================= subroutine facenodes_3d =============
!
subroutine facenodes_3d(nelnodes,face,list,nfacenodes)
   use Types
   use ParamIO
   implicit none

   integer, intent (in)      :: nelnodes
   integer, intent (in)      :: face
   integer, intent (out)     :: list(8)
   integer, intent (out)     :: nfacenodes
!
!  Subroutine to return list of nodes on an element face
!

   if (nelnodes == 4) nfacenodes = 3
   if (nelnodes == 10) nfacenodes = 6
   if (nelnodes == 8) nfacenodes = 4
   if (nelnodes == 20) nfacenodes = 8 

   if (nelnodes==4) then
        if   (face == 1) list(1:3) = [1,2,3]
        if (face == 2) list(1:3) = [1,4,2]
        if (face == 3) list(1:3) = [2,4,3]
        if (face == 4) list(1:3) = [3,4,1] 
   else if (nelnodes == 10) then
        if   (face == 1) list(1:6) = [1,2,3,5,6,7]
        if (face == 2) list(1:6) = [1,4,2,8,9,5]
        if (face == 3) list(1:6) = [2,4,3,9,10,6]
        if (face == 4) list(1:6) = [3,4,1,10,8,7]
   else if (nelnodes == 8) then
        if (face==1) list(1:4) = [1,2,3,4]
		if (face==2) list(1:4) = [5,8,7,6]
		if (face==3) list(1:4) = [1,5,6,2]
        if (face==4) list(1:4) = [2,6,7,3]
        if (face==5) list(1:4) = [3,7,8,4]
        if (face==6) list(1:4) = [4,8,5,1]
   else if (nelnodes == 20) then 
        if (face == 1) list(1:8) = [1,2,3,4,9,10,11,12]
        if (face == 2) list(1:8) = [5,8,7,6,16,15,14,13]
        if (face == 3) list(1:8) = [1,5,6,2,17,13,18,9]
        if (face == 4) list(1:8) = [2,6,7,3,18,14,19,10]
        if (face == 5) list(1:8) = [3,7,8,4,19,15,6,11]
        if (face == 6) list(1:8) = [4,8,5,1,20,16,17,12] 
	endif
end subroutine facenodes_3d
!
!================================== subroutine dload_3d ==============================
!
subroutine dload_3d(lmn, iep, numnod, nodpn, eprop, MAXPRP, xloc,  &
     maxx, iface,iopt, dlprop,ndlprp, resid, MAXSTF)
  use Types
  use ParamIO
  implicit none

  integer, intent( inout )      :: lmn                        
  integer, intent( inout )      :: iep                        
  integer, intent( inout )      :: numnod                     
  integer, intent( in )         :: MAXPRP                     
  integer, intent( in )         :: maxx                       
  integer, intent( inout )      :: iface
  integer, intent( in )         :: iopt                       
  integer, intent( inout )      :: ndlprp                       
  integer, intent( in )         :: MAXSTF                     
  integer, intent( inout )      :: nodpn(4, numnod)           
  real( prec ), intent( inout ) :: eprop(MAXPRP)              
  real( prec ), intent( inout ) :: xloc(maxx)
  real( prec ), intent( in )    :: dlprop(ndlprp)                 
  real( prec ), intent( inout ) :: resid(MAXSTF)              

  ! Local Variables
  real (prec)  :: xi(2,9),w(9)           ! Integration pts and weights
  real (prec)  :: N(9),dNdxi(9,2)      ! Shape functions and derivatives
  real (prec)  :: dxdxi(3,2)                          ! natural basis vectors
  real (prec)  :: norm(3)                             ! Normal vector to face
  real (prec)  :: traction(10)                         ! Traction vector
  real (prec)  :: x(3)                                ! coords of point
  real (prec)  :: det                                 ! Determinant
  integer :: nfacenodes,list(8)
  integer :: nintp,intpt,i,j,a,row

  !     Subroutine to compute contribution to residual due to
  !     distributed traction acting on face IFACE of element LMN

  !     LMN          Element number
  !     IEP          User defined element property flag
  !     NUMNOD       No. nodes on the element
  !     NODPN        Nodal pointer array
  !     NODPN(1,I)  User defined flag for Ith node on element
  !     NODPN(2,I)  No. coords associated with Ith node on element
  !     NODPN(3,I)  No. DOF associated with Ith node on element
  !     XLOC(J)      Coordinate array
  !     MAXX         Dimension of coord array
  !     IFACE       Abs value gives face number of element; sign controls whether
  !                 user subroutine is called to calculate traction value.
  !     IOPT         Option controlling distributed load type
  !                 IOPT=1    Traction values provided directly
  !                 IOPT=2    Traction applied normal to element face
  !                 IOPT=3    Traction controlled by user subroutine
  !     NDLPRP       No. parameters controlling distributed loads
  !     RESID(I)     Residual (must be assembled and returned by the routine)

    resid = 0.D0

    if (numnod == 4) nintp = 3
    if (numnod == 10) nintp = 4
    if (numnod == 8) nintp = 4
    if (numnod == 20) nintp = 9

    call facenodes_3d(numnod,iabs(iface),list,nfacenodes)
    call intpts_2d(xi,w,nfacenodes,nintp)                  

    do intpt = 1,nintp
      call shape_2d(nfacenodes,xi(1,intpt), N)         
      call dshape_2d(nfacenodes,xi(1,intpt),dNdxi)     
!
!     global coords of integration point
!
      do i = 1,3
        x(i) = 0.D0
        do a = 1,nfacenodes
           x(i) = x(i) + xloc(3*(list(a)-1)+i)*N(a)
        end do
      end do
!
!     Compute the jacobian matrix and its determinant
!
     do i = 1,3
       do j = 1,2
         dxdxi(i,j) = 0.D0
         do a = 1,nfacenodes
           dxdxi(i,j) = dxdxi(i,j) + xloc(3*(list(a)-1)+i)*dNdxi(a,j)
         end do
      end do
     end do
!    normal vector
	 norm(1) = (dxdxi(2,1)*dxdxi(3,2))-(dxdxi(2,2)*dxdxi(3,1))
	 norm(2) = (dxdxi(1,1)*dxdxi(3,2))-(dxdxi(1,2)*dxdxi(3,1))
	 norm(3) = (dxdxi(1,1)*dxdxi(2,2))-(dxdxi(1,2)*dxdxi(2,1))
	 det = sqrt(dot_product(norm,norm))
	 if (det==0.D0) then
	   write(IOW,1001) lmn
1001   format(/' *** Error detected in subroutine dload_3d *** '/ &
               ' element ',i4,' has zero determinant ')
	   stop
	 endif
	 norm = norm/det

     if (iopt==1)then        ! Traction magnitude supplied directly
	    if (ndlprp<nodpn(3,1)) then
		   write(IOW,*) ' Error in subroutine dload_3d '
		   write(IOW,*) ' Insufficitent traction components were provided '
		   stop
		endif
	    traction(1:nodpn(3,1)) = dlprop(1:nodpn(3,1))
	 else if (iopt==2) then
	    if (nodpn(3,1) /= 3) then
	       write(IOW,*) ' Error in subroutine DLOAD_3d '
	       write(IOW,*) ' Traction acting normal to element face was specified in input file '
	       write(IOW,*) ' but this element has ',nodpn(3,1),' degrees of freedom at each node '
	       stop
	    endif
	    traction(1:3) = dlprop(1)*norm(1:3)
        
	 else                     ! Traction value computed by user subroutine
	    call btract_3d(dlprop,ndlprp,x,norm,traction)
	 endif

     row = 0
     do a = 1,nfacenodes
       do i = 1,nodpn(3,a)
	     row = nodpn(3,1)*(list(a)-1) + i
         resid(row) = resid(row) + N(a)*traction(i)*w(intpt)*det
       end do
     end do
   end do

   return
end subroutine dload_3d

!
!============================== subroutine btract_2d =================================
!
subroutine btract_2d(props,nprops, x, norm, tract)
  use Types
  implicit none

  integer, intent( in )         :: nprops
  real( prec ), intent( inout ) :: x(2)
  real( prec ), intent( inout ) :: norm(2)
  real( prec ), intent( out )   :: tract(*)
  real( prec ), intent( in )    :: props(nprops)

  tract(1:2) = norm

  return
end subroutine btract_2d

!
!============================== subroutine btract_3d =================================
!
subroutine btract_3d(props,nprops, x, norm, tract)
  use Types
  implicit none

  integer, intent( in )         :: nprops
  real( prec ), intent( inout ) :: x(3)
  real( prec ), intent( inout ) :: norm(3)
  real( prec ), intent( out )   :: tract(*)
  real( prec ), intent( in )    :: props(nprops)

  tract(1:3) = norm

  return
end subroutine btract_3d

!
!=================== SUBROUTINE dof_user_sub ======================
!

subroutine dof_user_sub(idof,params,npar,utot,du,rfor,ndof,value)
   use TYPES
   use PARAMIO
   use Globals

   integer,  intent( in )         :: idof
   integer,  intent( in )         :: npar
   integer,  intent( in )         :: ndof

   real( prec ), intent( in )     :: params(npar)
   real( prec ), intent( in )     :: utot(ndof)
   real( prec ), intent( in )     :: du(ndof)
   real( prec ), intent( in )     :: rfor(ndof)
   real( prec ), intent( inout )  :: value

!  Subroutine to compute user-defined DOF value
!  idof  Degree of freedom
!  params(1:npar)   List of user supplied parameters
!  utot(1:ndof)     Accumulated DOF at node at start of increment
!  du(1:ndof)       Current approx to increment in DOF at node
!  rfor(1:ndof)     Residual force at node at start of increment
!  value            DOF value - must be computed in this subroutine

   write(IOW,*) ' Error detected in subroutine dof_user_sub'
   write(IOW,*) ' Not coded to apply DOF BCs - need to edit code in usrelem.f90'
   STOP

end subroutine dof_user_sub

!
!=================== SUBROUTINE for_user_sub ======================
!

subroutine for_user_sub(idof,params,npar,utot,du,rfor,ndof,value)
   use TYPES
   use PARAMIO
   use Globals

   integer,  intent( in )         :: idof
   integer,  intent( in )         :: npar
   integer,  intent( in )         :: ndof

   real( prec ), intent( inout )  :: params(npar)
   real( prec ), intent( in )     :: utot(ndof)
   real( prec ), intent( in )     :: du(ndof)
   real( prec ), intent( in )     :: rfor(ndof)
   real( prec ), intent( out )  :: value

!  Subroutine to compute user-defined DOF value
!  idof  Degree of freedom
!  params(1:npar)   List of user supplied parameters
!  utot(1:ndof)     Accumulated DOF at node at start of increment
!  du(1:ndof)       Current approx to increment in DOF at node
!  rfor(1:ndof)     Residual force at node at start of increment
!  value            Value of force - must be computed in this routine

   if (npar<5) then
      write(IOW,*) ' Error in subroutine for_user_sub'
      write(IOW,*) ' Insufficient paramters '
      stop
   endif
   write(1,*) ' DOF and RFOR in for_user_sub'
   write(1,*) utot(1:ndof)
   write(1,*) du(1:ndof)
   write(1,*) rfor(1:ndof)
   
   if (params(5)>0.d0) then
      value = params(1)
      if (TIME==0.d0) return
      if (utot(1)<params(3)) then
         value = params(2)
         params(5) = -params(5)
      endif
      return
   else
     value = params(2)
     if (utot(1)>params(4))  then
        value = params(1)
        params(5) = -params(5)
     endif
     return
   endif
   
end subroutine for_user_sub

!
!================================= SUBROUTINE INTPTS_3D ===================
!
subroutine intpts_3d(xi, w, knode, npoints)
  use Types
  use ParamIO

  implicit none

  integer, intent( in )       :: knode
  integer, intent( in )       :: npoints
  real( prec ), intent( out ) :: xi(3,*)
  real( prec ), intent( out ) :: w(*)

  real (prec) :: x1D(4),w1D(4)
  integer :: i,j,k,n
!
! Integration points for 3d elements
!
  if (knode  == 4.or.knode ==10 ) then
        if (npoints == 1) then
          xi(1,1) = 0.25
          xi(2,1) = 0.25
          xi(3,1) = 0.25
          w(1) = 1.D0/6.D0
        else if (npoints == 4) then
          xi(1,1) = 0.58541020
          xi(2,1) = 0.13819660
          xi(3,1) = xi(2,1)
          xi(1,2) = xi(2,1)
          xi(2,2) = xi(1,1)
          xi(3,2) = xi(2,1)
          xi(1,3) = xi(2,1)
          xi(2,3) = xi(2,1)
          xi(3,3) = xi(1,1)
          xi(1,4) = xi(2,1)
          xi(2,4) = xi(2,1)
          xi(3,4) = xi(2,1)
		  w(1:4) = 1.D0/24.D0
		else if (npoints == 5) then
          xi(1,1) = 0.25d0
          xi(2,1) = 0.25d0
          xi(3,1) = 0.25d0
		  xi(1,2) = 0.5d0
		  xi(2,2) = 1.d0/6.d0
		  xi(3,2) = 1.d0/6.d0
		  xi(1,3) = 1.d0/6.d0
		  xi(2,3) = 0.5d0
		  xi(3,3) = 1.d0/6.d0
		  xi(1,4) = 1.d0/6.d0
		  xi(2,4) = 1.d0/6.d0
		  xi(3,4) = 0.5d0
		  xi(1,5) = 1.d0/6.d0
		  xi(2,5) = 1.d0/6.d0
		  xi(3,5) = 1.d0/6.d0
		  w(1) = -4.d0/30.d0
		  w(2:5) = 3.d0/40.d0
		else
		  write(IOW,*) ' Incorrect number of integration points for tetrahedral element '
		  write(IOW, *) ' called with ',npoints
		  stop
        endif
      else if ( knode == 8 .or. knode == 20 ) then
        if (npoints == 1) then
          xi(1,1) = 0.D0
          xi(2,1) = 0.D0
          xi(3,1) = 0.D0
		  w(1) = 8.D0
        else if (npoints == 8) then
          x1D(1) = -0.5773502692
		  x1D(2) =  0.5773502692
          do k = 1,2
            do j = 1,2
              do i = 1,2 
			    n = 4*(k-1) + 2*(j-1) + i
                xi(1,n) = x1D(i)
                xi(2,n) = x1D(j)
                xi(3,n) = x1D(k)
              end do
            end do
          end do
		  w(1:8) = 1.D0
        else if (npoints == 27) then
          x1D(1) = -0.7745966692
		  x1D(2) = 0.
		  x1D(3) = 0.7745966692
          w1D(1) = 0.5555555555D0
		  w1D(2) = 0.888888888D0
		  w1D(3) = 0.55555555555D0
          do k = 1,3 
            do j = 1,3
              do i = 1,3
                n = 9*(k-1) + 3*(j-1) + i
                xi(1,n) = x1D(i)
                xi(2,n) = x1D(j)
                xi(3,n) = x1D(k)
				w(n) = w1D(i)*w1D(j)*w1D(k)
              end do
            end do
          end do
       else if (npoints == 64) then
         x1D(1) = .8611363115940526D+00
         x1D(2) = .3399810435848563D+00
         x1D(3) = -.3399810435848563D+00
         x1D(4) = -.8611363115940526D+00
         w1D(1) = .3478548451374538D+00
         w1D(2) = .6521451548625461D+00
         w1D(3) = .6521451548625461D+00
         w1D(4) = .3478548451374538D+00
          do k = 1,4
            do j = 1,4
              do i = 1,4
                n = 16*(k-1) + 4*(j-1) + i
                xi(1,n) = x1D(i)
                xi(2,n) = x1D(j)
                xi(3,n) = x1D(k)
				w(n) = w1D(i)*w1D(j)*w1D(k)
              end do
            end do
          end do
        endif
      endif
end subroutine intpts_3d
!


!============================SUBROUTINE INTERP =====================
subroutine interp(ncoor, knode, xloc, pq, x)
  use Types
  implicit none

  integer, intent( in )         :: ncoor                        
  integer, intent( in )         :: knode                        
  real( prec ), intent( in )    :: xloc(ncoor, knode)           
  real( prec ), intent( inout ) :: pq(*)                   
  real( prec ), intent( out )   :: x(*)                    

  ! Local Variables
  real( prec ) :: f
  integer      :: i, n

  dimension  f(20)

  !     Subroutine to calculate physical co-ords at local co-ords within
  !     an element

  !     KNODE      No. nodes on element
  !     XLOC(I,J)  Ith coord at Jth node
  !     PQ(I)      Ith local co-ord
  !     X(I)       Ith physical co-ord at current local co-ord

  if (ncoor==2) then

    call shape_2d(knode, pq, f)
  else
    call shape_3d(knode,pq,f)
  endif

  do i = 1, ncoor
    x(i) = 0.D0
    do n = 1, knode
      x(i) = x(i) + xloc(i, n)*f(n)
    end do
  end do

  return

end subroutine interp


!============================SUBROUTINE X2XI =====================
subroutine x2xi(ncoor, knode, xloc, x, pq)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: ncoor                        
  integer, intent( in )         :: knode                        
  real( prec ), intent( in )    :: xloc(ncoor, *)           
  real( prec ), intent( inout ) :: pq(*)                   
  real( prec ), intent( inout ) :: x(*)                    

  ! Local Variables
  real( prec ) :: f3(20),df3(20,3),xjac3(3,3),xxi3(3),err,tol,work(3),dpq(3)
  real( prec ) :: f2(20),df2(20,2),xjac2(2,2),xxi2(2)
  integer      :: i,j, n,iter,maxit,ifail

  !     Subroutine to calculate local coords at given co-ords within
  !     an element

  !     KNODE      No. nodes on element
  !     XLOC(I,J)  Ith coord at Jth node
  !     PQ(I)      Ith local co-ord
  !     X(I)       Ith physical co-ord at current local co-ord

  pq(1:ncoor) = 0.d0
  maxit = 20
  tol = 1.d-08
  do iter = 1,maxit
    if (ncoor==2) then

      call shape_2d(knode, pq, f2)
      call dshape_2d(knode, pq, df2)
      xjac2 = 0.d0
      do i = 1, ncoor
        xxi2(i) = x(i)
        do n = 1, knode
          xxi2(i) = xxi2(i) - xloc(i, n)*f2(n)
          xjac2(i,j) = 0.d0
          do j = 1,ncoor
            xjac2(i,j) = xjac2(i,j) + df2(n,j)*xloc(i,n)
          end do
        end do
      end do
      err = dsqrt(dot_product(xxi2,xxi2))    

    else
      call shape_3d(knode,pq,f3)
      call dshape_3d(knode,pq,df3)
      xjac3 = 0.d0
      do i = 1, ncoor
        xxi3(i) = x(i)
          do n = 1, knode
          xxi3(i) = xxi3(i) - xloc(i, n)*f3(n)
          do j = 1,3
            xjac3(i,j) = xjac3(i,j) + df3(n,j)*xloc(i,n)
          end do
        end do
      end do
      err = dsqrt(dot_product(xxi3,xxi3))
    endif

    if (err<tol) return
    
    if (ncoor==2) then
      call glin(2, xjac2, 2, xxi2, dpq, work, ifail)    
    else if (ncoor==3) then    
      call glin(3, xjac3, 3, xxi3, dpq, work, ifail)
    endif
    
    if (ifail==1) then
       write(IOW,*) ' Error detected in subroutine x2xi '
       write(IOW,*) ' Jacobian matrix is singular - unable to locate point within element '
       stop
    endif
    pq(1:ncoor) = pq(1:ncoor) + dpq(1:ncoor) 
   
  end do

  write(IOW,*) ' Error in subroutine x2xi '
  write(IOW,*) ' Unable to compute local coords '
  stop

end subroutine x2xi

!===========================SUBROUTINE INVERT ========================

subroutine invert(iwsiz, w, winv, nord, bmax, xmax, work1, work2, ifail)
  use Types
  implicit none

  integer                       :: iwsiz                         
  integer, intent( in )         :: nord                          
  integer, intent( inout )      :: ifail                         
  real( prec ), intent( in )    :: w(iwsiz, iwsiz)               
  real( prec ), intent( out )   :: winv(iwsiz, iwsiz)            
  real( prec ), intent( out )   :: bmax(*)                       
  real( prec ), intent( inout ) :: xmax(*)                       
  real( prec ), intent( out )   :: work1(iwsiz, iwsiz)           
  real( prec ), intent( inout ) :: work2(*)                      

  ! Local Variables
  integer :: i, j, k

  ! Subroutine to invert matrix w(i,j), result is returned in winv(i,j).

  do i = 1, nord
    do j = 1, nord
      bmax(j) = 0.D0
      do k = 1, nord
        work1(k, j) = w(k, j)
      end do
    end do
    bmax(i) = 1.D0
    call glin(iwsiz, work1, nord, bmax, xmax, work2, ifail)
    do j = 1, nord
      winv(i, j) = xmax(j)
    end do
  end do

  return
end subroutine invert


!==============================SUBROUTINE GLIN ============================
subroutine glin(iwsiz, w, nord, bmax, xmax, work, ifail)
  use Types
  implicit none

  integer, intent( inout )      :: iwsiz                     
  integer, intent( in )         :: nord                      
  integer, intent( out )        :: ifail                     
  real( prec ), intent( inout ) :: w(iwsiz, iwsiz)           
  real( prec ), intent( in )    :: bmax(*)                   
  real( prec ), intent( inout ) :: xmax(*)                   
  real( prec ), intent( out )   :: work(*)                   

  ! Local Variables
  real( prec ) :: cm, r, wmax, wtemp
  integer      :: i, imax, j, k, nmax

  ifail = 0
  nmax = nord

  ! Subroutine to solve bmax(j) = w(i,j)*xmax(i) by Gauss Elimination
  ! with partial pivoting. (Note: w is destroyed during pivoting,
  ! but bmax remains intact
  ! Argument List: 
  !   nord  --- specifies order of matrix w.
  !   work  --- used as work space.
  !   ifail --- set to 0 on succesful exit.

  do i = 1, nmax
    work(i) = bmax(i)
  end do

  do k = 1, nmax

    !     FIND PIVOT

    imax = 0
    wmax = 0.D0
    do i = k, nmax
      if ( dabs(w(k, i))>wmax ) then
        imax = i
        wmax = dabs(w(k, i))
      end if
    end do

    !     TEST FOR ZERO PIVOT

    if ( wmax<1.D-15 ) then
      ifail = 1
      cycle
    end if

    !     INTERCHANGE ROWS OF MATRIX AND RHS

    do j = 1, nmax
      wtemp = w(j, k)
      w(j, k) = w(j, imax)
      w(j, imax) = wtemp
    end do
    wtemp = work(k)
    work(k) = work(imax)
    work(imax) = wtemp

    !     PERFORM GAUSS ELIMINATION

    do i = k + 1, nmax
      cm = w(k, i)/w(k, k)
      w(k, i) = cm
      do j = k + 1, nmax
        w(j, i) = w(j, i) - cm*w(j, k)
      end do
      work(i) = work(i) - cm*work(k)
    end do
  end do

  !     BACK SUBSTITUTION

  do i = nmax, 1, -1
    r = work(i)
    do j = i + 1, nmax
      r = r - w(j, i)*xmax(j)
    end do
    if ( dabs(w(i, i))<1.D-15 ) then
      ifail = 1
      return
    end if
    xmax(i) = r/w(i, i)
  end do

end subroutine glin


!==========================Subroutine CNSTRN ====================

subroutine cnstrn(mpc, mpctyp, idof, param, nparam, utmpc, dumpc,  &
     rmult, drmult, stfmpc, resmpc)
  use Types
  use ParamIO
  implicit none
  
  integer, intent( inout )      :: mpc                      
  integer, intent( inout )      :: mpctyp                   
  integer, intent( in )         :: nparam                   
  integer, intent( in )         :: idof(2)                  
  real( prec ), intent( in )    :: rmult                    
  real( prec ), intent( in )    :: drmult                   
  real( prec ), intent( in )    :: param(nparam)            
  real( prec ), intent( inout ) :: utmpc(2)                 
  real( prec ), intent( inout ) :: dumpc(2)                 
  real( prec ), intent( out )   :: stfmpc(3, 3)             
  real( prec ), intent( out )   :: resmpc(3)  
                
  if (nparam<1) then
     write(IOW,*) ' Error detected in subroutine CNSTRN '
	 write(IOW,*) ' Constraint requires a penalty compliance (small value)'
	 stop
  endif
 
  ! Subroutine to set up stiffness for multi--point constraint
  resmpc = 0.d0
  stfmpc = 0.d0
  stfmpc(3,3) = param(1)
!
  resmpc(1) = -rmult - drmult
  resmpc(2) = rmult + drmult
  resmpc(3) = (utmpc(2)+dumpc(2)-utmpc(1)-dumpc(1)-(rmult+drmult)*param(1))
  stfmpc(1, 3) = 1.D0
  stfmpc(3, 1) = 1.D0
  stfmpc(2, 3) = -1.D0
  stfmpc(3, 2) = -1.D0

end subroutine cnstrn
