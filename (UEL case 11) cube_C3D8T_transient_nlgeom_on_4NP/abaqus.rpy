# -*- coding: mbcs -*-
#
# Abaqus/Viewer Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Sat Mar 29 13:43:59 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=193.947906494141, 
    height=185.628463745117)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from viewerModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
o2 = session.openOdb(
    name='subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o2)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00186345, 
    farPlane=0.00509307, width=0.00287276, height=0.00176378, 
    viewOffsetX=0.00012748, viewOffsetY=0.000151656)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00192947, 
    farPlane=0.00502705, width=0.00366864, height=0.00168791, 
    viewOffsetX=0.000297986, viewOffsetY=0.000215424)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=33 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=34 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=35 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=36 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=37 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=38 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=39 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=40 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=41 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=164.714, 
    farPlane=402.185, width=247.673, height=113.952, viewOffsetX=9.23547, 
    viewOffsetY=12.246)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=153.984, 
    farPlane=412.914, width=296.561, height=136.445, viewOffsetX=13.5729, 
    viewOffsetY=21.3167)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=163.994, 
    farPlane=402.905, width=424.895, height=215.232, viewOffsetX=71.5391, 
    viewOffsetY=26.613)
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=166.405, 
    farPlane=400.493, width=432.907, height=219.29, viewOffsetX=104.704, 
    viewOffsetY=2.52098)
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=178.659, 
    farPlane=401.34, width=323.167, height=163.701, viewOffsetX=61.9165, 
    viewOffsetY=4.38856)
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00210353, 
    farPlane=0.00485299, width=0.00453259, height=0.002296, 
    viewOffsetX=0.000596027, viewOffsetY=-2.18606e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00257206, 
    farPlane=0.00474502, width=0.00305183, height=0.00154591, 
    viewOffsetX=0.00019002, viewOffsetY=-4.95201e-05)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207548, 
    farPlane=0.00488104, width=0.00492392, height=0.00249422, 
    viewOffsetX=0.0011247, viewOffsetY=6.26583e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=47 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=48 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=49 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=50 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=51 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=52 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=53 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=54 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR34_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=284.089, 
    farPlane=517.484, width=384.115, height=194.575, viewOffsetX=29.9494, 
    viewOffsetY=-8.20882)
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203531, 
    farPlane=0.00492121, width=0.00546471, height=0.00276816, 
    viewOffsetX=0.00129248, viewOffsetY=5.48872e-05)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].view.setValues(nearPlane=289.137, 
    farPlane=512.436, width=367.485, height=186.151, viewOffsetX=22.5766, 
    viewOffsetY=-9.16396)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=280.478, 
    farPlane=521.095, width=434.731, height=220.214, viewOffsetX=48.1506, 
    viewOffsetY=-18.9398)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=277.977, 
    farPlane=523.596, width=518.736, height=262.767, viewOffsetX=78.1937, 
    viewOffsetY=-34.017)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].view.setValues(nearPlane=243.695, 
    farPlane=557.878, width=483.495, height=222.451, viewOffsetX=63.0083, 
    viewOffsetY=-30.0425)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=10 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=11 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=12 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=13 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=14 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=15 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=16 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=17 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=18 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=19 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=20 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=21 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=22 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=23 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=24 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=25 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=26 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=27 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=28 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=29 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=30 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=31 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=32 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=33 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=34 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=35 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=36 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2, Layer-1
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=157.748, 
    farPlane=409.151, width=248.741, height=137.998, viewOffsetX=22.6205, 
    viewOffsetY=21.5545)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=33 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=34 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=159.849, 
    farPlane=407.049, width=235.966, height=130.911, viewOffsetX=22.6187, 
    viewOffsetY=21.9129)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=161.204, 
    farPlane=405.694, width=224.604, height=124.607, viewOffsetX=23.5951, 
    viewOffsetY=11.4671)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=153.572, 
    farPlane=413.327, width=274.056, height=152.043, viewOffsetX=34.0096, 
    viewOffsetY=18.0174)
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
#: 
#: Node: CUBE_ASSEMBLY.2
#:                                         1             2             3        Magnitude
#: Base coordinates:                  5.00000e-04, -5.00000e-04,  5.00000e-04,      -      
#: Scale:                             1.00000e+00,  1.00000e+00,  1.00000e+00,      -      
#: Deformed coordinates (unscaled):   4.56451e-04, -5.00000e-04,  4.56451e-04,      -      
#: Deformed coordinates (scaled):     4.56451e-04, -5.00000e-04,  4.56451e-04,      -      
#: Displacement (unscaled):          -4.35493e-05,  4.73281e-34, -4.35493e-05,  6.15880e-05
session.viewports['Viewport: 1'].view.setValues(nearPlane=177.075, 
    farPlane=415.776, width=262.464, height=145.612, viewOffsetX=27.7744, 
    viewOffsetY=-0.224567)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=143.345, 
    farPlane=451.238, width=381.112, height=140.449, viewOffsetX=40.5563, 
    viewOffsetY=8.24772)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
