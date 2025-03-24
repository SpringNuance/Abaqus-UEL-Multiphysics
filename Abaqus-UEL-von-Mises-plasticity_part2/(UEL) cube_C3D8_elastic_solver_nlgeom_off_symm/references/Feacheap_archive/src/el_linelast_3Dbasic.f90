!     Subroutines for basic 3D linear elastic elements 

!==========================SUBROUTINE el_linelast_3dbasic ==============================
subroutine elstif_linelast_3Dbasic(lmn,iep,nnode, props, nprop, coords, u_current, du_current, svart,  &
     svaru, nsvars, amatrx, rhs, ndofel)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: lmn
  integer, intent( in )         :: iep
  integer, intent( in )         :: nnode                                
  integer, intent( in )         :: nprop                                
  integer, intent( in )         :: nsvars                               
  integer, intent( in )         :: ndofel                               
  real( prec ), intent( inout ) :: props(nprop)                         
  real( prec ), intent( inout ) :: coords(3, nnode)                       
  real( prec ), intent( inout ) :: u_current(3, nnode)                      
  real( prec ), intent( inout ) :: du_current(3, nnode)                      
  real( prec ), intent( in )    :: svart(nsvars)                        
  real( prec ), intent( out )   :: svaru(nsvars)                        
  real( prec ), intent( out )   :: amatrx(ndofel, ndofel)                 
  real( prec ), intent( out )   :: rhs(ndofel)                        

  ! Local Variables
  integer      :: i,j,k,l, knode, ib, icol, ii,ik, irow, ninpt,kinpt,ifail


  real (prec)  ::  xi(3,27), weight(27), x(3)
  real (prec)  ::  N_deriv_local_kinpt(20,3),N_deriv_global_kinpt(20,3),N_shape_local_kinpt(20)
  real (prec)  ::  stran(3,3),dstran(3,3), stress(3,3)
  real (prec)  ::  ddsdde(3,3,3,3)
  real (prec)  ::  xjac(3,3),djac,xjaci(3,3)
  real (prec)  ::  work1(3, 3), work2(3), work3(3), work4(3)       ! Workspace arrays

  !
  !     Subroutine to compute element stiffness matrix and residual force vector for 3D linear elastic elements

  !     IEP            Element property flag
  !     nnode         No. nodes on element
  !     coords(I,J)      Ith co-ord on Jth node of element
  !     u_current(I,J)     Ith total DOF on jth node of element
  !     du_current(I,J)     Increment in Ith DOF on jth node of element

  !     amatrx(I,J)      Element stiffness matrix
  !     rhs(J)       Element contribution to residual

  !     El props are:

  !     props(1)         Young's modulus
  !     props(2)         Poisson's ratio
  !     props(3)         Thermal expansion coefficient


    if (nnode == 4) ninpt = 1
    if (nnode == 10) ninpt = 4
    if (nnode == 8) ninpt = 8
    if (nnode == 20) ninpt = 27

    call intpts_3d(xi,weight,nnode,ninpt)

    rhs = 0.d0
	amatrx = 0.d0

!     --  Loop over integration points
    do kinpt = 1, ninpt

! Compute shape function derivatives wrt local coords

        call shape_3d(nnode,xi(1,kinpt),N)
        call dshape_3d(nnode,xi(1,kinpt),N_deriv_local_kinpt)         
 
        x = 0.d0
        do idim = 1,3
            do knode = 1,nnode
                x(i) = x(i) + coords(i,knode)*N_shape_local_kinpt(knode)
            end do
        end do

!   Compute Jacobian matrix and its determinant
    xjac = 0.d0
    do idim = 1,3
        do jdim = 1,3
            do knode = 1,nnode
                xjac(idim,jdim) = xjac(idim,jdim) + coords(idim,knode)*N_deriv_local_kinpt(knode,jdim)
            end do
        end do
    end do
 
       djac = xjac(1,1)*(xjac(2,2)*xjac(3,3)-xjac(3,2)*xjac(2,3)) &
	       - xjac(1,2)*(xjac(2,1)*xjac(3,3)-xjac(2,3)*xjac(3,1)) &
		   + xjac(1,3)*(xjac(2,1)*xjac(3,2)-xjac(3,1)*xjac(2,2))

!     Compute shape function derivatives wrt spatial coords

       call invert(3,xjac,xjaci,3, work3, work4, work1, work2, ifail)

	   if (ifail==1) then
	     write(IOW,1003) lmn,kinpt
