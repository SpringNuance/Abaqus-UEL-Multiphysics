# -*- coding: mbcs -*-
#
# Abaqus/Viewer Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Tue Mar 25 14:15:30 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=243.21875, 
    height=185.628463745117)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from viewerModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
o2 = session.openOdb(
    name='subroutine_cube_C3D8_elastic_nlgeom_on_symm_UEL.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8_elastic_nlgeom_on_symm_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o2)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00194875, 
    farPlane=0.00500777, width=0.00406922, height=0.00200761, 
    viewOffsetX=0.000417151, viewOffsetY=0.000250717)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR1_SIG11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR34_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR47_MU', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR10_STRAN12', outputPosition=INTEGRATION_POINT, )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8_elastic_nlgeom_on_symm_UEL.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8_elastic_nlgeom_on_symm_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8_elastic_nlgeom_on_symm_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00190858, 
    farPlane=0.00504794, width=0.00362971, height=0.00179077, 
    viewOffsetX=0.00028978, viewOffsetY=0.000296064)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8_elastic_nlgeom_on_symm_UEL.odb'].close(
    )
