      subroutine uel(rhs,amatrx,svars,energy,ndofel,nrhs,nsvars,props,
     1 nprops,coords,mcrd,nnode,u,du,v,a,jtype,time,dtime,kstep,kinc,
     2 jelem,params,ndload,jdltyp,adlmag,predef,npredf,lflags,
     3 mlvarx,ddlmag,mdload,pnewdt,jprops,njprop,period)
c
      include 'aba_param.inc'
c
      dimension rhs(mlvarx,*),amatrx(ndofel,ndofel),svars(nsvars),
     1 energy(8),props(*),coords(mcrd,nnode),
     2 u(ndofel),du(mlvarx,*),v(ndofel),a(ndofel),time(2),
     3 params(3),jdltyp(mdload,*),adlmag(mdload,*),
     4 ddlmag(mdload,*),predef(2,npredf,nnode),lflags(*),jprops(*)
      dimension sresid(6)

      parameter (zero=0.d0, one=1.d0)
      dimension coordsu(3), vel(3), accel(3)

c
c     sresid - stores the static residual at time t+dt
c     svars  - contains the static residual at time t upon entering the
c              routine. sresid is copied to svars after the dynamic
c              residual has been calculated.
c
      area= props(1)
      e   = props(2)
      anu = props(3)
      rho = props(4)
c
      alen = coords(1,2) - coords(1,1)
      ak = area*e/alen
      am = 0.5d0*area*rho*alen
c
      do k1=1,ndofel                      
        sresid(k1) = zero
        do krhs=1,nrhs
          rhs(k1,krhs)  = zero
        end do
        do k2=1,ndofel
          amatrx(k2,k1)= zero
        end do
      end do
c
      if (lflags(3).eq.1) then
c        normal incrementation
         if (lflags(1).eq.1 .or. lflags(1).eq.2) then
c           *static
            amatrx(1,1) =  ak  
            amatrx(4,4) =  ak  
            amatrx(1,4) = -ak  
            amatrx(4,1) = -ak
         else if (lflags(1).eq.11 .or. lflags(1).eq.12) then
c           *dynamic
            alpha = params(1)
            beta  = params(2)
            gamma = params(3)
c                  
            dadu = 1.0d0/(beta*dtime**2)
            dvdu = gamma/(beta*dtime)
c                  
            do k1=1,ndofel
              amatrx(k1,k1) = am*dadu
            end do
            amatrx(1,1) = amatrx(1,1) + (1.0d0+alpha)*ak  
            amatrx(4,4) = amatrx(4,4) + (1.0d0+alpha)*ak  
            amatrx(1,4) = amatrx(1,4) - (1.0d0+alpha)*ak  
            amatrx(4,1) = amatrx(4,1) - (1.0d0+alpha)*ak
         end if
      else if (lflags(3).eq.2) then
c        stiffness matrix
         amatrx(1,1) =  ak  
         amatrx(4,4) =  ak  
         amatrx(1,4) = -ak  
         amatrx(4,1) = -ak
      else if (lflags(3).eq.4) then
c        mass matrix
         do k1=1,ndofel
           amatrx(k1,k1) = am
         end do
      else if (lflags(3).eq.5) then
c        half-step residual calculation
      else if (lflags(3).eq.6) then
c        initial acceleration calculation
         do k1=1,ndofel
           amatrx(k1,k1) = am
         end do
      else if (lflags(3).eq.100) then
c        output for perturbations
      end if

      if (lflags(3) .gt. 1) return

      ndim = 3

      coordsu(1) = zero
      coordsu(2) = zero
      coordsu(3) = 300.d0
      call getwindvel (ndim, coordsu, vel, noel, exinterm)
      do i = 1,3
        svars(i) = vel(i)
      end do

      write(7,*) 'wind velocity for a z = ',coordsu(3)
      write(7,333)(vel(k1),k1=1,ndim)

      call getCurrVel (ndim, coordsu, vel, noel, exinterm)
      do i = 1,3
        svars(i+3) = vel(i)
      end do
      write(7,*) 'current velocity'
      write(7,333)(vel(k1),k1=1,ndim)

      coordsu(3) = 100.d0
      call getWindVel (ndim, coordsu, vel, noel, exinterm)
      do i = 1,3
        svars(i+6) = vel(i)
      end do

      write(7,*) 'wind velocity for a z = ',coordsu(3)
      write(7,333)(vel(k1),k1=1,ndim)

      call getCurrVel (ndim, coordsu, vel, noel, exinterm) 
      do i = 1,3
        svars(i+9) = vel(i)
      end do
      write(7,*) 'current velocity'
      write(7,333)(vel(k1),k1=1,ndim)


 333  format(3f6.2)



      return
      end         
