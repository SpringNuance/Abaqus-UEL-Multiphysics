# -*- coding: mbcs -*-
#
# Abaqus/Viewer Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Mon Mar 24 11:09:12 2025
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
o2 = session.openOdb(name='cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00189177, 
    farPlane=0.00506294, width=0.00338187, height=0.00166849, 
    viewOffsetX=0.000263168, viewOffsetY=0.000254303)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR10_STRAN12', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00185334, 
    farPlane=0.00510136, width=0.00362088, height=0.00178641, 
    viewOffsetX=-7.04963e-05, viewOffsetY=0.000228241)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00175999, 
    farPlane=0.0051052, width=0.0034385, height=0.00169643, cameraPosition=(
    -0.00117196, 0.00374509, 0.000399497), cameraUpVector=(-0.69389, -0.650243, 
    -0.309356), cameraTarget=(0.000339767, 0.000434606, 2.49731e-05), 
    viewOffsetX=-6.69455e-05, viewOffsetY=0.000216745)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00173338, 
    farPlane=0.00498544, width=0.0033865, height=0.00167078, cameraPosition=(
    0.000981124, 0.00371597, -0.000180861), cameraUpVector=(-0.800013, 
    -0.233081, -0.552859), cameraTarget=(0.000200584, 0.000166438, 
    0.000239247), viewOffsetX=-6.59332e-05, viewOffsetY=0.000213467)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00189211, 
    farPlane=0.00493265, width=0.00369661, height=0.00182378, cameraPosition=(
    0.00242255, 0.00191344, 0.00178178), cameraUpVector=(-0.520404, 0.613395, 
    -0.594077), cameraTarget=(-0.000131598, 1.03838e-06, -8.17518e-06), 
    viewOffsetX=-7.19709e-05, viewOffsetY=0.000233015)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00208749, 
    farPlane=0.00477737, width=0.00407832, height=0.0020121, cameraPosition=(
    0.00230509, 0.000834403, 0.00238122), cameraUpVector=(-0.234237, 0.822365, 
    -0.518507), cameraTarget=(-0.000250492, 2.05343e-05, -0.000107055), 
    viewOffsetX=-7.94026e-05, viewOffsetY=0.000257076)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00176876, 
    farPlane=0.00512718, width=0.00345561, height=0.00170488, cameraPosition=(
    0.00181755, 0.00229526, 0.00218002), cameraUpVector=(-0.733281, 0.507858, 
    -0.452083), cameraTarget=(4.21849e-05, 7.93742e-05, -0.000127107), 
    viewOffsetX=-6.72788e-05, viewOffsetY=0.000217824)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00231091, 
    farPlane=0.00449529, width=0.0045148, height=0.00222745, cameraPosition=(
    0.00282461, 2.42685e-05, 0.00164944), cameraUpVector=(-0.245756, 0.943935, 
    -0.220431), cameraTarget=(-0.000329801, 6.22495e-05, -0.00020345), 
    viewOffsetX=-8.79006e-05, viewOffsetY=0.00028459)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
#* VisError: The output database 
#* C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) 
#* cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb 
#* disk file has changed.
#* 
#* The current plot operation has been canceled, re-open the file to view the 
#* results
session.viewports['Viewport: 1'].view.setValues(nearPlane=1.4079, 
    farPlane=2.78827, width=0.00465936, height=0.00229877, 
    viewOffsetX=0.000137916, viewOffsetY=0.000340051)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00233152, 
    farPlane=0.00496246, width=0.00303405, height=0.00149689, 
    viewOffsetX=0.000126999, viewOffsetY=1.04917e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00182222, 
    farPlane=0.00513249, width=0.003805, height=0.00187725, 
    viewOffsetX=0.000190131, viewOffsetY=0.000148055)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00185934, 
    farPlane=0.00509717, width=0.00349302, height=0.00172334, 
    viewOffsetX=0.000514586, viewOffsetY=0.000227052)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR10_STRAN12', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR11_STRAN13', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR12_STRAN23', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR1_SIG11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00181756, 
    farPlane=0.00513896, width=0.00386434, height=0.00190653, 
    viewOffsetX=0.000165263, viewOffsetY=0.000380444)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00175734, 
    farPlane=0.00519918, width=0.0042458, height=0.00209473, 
    viewOffsetX=0.000237438, viewOffsetY=0.000241804)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
#* VisError: The output database 
#* C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) 
#* cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb 
#* disk file has changed.
#* 
#* The current plot operation has been canceled, re-open the file to view the 
#* results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00188015, 
    farPlane=0.00507637, width=0.00382163, height=0.00188546, 
    viewOffsetX=0.00032309, viewOffsetY=0.000237767)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR1_SIG11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
