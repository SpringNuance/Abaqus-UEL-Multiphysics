# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Sun Oct 13 13:27:02 2024
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=140.197906494141, 
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
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_deformation_plastic_solver_nlgeom_on', 
    toName='cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC')
p = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(
    fromName='cube_C3D8_deformation_plastic_solver_nlgeom_off', 
    toName='cube_C3D8_deformation_plastic_solver_nlgeom_on_2BC')
p = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_2BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
mdb.models.changeKey(
    fromName='cube_C3D8_deformation_plastic_solver_nlgeom_on_2BC', 
    toName='cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC')
p = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC'].steps['step1_tensile'].setValues(
    nlgeom=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC'].boundaryConditions['ysymm'].setValues(
    typeName=ENCASTRE)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
del mdb.jobs['cube_C3D8_deformation_plastic_solver_nlgeom_off']
del mdb.jobs['cube_C3D8_deformation_plastic_solver_nlgeom_on']
mdb.Job(name='cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC', 
    model='cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC', 
    description='', type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, 
    queue=None, memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC', 
    model='cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC', 
    description='', type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, 
    queue=None, memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
mdb.jobs['cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.inp" has been submitted for analysis.
mdb.jobs['cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC.inp" has been submitted for analysis.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC: Abaqus/Standard completed successfully.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC completed successfully. 
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC: Abaqus/Standard completed successfully.
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00160079, 
    farPlane=0.00513894, width=0.00300683, height=0.00166576, 
    viewOffsetX=0.000343962, viewOffsetY=0.000131143)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00191181, 
    farPlane=0.00516522, width=0.00397758, height=0.00167246, 
    viewOffsetX=0.00016791, viewOffsetY=0.000255787)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(solver) cube_C3D8_deformation_elastic_solver_nlgeom_on/cube_C3D8_deformation_elastic_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(solver) cube_C3D8_deformation_elastic_solver_nlgeom_on/cube_C3D8_deformation_elastic_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00182155, 
    farPlane=0.00513496, width=0.00428905, height=0.00180342, 
    viewOffsetX=0.000304556, viewOffsetY=0.000317997)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00160485, 
    farPlane=0.00513487, width=0.00398215, height=0.00166999, 
    viewOffsetX=0.000345645, viewOffsetY=0.000130667)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00154682, 
    farPlane=0.0051929, width=0.00428342, height=0.0016096, 
    viewOffsetX=0.000658897, viewOffsetY=6.99239e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S11'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S22'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S33'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S12'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S13'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(COMPONENT, 
    'S23'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Max. Principal'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'LE11'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'LE22'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'LE33'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'LE12'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'LE13'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'LE23'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(COMPONENT, 'RF3'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(COMPONENT, 'U1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(COMPONENT, 'U2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(COMPONENT, 'U3'), )
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
del mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_off']
del mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on']
mdb.Model(name='cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC', 
    objectToCopy=mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC'])
#: The model "cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC" has been created.
p1 = mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
p1 = mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].materials.changeKey(
    fromName='von_Mises', toName='user_subroutine')
del mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].materials['user_subroutine'].elastic
del mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].materials['user_subroutine'].plastic
mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].materials['user_subroutine'].Depvar(
    n=30)
mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].materials['user_subroutine'].UserMaterial(
    mechanicalConstants=(0.0, ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.Job(name='cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC', 
    model='cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC.inp".
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(solver) cube_C3D8_deformation_elastic_solver_nlgeom_on/cube_C3D8_deformation_elastic_solver_nlgeom_on.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_2_BC.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on_3_BC.odb'].close(
    )
a = mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC.inp".
p1 = mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].sections['Section-1'].setValues(
    material='user_subroutine', thickness=None)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC.inp".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('RF', 'U', 'SDV'))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8_deformation_plastic_srt_nlgeom_on_2_BC.inp".