#: Warning: Requested operation could not be performed for the following layers: Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: Requested operation could not be performed for the following layers: Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
#: Warning: Requested operation could not be performed for the following layers: Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
#: Warning: Requested operation could not be performed for the following layers: Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
#: Warning: Requested operation could not be performed for the following layers: Layer-1
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: Requested operation could not be performed for the following layers: Layer-1
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=152.116, 
    farPlane=442.467, width=335.914, height=123.792, viewOffsetX=34.9891, 
    viewOffsetY=4.49828)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Max. Principal'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: 
#: Node: CUBE_ASSEMBLY.2
#:                                         1             2             3        Magnitude
#: Base coordinates:                  5.00000e-04, -5.00000e-04,  5.00000e-04,      -      
#: Scale:                             1.00000e+00,  1.00000e+00,  1.00000e+00,      -      
#: Deformed coordinates (unscaled):   3.12253e-04, -5.00000e-04,  3.12253e-04,      -      
#: Deformed coordinates (scaled):     3.12253e-04, -5.00000e-04,  3.12253e-04,      -      
#: Displacement (unscaled):          -1.87747e-04,  8.67774e-37, -1.87747e-04,  2.65514e-04
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=142.083, 
    farPlane=426.363, width=318.044, height=117.206, viewOffsetX=26.9848, 
    viewOffsetY=0.0952101)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: Requested operation could not be performed for the following layers: Layer-2
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=140.574, 
    farPlane=427.873, width=357.574, height=131.774, viewOffsetX=42.9052, 
    viewOffsetY=12.6)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb'].close(
    )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=169.957, 
    farPlane=426.47, width=318.574, height=117.402, viewOffsetX=38.743, 
    viewOffsetY=-12.0625)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=149.916, 
    farPlane=416.983, width=268.626, height=149.031, viewOffsetX=18.3298, 
    viewOffsetY=22.8485)
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=160.636, 
    farPlane=412.545, width=270.566, height=150.107, viewOffsetX=31.5016, 
    viewOffsetY=11.576)
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=156.963, 
    farPlane=409.935, width=249.533, height=138.438, viewOffsetX=15.4761, 
    viewOffsetY=10.5901)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=155.528, 
    farPlane=411.37, width=261.962, height=145.333, viewOffsetX=27.8494, 
    viewOffsetY=13.6745)
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=155.698, 
    farPlane=411.2, width=261.18, height=144.899, viewOffsetX=30.6606, 
    viewOffsetY=17.8743)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=50 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=49 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=48 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=47 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=46 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=45 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=44 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=43 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=42 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=41 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=40 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=39 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=38 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=37 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=36 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=35 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=34 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=33 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=32 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=31 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=30 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=29 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=28 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=27 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=26 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=25 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=24 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=23 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=22 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=21 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=20 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=19 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=18 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=17 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=16 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=15 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=14 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=13 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=12 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=11 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=10 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].view.setValues(nearPlane=174.691, 
    farPlane=421.4, width=294.238, height=163.239, viewOffsetX=23.172, 
    viewOffsetY=1.05778)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=155.836, 
    farPlane=411.062, width=230.983, height=128.146, viewOffsetX=12.1272, 
    viewOffsetY=19.6467)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=95 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=94 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=93 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=158.499, 
    farPlane=408.4, width=236.992, height=131.48, viewOffsetX=25.2058, 
    viewOffsetY=12.2446)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=154.226, 
    farPlane=412.672, width=270.136, height=149.868, viewOffsetX=26.0201, 
    viewOffsetY=22.2304)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=150.114, 
    farPlane=416.784, width=295.336, height=163.849, viewOffsetX=32.3365, 
    viewOffsetY=21.2609)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=157.748, 
    farPlane=409.151, width=248.741, height=137.998, viewOffsetX=22.5981, 
    viewOffsetY=21.025)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=157.533, 
    farPlane=409.365, width=227.461, height=126.193, viewOffsetX=19.1823, 
    viewOffsetY=14.5413)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=152.424, 
    farPlane=414.474, width=254.646, height=141.274, viewOffsetX=31.5334, 
    viewOffsetY=15.1147)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=146.875, 
    farPlane=420.023, width=277.7, height=154.064, viewOffsetX=27.2018, 
    viewOffsetY=17.7117)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=155.699, 
    farPlane=411.2, width=230.779, height=128.033, viewOffsetX=16.5161, 
    viewOffsetY=17.5592)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].view.setValues(width=250.347, height=138.889, 
    viewOffsetX=17.7012, viewOffsetY=16.6567)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=155.836, 
    farPlane=411.063, width=230.041, height=127.624, viewOffsetX=15.329, 
    viewOffsetY=17.3341)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=175.287, 
    farPlane=409.748, width=228.636, height=126.844, viewOffsetX=6.30702, 
    viewOffsetY=3.53772)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=46 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=47 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=48 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=49 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=50 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=51 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=52 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=53 )
