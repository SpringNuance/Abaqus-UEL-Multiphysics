# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Thu Oct 17 21:29:03 2024
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=103.244789123535, 
    height=119.284721374512)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
openMdb('cube_test.cae')
#: The model database "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae" has been opened.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
p = mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON, mesh=OFF)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=OFF)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].conductivity.setValues(
    table=((1.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].boundaryConditions['top_disp'].setValues(
    u2=0.0)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00229791, 
    farPlane=0.00501917, width=0.00301665, height=0.0014693, 
    viewOffsetX=0.000118358, viewOffsetY=-8.25395e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=10 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=11 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=12 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=13 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
del mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].predefinedFields['Predefined Field-1']
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].conductivity.setValues(
    table=((1e-06, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=10 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=11 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=12 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=13 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=14 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=15 )
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].conductivity.setValues(
    table=((1e-12, ), ))
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].conductivity.setValues(
    table=((1e-08, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00229791, 
    farPlane=0.00501917, width=0.00266551, height=0.00129827, 
    viewOffsetX=9.65846e-06, viewOffsetY=3.76794e-06)
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00232269, 
    farPlane=0.00499439, width=0.0025326, height=0.00123353, 
    viewOffsetX=5.56164e-05, viewOffsetY=-0.00011054)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=10 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=11 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=12 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=13 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=14 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=15 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=16 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=17 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=18 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=19 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=20 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=21 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=22 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=23 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=24 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=25 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=26 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=27 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=28 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=29 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=30 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=31 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=32 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=33 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=34 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=35 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=36 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=37 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=38 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=39 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=40 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=41 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=42 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=43 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=44 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=45 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=46 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=47 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=48 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=49 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=50 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=51 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=52 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=53 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=54 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=55 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=56 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=57 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=58 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=59 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=60 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=61 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=62 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=64 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=65 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=66 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=67 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=68 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=69 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=70 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=71 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=72 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=73 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=74 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=75 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/nlgeom_on_no_deform_rho_1_cp_1_cond_1e_minus8.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/nlgeom_on_no_deform_rho_1_cp_1_cond_1e_minus8.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0023207, 
    farPlane=0.00499638, width=0.00286377, height=0.00139484, 
    viewOffsetX=-4.09464e-05, viewOffsetY=-9.35114e-05)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/nlgeom_on_no_deform_rho_1_cp_1_cond_1e_minus8.odb'].close(
    )
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].specificHeat.setValues(
    table=((0.3, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].specificHeat.setValues(
    table=((5.0, ), ))
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(width=0.0027195, 
    height=0.00132457, viewOffsetX=4.86197e-05, viewOffsetY=1.90011e-06)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0023207, 
    farPlane=0.00499638, width=0.00286377, height=0.00139484, 
    viewOffsetX=0.00017414, viewOffsetY=-9.42714e-05)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].density.setValues(
    table=((7900.0, ), ))
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].specificHeat.setValues(
    table=((1.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00232282, 
    farPlane=0.00499425, width=0.00253275, height=0.00123361, 
    viewOffsetX=8.71846e-05, viewOffsetY=2.15586e-06)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RFL11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00228348, 
    farPlane=0.0050336, width=0.00281785, height=0.00137247, 
    viewOffsetX=0.000153543, viewOffsetY=-0.000102123)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].specificHeat.setValues(
    table=((0.3, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00235508, 
    farPlane=0.004962, width=0.00273183, height=0.00133057, 
    viewOffsetX=9.84363e-05, viewOffsetY=-6.53765e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].specificHeat.setValues(
    table=((5.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00231734, 
    farPlane=0.00499974, width=0.00262707, height=0.00148172, 
    viewOffsetX=0.000124217, viewOffsetY=-0.000103029)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
