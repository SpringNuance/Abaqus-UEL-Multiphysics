# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Thu Apr  3 10:58:08 2025
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
session.viewports['Viewport: 1'].partDisplay.setValues(mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00248702, 
    farPlane=0.00483006, width=0.00325156, height=0.00159021, 
    viewOffsetX=0.000560722, viewOffsetY=-6.38689e-05)
a = mdb.models['suborutine_multiphysics'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_multiphysics')
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00251591, 
    farPlane=0.00480117, width=0.00329621, height=0.00160869, 
    viewOffsetX=0.00030478, viewOffsetY=8.41887e-07)
mdb.models.changeKey(fromName='suborutine_multiphysics', 
    toName='subroutine_multiphysics')
a = mdb.models['subroutine_multiphysics'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
del mdb.jobs['subroutine_multiphysics']
mdb.Job(name='subroutine_multiphysics', model='subroutine_multiphysics', 
    description='', type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, 
    queue=None, memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['subroutine_multiphysics'].writeInput(consistencyChecking=OFF)
#: The job input file has been written to "subroutine_multiphysics.inp".
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON, mesh=OFF)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=OFF)
p1 = mdb.models['subroutine_multiphysics'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['subroutine_multiphysics'].materials['multiphysics'].Density(table=(
    (7900.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
a = mdb.models['subroutine_multiphysics'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['subroutine_multiphysics'].writeInput(consistencyChecking=OFF)
#: The job input file has been written to "subroutine_multiphysics.inp".
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
