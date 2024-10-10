# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Thu Oct 10 11:56:27 2024
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=127.88020324707, 
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
p = mdb.models['cube_C3D8T_deformation_elastic_solver'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00235177, 
    farPlane=0.0049653, width=0.00252904, height=0.00124898, 
    viewOffsetX=0.000107368, viewOffsetY=-1.95382e-05)
p1 = mdb.models['cube_C3D8T_diffusion_srt'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='cube_C3D8T_diffusion_solver', 
    objectToCopy=mdb.models['cube_C3D8T_diffusion_srt'])
#: The model "cube_C3D8T_diffusion_solver" has been created.
p = mdb.models['cube_C3D8T_diffusion_solver'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
p1 = mdb.models['cube_C3D8_deformation_elastic_solver'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
del mdb.models['cube_C3D8_deformation_elastic_solver'].materials['von_Mises']
a = mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
mdb.models['cube_C3D8_deformation_elastic_solver'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('E', 'LODE', 'MISES', 'RF', 'S', 'TRIAX', 'U'))
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
del mdb.models['cube_C3D8_deformation_elastic_solver'].boundaryConditions['zsymm']
a = mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly
region = a.sets['zsymm_side']
mdb.models['cube_C3D8_deformation_elastic_solver'].ZsymmBC(name='zsymm', 
    createStepName='step1_tensile', region=region, localCsys=None)
del mdb.models['cube_C3D8_deformation_elastic_solver'].boundaryConditions['xsymm']
a = mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly
region = a.sets['xsymm_side']
mdb.models['cube_C3D8_deformation_elastic_solver'].XsymmBC(name='xsymm', 
    createStepName='step1_tensile', region=region, localCsys=None)
mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly.sets.changeKey(
    fromName='Set-6', toName='ysymm')
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
del mdb.jobs['CHD2_solver']
del mdb.jobs['CHD2_subroutine']
del mdb.jobs['CHD4_solver']
del mdb.jobs['CHD4_subroutine']
del mdb.jobs['CHD4_von_Mises']
del mdb.jobs['CHD4_von_Mises_solver']
del mdb.jobs['NDBR2p5_solver']
del mdb.jobs['NDBR2p5_subroutine']
del mdb.jobs['NDBR6_solver']
del mdb.jobs['NDBR6_subroutine']
del mdb.jobs['NDBR15_solver']
del mdb.jobs['NDBR15_subroutine']
del mdb.jobs['NDBR40_solver']
del mdb.jobs['NDBR40_subroutine']
del mdb.jobs['SH115_solver']
del mdb.jobs['SH115_subroutine']
del mdb.jobs['cube_C3D8_deformation']
del mdb.jobs['cube_C3D8_deformation_solver']
del mdb.jobs['cube_C3D8_diffusion']
del mdb.jobs['cube_C3D20R_deformation']
del mdb.jobs['cube_C3D20R_deformation_solver']
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
mdb.Job(name='cube_C3D8_deformation_elastic_solver', 
    model='cube_C3D8_deformation_elastic_solver', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly.sets.changeKey(
    fromName='ysymm', toName='ysymm_side')
del mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly.sets['bottom_side']
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00230417, 
    farPlane=0.0050129, width=0.00280426, height=0.00138491, 
    viewOffsetX=0.000271382, viewOffsetY=8.97014e-05)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly
region = a.sets['ysymm_side']
mdb.models['cube_C3D8_deformation_elastic_solver'].boundaryConditions['ysymm'].setValues(
    region=region)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
mdb.jobs['cube_C3D8_deformation_elastic_solver'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_elastic_solver.inp" has been submitted for analysis.
#: Job cube_C3D8_deformation_elastic_solver: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_elastic_solver: Abaqus/Standard completed successfully.
#: Job cube_C3D8_deformation_elastic_solver completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00225892, 
    farPlane=0.00503507, width=0.00294864, height=0.00145621, 
    viewOffsetX=0.000292619, viewOffsetY=-8.86693e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='E', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Max. Principal'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LODE', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TRIAX', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].view.setValues(width=0.00316815, 
    height=0.00156461, viewOffsetX=0.000316803, viewOffsetY=-9.8499e-05)
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
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00223353, 
    farPlane=0.00506045, width=0.0031016, height=0.00153175, 
    viewOffsetX=0.000158867, viewOffsetY=-0.00010646)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00223912, 
    farPlane=0.00478835, width=0.00310936, height=0.00153558, cameraPosition=(
    0.000543059, 0.00149275, 0.0031619), cameraUpVector=(-0.945516, 0.112182, 
    -0.305637), cameraTarget=(4.59385e-05, -0.000342342, 3.61591e-05), 
    viewOffsetX=0.000159264, viewOffsetY=-0.000106727)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.002486, 
    farPlane=0.00496592, width=0.00345219, height=0.00170489, cameraPosition=(
    0.00173186, -0.000587948, 0.00321814), cameraUpVector=(-0.617654, 0.782663, 
    0.0770884), cameraTarget=(-4.17576e-05, -0.000117726, 5.30006e-05), 
    viewOffsetX=0.000176824, viewOffsetY=-0.000118494)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00225137, 
    farPlane=0.00476962, width=0.00312637, height=0.00154398, cameraPosition=(
    -0.00168246, -0.000172508, 0.00306894), cameraUpVector=(0.14079, 0.964065, 
    -0.225292), cameraTarget=(-6.41652e-05, 9.18469e-05, -0.000201559), 
    viewOffsetX=0.000160135, viewOffsetY=-0.00010731)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00245879, 
    farPlane=0.00460862, width=0.0034144, height=0.00168623, cameraPosition=(
    -0.000207527, 0.000514475, 0.00348552), cameraUpVector=(0.0133064, 
    0.893646, -0.448575), cameraTarget=(-0.000150445, 5.65024e-05, 
    -0.000143794), viewOffsetX=0.000174888, viewOffsetY=-0.000117196)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=36 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=37 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=38 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=39 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=40 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=41 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=42 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=43 )
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
p1 = mdb.models['cube_C3D8_deformation_elastic_solver'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['cube_C3D8_deformation_elastic_solver'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['cube_C3D8_deformation_elastic_solver'].steps['step1_tensile'].setValues(
    nlgeom=ON)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['cube_C3D8_deformation_elastic_solver'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_elastic_solver.inp" has been submitted for analysis.
#: Job cube_C3D8_deformation_elastic_solver: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_elastic_solver: Abaqus/Standard completed successfully.
#: Job cube_C3D8_deformation_elastic_solver completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00190353, 
    farPlane=0.00505298, width=0.00304434, height=0.00150347, 
    viewOffsetX=-2.01432e-05, viewOffsetY=0.000246231)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver.odb'].close(
    )
mdb.Model(name='cube_C3D8_deformation_elastic_solver_nlgeom_on', 
    objectToCopy=mdb.models['cube_C3D8_deformation_elastic_solver'])
#: The model "cube_C3D8_deformation_elastic_solver_nlgeom_on" has been created.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
mdb.models.changeKey(fromName='cube_C3D8_deformation_elastic_solver', 
    toName='cube_C3D8_deformation_elastic_solver_nlgeom_off')
a = mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_off'].steps['step1_tensile'].setValues(
    nlgeom=OFF)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
