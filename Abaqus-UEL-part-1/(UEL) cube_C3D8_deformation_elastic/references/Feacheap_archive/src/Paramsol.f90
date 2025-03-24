! Paramsol.f90                                                
 

module Paramsol
  implicit none
  !  Parameters used to dimension arrays in solver

  ! --  Max number of nodes per element
  integer, parameter :: MAXNDL = 20
  ! --  Max number of coords (MAX#coords * Max#nodes per element)
  integer, parameter :: MAXCRL = 40
  ! --  Max no. DOF (Max dof per node*max no nodes per element)
  integer, parameter :: MAXDFL = 44
  ! --  Max number of nodal states/props (Max state per node*max no
  !     nodes per element)
  integer, parameter :: MAXSNL = 50
  ! --  Max size of stiffness matrix
  integer, parameter :: MAXSTF = 50
  ! --  Max no. state variables to be lumped to nodes
  integer, parameter :: MAXSTL = 47
  ! --  Max size of storage for local state variables
  integer, parameter :: MAXSTT = MAXNDL*MAXSTL
  ! --  Max (total) no. integration pts*no. coords in an element
  !     Used to dimension list of int.pt coords in mgentrans.f
  integer, parameter :: MAXILS = 12
end module Paramsol
