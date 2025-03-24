!   Subroutines controlling time incrementation
!
!========================= SUBROUTINE STATICSTEP ======================
!
! Automatic time step computation for static deformation analysis
!
subroutine staticstep(tprops,ntprops,converged,nit,dunorm,cnorm,rnorm,&
                      dtnew,dtopt,cutback,continue_stepping,prin)

  use Types
  use ParamIO  
  use Globals, only : TIME, DTIME, n_total_steps, state_print_steps, &
                      usr_print_steps, n_state_prints, n_usr_prints
  implicit none

    integer, intent( in )         :: ntprops
    integer, intent( in )         :: nit

    real( prec ), intent( in )    :: tprops(ntprops)
    real( prec ), intent( in )    :: dunorm(nit)
    real( prec ), intent( in )    :: cnorm(nit)    
    real( prec ), intent( in )    :: rnorm(nit)    

    real( prec ), intent( out )   :: dtnew
    real( prec ), intent( inout)  :: dtopt

    logical, intent( in )          :: converged
    logical, intent( inout )       :: cutback
    logical, intent( inout )       :: continue_stepping
    logical, intent( inout )       :: prin(4)

    integer :: nsmax,nssprn,nsuprn
    real(prec) :: dtmax,dtmin,dtsprn,dtuprn,dtremesh   
    real(prec) :: dt_distor,dt_du
    real(prec) :: tstop

!
!             dtmax      Max time step
!             dtmin      Min time step
!             tstop      Total analysis time
!             nsmax      No. timesteps
!             dtsprn      Time interval between state prints
!             nssprn      Max no. steps between state prints
!             dtuprn      Time interval between user prints
!             nsuprn      Max no. steps between user prints
!             dtnew      New time step size
!             cutback    Repeat attempt to get convergent solution with dtnew
!             prin(1)    Print state
!             prin(2)    Print using user defined routine
!
    dtmax = tprops(2)
    dtmin = tprops(3)
    nsmax = int(tprops(4))
    tstop = tprops(5)
    dtsprn = tprops(6)
    nssprn = int(tprops(7))
    dtuprn = tprops(8)
    nsuprn = int(tprops(9))


    prin = .false.
    cutback = .false.

    if (.not.converged) then
       dtnew = DTIME/2.D0
       if (dtnew>dtmin) then
         dtopt = dtnew
         cutback = .true.
         write(IOW,9902) dtnew
       else
         continue_stepping = .false.
         write(IOW,9900)
         write(6,*) ' timestep cut below min value '
         write(6,*) ' Analysis terminated'
         stop
       endif
       return
     endif

    if (nit.lt.8.and.DTIME==dtopt) then
       dtopt = 1.25D0*DTIME
    endif
    dtnew = dtopt
    if (dtnew>dtmax) then
        dtnew = dtmax
    endif
    if (state_print_steps >= nssprn) then
       prin(1) = .true.
       state_print_steps = 1
    else
       state_print_steps = state_print_steps + 1
    endif
    if (usr_print_steps >= nsuprn) then
       prin(2) = .true.
       usr_print_steps = 1
    else
       usr_print_steps = usr_print_steps + 1
    endif

 
    if (TIME+DTIME+dtnew >= tstop) then
      dtnew = tstop-TIME-DTIME
      if (dtnew<0.d0) dtnew = dtmin
    endif

    if (TIME+DTIME-tstop>=0.d0.or.n_total_steps+1==nsmax) then
      continue_stepping = .false.
      prin(1) = .true.
      prin(2) = .true.
      prin(3) = .true.
    endif    


    If (dabs(TIME+DTIME-(n_state_prints+1)*dtsprn)<dtmin) then
       prin(1) = .true.
       n_state_prints = n_state_prints + 1
    endif
    If (dabs(TIME+DTIME-(n_usr_prints+1)*dtuprn)<dtmin) then
       prin(2) = .true.
       n_state_prints = n_state_prints + 1
    endif

    if (TIME+DTIME+dtnew>(n_state_prints+1)*dtsprn) then
       dtnew = (n_state_prints+1)*dtsprn - (TIME+DTIME)
    endif
    if (TIME+DTIME+dtnew>(n_usr_prints+1)*dtuprn) then
       dtnew = (n_usr_prints+1)*dtuprn - (TIME+DTIME)
    endif


    n_total_steps = n_total_steps + 1


    Write(IOW,'(// ''*** Step number '',i8,'' completed successfully ''/&
                 ''    Current time step:          '',d16.5/ &
                 ''    Total elapsed time:         '',d16.5/ &
                 ''    Best time step would be:    '',d16.5/ &
                 ''    Time step adjusted to:      '',d16.5)') &
     n_total_steps,DTIME,TIME+DTIME,dtopt,dtnew





 9902 Format(//&
   ' *** Time step cutback due to poor convergence *** '/&
   '   Attempting time step:    ',d14.4)

  9900 Format('// *** Timestep cut below minimum allowable value ***'/&
              ' Analysis has been terminated. ')

    return
