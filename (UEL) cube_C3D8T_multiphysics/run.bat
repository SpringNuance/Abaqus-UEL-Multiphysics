@REM python3.12 autoscript.py --input "subroutine_multiphysics"
abaqus job=subroutine_multiphysics_UEL user="source_code/UEL_multiphysics" cpus=1 -verbose 1 interactive ask_delete=off