1003     Format(//' *** Error in subroutine el_linelast_3dbasic.f90 *** '// &
                  ' Unable to invert jacobian matrix for element ',i4/ &
                  ' at integration point ',i4)
		 stop
	   endif

       N_deriv_global_kinpt = 0.d0
       do idim = 1,3
         do jdim = 1,3
           do knode = 1,nnode
              N_deriv_global_kinpt(knode,idim) = N_deriv_global_kinpt(knode,idim) + N_deriv_local_kinpt(knode,jdim)*xjaci(j,idim)
            end do
         end do
       end do
      
!      Compute the stran and stran increment (this step is not really necessary, but
!      is included to make generalizing the element to nonlinear materials easier)

        stran = 0.d0
        dstran = 0.d0
        do idim = 1,3
            do jdim = 1,3
                do knode = 1,nnode
                    stran(idim,jdim) = stran(idim,jdim)   + 0.5d0*(u_current(idim,knode)*N_deriv_global_kinpt(knode,jdim) + u_current(jdim,knode)*N_deriv_global_kinpt(knode,idim))
                    dstran(idim,jdim) = dstran(idim,jdim) + 0.5d0*(du_current(idim,knode)*N_deriv_global_kinpt(knode,jdim) + du_current(jdim,knode)*N_deriv_global_kinpt(knode,idim))
                end do
            end do
        end do
!
!     Calculate the stress and tangent matrix

        call linelast_3d_stress(stran, dstran, props, nprop, stress)
        call linelast_3D_tangent(stran, dstran, props, nprop, ddsdde)
!

    !     --   RESIDUAL F(J,N)

        irow = 0
        do knode = 1, nnode
            do ii = 1, 3
                irow = irow + 1
                do i = 1, 3
                    rhs(irow) = rhs(irow) - stress(ii, i)*N_deriv_global_kinpt(knode, i)*weight(kinpt)*djac
                end do
            end do
        end do

    !     --   Stiffness K(I,A,K,B) U(K,B) = F(I,A)
    !     Stiffness stored as amatrx(IROW,ICOL)*U(ICOL) = F(IROW)

        icol = 0
        do ib = 1, nnode
            do ik = 1, 3
                icol = icol + 1
                irow = 0
                do knode = 1, nnode
                    do ii = 1, 3
                        irow = irow + 1
                        do j = 1, 3
                            do l = 1, 3
                                amatrx(irow,icol) = amatrx(irow,icol) +   &
                                weight(kinpt)*djac*N_deriv_global_kinpt(knode, j) *ddsdde(ii, j, ik, l)*N_deriv_global_kinpt(ib, l)
                            end do
                        end do
                    end do
                end do
            end do
        end do

    end do

  svaru = svart       ! State variables are not used in this element, but updated anyway

  return
end subroutine elstif_linelast_3Dbasic



!===================== linelast_3d_stress ========================

subroutine linelast_3d_stress(stran,dstran, props, nprop, stress)
  use Types
  use Globals, only : BTEMP, BTINC
  implicit none

  integer, intent( in )       :: nprop                          
  real( prec ), intent( in )  :: stran(3, 3)
  real( prec ), intent( in )  :: dstran(3, 3)                         
  real( prec ), intent( in )  :: props(nprop)                   
  real( prec ), intent( out ) :: stress(3, 3)                     

  ! Local Variables
  real( prec ) :: E, xnu, excoef, devol
  integer :: i


  E = props(1)
  xnu = props(2)
  excoef = 0.d0
  if ( nprop == 3 ) excoef = props(3)
  
  stress = (stran+dstran)*E/(1+xnu)

  devol = stran(1,1) + stran(2,2) + stran(3,3) + dstran(1,1) + dstran(2,2) + dstran(3,3)
  do idim = 1,3
    stress(i,i) = stress(i,i) + E*xnu*devol/(1.d0+xnu)/(1.d0-2.d0*xnu) - &
	                            E*excoef*(BTEMP+BTINC)/(1.d0-2.d0*xnu)
  end do

  return

end subroutine linelast_3d_stress


