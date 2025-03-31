# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Mon Mar 31 14:40:50 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=193.947906494141, 
    height=142.73957824707)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
openMdb('cube_test.cae')
#: The model database "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae" has been opened.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
p = mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0020903, 
    farPlane=0.00486622, width=0.00408774, height=0.00198773, 
    viewOffsetX=0.000654118, viewOffsetY=5.29763e-05)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=16 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=17 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR38_TEMP', outputPosition=INTEGRATION_POINT, )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR37_U_HEAT', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR39_FLUX_HEAT_X', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR40_FLUX_HEAT_Y', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR41_FLUX_HEAT_Z', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR49_HISTORY', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR50_GC', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00201488, 
    farPlane=0.00494164, width=0.00447756, height=0.00217729, 
    viewOffsetX=0.000686505, viewOffsetY=0.000149711)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=15 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=14 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=13 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=12 )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR38_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR45_THETA_L', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR37_U_HEAT', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=75 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=74 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=73 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=72 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=71 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=70 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=69 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=68 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=67 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=66 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=65 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=64 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=62 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=61 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=60 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=59 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=58 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=57 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=56 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=55 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=54 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=53 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=52 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=51 )
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
#: 
#: Node: CUBE_ASSEMBLY.2
#:                                         1             2             3        Magnitude
#: Base coordinates:                  5.00000e-04, -5.00000e-04,  5.00000e-04,      -      
#: Scale:                             1.00000e+00,  1.00000e+00,  1.00000e+00,      -      
#: Deformed coordinates (unscaled):   4.05932e-04, -5.00000e-04,  4.05932e-04,      -      
#: Deformed coordinates (scaled):     4.05932e-04, -5.00000e-04,  4.05932e-04,      -      
#: Displacement (unscaled):          -9.40681e-05,  3.68581e-34, -9.40681e-05,  1.33032e-04
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00248326, 
    farPlane=0.00483378, width=0.00326532, height=0.00158781, 
    viewOffsetX=0.000169151, viewOffsetY=-0.000122818)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    SYMBOLS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0020773, 
    farPlane=0.00487922, width=0.00372351, height=0.00181723, 
    viewOffsetX=0.000513365, viewOffsetY=0.00016103)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00199483, 
    farPlane=0.00496169, width=0.00457982, height=0.00223514, 
    viewOffsetX=0.0010326, viewOffsetY=5.68724e-05)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00225109, 
    farPlane=0.00490207, width=0.00403503, height=0.00196926, 
    viewOffsetX=0.000703562, viewOffsetY=9.09908e-05)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00197663, 
    farPlane=0.00497989, width=0.00491002, height=0.0023963, 
    viewOffsetX=0.00078401, viewOffsetY=-6.45217e-05)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=75 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=74 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=73 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=72 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=71 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=70 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=69 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=68 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=67 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=66 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=65 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00204271, 
    farPlane=0.00491381, width=0.00416081, height=0.00203065, 
    viewOffsetX=0.000822954, viewOffsetY=0.000167279)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00199138, 
    farPlane=0.00496514, width=0.00462824, height=0.00225878, 
    viewOffsetX=0.000483835, viewOffsetY=0.000134761)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00209696, 
    farPlane=0.00485956, width=0.00398239, height=0.00194357, 
    viewOffsetX=0.00068556, viewOffsetY=0.000249125)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=14 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=15 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=16 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=17 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR38_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00209459, 
    farPlane=0.00486193, width=0.00401049, height=0.00195729, 
    viewOffsetX=0.000610341, viewOffsetY=0.000202828)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203646, 
    farPlane=0.00492006, width=0.00469451, height=0.00229112, 
    viewOffsetX=0.000788169, viewOffsetY=0.000215619)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
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
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00204309, 
    farPlane=0.00491343, width=0.00416159, height=0.00203103, 
    viewOffsetX=0.000748239, viewOffsetY=0.00022628)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RFL11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00206264, 
    farPlane=0.00489388, width=0.00394932, height=0.00192744, 
    viewOffsetX=0.000635188, viewOffsetY=0.000258441)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203664, 
    farPlane=0.00491988, width=0.00414845, height=0.00202462, 
    viewOffsetX=0.000685109, viewOffsetY=0.000202707)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=16 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=17 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=18 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=19 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=20 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=21 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=22 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=23 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=24 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
