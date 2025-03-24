! Globals.f90
!
! Definition of COMMON variables in Finite Element Routines

module Globals
  use Types
  implicit none

  integer :: n_total_steps
  integer :: state_print_steps
  integer :: usr_print_steps
  integer :: n_state_prints
  integer :: n_usr_prints 

  real( prec ) :: TIME, DTIME
  real( prec ) :: BTEMP, BTINC



end module Globals
