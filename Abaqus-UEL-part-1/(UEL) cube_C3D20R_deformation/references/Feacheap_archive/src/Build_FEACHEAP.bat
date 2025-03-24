del *.o
del *.mod
gfortran -c -O5 Types.f90
gfortran -c -O5 Globals.f90
gfortran -c -O5 ParamIO.f90
gfortran -c -O5 Parambw.f90
gfortran -c -O5 Paramsol.f90
gfortran -c -O5 el_linelast_3dbasic.f90
gfortran -c -O5 misc.f90
gfortran -c -O5 solver.f90
gfortran -c -O5 stiftest.f90
gfortran -c -O5 timestep.f90
gfortran -c -O5 usrelem.f90
gfortran -c -O5 usrprn.f90
gfortran -c -O5 usrstep.f90
gfortran -c -O5 mesh_routines.f90
gfortran -O5 -o feacheap feacheap.f90 Globals.o el_linelast_3dbasic.o misc.o solver.o stiftest.o timestep.o usrelem.o usrprn.o usrstep.o mesh_routines.o
move feacheap.exe ../input_files/feacheap.exe
pause