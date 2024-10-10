! User element subroutine for the phase field model for corrosion    
! Plane strai version (CPE4 and CPE8R elements)
! The code is distributed under a BSD license     
      
! If using this code for research or industrial purposes, please cite:
! C. Cui, R. Ma and E. Martinez-Paneda, 
! A phase field formulation for dissolution-driven stress corrosion cracking. 
! Journal of the Mechanics and Physics of Solids 147, 104254 (2021)
! doi: https://doi.org/10.1016/j.jmps.2020.104254.

      module kvisual
      implicit none
      real*8 UserVar(8,30,70000)
      integer nelem
      save
      end module
      
!***********************************************************************
      subroutine uexternaldb(lop,lrestart,time,dtime,kstep,kinc)
      include 'aba_param.inc' 
      !implicit real(a-h o-z)
      dimension time(2)
      if (lop.eq.0) then !start of analysis
       call mutexinit(1)
      endif
      return
      end 
      
!***********************************************************************
      subroutine uel(rhs,amatrx,svars,energy,ndofel,nrhs,nsvars,
     1 props,nprops,coords,mcrd,nnode,u,du,v,a,jtype,time,dtime,
     2 kstep,kinc,jelem,params,ndload,jdltyp,adlmag,predef,npredf,
     3 lflags,mlvarx,ddlmag,mdload,pnewdt,jprops,njpro,period)

      use kvisual
      include 'aba_param.inc' 
      !implicit real(a-h o-z)
      
      dimension rhs(mlvarx,*),amatrx(ndofel,ndofel),props(*),svars(*),
     1 energy(*),coords(mcrd,nnode),u(ndofel),du(mlvarx,*),v(ndofel),
     2 a(ndofel),time(2),params(*),jdltyp(mdload,*),adlmag(mdload,*),
     3 ddlmag(mdload,*),predef(2,npredf,nnode),lflags(*),jprops(*)

      parameter(ndim=3,ntens=6,ndi=3,nshr=3,ninpt=8,nsvint=30,ndof=3) !C3D8
      
      dimension wght(ninpt),dN(nnode,1),dNdz(ndim,nnode),stress(ntens),
     1 dNdx(ndim,nnode),b(ntens,nnode*ndim),ddsdde(ntens,ntens),
     2 stran(ntens),dstran(ntens),
     3 statevLocal(nsvint),eelas(ntens),eplas(ntens),flow(ntens)
        
!     initialising
      do k1=1,ndofel
       rhs(k1,1)=0.d0
      end do
      amatrx=0.d0
      wght=1.d0
      
!     find number of elements          
      if (dtime.eq.0.d0) then
       if (jelem.eq.1) then   
        nelem=jelem
       else
        CALL MutexLock(1)
        if (jelem.gt.nelem) nelem=jelem 
        CALL MutexUnlock(1)
       endif 
      endif      
      
      do kintk=1,ninpt
!     evaluate shape functions and derivatives
       call kshapefcn(kintk,ninpt,nnode,ndim,dN,dNdz)
       !  kshapefcn(kintk,ninpt,nnode,ndim,dN,dNdz)
       call kjacobian(jelem,ndim,nnode,coords,dNdz,djac,dNdx,mcrd)
       ! kjacobian(jelem,ndim,nnode,coords,dNdz,djac,dNdx,mcrd)
       call kbmatrix(dNdx,ntens,nnode,ndim,b)
    ! kbmatrix(dNdx,ntens,nnode,ndim,b)
       dvol=wght(kintk)*djac                   
       
       dstran=matmul(b,du(1:ndim*nnode,1))

!     recover and assign state variables
       call kstatevar(kintk,nsvint,svars,statevLocal,1)
       stress=statevLocal(1:ntens)
       stran(1:ntens)=statevLocal((ntens+1):(2*ntens))
       eelas(1:ntens)=statevLocal((2*ntens+1):3*ntens)
       
!     call umat to obtain stresses and constitutive matrix
       call kumat(props,ddsdde,stress,dstran,ntens,statevLocal,eelas,
     1 spd,xkap,Sh0,eqplas,deqpl)
    !    subroutine kumat(props,ddsdde,stress,dstran,ntens,statev,eelas,
    !  1 spd,eqplas,deqpl)
       
