! ParamIO.f90                                                 

module ParamIO
  implicit none

  ! --  Unit to use for log file
  integer, parameter :: IOW = 1
  ! --  Unit to use for intput file
  integer, parameter :: IOR = 2
  ! --  Parameter controlling whether errors are written
  integer, parameter :: IWT = 1
  ! --  Parameter specifying operating system type.  0 for UNIX, 1 for Windows
  integer, parameter :: IOPSYS = 1

end module ParamIO