!=====================SUBROUTINE linelast_3D_tangent ========================
subroutine linelast_3D_tangent(stran,dstran, props, nprop, ddsdde)
  use Types
  implicit none

  integer, intent( in )         :: nprop                         
  real( prec ), intent( inout ) :: stran(3, 3)
  real( prec ), intent( inout ) :: dstran(3, 3)                           
  real( prec ), intent( in )    :: props(nprop)                  
  real( prec ), intent( out )   :: ddsdde(3, 3, 3, 3)                 

  ! Local Variables
  real( prec )   E, xnu, mu, c11, c22, c44
  integer :: i, j


  E = props(1)
  xnu = props(2)
  mu = 0.5D0*E/(1+xnu)
  c11 = (1.D0-xnu)*E/( (1+xnu)*(1-2.D0*xnu) )
  c22 = xnu*E/( (1+xnu)*(1-2.D0*xnu) )
  c44 = mu
  ddsdde = 0.D0
  do idim = 1,3
    do jdim = 1,3
	  if (i==j) then
	    ddsdde(i,i,j,j) = c11
	  else
	    ddsdde(i,i,j,j) = c22
		ddsdde(i,j,i,j) = c44
		ddsdde(j,i,i,j) = c44
	  endif
	enddo
  enddo

  return
end subroutine linelast_3D_tangent


!==========================SUBROUTINE state_linelast_3dbasic ==============================
subroutine state_linelast_3dbasic(lmn,iep,nnode, props, nprop, coords, u_current, du_current, svart,  &
     svaru, nsvars, stat, nstat)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: lmn
  integer, intent( in )         :: iep
  integer, intent( in )         :: nnode                                
  integer, intent( in )         :: nprop                                
  integer, intent( in )         :: nsvars                               
  integer, intent( in )         :: nstat                              
  real( prec ), intent( inout ) :: props(nprop)                         
  real( prec ), intent( inout ) :: coords(3, nnode)                       
  real( prec ), intent( inout ) :: u_current(3, nnode)                      
  real( prec ), intent( inout ) :: du_current(3, nnode)                      
  real( prec ), intent( in )    :: svart(nsvars)                        
  real( prec ), intent( in )   :: svaru(nsvars)                        
  real( prec ), intent( out )   :: stat(nstat, nnode)                       

  ! Local Variables
  integer      :: i,j,k,l, knode, ib, icol, ii,ik, irow, ninpt,kinpt,ifail
  real (prec) :: stran_vol

  real (prec)  ::  xi(3,27), weight(27), x(3)
  real (prec)  ::  N_shape_local_kinpt(20), N_deriv_local_kinpt(20,3),N_deriv_global_kinpt(20,3)
  real (prec)  ::  stran(3,3),dstran(3,3), stress(3,3),stran_dev(3,3)
  real (prec)  ::  xjac(3,3),djac,xjaci(3,3)
  real (prec)  ::  work1(3, 3), work2(3), work3(3), work4(3)       ! Workspace arrays

  !
  !     Subroutine to compute element stiffness matrix and residual force vector for 3D linear elastic elements

  !     IEP            Element property flag
  !     nnode         No. nodes on element
  !     coords(I,J)      Ith co-ord on Jth node of element
  !     u_current(I,J)     Ith total DOF on jth node of element
  !     du_current(I,J)     Increment in Ith DOF on jth node of element

  !     El props are:

  !     props(1)         Young's modulus
  !     props(2)         Poisson's ratio
  !     props(3)         Thermal expansion coefficient




    if (nnode == 4) ninpt = 1
    if (nnode == 10) ninpt = 4
    if (nnode == 8) ninpt = 8
    if (nnode == 20) ninpt = 27

     call intpts_3d(xi,w,nnode,ninpt)



    stat = 0.d0 
!     --  Loop over integration points
    do kinpt = 1, ninpt

! Compute shape function derivatives wrt local coords

       call shape_3d(nnode,xi(1,kinpt),N)
       call dshape_3d(nnode,xi(1,kinpt),N_deriv_local_kinpt)         
 
       x = 0.d0
       do idim = 1,3
         do knode = 1,nnode
            x(i) = x(i) + coords(i,knode)*N_shape_local_kinpt(knode)
         end do
       end do

!      Compute Jacobian matrix and its determinant
       xjac = 0.d0
       do idim = 1,3
         do jdim = 1,3
           do knode = 1,nnode
              xjac(idim,jdim) = xjac(idim,jdim) + coords(i,knode)*N_deriv_local_kinpt(knode,j)
            end do
         end do
       end do
 
       djac = xjac(1,1)*(xjac(2,2)*xjac(3,3)-xjac(3,2)*xjac(2,3)) &
	       - xjac(1,2)*(xjac(2,1)*xjac(3,3)-xjac(2,3)*xjac(3,1)) &
		   + xjac(1,3)*(xjac(2,1)*xjac(3,2)-xjac(3,1)*xjac(2,2))

