# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Mon Oct 14 15:42:23 2024
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
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(solver) cube_C3D8T_no_diffusion_elastic_solver_nlgeom_off/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(solver) cube_C3D8T_no_diffusion_elastic_solver_nlgeom_off/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00221099, 
    farPlane=0.00508299, width=0.0026881, height=0.00151011, 
    viewOffsetX=0.000205052, viewOffsetY=1.57951e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
p1 = mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].conductivity.setValues(
    table=((1e-05, ), ))
p1 = mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].materials['hydrogen_subroutine'].conductivity.setValues(
    table=((1e-05, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.inp" has been submitted for analysis.
mdb.jobs['cube_C3D8T_no_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_no_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_off: Analysis Input File Processor completed successfully.
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_off'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.inp" has been submitted for analysis.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_off: Abaqus/Standard completed successfully.
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_off completed successfully. 
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_off: Analysis Input File Processor completed successfully.
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(solver) cube_C3D8T_no_diffusion_elastic_solver_nlgeom_off/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_on completed successfully. 
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(solver) cube_C3D8T_no_diffusion_elastic_solver_nlgeom_off/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb'].close(
    )
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_off: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_off completed successfully. 
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
o1 = session.openOdbs(names=(
    'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb', 
    'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_on.odb', 
    'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.odb', 
    'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'))
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
session.viewports['Viewport: 1'].view.fitView()
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00185551, 
    farPlane=0.00510101, width=0.0027902, height=0.00156747, 
    viewOffsetX=0.000164032, viewOffsetY=0.000183018)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(width=0.0030013, 
    height=0.00168606, viewOffsetX=0.000198329, viewOffsetY=0.000176114)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00230165, 
    farPlane=0.00499233, width=0.00246253, height=0.00138339, 
    viewOffsetX=0.000106562, viewOffsetY=-7.13851e-05)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(width=0.00231832, 
    height=0.00130238, viewOffsetX=1.53107e-05, viewOffsetY=-1.4865e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00227887, 
    farPlane=0.00501511, width=0.00259378, height=0.00145713, 
    viewOffsetX=-3.84218e-05, viewOffsetY=-7.46478e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='S', outputPosition=INTEGRATION_POINT, refinement=(INVARIANT, 
    'Mises'), )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RFL11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_no_diffusion_transient_solver_nlgeom_on.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.odb'].close(
    )
session.viewports['Viewport: 1'].setValues(displayedObject=None)
mdb.Model(name='cube_C3D8T_with_diffusion_transient_srt_nlgeom_on', 
    objectToCopy=mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'])
#: The model "cube_C3D8T_with_diffusion_transient_srt_nlgeom_on" has been created.
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
del mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].materials['hydrogen_subroutine'].conductivity
del mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].materials['hydrogen_subroutine'].elastic
mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].materials['hydrogen_subroutine'].density.setValues(
    table=((1.0, ), ))
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].density.setValues(
    table=((1.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_off'].materials['hydrogen_subroutine'].density.setValues(
    table=((1.0, ), ))
p1 = mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_on completed successfully. 
mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_on'].materials['hydrogen_subroutine'].density.setValues(
    table=((1.0, ), ))
p1 = mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].materials['hydrogen_subroutine'].density.setValues(
    table=((1.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_solver_nlgeom_off'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_with_diffusion_transient_solver_nlgeom_off.inp" has been submitted for analysis.
mdb.jobs['cube_C3D8T_no_diffusion_transient_solver_nlgeom_on'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_no_diffusion_transient_solver_nlgeom_on.inp" has been submitted for analysis.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_off: Analysis Input File Processor completed successfully.
mdb.jobs['cube_C3D8T_no_diffusion_transient_solver_nlgeom_off'].submit(
    consistencyChecking=OFF)
#: The job input file "cube_C3D8T_no_diffusion_transient_solver_nlgeom_off.inp" has been submitted for analysis.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_on: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_off: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_with_diffusion_transient_solver_nlgeom_off completed successfully. 
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_off: Analysis Input File Processor completed successfully.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_on: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_on completed successfully. 
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_off: Abaqus/Standard completed successfully.
#: Job cube_C3D8T_no_diffusion_transient_solver_nlgeom_off completed successfully. 
a = mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.Job(name='cube_C3D8T_with_diffusion_transient_srt_nlgeom_on', 
    model='cube_C3D8T_with_diffusion_transient_srt_nlgeom_on', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8T_with_diffusion_transient_srt_nlgeom_on.inp".
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
del mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].materials['hydrogen_subroutine'].specificHeat
mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].materials['hydrogen_subroutine'].UserMaterial(
    mechanicalConstants=(0.0, ))
mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].materials['hydrogen_subroutine'].Depvar(
    n=36)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8T_with_diffusion_transient_srt_nlgeom_on.inp".
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].materials['hydrogen_subroutine'].SpecificHeat(
    table=((1.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
a = mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8T_with_diffusion_transient_srt_nlgeom_on.inp".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('RF', 'U', 'SDV'))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['cube_C3D8T_with_diffusion_transient_srt_nlgeom_on'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8T_with_diffusion_transient_srt_nlgeom_on.inp".
p1 = mdb.models['cube_C3D8T_with_diffusion_transient_solver_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
