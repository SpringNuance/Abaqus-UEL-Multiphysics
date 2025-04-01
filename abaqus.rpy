# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Tue Apr  1 11:42:11 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=192.38020324707, 
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00202217, 
    farPlane=0.00493435, width=0.00438188, height=0.00213854, 
    viewOffsetX=0.000651836, viewOffsetY=0.000108044)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203634, 
    farPlane=0.00492017, width=0.00501431, height=0.0024472, 
    viewOffsetX=0.000631624, viewOffsetY=0.000285923)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR38_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00197004, 
    farPlane=0.00498648, width=0.0054901, height=0.0026794, 
    viewOffsetX=0.000706405, viewOffsetY=0.000284927)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR38_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207396, 
    farPlane=0.00488256, width=0.003748, height=0.00182918, 
    viewOffsetX=0.000534781, viewOffsetY=0.000206805)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00202411, 
    farPlane=0.00493241, width=0.00438608, height=0.00214059, 
    viewOffsetX=0.000695261, viewOffsetY=0.000134302)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
#: The selected probe values were written to file "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/abaqus.rpt".
#: The selected probe values were appended to file "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/abaqus.rpt".
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
#: The selected probe values were appended to file "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/abaqus.rpt".
#: The selected probe values were appended to file "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/abaqus.rpt".
#: The selected probe values were appended to file "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/abaqus.rpt".
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
#: The selected probe values were appended to file "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/abaqus.rpt".
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00197849, 
    farPlane=0.00497802, width=0.00485202, height=0.00236799, 
    viewOffsetX=0.000884409, viewOffsetY=1.09269e-05)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00206265, 
    farPlane=0.00489386, width=0.00394935, height=0.00192745, 
    viewOffsetX=0.00079873, viewOffsetY=0.000156807)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00206144, 
    farPlane=0.00489508, width=0.00396317, height=0.00193419, 
    viewOffsetX=0.000896144, viewOffsetY=0.000189067)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00217128, 
    farPlane=0.0049395, width=0.00444078, height=0.00216729, 
    viewOffsetX=0.000802526, viewOffsetY=9.53715e-05)
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=1.75014, 
    farPlane=3.50028, width=0.00398058, height=0.00194269, cameraPosition=(
    2.02066, 2.0206, 2.02066), viewOffsetX=0.000641832, 
    viewOffsetY=0.000156463)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00208125, 
    farPlane=0.00487527, width=0.00376118, height=0.00183562, 
    viewOffsetX=0.000555531, viewOffsetY=0.000200314)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00238061, 
    farPlane=0.00484062, width=0.00337266, height=0.001646, 
    viewOffsetX=0.000495012, viewOffsetY=1.85229e-05)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0020201, 
    farPlane=0.00493641, width=0.00443135, height=0.00216268, 
    viewOffsetX=0.00067606, viewOffsetY=0.000168537)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203505, 
    farPlane=0.00492146, width=0.00471047, height=0.00229891, 
    viewOffsetX=0.000882747, viewOffsetY=8.9007e-05)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0022999, 
    farPlane=0.00499199, width=0.00500408, height=0.0024422, 
    viewOffsetX=0.00121511, viewOffsetY=0.00021287)
