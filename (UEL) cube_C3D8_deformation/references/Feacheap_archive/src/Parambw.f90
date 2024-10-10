! Parambw.f90                                                 
! Code converted from FORTRAN 77 fixed format to Fortran 90 free format on
! Date: 02/04/2000  Time: 10:40:57

module Parambw
  implicit none
  !  Parameters for bandwidth reduction algorithm only
  
  ! --  Max no. of nodes to renumber
  integer, parameter :: MAXNBW = 30000
  ! --  Max no. of nodes adjacent to a node
  integer, parameter :: MAXAD = 2000
  ! --  Max no. of levels
  integer, parameter :: MAXLEV = 700
  ! --  Max level width
  integer, parameter :: MAXWID = 2000
end module Parambw