!     store state variables
       statevLocal(1:ntens)=stress(1:ntens)
       statevLocal((ntens+1):(2*ntens))=statevLocal((ntens+1):(2*ntens))
     1 +dstran(1:ntens)
       

       call kstatevar(kintk,nsvint,svars,statevLocal,0) 

!     form and assemble stiffness matrix and internal force vector
       
       amatrx(1:24,1:24)=amatrx(1:24,1:24)+dvol*
     2 (matmul(matmul(transpose(b),ddsdde),b))
        
       rhs(1:24,1)=rhs(1:24,1)-
     1 dvol*(matmul(transpose(b),stress))        
       
    
! output
       UserVar(kintk,1:ntens,jelem)=stress(1:ntens)
       UserVar(kintk,(ntens+1):nsvint,jelem)=
     1 statevLocal((ntens+1):nsvint)
      
      end do       ! end loop on material integration points
      
      RETURN
      END

!***********************************************************************
      subroutine kshapefcn(kintk,ninpt,nnode,ndim,dN,dNdz)
c
      include 'aba_param.inc'
c
      parameter (gaussCoord=0.577350269d0)
      dimension dN(nnode,1),dNdz(ndim,*),coord38(3,8)

      data  coord38 /-1.d0, -1.d0, -1.d0,
     2                1.d0, -1.d0, -1.d0,
     3               -1.d0,  1.d0, -1.d0,
     4                1.d0,  1.d0, -1.d0,
     5               -1.d0, -1.d0,  1.d0,
     6                1.d0, -1.d0,  1.d0,
     7               -1.d0,  1.d0,  1.d0,
     8                1.d0,  1.d0,  1.d0/

!     determine (g,h,r)
       f=coord38(1,kintk)*gaussCoord
       g=coord38(2,kintk)*gaussCoord
       h=coord38(3,kintk)*gaussCoord

!     shape functions
       dN(1,1)=0.125d0*(1.d0-f)*(1.d0-g)*(1.d0-h)
       dN(2,1)=0.125d0*(1.d0+f)*(1.d0-g)*(1.d0-h)
       dN(3,1)=0.125d0*(1.d0+f)*(1.d0+g)*(1.d0-h)
       dN(4,1)=0.125d0*(1.d0-f)*(1.d0+g)*(1.d0-h)
       dN(5,1)=0.125d0*(1.d0-f)*(1.d0-g)*(1.d0+h)
       dN(6,1)=0.125d0*(1.d0+f)*(1.d0-g)*(1.d0+h)
       dN(7,1)=0.125d0*(1.d0+f)*(1.d0+g)*(1.d0+h)
       dN(8,1)=0.125d0*(1.d0-f)*(1.d0+g)*(1.d0+h)

!     derivative d(Ni)/d(f)
       dNdz(1,1)=-0.125d0*(1.d0-g)*(1.d0-h)
       dNdz(1,2)= 0.125d0*(1.d0-g)*(1.d0-h)
       dNdz(1,3)= 0.125d0*(1.d0+g)*(1.d0-h)
       dNdz(1,4)=-0.125d0*(1.d0+g)*(1.d0-h)
       dNdz(1,5)=-0.125d0*(1.d0-g)*(1.d0+h)
       dNdz(1,6)= 0.125d0*(1.d0-g)*(1.d0+h)
       dNdz(1,7)= 0.125d0*(1.d0+g)*(1.d0+h)
       dNdz(1,8)=-0.125d0*(1.d0+g)*(1.d0+h)

!     derivative d(Ni)/d(g)
       dNdz(2,1)=-0.125d0*(1.d0-f)*(1.d0-h)
       dNdz(2,2)=-0.125d0*(1.d0+f)*(1.d0-h)
       dNdz(2,3)= 0.125d0*(1.d0+f)*(1.d0-h)
       dNdz(2,4)= 0.125d0*(1.d0-f)*(1.d0-h)
       dNdz(2,5)=-0.125d0*(1.d0-f)*(1.d0+h)
       dNdz(2,6)=-0.125d0*(1.d0+f)*(1.d0+h)
       dNdz(2,7)= 0.125d0*(1.d0+f)*(1.d0+h)
       dNdz(2,8)= 0.125d0*(1.d0-f)*(1.d0+h)