mdb.Model(name='solver_cube_C3D8T_transient_nlgeom_on_4NP_fix', 
    objectToCopy=mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'])
#: The model "solver_cube_C3D8T_transient_nlgeom_on_4NP_fix" has been created.
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_fix'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_thermomechanical')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_fix'].boundaryConditions['top_disp'].suppress(
    )
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
mdb.Job(name='solver_cube_C3D8T_transient_nlgeom_on_4NP_fix', 
    model='solver_cube_C3D8T_transient_nlgeom_on_4NP_fix', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP_fix'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_transient_nlgeom_on_4NP_fix.inp" has been submitted for analysis.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP_fix: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP_fix: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP_fix completed successfully. 
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'])
o3 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_fix.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_fix.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00244644, 
    farPlane=0.00487064, width=0.00364226, height=0.00177758, 
    viewOffsetX=0.000483739, viewOffsetY=-0.00015508)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00249912, 
    farPlane=0.00481796, width=0.00312843, height=0.00152681, 
    viewOffsetX=0.000479383, viewOffsetY=-0.000140841)
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
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_fix.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0024953, 
    farPlane=0.00482178, width=0.00353515, height=0.0017253, 
    viewOffsetX=0.000560001, viewOffsetY=-0.000128851)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00246098, 
    farPlane=0.0048561, width=0.00394581, height=0.00192572, 
    viewOffsetX=0.000660359, viewOffsetY=-0.000205577)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00247879, 
    farPlane=0.00483828, width=0.00330105, height=0.00161105, 
    viewOffsetX=0.000541917, viewOffsetY=-0.000144101)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_fix.odb']
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
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_fix'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.Model(name='solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer', 
    objectToCopy=mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_fix'])
#: The model "solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer" has been created.
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
del mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].steps['step1_thermomechanical']
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].HeatTransferStep(
    name='Step-1', previous='Initial', timePeriod=100.0, initialInc=1.0, 
    minInc=0.001, maxInc=1.0, deltmx=100.0, amplitude=STEP)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].fieldOutputRequests['F-Output-1'].setValues(
    variables=PRESELECT)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].rootAssembly
region = a.sets['top_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].TemperatureBC(
    name='BC-1', createStepName='Step-1', region=region, fixed=OFF, 
    distributionType=UNIFORM, fieldName='', magnitude=100.0, amplitude=UNSET)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=ON, 
    adaptiveMeshConstraints=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=ON)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
elemType1 = mesh.ElemType(elemCode=DC3D8, elemLibrary=STANDARD)
elemType2 = mesh.ElemType(elemCode=DC3D6, elemLibrary=STANDARD)
elemType3 = mesh.ElemType(elemCode=DC3D4, elemLibrary=STANDARD)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].parts['cube']
c = p.cells
cells = c.getSequenceFromMask(mask=('[#1 ]', ), )
pickedRegions =(cells, )
p.setElementType(regions=pickedRegions, elemTypes=(elemType1, elemType2, 
    elemType3))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].rootAssembly
a.regenerate()
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=OFF)
mdb.Job(name='solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer', 
    model='solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer', 
    description='', type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, 
    queue=None, memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.inp" has been submitted for analysis.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer completed successfully. 
o3 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0025, 
    farPlane=0.00481708, width=0.00307884, height=0.0015026, 
    viewOffsetX=0.000242, viewOffsetY=-0.000120474)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RFL11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'HFL1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'HFL2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'HFL3'), )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_fix.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb'].close(
    )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          7