p1 = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_thermomechanical')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=1.74999, 
    farPlane=3.49997, width=0.00242638, height=0.00118418, cameraPosition=(
    2.02053, 2.02047, 2.02053), viewOffsetX=0.000244633, 
    viewOffsetY=-7.00706e-05)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=ON, 
    adaptiveMeshConstraints=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=ON)
p1 = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='step1_thermomechanical', frame=1)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR6_SIG23', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR13_EELAS11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RFL11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR44_C_MOL', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR39_FLUX_HEAT_X', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR40_FLUX_HEAT_Y', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR41_FLUX_HEAT_Z', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR42_CL_MOL', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR37_U_HEAT', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR38_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207522, 
    farPlane=0.0048813, width=0.003735, height=0.00182283, 
    viewOffsetX=0.000734308, viewOffsetY=0.000216863)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=75 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205687, 
    farPlane=0.00489965, width=0.00393827, height=0.00192204, 
    viewOffsetX=0.000806148, viewOffsetY=0.000197241)
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00267251, 
    farPlane=0.00458442, width=0.000634904, height=0.00030986, 
    viewOffsetX=0.000106381, viewOffsetY=-0.000488944)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='step1_thermomechanical', frame=27)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00245239, 
    farPlane=0.0047887, width=0.00314788, height=0.0015363, 
    viewOffsetX=0.00050407, viewOffsetY=-0.000225399)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='step1_thermomechanical', frame=100)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00201296, 
    farPlane=0.00494356, width=0.00450935, height=0.00220075, 
    viewOffsetX=0.000780865, viewOffsetY=5.10851e-05)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00254436, 
    farPlane=0.00473923, width=0.00254832, height=0.00124369, 
    viewOffsetX=-1.01766e-05, viewOffsetY=-0.000241041)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205687, 
    farPlane=0.00489965, width=0.00393827, height=0.00192204, 
    viewOffsetX=0.000755477, viewOffsetY=0.000207229)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205553, 
    farPlane=0.00490099, width=0.00445416, height=0.00217382, 
    viewOffsetX=0.000857622, viewOffsetY=0.00013882)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0020153, 
    farPlane=0.00494122, width=0.00436701, height=0.00213128, 
    viewOffsetX=0.000838138, viewOffsetY=0.000126029)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00208147, 
    farPlane=0.00487505, width=0.00374625, height=0.00182833, 
    viewOffsetX=0.000613392, viewOffsetY=0.000152967)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
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
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#* OdbError: Cannot open file 
#* C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) 
#* cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb. 
#* ***ERROR: "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL 
#* case 11) 
#* cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb" 
#*  is not an Abaqus database file.
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=75 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=74 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=73 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=72 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=71 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=70 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=69 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=68 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=67 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=66 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=65 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=64 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=62 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=61 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205553, 
    farPlane=0.00490099, width=0.0039357, height=0.00192079, 
    viewOffsetX=0.000725106, viewOffsetY=0.000178599)
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203668, 
    farPlane=0.00491984, width=0.00414852, height=0.00202465, 
    viewOffsetX=0.00077341, viewOffsetY=0.000147731)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=75 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=74 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=73 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=72 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=71 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=70 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=69 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=68 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=67 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=66 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=65 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=64 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=62 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=64 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=65 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203668, 
    farPlane=0.00491984, width=0.00414852, height=0.00202465, 
    viewOffsetX=0.000833219, viewOffsetY=0.000140405)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(width=0.00424178, 
    height=0.00207017, viewOffsetX=0.000812473, viewOffsetY=0.000189282)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(width=0.00424178, 
    height=0.00207017, viewOffsetX=0.000812606, viewOffsetY=0.00017657)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='step1_thermomechanical', frame=100)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR39_FLUX_HEAT_X', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR40_FLUX_HEAT_Y', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=91 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=90 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=89 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=88 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=87 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=86 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=85 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=84 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=83 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=82 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=81 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=80 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=79 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=78 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=77 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=76 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=75 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=74 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=73 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=72 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=71 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=70 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=69 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=68 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=67 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=66 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=65 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=64 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=62 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=61 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=60 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=61 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=62 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=63 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=64 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00206494, 
    farPlane=0.00489158, width=0.00392158, height=0.00191389, 
    viewOffsetX=0.000855756, viewOffsetY=0.000188944)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203668, 
    farPlane=0.00491984, width=0.00414852, height=0.00202465, 
    viewOffsetX=0.000812789, viewOffsetY=0.000199505)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