session.viewports['Viewport: 1'].view.setValues(nearPlane=173.328, 
    farPlane=409.288, width=226.081, height=125.427, viewOffsetX=17.1475, 
    viewOffsetY=10.2953)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=153.292, 
    farPlane=413.607, width=277.087, height=153.725, viewOffsetX=23.8112, 
    viewOffsetY=10.6953)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=149.252, 
    farPlane=417.647, width=265.261, height=147.164, viewOffsetX=35.7906, 
    viewOffsetY=11.3873)
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=152.738, 
    farPlane=414.161, width=256.213, height=142.144, viewOffsetX=16.6545, 
    viewOffsetY=11.3579)
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
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=159.849, 
    farPlane=407.049, width=235.966, height=130.911, viewOffsetX=35.2369, 
    viewOffsetY=8.28559)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=157.07, 
    farPlane=409.828, width=249.703, height=138.532, viewOffsetX=18.7584, 
    viewOffsetY=23.0282)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=155.836, 
    farPlane=411.063, width=260.346, height=144.437, viewOffsetX=7.42755, 
    viewOffsetY=9.43887)
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
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
# session.viewports['Viewport: 1'].setValues(displayMode=SINGLE)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=157.723, 
    farPlane=409.176, width=248.701, height=137.976, viewOffsetX=28.764, 
    viewOffsetY=16.1427)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=97 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=96 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
#: Warning: Requested operation could not be performed for the following layers: Layer-1
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb'].close(
    )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1, 
    appendToLayers=True)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=155.705, 
    farPlane=411.194, width=261.191, height=144.906, viewOffsetX=30.6231, 
    viewOffsetY=17.6317)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
