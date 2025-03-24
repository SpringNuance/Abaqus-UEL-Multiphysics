python3.12 autoscript.py --input "cube_C3D8_elastic_srt_nlgeom_off_symm" --subroutine "UEL_deformation"
abaqus job=cube_C3D8_elastic_srt_nlgeom_off_symm_UEL user=C3D8_uel_umat_main cpus=1 mp_mode=threads -verbose 1 interactive
abaqus job=cube_C3D8_elastic_srt_nlgeom_off_symm_UEL user=UEL_deformation cpus=1 mp_mode=threads -verbose 1 interactive