del mdb.jobs['cube_C3D8_deformation_elastic_solver']
mdb.Job(name='cube_C3D8_deformation_elastic_solver_nlgeom_off', 
    model='cube_C3D8_deformation_elastic_solver_nlgeom_on', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs.changeKey(fromName='cube_C3D8_deformation_elastic_solver_nlgeom_off', 
    toName='cube_C3D8_deformation_elastic_solver_nlgeom_on')
mdb.Job(name='cube_C3D8_deformation_elastic_solver_nlgeom_off', 
    model='cube_C3D8_deformation_elastic_solver_nlgeom_off', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=ON)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=ON)
p = mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=OFF, 
    engineeringFeatures=OFF, mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0023747, 
    farPlane=0.00494238, width=0.00270612, height=0.00134166, 
    viewOffsetX=4.479e-05, viewOffsetY=-4.88981e-05)
elemType1 = mesh.ElemType(elemCode=C3D8, elemLibrary=STANDARD, 
    secondOrderAccuracy=OFF, distortionControl=DEFAULT)
elemType2 = mesh.ElemType(elemCode=C3D6, elemLibrary=STANDARD)
elemType3 = mesh.ElemType(elemCode=C3D4, elemLibrary=STANDARD)
p = mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_on'].parts['cube']
c = p.cells
cells = c.getSequenceFromMask(mask=('[#1 ]', ), )
pickedRegions =(cells, )
p.setElementType(regions=pickedRegions, elemTypes=(elemType1, elemType2, 
    elemType3))
a = mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_on'].rootAssembly
a.regenerate()
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=OFF)
mdb.jobs['cube_C3D8_deformation_elastic_solver_nlgeom_off'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_elastic_solver_nlgeom_off.inp" has been submitted for analysis.
mdb.jobs['cube_C3D8_deformation_elastic_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_elastic_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8_deformation_elastic_solver_nlgeom_off: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_elastic_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_elastic_solver_nlgeom_off: Abaqus/Standard completed successfully.
#: Job cube_C3D8_deformation_elastic_solver_nlgeom_off completed successfully. 
#: Job cube_C3D8_deformation_elastic_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8_deformation_elastic_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_off.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_off.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00230144, 
    farPlane=0.00499254, width=0.00297973, height=0.00147156, 
    viewOffsetX=4.9363e-05, viewOffsetY=4.11577e-05)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00188302, 
    farPlane=0.00507349, width=0.00316111, height=0.00156113, 
    viewOffsetX=0.00015571, viewOffsetY=0.000228068)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_on.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_elastic_solver_nlgeom_off.odb'].close(
    )
session.viewports['Viewport: 1'].setValues(displayedObject=None)
del mdb.models['cube_C3D8T_deformation_plastic_solver']
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON, mesh=OFF)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=OFF)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
p1 = mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='cube_C3D8_deformation_plastic_solver_nlgeom_off', 
    objectToCopy=mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_off'])
#: The model "cube_C3D8_deformation_plastic_solver_nlgeom_off" has been created.
p = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='cube_C3D8_deformation_plastic_solver_nlgeom_on', 
    objectToCopy=mdb.models['cube_C3D8_deformation_elastic_solver_nlgeom_on'])
#: The model "cube_C3D8_deformation_plastic_solver_nlgeom_on" has been created.
p = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].Material(
    name='von_Mises')
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].materials['von_Mises'].Density(
    table=((7900.0, ), ))
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].materials['von_Mises'].Elastic(
    table=((210000000000.0, 0.3), ))
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].materials['von_Mises'].Plastic(
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
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
del mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].materials['elastic']
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].sections['Section-1'].setValues(
    material='von_Mises', thickness=None)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
del mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on']
p = mdb.models['cube_C3D8T_deformation_elastic_solver'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='cube_C3D8_deformation_plastic_solver_nlgeom_on', 
    objectToCopy=mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'])
#: The model "cube_C3D8_deformation_plastic_solver_nlgeom_on" has been created.
p = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].steps['step1_tensile'].setValues(
    nlgeom=ON)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.Job(name='cube_C3D8_deformation_plastic_solver_nlgeom_off', 
    model='cube_C3D8_deformation_plastic_solver_nlgeom_off', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='cube_C3D8_deformation_plastic_solver_nlgeom_on', 
    model='cube_C3D8_deformation_plastic_solver_nlgeom_on', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['cube_C3D8_deformation_plastic_solver_nlgeom_off'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_plastic_solver_nlgeom_off.inp" has been submitted for analysis.
mdb.jobs['cube_C3D8_deformation_plastic_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8_deformation_plastic_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_off: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_off: Abaqus/Standard completed successfully.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_off completed successfully. 
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8_deformation_plastic_solver_nlgeom_on completed successfully. 
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00235135, 
    farPlane=0.00496572, width=0.00252858, height=0.00124876, 
    viewOffsetX=0.000207271, viewOffsetY=-2.45236e-05)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_off.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_off.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00235306, 
    farPlane=0.00496389, width=0.00253042, height=0.00124967, 
    viewOffsetX=-1.41944e-05, viewOffsetY=2.81352e-05)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00195296, 
    farPlane=0.00512408, width=0.00345941, height=0.00170845, 
    viewOffsetX=0.000170092, viewOffsetY=0.000245907)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