!     derivative d(Ni)/d(h)
       dNdz(3,1)=-0.125d0*(1.d0-f)*(1.d0-g)
       dNdz(3,2)=-0.125d0*(1.d0+f)*(1.d0-g)
       dNdz(3,3)=-0.125d0*(1.d0+f)*(1.d0+g)
       dNdz(3,4)=-0.125d0*(1.d0-f)*(1.d0+g)
       dNdz(3,5)= 0.125d0*(1.d0-f)*(1.d0-g)
       dNdz(3,6)= 0.125d0*(1.d0+f)*(1.d0-g)
       dNdz(3,7)= 0.125d0*(1.d0+f)*(1.d0+g)
       dNdz(3,8)= 0.125d0*(1.d0-f)*(1.d0+g)


      return
      end

!***********************************************************************
      subroutine kjacobian(jelem,ndim,nnode,coords,dNdz,djac,dNdx,mcrd)
!     Notation: djac - Jac determinant; xjaci - inverse of Jac matrix
!     dNdx - shape functions derivatives w.r.t. global coordinates
      include 'aba_param.inc'

      dimension xjac(ndim,ndim),xjaci(ndim,ndim),coords(mcrd,nnode),
     1 dNdz(ndim,nnode),dNdx(ndim,nnode)

      xjac=0.d0

      do inod=1,nnode
       do idim=1,ndim
        do jdim=1,ndim
         xjac(jdim,idim)=xjac(jdim,idim)+
     1        dNdz(jdim,inod)*coords(idim,inod)
        end do
       end do
      end do

      if (ndim.eq.3) then

       djac=xjac(1,1)*xjac(2,2)*xjac(3,3)+xjac(2,1)*xjac(3,2)*xjac(1,3)
     & +xjac(3,1)*xjac(2,3)*xjac(1,2)-xjac(3,1)*xjac(2,2)*xjac(1,3)
     & -xjac(2,1)*xjac(1,2)*xjac(3,3)-xjac(1,1)*xjac(2,3)*xjac(3,2)
       if (djac.gt.0.d0) then ! jacobian is positive - o.k.
        xjaci(1,1)=(xjac(2,2)*xjac(3,3)-xjac(2,3)*xjac(3,2))/djac
        xjaci(1,2)=(xjac(1,3)*xjac(3,2)-xjac(1,2)*xjac(3,3))/djac
        xjaci(1,3)=(xjac(1,2)*xjac(2,3)-xjac(1,3)*xjac(2,2))/djac
        xjaci(2,1)=(xjac(2,3)*xjac(3,1)-xjac(2,1)*xjac(3,3))/djac
        xjaci(2,2)=(xjac(1,1)*xjac(3,3)-xjac(1,3)*xjac(3,1))/djac
        xjaci(2,3)=(xjac(1,3)*xjac(2,1)-xjac(1,1)*xjac(2,3))/djac
        xjaci(3,1)=(xjac(2,1)*xjac(3,2)-xjac(2,2)*xjac(3,1))/djac
        xjaci(3,2)=(xjac(1,2)*xjac(3,1)-xjac(1,1)*xjac(3,2))/djac
        xjaci(3,3)=(xjac(1,1)*xjac(2,2)-xjac(1,2)*xjac(2,1))/djac
       else ! negative or zero jacobian
        write(7,*)'WARNING: element',jelem,'has neg. Jacobian'
       endif

      else if (ndim.eq.2) then

       djac=xjac(1,1)*xjac(2,2)-xjac(1,2)*xjac(2,1)
       if (djac.gt.0.d0) then ! jacobian is positive - o.k.
        xjaci(1,1)=xjac(2,2)/djac
        xjaci(2,2)=xjac(1,1)/djac
        xjaci(1,2)=-xjac(1,2)/djac
        xjaci(2,1)=-xjac(2,1)/djac
       else ! negative or zero jacobian
        write(7,*)'WARNING: element',jelem,'has neg. Jacobian'
       endif

      endif

      dNdx=matmul(xjaci,dNdz)

      return
      end

!***********************************************************************
      subroutine kbmatrix(dNdx,ntens,nnode,ndim,b)
