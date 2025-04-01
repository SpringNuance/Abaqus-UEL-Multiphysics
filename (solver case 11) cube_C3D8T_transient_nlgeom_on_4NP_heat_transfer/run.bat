python3.12 autoscript.py --input "subroutine_cube_C3D8_elastic_nlgeom_on_symm"
abaqus job=subroutine_cube_C3D8_elastic_nlgeom_on_symm_UEL user="source_code/UEL_multiphysics" cpus=1 mp_mode=threads -verbose 1 interactive ask_delete=off

python3.12 autoscript.py --input "subroutine_cube_C3D8T_transient_nlgeom_on_4NP"
abaqus job=solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer cpus=1 mp_mode=threads -verbose 1 interactive ask_delete=off