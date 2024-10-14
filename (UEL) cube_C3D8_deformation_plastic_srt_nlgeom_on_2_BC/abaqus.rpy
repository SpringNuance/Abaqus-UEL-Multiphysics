# -*- coding: mbcs -*-
#
# Abaqus/Viewer Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Sun Oct 13 21:13:53 2024
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
from viewerModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
o2 = session.openOdb(
    name='cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00161585, 
    farPlane=0.00512388, width=0.00375999, height=0.0016063, 
    viewOffsetX=0.000428006, viewOffsetY=0.000141296)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00111916, 
    farPlane=0.00453039, width=0.00260422, height=0.00111255, cameraPosition=(
    -0.000581879, 0.00274285, 0.00166046), cameraUpVector=(0.249137, 0.378743, 
    -0.891339), cameraTarget=(-0.000202903, 2.33779e-05, -0.000757338), 
    viewOffsetX=0.000296443, viewOffsetY=9.78638e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00123903, 
    farPlane=0.00350867, width=0.00288316, height=0.00123172, cameraPosition=(
    -0.00157305, 0.00015305, 0.00179146), cameraUpVector=(-0.0772076, 0.915609, 
    -0.394588), cameraTarget=(0.000420908, 0.00033347, -0.00127064), 
    viewOffsetX=0.000328195, viewOffsetY=0.000108346)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00121157, 
    farPlane=0.00391333, width=0.00281927, height=0.00120443, cameraPosition=(
    0.000156189, 0.00108127, 0.00254176), cameraUpVector=(-0.601642, 0.610312, 
    -0.515313), cameraTarget=(-0.000421615, -0.000306424, -0.000793704), 
    viewOffsetX=0.000320922, viewOffsetY=0.000105945)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00145201, 
    farPlane=0.00406596, width=0.00337876, height=0.00144345, cameraPosition=(
    0.00248699, 0.00166925, 0.000678949), cameraUpVector=(-0.67514, 0.682661, 
    -0.279573), cameraTarget=(-0.000837372, 0.000142893, 0.000617819), 
    viewOffsetX=0.00038461, viewOffsetY=0.00012697)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0010579, 
    farPlane=0.00434984, width=0.00246169, height=0.00105167, cameraPosition=(
    0.00147865, 0.00193319, 0.00187111), cameraUpVector=(-0.581998, 0.596901, 
    -0.552256), cameraTarget=(-0.000995019, -8.6866e-05, 8.63897e-05), 
    viewOffsetX=0.000280219, viewOffsetY=9.25076e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00115223, 
    farPlane=0.00432795, width=0.00268119, height=0.00114545, cameraPosition=(
    0.000703458, 0.00286136, 0.00136837), cameraUpVector=(-0.698416, 0.164639, 
    -0.696498), cameraTarget=(-0.000711629, -0.000332544, 0.00028144), 
    viewOffsetX=0.000305206, viewOffsetY=0.000100756)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00112801, 
    farPlane=0.00430125, width=0.00262483, height=0.00112137, cameraPosition=(
    0.00132273, 0.00218961, 0.00178804), cameraUpVector=(-0.632298, 0.498398, 
    -0.593126), cameraTarget=(-0.000918814, -0.000179664, 0.000130653), 
    viewOffsetX=0.00029879, viewOffsetY=9.86379e-05)
session.viewports['Viewport: 1'].view.setValues(session.views['Iso'])
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00166073, 
    farPlane=0.00513096, width=0.00388023, height=0.00165767, 
    viewOffsetX=0.000147893, viewOffsetY=0.000107266)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=92 )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00161227, 
    farPlane=0.00517942, width=0.00453538, height=0.00193756, 
    viewOffsetX=0.000116552, viewOffsetY=6.35306e-05)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00162437, 
    farPlane=0.00511536, width=0.00377982, height=0.00161478, 
    viewOffsetX=9.2338e-05, viewOffsetY=8.10781e-05)
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00149537, 
    farPlane=0.00524436, width=0.00395414, height=0.0019557, 
    viewOffsetX=0.000138747, viewOffsetY=0.000103477)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00155675, 
    farPlane=0.00518298, width=0.00386946, height=0.00191382, 
    viewOffsetX=0.000142779, viewOffsetY=0.000134937)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
