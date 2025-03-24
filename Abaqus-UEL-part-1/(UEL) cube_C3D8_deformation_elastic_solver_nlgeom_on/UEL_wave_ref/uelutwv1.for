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
      dimension x(9),y(11),vx(9,11),vy(9,11), coordsu(3), vel(3),
     1          accel(3)

      data x/0.0   ,  21.9 ,  43.8 ,  65.7 , 87.6  ,
     $       109.6 , 131.5 , 153.4 , 175.3  /
      data y/235.16, 232.81, 225.75, 214.0 , 197.53,
     $       176.37, 150.5 , 119.93,  84.66,  44.68, 0.0/
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

      ndim = 2
      ij   = 0
      do j=1,11
        coordsu(2) = y(j)
        do i=1,9
          coordsu(1) = x(i)
          iwarn = 0
          call getwavevel (ndim, coordsu, vel, accel, iwarn, 
     1                     noel, exinterm)
          vx(i,j) = vel(1)
          vy(i,j) = vel(2)
          if (iwarn.eq.1) write(7,*) '****** iwarn .eq. 1 *******'

          ij = ij + 1
          svars(ij)     = vel(1)
          svars(ij+ 99) = vel(2)
          svars(ij+198) = accel(1)
          svars(ij+297) = accel(2)
        end do
      end do

      write(7,*)'velocity-vx'
      write(7,222)((vx(k1,k2),k1=1,9),k2=1,11)
      write(7,*)'velocity-vy'
      write(7,222)((vy(k1,k2),k1=1,9),k2=1,11)


 222  format(9f6.2)
 333  format(3f6.2)



      return
      end         