#: Number of Steps:              3
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00251591, 
    farPlane=0.00480117, width=0.00329621, height=0.00160869, 
    viewOffsetX=0.000230373, viewOffsetY=-0.000131351)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=1, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=1, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=1, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=1, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=2, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=1, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=1, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00250274, 
    farPlane=0.00481434, width=0.00309483, height=0.00151041, 
    viewOffsetX=0.00011628, viewOffsetY=-0.000130911)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer/solver_cube_C3D8T_transient_nlgeom_on_4NP_heat_transfer.odb' disk file has changed.
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205993, 
    farPlane=0.00489659, width=0.00399273, height=0.00194862, 
    viewOffsetX=0.00084222, viewOffsetY=0.000143544)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205275, 
    farPlane=0.00490377, width=0.00450296, height=0.00219763, 
    viewOffsetX=0.00096746, viewOffsetY=0.000217357)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00200948, 
    farPlane=0.00494704, width=0.00500914, height=0.00244467, 
    viewOffsetX=0.00109056, viewOffsetY=5.51041e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR30_SIG_H', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR34_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR34_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00212628, 
    farPlane=0.00483024, width=0.00364162, height=0.00177726, 
    viewOffsetX=0.000810068, viewOffsetY=-2.62618e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00202689, 
    farPlane=0.00492962, width=0.0047494, height=0.00231791, 
    viewOffsetX=0.000955837, viewOffsetY=1.1961e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205275, 
    farPlane=0.00490377, width=0.00450296, height=0.00219763, 
    viewOffsetX=0.00110016, viewOffsetY=0.000185527)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205275, 
    farPlane=0.00490377, width=0.00450296, height=0.00219763, 
    viewOffsetX=0.000930346, viewOffsetY=1.74982e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00201048, 
    farPlane=0.00494604, width=0.00501163, height=0.00244589, 
    viewOffsetX=0.00122489, viewOffsetY=0.000127769)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00194181, 
    farPlane=0.00501471, width=0.00580402, height=0.00283261, 
    viewOffsetX=0.0013876, viewOffsetY=0.000253948)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203235, 
    farPlane=0.00492417, width=0.00474277, height=0.00231467, 
    viewOffsetX=0.00109495, viewOffsetY=0.000274169)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0020051, 
    farPlane=0.00495142, width=0.00499823, height=0.00243934, 
    viewOffsetX=0.00133036, viewOffsetY=0.000196182)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203169, 
    farPlane=0.00492483, width=0.00476063, height=0.00232339, 
    viewOffsetX=0.0012112, viewOffsetY=0.000246599)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207355, 
    farPlane=0.00488297, width=0.00425825, height=0.0020782, 
    viewOffsetX=0.00094896, viewOffsetY=9.99552e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207229, 
    farPlane=0.00488423, width=0.00427307, height=0.00208544, 
    viewOffsetX=0.000895634, viewOffsetY=9.20726e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203235, 
    farPlane=0.00492417, width=0.00474277, height=0.00231467, 
    viewOffsetX=0.000920418, viewOffsetY=0.000103406)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203235, 
    farPlane=0.00492417, width=0.00474278, height=0.00231467, 
    viewOffsetX=0.00099275, viewOffsetY=0.000227137)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00201048, 
    farPlane=0.00494604, width=0.00501163, height=0.00244588, 
    viewOffsetX=0.00123128, viewOffsetY=0.000125696)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203235, 
    farPlane=0.00492417, width=0.00474278, height=0.00231467, 
    viewOffsetX=0.00133878, viewOffsetY=9.97588e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00205936, 
    farPlane=0.00491968, width=0.00424642, height=0.00207243, 
    viewOffsetX=0.000964219, viewOffsetY=0.000181729)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0020119, 
    farPlane=0.00494462, width=0.00499475, height=0.00243765, 
    viewOffsetX=0.00112999, viewOffsetY=0.00019932)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00204046, 
    farPlane=0.00491606, width=0.00420745, height=0.00205341, 
    viewOffsetX=0.000972923, viewOffsetY=8.18746e-05)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207309, 
    farPlane=0.00490595, width=0.00452905, height=0.00221037, 
    viewOffsetX=0.000892534, viewOffsetY=0.000104923)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207698, 
    farPlane=0.00489801, width=0.00400938, height=0.00195675, 
    viewOffsetX=0.000801394, viewOffsetY=0.000193168)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00202619, 
    farPlane=0.0049488, width=0.00503023, height=0.00245496, 
    viewOffsetX=0.00107929, viewOffsetY=0.000111312)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00207176, 
    farPlane=0.00490728, width=0.00454467, height=0.00221799, 
    viewOffsetX=0.000926399, viewOffsetY=0.000141842)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00203306, 
    farPlane=0.00492346, width=0.00474443, height=0.00231548, 
    viewOffsetX=0.000911228, viewOffsetY=0.000179587)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0020119, 
    farPlane=0.00494462, width=0.00499475, height=0.00243765, 
    viewOffsetX=0.000895976, viewOffsetY=0.000225106)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0021433, 
    farPlane=0.00481322, width=0.00343646, height=0.00167713, 
    viewOffsetX=0.00055743, viewOffsetY=-9.68436e-06)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