p1 = mdb.models['cube_C3D8_deformation_plastic_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
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
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00232049, 
    farPlane=0.00499646, width=0.00300439, height=0.00148374, 
    viewOffsetX=0.000112962, viewOffsetY=2.20983e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
del mdb.models['cube_C3D8_deformation_plastic_solver']
del mdb.models['cube_C3D8_deformation_elastic_srt']
a = mdb.models['cube_C3D8T_diffusion_srt'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_diffusion')
a = mdb.models['cube_C3D8_deformation_plastic_srt'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
del mdb.models['cube_C3D8_deformation_plastic_srt']
a = mdb.models['cube_C3D8T_deformation_elastic_solver'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
a = mdb.models['cube_DC3D8_diffusion_srt'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
del mdb.models['cube_DC3D8_diffusion_srt']
a = mdb.models['cube_C3D8T_deformation_elastic_solver'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
a = mdb.models['cube_DC3D8_diffusion_solver'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
p1 = mdb.models['cube_DC3D8_diffusion_solver'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['cube_DC3D8_diffusion_solver'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_diffusion')
mdb.models.changeKey(fromName='cube_DC3D8_diffusion_solver', 
    toName='cube_DC3D8_diffusion_solver_nlgeom_on')
a = mdb.models['cube_DC3D8_diffusion_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.Model(name='cube_DC3D8_diffusion_solver_nlgeom_off', 
    objectToCopy=mdb.models['cube_DC3D8_diffusion_solver_nlgeom_on'])
#: The model "cube_DC3D8_diffusion_solver_nlgeom_off" has been created.
a = mdb.models['cube_DC3D8_diffusion_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
a = mdb.models['cube_DC3D8_diffusion_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
del mdb.models['cube_DC3D8_diffusion_solver_nlgeom_on']
a = mdb.models['cube_C3D8T_deformation_elastic_solver'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.Job(name='cube_DC3D8_diffusion_solver_nlgeom_off', 
    model='cube_DC3D8_diffusion_solver_nlgeom_off', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_DC3D8_diffusion_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_diffusion')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
mdb.jobs['cube_DC3D8_diffusion_solver_nlgeom_off'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_DC3D8_diffusion_solver_nlgeom_off.inp".
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_off.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8_deformation_plastic_solver_nlgeom_on.odb'].close(
    )
a = mdb.models['cube_DC3D8_diffusion_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
a = mdb.models['cube_DC3D8_diffusion_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs.changeKey(fromName='cube_DC3D8_diffusion_solver_nlgeom_off', 
    toName='cube_DC3D8_diffusion_transient_solver_nlgeom_off')
mdb.models.changeKey(fromName='cube_DC3D8_diffusion_solver_nlgeom_off', 
    toName='cube_DC3D8_diffusion_transient_solver_nlgeom_off')
a = mdb.models['cube_DC3D8_diffusion_transient_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
del mdb.jobs['cube_DC3D8_diffusion_transient_solver_nlgeom_off']
mdb.Job(name='cube_DC3D8_diffusion_transient_solver_nlgeom_off', 
    model='cube_DC3D8_diffusion_transient_solver_nlgeom_off', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['cube_DC3D8_diffusion_transient_solver_nlgeom_off'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_DC3D8_diffusion_transient_solver_nlgeom_off.inp".
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
