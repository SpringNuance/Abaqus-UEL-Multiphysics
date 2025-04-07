@REM python3.12 autoscript.py --input "elastic_plate" --process "processing_input_elastic_plate"
@REM python3.12 autoscript.py --input "notched_plate" --process "processing_input_notched_plate"

abaqus job=elastic_plate_UEL user="source_code/UEL_multiphysics" cpus=1 -verbose 1 interactive ask_delete=off mp_mode=threads
abaqus job=notched_plate_UEL user="source_code/UEL_multiphysics" cpus=2 -verbose 1 interactive ask_delete=off mp_mode=threads