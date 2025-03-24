# Makefile to make FEM program

# Directories
ROOTDIR = ../
BINDIR = $(ROOTDIR)input_files/
SRCDIR = $(ROOTDIR)src/
MODDIR = $(ROOTDIR)mod/

# Compiler Directives
FF = f95
DBG = # -g -check_bounds
OPT = -O5 -arch host -fast
MOD = -I$(MODDIR) -module $(MODDIR)
FFLAGS = $(OPT) $(MOD) $(DBG)

.SUFFIXES:	.o .f90
.f90.o:	
	$(FF) -c $(FFLAGS) $<

# Source Files
SOR1 = $(SRCDIR)Types.f90
SOR2 = $(SRCDIR)Globals.f90
SOR3 = $(SRCDIR)ParamIO.f90 
SOR4 = $(SRCDIR)Parambw.f90
SOR5 = $(SRCDIR)Paramsol.f90
SOR6 = $(SRCDIR)el_linelast_3Dbasic.f90
SOR7 = $(SRCDIR)feacheap.f90
SOR8 = $(SRCDIR)misc.f90
SOR9 = $(SRCDIR)solver.f90
SOR10 = $(SRCDIR)stiftest.f90
SOR11 = $(SRCDIR)timestep.f90
SOR12 = $(SRCDIR)usrelem.f90
SOR13 = $(SRCDIR)usrprn.f90
SOR14 = $(SRCDIR)usrstep.f90
SOR15 = $(SRCDIR)mesh_routines.f90


# Object Files
OBJ1 = $(SRCDIR)Types.o
OBJ2 = $(SRCDIR)Globals.o
OBJ3 = $(SRCDIR)ParamIO.o 
OBJ4 = $(SRCDIR)Parambw.o
OBJ5 = $(SRCDIR)Paramsol.o
OBJ6 = $(SRCDIR)el_linelast_3Dbasic.o
OBJ7 = $(SRCDIR)feacheap.o
OBJ8 = $(SRCDIR)misc.o
OBJ9 = $(SRCDIR)solver.o
OBJ10 = $(SRCDIR)stiftest.o
OBJ11 = $(SRCDIR)timestep.o
OBJ12 = $(SRCDIR)usrelem.o
OBJ13 = $(SRCDIR)usrprn.o
SOR14 = $(SRCDIR)usrstep.o
SOR15 = $(SRCDIR)mesh_routines.o


# Targets
TAGT1 = feacheap

# Dependencies
$(OBJ7) : $(OBJ12) $(OBJ11) $(OBJ10) $(OBJ9) $(OBJ8) $(OBJ6) $(OBJ7) $(OBJ4) $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ15) :  $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ14) :  $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ13) :  $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ12) :  $(OBJ3) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ11) : $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ10) : $(OBJ4) $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ9) : $(OBJ4) $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ8) : $(OBJ4) $(OBJ3) $(OBJ2) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ6) : $(OBJ3) $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ5) : $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ4) : $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ3) : $(OBJ1)
	$(FF) -c $(FFLAGS) $<

$(OBJ2) : $(OBJ1)
	$(FF) -c $(FFLAGS) $<

# Rules
feacheap : $(TAGT1)
$(TAGT1) : $(OBJ7) $(OBJ13) $(OBJ12) $(OBJ11) $(OBJ10) $(OBJ9) $(OBJ8) $(OBJ6) $(OBJ5) $(OBJ4) $(OBJ3) $(OBJ2) $(OBJ1) 
	$(FF) $(FFLAGS) -o $(TAGT1) $(SOR7) $(OBJ1) $(OBJ2) $(OBJ3) $(OBJ4) $(OBJ5) $(OBJ6) $(OBJ8) $(OBJ9) $(OBJ10) $(OBJ11) $(OBJ12) $(OBJ13) $(OBJ14) $(OBJ15)
	cp $(TAGT1) $(BINDIR)$(TAGT1)

.PHONY : clean
clean:
	rm -f *.o *.mod
	rm -f $(MODDIR)*.mod
	rm -f $(TAGT1)
	rm -f $(BINDIR)$(TAGT1)