#* VisError: The output database 
#* C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) 
#* cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb 
#* disk file has changed.
#* 
#* The current plot operation has been canceled, re-open the file to view the 
#* results
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00189139, 
    farPlane=0.00515813, width=0.00345025, height=0.00170648, 
    viewOffsetX=6.85293e-05, viewOffsetY=8.39264e-06)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00146319, 
    farPlane=0.00527654, width=0.00437872, height=0.00216569, 
    viewOffsetX=0.000120422, viewOffsetY=4.33922e-05)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00171231, 
    farPlane=0.00560477, width=0.00616945, height=0.00305138, 
    viewOffsetX=0.000191975, viewOffsetY=0.000197361)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00131484, 
    farPlane=0.00542488, width=0.00445314, height=0.0022025, 
    viewOffsetX=0.000148592, viewOffsetY=0.000168228)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00134406, 
    farPlane=0.00539566, width=0.00521826, height=0.00258092, 
    viewOffsetX=0.000172735, viewOffsetY=6.0769e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00121578, 
    farPlane=0.00533817, width=0.00472021, height=0.00233459, cameraPosition=(
    0.00158634, 0.00228556, 0.00228627), cameraUpVector=(-0.5455, 0.501065, 
    -0.671836), cameraTarget=(2.87533e-05, -8.0584e-05, -2.89385e-05), 
    viewOffsetX=0.000156249, viewOffsetY=5.4969e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00114394, 
    farPlane=0.00531898, width=0.00444128, height=0.00219664, cameraPosition=(
    0.00137738, 0.00306659, 0.00146128), cameraUpVector=(-0.625949, 0.191878, 
    -0.75589), cameraTarget=(8.67238e-05, -8.1948e-05, 0.000117474), 
    viewOffsetX=0.000147016, viewOffsetY=5.17208e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00133597, 
    farPlane=0.00519635, width=0.00518682, height=0.00256538, cameraPosition=(
    0.00147549, 0.0021786, 0.00241314), cameraUpVector=(-0.454742, 0.545876, 
    -0.703725), cameraTarget=(8.10873e-07, -4.39804e-05, -9.09296e-05), 
    viewOffsetX=0.000171695, viewOffsetY=6.0403e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00129929, 
    farPlane=0.00548689, width=0.0050444, height=0.00249494, cameraPosition=(
    0.00231821, 0.00251316, 0.00150708), cameraUpVector=(-0.649996, 0.445911, 
    -0.615361), cameraTarget=(2.71331e-05, 1.31906e-05, 0.000133753), 
    viewOffsetX=0.000166981, viewOffsetY=5.87444e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00117946, 
    farPlane=0.00524745, width=0.00457919, height=0.00226485, cameraPosition=(
    0.00112439, 0.00224676, 0.00249498), cameraUpVector=(-0.572546, 0.469155, 
    -0.672372), cameraTarget=(3.75326e-05, -0.000138304, -5.74922e-05), 
    viewOffsetX=0.000151581, viewOffsetY=5.33268e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00123504, 
    farPlane=0.00524249, width=0.00479496, height=0.00237157, cameraPosition=(
    0.00139265, 0.00252223, 0.00216425), cameraUpVector=(-0.63592, 0.39605, 
    -0.662383), cameraTarget=(3.49172e-05, -0.000129768, 4.0959e-05), 
    viewOffsetX=0.000158723, viewOffsetY=5.58395e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00142338, 
    farPlane=0.00532563, width=0.00552618, height=0.00273322, cameraPosition=(
    0.00219222, 0.00196271, 0.0021541), cameraUpVector=(-0.576688, 0.611442, 
    -0.541821), cameraTarget=(-6.02001e-05, -2.09858e-05, 6.21083e-05), 
    viewOffsetX=0.000182927, viewOffsetY=6.43547e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00148686, 
    farPlane=0.00535003, width=0.00577264, height=0.00285512, cameraPosition=(
    0.00239411, 0.00156893, 0.00223976), cameraUpVector=(-0.534855, 0.707793, 
    -0.461475), cameraTarget=(-7.75268e-05, -4.35657e-06, 4.87183e-05), 
    viewOffsetX=0.000191085, viewOffsetY=6.72248e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00141121, 
    farPlane=0.00548272, width=0.00547892, height=0.00270985, cameraPosition=(
    0.00252543, 0.00135658, 0.00223092), cameraUpVector=(-0.507925, 0.753508, 
    -0.417417), cameraTarget=(-8.40652e-05, 7.8714e-06, 5.00089e-05), 
    viewOffsetX=0.000181362, viewOffsetY=6.38043e-05)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00159328, 
    farPlane=0.00514645, width=0.00372264, height=0.0018412, 
    viewOffsetX=0.000171179, viewOffsetY=0.000280351)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00144312, 
    farPlane=0.0052966, width=0.00459434, height=0.00227234, 
    viewOffsetX=0.000121512, viewOffsetY=1.70132e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00114921, 
    farPlane=0.00509826, width=0.00365864, height=0.00180954, cameraPosition=(
    0.00100335, 0.00293902, 0.00178758), cameraUpVector=(-0.986342, -0.152015, 
    -0.0634064), cameraTarget=(0.000365642, -0.00023408, 8.18033e-05), 
    viewOffsetX=9.67646e-05, viewOffsetY=1.35482e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00125008, 
    farPlane=0.00483564, width=0.00397978, height=0.00196837, cameraPosition=(
    0.00096232, 0.00342751, -0.000249435), cameraUpVector=(-0.972694, 
    -0.193058, -0.128826), cameraTarget=(0.000313841, -0.000100873, 
    0.00046812), viewOffsetX=0.000105258, viewOffsetY=1.47374e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00187008, 
    farPlane=0.00502795, width=0.00595362, height=0.00294461, cameraPosition=(
    0.00304409, 0.00110872, 0.00152848), cameraUpVector=(-0.544492, 0.829244, 
    -0.126025), cameraTarget=(-0.00020147, 0.000229214, 8.70593e-05), 
    viewOffsetX=0.000157462, viewOffsetY=2.20467e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00110569, 
    farPlane=0.00549764, width=0.00352009, height=0.001741, cameraPosition=(
    0.000726413, 0.00262649, 0.0024304), cameraUpVector=(-0.49743, 0.445272, 
    -0.744511), cameraTarget=(-0.000202207, 0.000131663, -7.92581e-05), 
    viewOffsetX=9.30996e-05, viewOffsetY=1.30351e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0015, 
    farPlane=0.00514466, width=0.00477543, height=0.00236188, cameraPosition=(
    0.00147037, 0.00272595, 0.00199627), cameraUpVector=(-0.6571, 0.431492, 
    -0.61809), cameraTarget=(-0.000230715, 0.000149645, 3.31428e-05), 
    viewOffsetX=0.000126301, viewOffsetY=1.76837e-05)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb'].close(
    )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC/cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC_UEL.odb
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
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