!     Compute shape function derivatives wrt spatial coords

       call invert(3,xjac,xjaci,3, work3, work4, work1, work2, ifail)

	   if (ifail==1) then
	     write(IOW,1003) lmn,kinpt
1003     Format(//' *** Error in subroutine el_linelast_3dbasic.f90 *** '// &
                  ' Unable to invert jacobian matrix for element ',i4/ &
                   ' at integration point ',i4)
		 stop
	   endif

       N_deriv_global_kinpt = 0.d0
       do idim = 1,3
         do jdim = 1,3
           do knode = 1,nnode
              N_deriv_global_kinpt(knode,i) = N_deriv_global_kinpt(knode,i) + N_deriv_local_kinpt(knode,j)*xjaci(j,i)
            end do
         end do
       end do
      
!      Compute the strain and strain increment (this step is not really necessary, but
!      is included to make generalizing the element to nonlinear materials easier)

      stran = 0.d0
	  dstran = 0.d0
      do idim = 1,3
	     do jdim = 1,3
		    do knode = 1,nnode
			   stran(idim,jdim) = stran(idim,jdim)   + 0.5d0*(u_current(i,knode)*N_deriv_global_kinpt(knode,j) + u_current(j,knode)*N_deriv_global_kinpt(knode,i))
			   dstran(idim,jdim) = dstran(idim,jdim) + 0.5d0*(du_current(i,knode)*N_deriv_global_kinpt(knode,j) + du_current(j,knode)*N_deriv_global_kinpt(knode,i))
			end do
		 end do
	  end do
!
!     Calculate the stress and tangent matrix

      call linelast_3d_stress(stran,dstran, props, nprop, stress)
!
      call shape_3d(nnode,xi(1,kinpt),N)  
      strain_vol = (stran(1,1) + dstran(1,1) + stran(2,2) + dstran(2,2) + stran(3,3) + dstran(3,3))/3.d0
      stran_dev = stran + dstran
      stran_dev(1,1) = stran_dev(1,1) - strain_vol
      stran_dev(2,2) = stran_dev(2,2) - strain_vol
      stran_dev(3,3) = stran_dev(3,3) - strain_vol
 
      do knode = 1, nnode
        stat(1, knode) = stat(1, knode) + stress(1, 1)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
        stat(2, knode) = stat(2, knode) + stress(2, 2)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
        stat(3, knode) = stat(3, knode) + stress(3, 3)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
        stat(4, knode) = stat(4, knode) + stress(1, 2)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
        stat(5, knode) = stat(5, knode) + stress(1, 3)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
        stat(6, knode) = stat(6, knode) + stress(2, 3)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
        if (nstat>6) then
          stat(7, knode) = stat(7, knode) + stran_dev(1, 1)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
          stat(8, knode) = stat(8, knode) + stran_dev(2, 2)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
          stat(9, knode) = stat(9, knode) + stran_dev(3, 3)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
          stat(10, knode) = stat(10, knode) + stran_dev(1, 2)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
          stat(11, knode) = stat(11, knode) + stran_dev(1, 3)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
          stat(12, knode) = stat(12, knode) + stran_dev(2, 3)*N_shape_local_kinpt(knode)*weight(kinpt)*djac
        endif
      end do

    end do


  return
end subroutine state_linelast_3Dbasic