end subroutine staticstep
!
!========================= SUBROUTINE convergencecheck ======================
!
! Routine to check convergence for Newton-Raphson iterations
!
subroutine convergencecheck(nit,dunorm,cnorm,rnorm,tolrnc,maxitn,&
                      iterate,converged)

  use Types
  use ParamIO  

  implicit none

  integer,  intent( inout  )     :: nit
  integer,  intent(  in  )       :: maxitn
  real( prec ), intent( in )     :: dunorm(nit)
  real( prec ), intent( in )     :: cnorm(nit)
  real( prec ), intent( in )     :: rnorm(nit)
  real( prec ), intent( in )     :: tolrnc

  logical, intent( inout )         :: iterate
  logical, intent( inout )         :: converged


  iterate = .true.
  converged = .false.

  if (dunorm(nit)>0.D0) then
   write (IOW, 99042) nit,rnorm(nit), cnorm(nit), dunorm(nit), &
                    cnorm(nit)/dunorm(nit), tolrnc
  else
   write (IOW, 99042) nit,rnorm(nit), cnorm(nit), dunorm(nit), &
                    0.D0, tolrnc
  endif
99042 format ( // '  Newton Raphson iteration ', I5/&
                 '  Residual norm    ', D15.6/      &
                 '  Correction norm  ', D15.6/      &
                 '  Solution norm    ', D15.6/    &
                 '  Ratio            ', D15.6/     &
                 '  Tolerance        ', D15.6)
! Check for NaN
  if (rnorm(nit)+1.d0 == rnorm(nit)) then
    write(1,*) ' Nan detected '
    converged = .false.
    iterate = .false.
    return
  endif
  
  if (cnorm(nit)==0.D0.and.dunorm(nit) == 0.D0) then
     write(IOW,*) ' Warning - zero solution '
     iterate = .false.
     converged = .true.
     return
  endif

  if (rnorm(nit)==0.d0) then
     write(IOW,*) ' Residual norm is zero - assumed to have converged'
     iterate = .false.
     converged = .true.
     return
  endif



  if (cnorm(nit)/dunorm(nit)<tolrnc) then
     converged = .true.
     iterate = .false.
     return
  endif

  if (nit.gt.maxitn) iterate = .false.
  

  nit = nit + 1

  return
end subroutine convergencecheck


!

!
!========================= SUBROUTINE LOAD_HISTORY ======================
!

subroutine global_load_history(lprops,nlprops,time,umag,dlmag,fmag)

  use Types
  use ParamIO  
  use Globals, only : BTEMP, BTINC,n_total_steps

  implicit none

    integer, intent( in )         :: nlprops

    real( prec ), intent( in )    :: lprops(nlprops)
    real( prec ), intent( in )    :: time
    real( prec ), intent( out )   :: umag,dlmag,fmag

    integer :: nu,ndl,nf,nt,ipoin
    real( prec ) :: tval

!   Subroutine to define load and temperature values
 

!     lprops(1)  -> nu     No. umag points
!     lprops(2)  -> ndl    No. dlmag points
!     lprops(3)  -> nf     No. fmag points
!     lprops(4)  -> nt     No. temp points
!     lprops(5)  ->        Position in lprops of first umag point
!     lprops(6)  ->        Position in lprops of first dlmag point
!     lprops(7)  ->        Position in lprops of first fmag point
!     lprops(8)  ->        Position in lprops of first temp point
!

      nu = int(lprops(1))
      ndl = int(lprops(2))
      nf = int(lprops(3))
      nt = int(lprops(4))

!     Default values
      umag = 1.D0
      dlmag = 1.D0
      fmag = 1.D0

      if (nu > 0) then
         ipoin = int(lprops(5))
         call loadval(lprops(ipoin),nu,TIME,umag)
      endif
      if (ndl > 0) then
         ipoin = int(lprops(6))
         call loadval(lprops(ipoin),ndl,TIME,dlmag)
      endif
      if (nf > 0) then
         ipoin = int(lprops(7))
         call loadval(lprops(ipoin),nf,TIME,fmag)
      endif
      if (nt > 0) then
         ipoin = int(lprops(8))
         call loadval(lprops(ipoin),nt,TIME,tval)
         BTINC = tval-BTEMP
         BTEMP = tval
      else
         BTEMP = 0.D0
         BTINC = 0.D0
      endif

!      Write(IOW,9901) n_total_steps,TIME,umag,dlmag,fmag,BTEMP
!9901  Format(//' *** Load values for step no. ',i8/ &
!               '     Elapsed time             ',d16.5/&
!               '     Displacement BC mag:     ',d16.5/&
!               '     Distributed load mag:    ',d16.5/&
!               '     Nodal force mag:         ',d16.5/&
!               '     Temperature:             ',d16.5/)


      return
end subroutine global_load_history

!=================== SUBROUTINE LOADVAL ======================


subroutine loadval(history,nhist,time,value)

   use TYPES
   use PARAMIO

   integer,  intent( in )         :: nhist

   real( prec ), intent( in )     :: history(2,nhist)
   real( prec ), intent( in )     :: time
   real( prec ), intent( inout )  :: value


   integer :: klo,khi,k

!   Subroutine to interpolate a load history table
!  
!  Find positions in history table within which to interpolate

   if (nhist == 1) then
     value = history(2,1)
     return
   endif

   if (time <= history(1,1) ) then
      value = history(2,1)
   else if (time >= history(1,nhist) ) then
      value = history(2,nhist)
   else

     klo = 1
     khi = nhist

     do while ( .true. )

      if ( khi - klo>1 ) then
        k = (khi + klo)/2
        if ( history(1, k)>time ) then
          khi = k
        else
          klo = k
        end if
        cycle
      else
        exit
      end if

     end do

     if (history(1,khi) == history(1,klo)) then
        value = 0.5D0*(history(2,khi) + history(2,klo))
        return
     endif
     value =( (history(1,khi)-time)*history(2,klo) +  & 
              (time-history(1,klo))*history(2,khi)  )/ &
              (history(1,khi)-history(1,klo))

   endif

   return

end subroutine loadval
