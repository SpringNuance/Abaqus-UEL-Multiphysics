# Abaqus-UEL-von-Mises-plasticity
This is the template for elastic and also von Mises plasticity using UEL subroutine in Abaqus/Standard with element C3D8. 

There are five case studies
1) Case 1: *ELASTIC, NLGEOM is turned off
2) Case 2: *ELASTIC, NLGEOM is turned on
3) Case 3: *PLASTIC (isotropic), NLGEOM is turned off
4) Case 4: *PLASTIC (isotropic), NLGEOM is turned on

These case studies returns the exact result as the default solver in Abaqus using element C3D8 only with NLGEOM is off. For NLGEOM is on, the result still does not match with Abaqus's results
