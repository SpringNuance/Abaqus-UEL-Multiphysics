# -*- coding: mbcs -*-
#
# Abaqus/Viewer Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Fri Mar  7 22:06:39 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# -*- coding: mbcs -*-
#
# Abaqus/Viewer Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Fri Mar  7 22:06:39 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=208.28125, 
    height=108.33911895752)
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=208.28125, 
    height=108.33911895752)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from viewerModules import *
from viewerModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
o2 = session.openOdb(
    name='cube_C3D8_deformation_elastic_solver_nlgeom_off.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_elastic_solver_nlgeom_off/cube_C3D8_deformation_elastic_solver_nlgeom_off.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].setValues(displayedObject=o2)
session.viewports['Viewport: 1'].makeCurrent()
o2 = session.openOdb(
    name='cube_C3D8_deformation_elastic_srt_nlgeom_off_UEL.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_elastic_solver_nlgeom_off/cube_C3D8_deformation_elastic_srt_nlgeom_off_UEL.odb
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00218589, 
    farPlane=0.0051081, width=0.00347118, height=0.00148688, 
    viewOffsetX=-9.11254e-05, viewOffsetY=-6.18723e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(COMPONENT, 'U2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(COMPONENT, 'U3'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00223832, 
    farPlane=0.00505566, width=0.00277513, height=0.00118873, 
    viewOffsetX=6.32443e-05, viewOffsetY=-3.42865e-06)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_elastic_solver_nlgeom_off/cube_C3D8_deformation_elastic_solver_nlgeom_off.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_elastic_solver_nlgeom_off/cube_C3D8_deformation_elastic_solver_nlgeom_off.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.Viewport(name='Viewport: 2', origin=(5.375, 15.8599538803101), 
    width=192.828125, height=87.1180572509766)
session.viewports['Viewport: 2'].makeCurrent()
session.viewports['Viewport: 2'].maximize()
session.viewports['Viewport: 1'].restore()
session.viewports['Viewport: 2'].restore()
session.viewports['Viewport: 1'].setValues(origin=(0.0, 62.099536895752), 
    width=215.89582824707, height=46.2395820617676)
session.viewports['Viewport: 2'].setValues(origin=(0.0, 15.8599548339844), 
    width=215.89582824707, height=46.2395820617676)
session.viewports['Viewport: 1'].setValues(origin=(0.0, 15.8599548339844), 
    width=107.947914123535, height=92.4791641235352)
session.viewports['Viewport: 2'].setValues(origin=(107.947914123535, 
    15.8599548339844), width=107.947914123535, height=92.4791641235352)
session. linkedViewportCommands.setValues(linkViewports=True)
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
session.viewports['Viewport: 2'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].view.setValues(width=0.00154516, 
    height=0.0012375, viewOffsetX=2.10167e-05, viewOffsetY=2.4195e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00154516, 
    height=0.0012375, viewOffsetX=2.10167e-05, viewOffsetY=2.4195e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00146714, 
    height=0.00117502, viewOffsetX=3.87138e-05, viewOffsetY=4.56844e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00146714, 
    height=0.00117502, viewOffsetX=3.87138e-05, viewOffsetY=4.56844e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00158062, 
    height=0.00126591, viewOffsetX=1.73048e-05, viewOffsetY=4.83693e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00158062, 
    height=0.00126591, viewOffsetX=1.73048e-05, viewOffsetY=4.83693e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00165082, 
    height=0.00132213, viewOffsetX=-7.35361e-06, viewOffsetY=4.90561e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00165082, 
    height=0.00132213, viewOffsetX=-7.35361e-06, viewOffsetY=4.90561e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00173599, 
    height=0.00139034, viewOffsetX=-3.55156e-05, viewOffsetY=4.8822e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00173599, 
    height=0.00139034, viewOffsetX=-3.55156e-05, viewOffsetY=4.8822e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00182072, 
    height=0.0014582, viewOffsetX=-7.06572e-05, viewOffsetY=4.61705e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00182072, 
    height=0.0014582, viewOffsetX=-7.06572e-05, viewOffsetY=4.61705e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00190935, 
    height=0.00152918, viewOffsetX=-0.000108242, viewOffsetY=4.29709e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00190935, 
    height=0.00152918, viewOffsetX=-0.000108242, viewOffsetY=4.29709e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00200052, 
    height=0.0016022, viewOffsetX=-0.000121864, viewOffsetY=4.72674e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00200052, 
    height=0.0016022, viewOffsetX=-0.000121864, viewOffsetY=4.72674e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00209461, 
    height=0.00167755, viewOffsetX=-0.000136715, viewOffsetY=5.16999e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00209461, 
    height=0.00167755, viewOffsetX=-0.000136715, viewOffsetY=5.16999e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00219141, 
    height=0.00175509, viewOffsetX=-0.000161194, viewOffsetY=5.45949e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00219141, 
    height=0.00175509, viewOffsetX=-0.000161194, viewOffsetY=5.45949e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00229091, 
    height=0.00183477, viewOffsetX=-0.000192766, viewOffsetY=5.55373e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00229091, 
    height=0.00183477, viewOffsetX=-0.000192766, viewOffsetY=5.55373e-05)
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S22'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S33'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S12'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S13'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S23'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Max. Principal'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'E11'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'E22'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'E33'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'E12'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'E13'), )
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'E23'), )
