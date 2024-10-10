abaqus job=cube_C3D8_diffusion input=cube_C3D8_diffusion.inp user=pure_diffusion_trap cpus=1 mp_mode=threads -verbose 1 interactive
abaqus mtxasm job=cube_C3D8_diffusionTHERM1 text