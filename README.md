# Abaqus-UEL-Multiphysics
This is the template for elastic, isotropic von Mises plasticity and transient heat transfer using UEL subroutine in Abaqus/Standard with element C3D8. 
The work is currently being updated and many things are messy. 

The UEL code is trying to conform to the interface of UMAT and UMATHT subroutines as closely as possible

BC conditions must only be Dirichlet type (displacement or nodal temperature). This UEL has not supported Neumann type BC (traction or flux)

There are 12 case studies and their status
1) Case 1: *ELASTIC, NLGEOM is turned off, no symmetry BC (completed)
2) Case 2: *ELASTIC, NLGEOM is turned off, with symmetry BC (completed)
3) Case 3: *ELASTIC, NLGEOM is turned on, no symmetry BC (completed)
4) Case 4: *ELASTIC, NLGEOM is turned on, with symmetry BC (completed)
5) Case 5: *PLASTIC (isotropic), NLGEOM is turned off, no symmetry BC (completed)
6) Case 6: *PLASTIC (isotropic), NLGEOM is turned off, with symmetry BC (completed)
7) Case 7: *PLASTIC (isotropic), NLGEOM is turned on, no symmetry BC (completed)
8) Case 8: *PLASTIC (isotropic), NLGEOM is turned on, with symmetry BC (completed)
9) Case 9: Transient heat transfer (only conduction), NLGEOM is turned off, 4 node point BC (not yet)
10) Case 10: Transient heat transfer (only conduction), NLGEOM is turned off, 1 node point BC (not yet)
11) Case 11: Transient heat transfer (only conduction), NLGEOM is turned on, 4 node point BC (not yet)
12) Case 12: Transient heat transfer (only conduction), NLGEOM is turned on, 1 node point BC (not yet)

Nonlinear geometry can also change diffusion just because of evolving geometry, not due to stress or strain from mechanical field.

These case studies should supposedly returns near exact result as the default solver in Abaqus using element C3D8/C3D8T


