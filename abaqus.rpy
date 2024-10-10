# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Thu Oct 10 15:21:53 2024
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=93.8385391235352, 
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
p1 = mdb.models['cube_C3D8_deformation_elastic_srt_nlgeom_off'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='cube_C3D8_deformation_elastic_srt_nlgeom_on', 
    objectToCopy=mdb.models['cube_C3D8_deformation_elastic_srt_nlgeom_off'])
#: The model "cube_C3D8_deformation_elastic_srt_nlgeom_on" has been created.
p = mdb.models['cube_C3D8_deformation_elastic_srt_nlgeom_on'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
a = mdb.models['cube_C3D8_deformation_elastic_srt_nlgeom_on'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
mdb.models['cube_C3D8_deformation_elastic_srt_nlgeom_on'].steps['step1_tensile'].setValues(
    nlgeom=ON)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.Job(name='cube_C3D8_deformation_elastic_srt_nlgeom_on', 
    model='cube_C3D8_deformation_elastic_srt_nlgeom_on', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['cube_C3D8_deformation_elastic_srt_nlgeom_on'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "cube_C3D8_deformation_elastic_srt_nlgeom_on.inp".
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-von-Mises-plasticity\cube_test.cae".