!==========================SUBROUTINE elforc_linelast_3dbasic ==============================
subroutine elforc_linelast_3Dbasic(lmn,iep,nnode, props, nprop, coords, u_current, du_current, svart,  &
     svaru, nsvars, rhs, MAXFOR)
  use Types
  use ParamIO
  implicit none

  integer, intent( in )         :: lmn
  integer, intent( in )         :: iep
  integer, intent( in )         :: nnode                                
  integer, intent( in )         :: nprop                                
  integer, intent( in )         :: nsvars                               
  integer, intent( in )         :: MAXFOR                             
  real( prec ), intent( inout ) :: props(nprop)                         
  real( prec ), intent( inout ) :: coords(3, nnode)                       
  real( prec ), intent( inout ) :: u_current(3, nnode)                      
  real( prec ), intent( inout ) :: du_current(3, nnode)                      
  real( prec ), intent( in )    :: svart(nsvars)                        
  real( prec ), intent( out )   :: svaru(nsvars)                        
              
  real( prec ), intent( out )   :: rhs(MAXFOR)                        

  ! Local Variables
  integer      :: i,j,k,l, knode, ib, icol, ii,ik, irow, ninpt,kinpt,ifail

  real (prec)  ::  xi(3,27), weight(27)
  real (prec)  ::  N_deriv_local_kinpt(20,3),N_deriv_global_kinpt(20,3)
  real (prec)  ::  stran(3,3),dstran(3,3), stress(3,3)
  real (prec)  ::  ddsdde(3,3,3,3)
  real (prec)  ::  xjac(3,3),djac,xjaci(3,3)
  real (prec)  ::  work1(3, 3), work2(3), work3(3), work4(3)       ! Workspace arrays

  !
  !     Subroutine to compute residual force vector for 3D linear elastic elements

  !     IEP            Element property flag
  !     nnode         No. nodes on element
  !     coords(I,J)      Ith co-ord on Jth node of element
  !     u_current(I,J)     Ith total DOF on jth node of element
  !     du_current(I,J)     Increment in Ith DOF on jth node of element

  !     STIF(I,J)      Element stiffness matrix
  !     rhs(J)       Element contribution to residual

  !     El props are:

  !     props(1)         Young's modulus
  !     props(2)         Poisson's ratio
  !     props(3)         Thermal expansion coefficient

    if (nnode == 4) ninpt = 1
    if (nnode == 10) ninpt = 4
    if (nnode == 8) ninpt = 8
    if (nnode == 20) ninpt = 27

     call intpts_3d(xi,weight,nnode,ninpt)

    rhs = 0.d0

    !   --  Loop over integration points
    do kinpt = 1, ninpt

    ! Compute shape function derivatives wrt local coords

        call dshape_3d(nnode,xi(1,kinpt),N_deriv_local_kinpt)         

!       Compute Jacobian matrix and its determinant
        xjac = 0.d0
        do idim = 1,3
            do jdim = 1,3
                do knode = 1,nnode
                    xjac(idim,jdim) = xjac(idim,jdim) + coords(idim,knode) * N_deriv_local_kinpt(knode,jdim)
                end do
            end do
        end do
 
        djac = xjac(1,1)*(xjac(2,2)*xjac(3,3)-xjac(3,2)*xjac(2,3)) &
	         - xjac(1,2)*(xjac(2,1)*xjac(3,3)-xjac(2,3)*xjac(3,1)) &
		     + xjac(1,3)*(xjac(2,1)*xjac(3,2)-xjac(3,1)*xjac(2,2))

!     Compute shape function derivatives wrt spatial coords

        call invert(3,xjac,xjaci,3, work3, work4, work1, work2, ifail)

        if (ifail==1) then
            write(IOW,1003) lmn,kinpt
            Format(//' *** Error in subroutine elforc_linelast_3dbasic.f90 *** '// &
                        ' Unable to invert jacobian matrix for element ',i4/ &
                        ' at integration point ',i4)
            stop
        endif

        N_deriv_global_kinpt = 0.d0
        do idim = 1,3
            do jdim = 1,3
                do knode = 1,nnode
                    N_deriv_global_kinpt(knode,idim) = N_deriv_global_kinpt(knode,idim) + &
                        N_deriv_local_kinpt(knode,jdim)*xjaci(jdim,idim)
                end do
            end do
        end do
      
!      Compute the strain and strain increment (this step is not really necessary, but
!      is included to make generalizing the element to nonlinear materials easier)

        stran = 0.d0
        dstran = 0.d0
        do idim = 1,3
            do jdim = 1,3
                do knode = 1,nnode
                    stran(idim,jdim) = stran(idim,jdim)   + 0.5d0*(u_current(idim,knode)*N_deriv_global_kinpt(knode,jdim) + u_current(jdim,knode)*N_deriv_global_kinpt(knode,idim))
                    dstran(idim,jdim) = dstran(idim,jdim) + 0.5d0*(du_current(idim,knode)*N_deriv_global_kinpt(knode,jdim) + du_current(jdim,knode)*N_deriv_global_kinpt(knode,idim))
                end do
            end do
        end do
!
!       Calculate the stress and tangent matrix

        call linelast_3d_stress(stran,dstran, props, nprop, stress)
!

    !     --   RESIDUAL F(J,N)

        irow = 0
        do knode = 1, nnode
            do ii = 1, 3
                irow = irow + 1
                do i = 1, 3
                    rhs(irow) = rhs(irow) - stress(ii, i)*N_deriv_global_kinpt(knode, i)*weight(kinpt)*djac
                end do
            end do
        end do

 
    end do

    svaru = svart       ! State variables are not used in this element, but updated anyway

return
end subroutine elforc_linelast_3Dbasic