!     Notation, strain tensor: e11, e22, e33, e12, e13, e23
      include 'aba_param.inc'

      dimension dNdx(ndim,nnode),b(ntens,nnode*ndim)

      b=0.d0
      do inod=1,nnode
       b(1,ndim*inod-ndim+1)=dNdx(1,inod)
       b(2,ndim*inod-ndim+2)=dNdx(2,inod)
       b(4,ndim*inod-ndim+1)=dNdx(2,inod)
       b(4,ndim*inod-ndim+2)=dNdx(1,inod)
       if (ndim.eq.3) then
        b(3,ndim*inod)=dNdx(3,inod)
        b(5,ndim*inod-2)=dNdx(3,inod)
        b(5,ndim*inod)=dNdx(1,inod)
        b(6,ndim*inod-1)=dNdx(3,inod)
        b(6,ndim*inod)=dNdx(2,inod)
       endif
      end do

      return
      end


c*****************************************************************
      subroutine kstatevar(npt,nsvint,statev,statev_ip,icopy)
c
c     Transfer data to/from element-level state variable array from/to
c     material-point level state variable array.
c
      include 'aba_param.inc'

      dimension statev(*),statev_ip(*)

      isvinc=(npt-1)*nsvint     ! integration point increment

      if (icopy.eq.1) then ! Prepare arrays for entry into umat
       do i=1,nsvint
        statev_ip(i)=statev(i+isvinc)
       enddo
      else ! Update element state variables upon return from umat
       do i=1,nsvint
        statev(i+isvinc)=statev_ip(i)
       enddo
      end if

      return
      end

c*****************************************************************
      subroutine kumat(props,ddsdde,stress,dstran,ntens,statev,eelas,
     1 spd,eqplas,deqpl)
c
c     Subroutine with the material model
c
      include 'aba_param.inc' !implicit real(a-h o-z)
      
      dimension props(*),ddsdde(ntens,ntens),stress(ntens),statev(*),
     + dstran(ntens),eelas(ntens),eplas(ntens),flow(ntens),olds(ntens),
     + oldpl(ntens), hard(3)
      
      parameter(toler=1.d-6,newton=20)  

      eelas(1:ntens)=statev((2*ntens+1):3*ntens)
      eplas(1:ntens)=statev((3*ntens+1):4*ntens)
      eqplas=statev(1+4*ntens)
      deqpl=statev(2+4*ntens)
      olds=stress
      oldpl=eplas
      
!     Initialization
      ddsdde=0.d0
      E=props(1) ! Young's modulus
      xnu=props(2) ! Poisson's ratio  
      
!     Build elastic stiffness matrix
      eg=E/(1.d0+xnu)/2.d0
      elam=(E/(1.d0-2.d0*xnu)-2.d0*eg)/3.d0
      
      do i=1,3
       do j=1,3
        ddsdde(j,i)=elam
       end do
       ddsdde(i,i)=2.d0*eg+elam
      end do
      do i=4,ntens
       ddsdde(i,i)=eg
      end do
      
!     Calculate predictor stress and elastic strain
      stress=stress+matmul(ddsdde,dstran)
      eelas=eelas+dstran
      
!     Calculate equivalent von Mises stress
      Smises=(stress(1)-stress(2))**2+(stress(2)-stress(3))**2
     1 +(stress(3)-stress(1))**2
      do i=4,ntens
       Smises=Smises+6.d0*stress(i)**2
      end do
      Smises=sqrt(Smises/2.d0)	 
      
!     Get yield stress from the specified Ehardening curve
      ! Sf=Sy*(1.d0+E*eqplas/Sy)**xn
      nvalue = 100
      call UHARD_von_Mises(syiel0, hard, eqplas, 
     1                           statev, nvalue, props(9))
!     Determine if active yielding
      if (Smises.gt.(1.d0+toler)*syiel0) then

!     Calculate the flow direction
       Sh=(stress(1)+stress(2)+stress(3))/3.d0
       flow(1:3)=(stress(1:3)-Sh)/Smises
       flow(4:ntens)=stress(4:ntens)/Smises
       
!     Solve for Smises and deqpl using Newton's method
       deqpl=0.d0
       syield = syiel0
       !Et=E*xn*(1.d0+E*eqplas/Sy)**(xn-1)
       do kewton=1,newton
        rhs=Smises-(3.d0*eg)*deqpl-syield
        deqpl=deqpl+rhs/((3.d0*eg)+hard(1))
