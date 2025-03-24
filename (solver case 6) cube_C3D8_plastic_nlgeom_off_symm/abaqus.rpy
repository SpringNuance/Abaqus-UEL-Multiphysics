# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Sun Mar 23 21:46:43 2025
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
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
openMdb('cube_test.cae')
#: The model database "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity_part2\cube_test.cae" has been opened.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
p = mdb.models['cube_C3D8_elastic_solver_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
#--- Recover file: 'cube_test.rec' ---
# -*- coding: mbcs -*- 
from part import *
from material import *
from section import *
from assembly import *
from step import *
from interaction import *
from load import *
from mesh import *
from optimization import *
from job import *
from sketch import *
from visualization import *
from connectorBehavior import *
mdb.Job(atTime=None, contactPrint=OFF, description='', echoPrint=OFF, 
    explicitPrecision=SINGLE, getMemoryFromAnalysis=True, historyPrint=OFF, 
    memory=90, memoryUnits=PERCENTAGE, 
    model='cube_C3D8_elastic_srt_nlgeom_off_nosymm', modelPrint=OFF, 
    multiprocessingMode=DEFAULT, 
    name='cube_C3D8_elastic_srt_nlgeom_off_nosymm', 
    nodalOutputPrecision=SINGLE, numCpus=1, numGPUs=0, 
    numThreadsPerMpiProcess=1, queue=None, resultsFormat=ODB, scratch='', 
    type=ANALYSIS, userSubroutine='', waitHours=0, waitMinutes=0)
mdb.Job(atTime=None, contactPrint=OFF, description='', echoPrint=OFF, 
    explicitPrecision=SINGLE, getMemoryFromAnalysis=True, historyPrint=OFF, 
    memory=90, memoryUnits=PERCENTAGE, 
    model='cube_C3D8_elastic_srt_nlgeom_off_symm', modelPrint=OFF, 
    multiprocessingMode=DEFAULT, name='cube_C3D8_elastic_srt_nlgeom_off_symm', 
    nodalOutputPrecision=SINGLE, numCpus=1, numGPUs=0, 
    numThreadsPerMpiProcess=1, queue=None, resultsFormat=ODB, scratch='', 
    type=ANALYSIS, userSubroutine='', waitHours=0, waitMinutes=0)
mdb.Job(atTime=None, contactPrint=OFF, description='', echoPrint=OFF, 
    explicitPrecision=SINGLE, getMemoryFromAnalysis=True, historyPrint=OFF, 
    memory=90, memoryUnits=PERCENTAGE, 
    model='cube_C3D8_elastic_srt_nlgeom_on_nosymm', modelPrint=OFF, 
    multiprocessingMode=DEFAULT, name='cube_C3D8_elastic_srt_nlgeom_on_nosymm', 
    nodalOutputPrecision=SINGLE, numCpus=1, numGPUs=0, 
    numThreadsPerMpiProcess=1, queue=None, resultsFormat=ODB, scratch='', 
    type=ANALYSIS, userSubroutine='', waitHours=0, waitMinutes=0)
mdb.Job(atTime=None, contactPrint=OFF, description='', echoPrint=OFF, 
    explicitPrecision=SINGLE, getMemoryFromAnalysis=True, historyPrint=OFF, 
    memory=90, memoryUnits=PERCENTAGE, 
    model='cube_C3D8_elastic_srt_nlgeom_on_symm', modelPrint=OFF, 
    multiprocessingMode=DEFAULT, name='cube_C3D8_elastic_srt_nlgeom_on_symm', 
    nodalOutputPrecision=SINGLE, numCpus=1, numGPUs=0, 
    numThreadsPerMpiProcess=1, queue=None, resultsFormat=ODB, scratch='', 
    type=ANALYSIS, userSubroutine='', waitHours=0, waitMinutes=0)
#--- End of Recover file ------
p1 = mdb.models['cube_C3D8_elastic_solver_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='cube_C3D8_plastic_solver_nlgeom_on_symm-Copy', 
    objectToCopy=mdb.models['cube_C3D8_elastic_solver_nlgeom_on_symm'])
#: The model "cube_C3D8_plastic_solver_nlgeom_on_symm-Copy" has been created.
p = mdb.models['cube_C3D8_plastic_solver_nlgeom_on_symm-Copy'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
mdb.models.changeKey(fromName='cube_C3D8_plastic_solver_nlgeom_on_symm-Copy', 
    toName='cube_C3D8_plastic_solver_nlgeom_on_symm')
p = mdb.models['cube_C3D8_plastic_solver_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
mdb.models['cube_C3D8_plastic_solver_nlgeom_on_symm'].materials.changeKey(
    fromName='elastic', toName='plastic')
mdb.models['cube_C3D8_plastic_solver_nlgeom_on_symm'].sections['Section-1'].setValues(
    material='plastic', thickness=None)
mdb.models['cube_C3D8_plastic_solver_nlgeom_on_symm'].materials['plastic'].Plastic(
    scaleStress=None, table=((869678161.0, 0.0), (871526751.0, 0.0002), (
    873375341.0, 0.0004), (875223931.0, 0.0006), (877072520.0, 0.0008), (
    878921110.0, 0.001), (888164060.0, 0.002), (897407009.0, 0.003), (
    906649958.0, 0.004), (915892908.0, 0.005), (925135857.0, 0.006), (
    934378806.0, 0.007), (943621755.0, 0.008), (952084914.0, 0.009), (
    959844844.0, 0.01), (1010427048.0, 0.02), (1033932857.0, 0.03), (
    1046208995.0, 0.04), (1053646044.0, 0.05), (1058887114.0, 0.06), (
    1063049790.0, 0.07), (1066621845.0, 0.08), (1069826972.0, 0.09), (
    1072775596.0, 0.1), (1079364332.0, 0.125), (1085153293.0, 0.15), (
    1090361229.0, 0.175), (1095119522.0, 0.2), (1099516804.0, 0.225), (
    1103616454.0, 0.25), (1107465618.0, 0.275), (1111100445.0, 0.3), (
    1114549346.0, 0.325), (1117835107.0, 0.35), (1120976321.0, 0.375), (
    1123988384.0, 0.4), (1126884207.0, 0.425), (1129674736.0, 0.45), (
    1132369345.0, 0.475), (1134976132.0, 0.5), (1137502145.0, 0.525), (
    1139953559.0, 0.55), (1142335826.0, 0.575), (1144653780.0, 0.6), (
    1146911730.0, 0.625), (1149113542.0, 0.65), (1151262691.0, 0.675), (
    1153362320.0, 0.7), (1155415280.0, 0.725), (1157424164.0, 0.75), (
    1159391342.0, 0.775), (1161318984.0, 0.8), (1163209085.0, 0.825), (
    1165063480.0, 0.85), (1166883866.0, 0.875), (1168671811.0, 0.9), (
    1170428771.0, 0.925), (1172156099.0, 0.95), (1173855056.0, 0.975), (
    1175526817.0, 1.0), (1178793080.0, 1.05), (1181962876.0, 1.1), (
    1185043253.0, 1.15), (1188040464.0, 1.2), (1190960083.0, 1.25), (
    1193807107.0, 1.3), (1196586031.0, 1.35), (1199300921.0, 1.4), (
    1201955460.0, 1.45), (1204553006.0, 1.5), (1207096621.0, 1.55), (
    1209589113.0, 1.6), (1212033060.0, 1.65), (1214430836.0, 1.7), (
    1216784635.0, 1.75), (1219096485.0, 1.8), (1221368268.0, 1.85), (
    1223601736.0, 1.9), (1225798517.0, 1.95), (1227960132.0, 2.0), (
    1230088002.0, 2.05), (1232183459.0, 2.1), (1234247750.0, 2.15), (
    1236282049.0, 2.2), (1238287457.0, 2.25), (1240265014.0, 2.3), (
    1242215699.0, 2.35), (1244140439.0, 2.4), (1246040107.0, 2.45), (
    1247915534.0, 2.5), (1249767502.0, 2.55), (1251596759.0, 2.6), (
    1253404010.0, 2.65), (1255189928.0, 2.7), (1256955154.0, 2.75), (
    1258700297.0, 2.8), (1260425937.0, 2.85), (1262132630.0, 2.9), (
    1263820905.0, 2.95), (1265491268.0, 3.0)))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity_part2\cube_test.cae".
a = mdb.models['cube_C3D8_plastic_solver_nlgeom_on_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    optimizationTasks=OFF, geometricRestrictions=OFF, stopConditions=OFF)
mdb.Job(name='cube_C3D8_plastic_solver_nlgeom_on_symm', 
    model='cube_C3D8_plastic_solver_nlgeom_on_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['cube_C3D8_plastic_solver_nlgeom_on_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_plastic_solver_nlgeom_on_symm.inp" has been submitted for analysis.
#: Job cube_C3D8_plastic_solver_nlgeom_on_symm: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_plastic_solver_nlgeom_on_symm: Abaqus/Standard completed successfully.
#: Job cube_C3D8_plastic_solver_nlgeom_on_symm completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/cube_C3D8_plastic_solver_nlgeom_on_symm.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/cube_C3D8_plastic_solver_nlgeom_on_symm.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00198882, 
    farPlane=0.00508822, width=0.00305416, height=0.00173983, 
    viewOffsetX=0.000258605, viewOffsetY=0.000257282)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0017474, 
    farPlane=0.00511099, width=0.00323077, height=0.00184043, 
    viewOffsetX=0.000238589, viewOffsetY=0.000263112)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb'].close(
    )
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/cube_C3D8_plastic_solver_nlgeom_on_symm.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00179218, 
    farPlane=0.00512586, width=0.00331356, height=0.0018876, 
    viewOffsetX=0.000328735, viewOffsetY=0.000227621)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/cube_C3D8_plastic_solver_nlgeom_on_symm.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00191996, 
    farPlane=0.00515707, width=0.0037764, height=0.00215126, 
    viewOffsetX=0.000440002, viewOffsetY=0.000226896)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0017731, 
    farPlane=0.00508529, width=0.00308158, height=0.00175545, 
    viewOffsetX=0.000323017, viewOffsetY=0.000215071)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00172081, 
    farPlane=0.00513758, width=0.00338467, height=0.00192811, 
    viewOffsetX=0.000300456, viewOffsetY=0.000257422)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00171233, 
    farPlane=0.00514606, width=0.003368, height=0.00191861, 
    viewOffsetX=0.000320671, viewOffsetY=0.000175969)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#* OdbError: Cannot open file 
#* C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) 
#* cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb. 
#* ***ERROR: 
#* "C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity_part2/(UEL) 
#* cube_C3D8_elastic_solver_nlgeom_on_symm/cube_C3D8_elastic_srt_nlgeom_on_symm_UEL.odb" 
#*  is not an Abaqus database file.
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
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
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
    SYMBOLS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR10_STRAN12', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
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
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0017724, 
    farPlane=0.00518231, width=0.0039454, height=0.00224753, 
    viewOffsetX=0.000373342, viewOffsetY=0.000228544)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR28_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
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
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR9_STRAN33', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR10_STRAN12', outputPosition=INTEGRATION_POINT, )
