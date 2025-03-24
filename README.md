# Abaqus-UEL-deformation-diffusion
This is the template for elastic, isotropic von Mises plasticity and steady/transient heat transfer using UEL subroutine in Abaqus/Standard with element C3D8. 
The work is currently being updated and many things are messy. 

The UEL code is trying to conform to the interface of UMAT and UMATHT subroutines as closely as possible

BC conditions must only be Dirichlet type (displacement or nodal temperature). This UEL has not supported Neumann type BC (traction or flux)

There are 12 case studies
1) Case 1: *ELASTIC, NLGEOM is turned off, no symmetry BC
2) Case 2: *ELASTIC, NLGEOM is turned off, with symmetry BC
3) Case 3: *ELASTIC, NLGEOM is turned on, no symmetry BC
4) Case 4: *ELASTIC, NLGEOM is turned on, with symmetry BC
5) Case 5: *PLASTIC (isotropic), NLGEOM is turned off, no symmetry BC
6) Case 6: *PLASTIC (isotropic), NLGEOM is turned off, with symmetry BC
7) Case 7: *PLASTIC (isotropic), NLGEOM is turned on, no symmetry BC
8) Case 8: *PLASTIC (isotropic), NLGEOM is turned on, with symmetry BC
9) Case 9: Steady state heat transfer (only conduction), 4 node BC
10) Case 10:  Steady state heat transfer (only conduction), 1 node BC
11) Case 11: Transient heat transfer (only conduction), 4 node BC
12) Case 12: Transient heat transfer (only conduction), 1 node BC

These case studies should supposedly returns near exact result as the default solver in Abaqus using element C3D8/C3D8T