!        if(deqpl.lt.0.d0) deqpl=-deqpl
        !Sf=Sy*(1.d0+E*(eqplas+deqpl)/Sy)**xn
        !Et=E*xn*(1.d0+E*(eqplas+deqpl)/Sy)**(xn-1)
        call UHARD_von_Mises(syield, hard, eqplas + deqplas, 
     1                          statev, nvalue, props(9))

        if(abs(rhs).lt.toler*syiel0) exit
       end do

       if (kewton.eq.newton) write(7,*)'WARNING: plasticity loop failed'
      
! update stresses and strains
       stress(1:3)=flow(1:3)*syield+Sh
       eplas(1:3)=eplas(1:3)+3.d0/2.d0*flow(1:3)*deqpl
       eelas(1:3)=eelas(1:3)-3.d0/2.d0*flow(1:3)*deqpl
       stress(4:ntens)=flow(4:ntens)*syield
       eplas(4:ntens)=eplas(4:ntens)+3.d0*flow(4:ntens)*deqpl
       eelas(4:ntens)=eelas(4:ntens)-3.d0*flow(4:ntens)*deqpl
       eqplas=eqplas+deqpl

!    Calculate the plastic strain energy density
       do i=1,ntens
        spd=spd+(stress(i)+olds(i))*(eplas(i)-oldpl(i))/2.d0
       end do
      
!     Formulate the jacobian (material tangent)   
       effg=eg*syield/Smises
       efflam=(E/(1.d0-2.d0*xnu)-2.d0*effg)/3.d0
       effhrd=3.d0*eg*hard(1)/(3.d0*eg+hard(1))-3.d0*effg
       do i=1,3
        do j=1,3
         ddsdde(j,i)=efflam
        enddo
        ddsdde(i,i)=2.d0*effg+efflam
       end do
       do i=4,ntens
        ddsdde(i,i)=effg
       end do

       do i=1,ntens
        do j=1,ntens
         ddsdde(j,i)=ddsdde(j,i)+effhrd*flow(j)*flow(i)
        end do
       end do
      endif  
      
!    Store strains in state variable array

      statev((2*ntens+1):3*ntens)=eelas
      statev((3*ntens+1):4*ntens)=eplas
      statev(4*ntens+1)=eqplas 
      statev(4*ntens+2)=deqpl

      return
      end

!***********************************************************************

      subroutine UHARD_von_Mises(syield, hard, eqplas, statev, nvalue, table)

      include 'aba_param.inc'

      character*80 cmname
      dimension hard(3),statev(*),table(2, nvalue)
    
    ! set yield stress to last value of table, hardening to zero
    
      syield = table(1, nvalue)
      hard(1) = 0.d0

    ! if more than one entry, search table
    
      if (nvalue > 1) then
        do k1 = 1, nvalue - 1
            eqpl1 = table(2, k1 + 1)
            if (eqplas < eqpl1) then
                eqpl0 = table(2, k1)
                if (eqpl1 <= eqpl0) then
                    write(7,*) 'error - plastic strain must be entered in ascending order'
                end if

                ! current yield stress and hardening

                deqpl = eqpl1 - eqpl0
                syiel0 = table(1, k1)
                syiel1 = table(1, k1 + 1)
                dsyiel = syiel1 - syiel0
                hard(1) = dsyiel/deqpl
                syield = syiel0 + (eqplas - eqpl0) * hard(1)
                exit
            endif
      end do
      endif

      return
      end

c*****************************************************************
      subroutine umat(stress,statev,ddsdde,sse,spd,scd,rpl,ddsddt,
     1 drplde,drpldt,stran,dstran,time,dtime,temp2,dtemp,predef,dpred,
     2 cmname,ndi,nshr,ntens,nstatv,props,nprops,coords,drot,pnewdt,
     3 celent,dfgrd0,dfgrd1,noel,npt,layer,kspt,jstep,kinc)

      use kvisual
      include 'aba_param.inc' !implicit real(a-h o-z)

      character*8 cmname
      dimension stress(ntens),statev(nstatv),ddsdde(ntens,ntens),
     1 ddsddt(ntens),drplde(ntens),stran(ntens),dstran(ntens),
     2 time(2),predef(1),dpred(1),props(nprops),coords(3),drot(3,3),
     3 dfgrd0(3,3),dfgrd1(3,3),jstep(4)

      ddsdde=0.0d0
      noffset=noel-nelem
      statev(1:nstatv)=UserVar(npt,1:nstatv,noffset)
      return
      end
