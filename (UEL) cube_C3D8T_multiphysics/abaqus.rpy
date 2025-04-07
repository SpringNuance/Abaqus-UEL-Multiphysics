# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Mon Apr  7 20:34:48 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=239.635406494141, 
    height=174.682861328125)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from caeModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
openMdb('cube_test_multiphysics.cae')
#: The model database "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\(UEL) cube_C3D8T_multiphysics\cube_test_multiphysics.cae" has been opened.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
p = mdb.models['elastic_plate'].parts['elastic_plate']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
#--- Recover file: 'cube_test_multiphysics.rec' ---
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
mdb.jobs['elastic_plate_default_solver'].submit(consistencyChecking=OFF)
mdb.jobs['elastic_plate_default_solver']._Message(STARTED, {
    'phase': BATCHPRE_PHASE, 'clientHost': 'L23-0203', 'handle': 0, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': 'THE ABSOLUTE ZERO TEMPERATURE HAS NOT BEEN SPECIFIED FOR COMPUTING INTERNAL THERMAL ENERGY USING THE ABSOLUTE ZERO PARAMETER ON THE *PHYSICAL CONSTANTS OPTION. A DEFAULT VALUE OF 0.0000 WILL BE ASSUMED.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': '2 elements are distorted. Either the isoparametric angles are out of the suggested limits or the triangular or tetrahedral quality measure is bad. The elements have been identified in element set WarnElemDistorted.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': 'OUTPUT VARIABLE SDV HAS NO COMPONENTS IN THIS ANALYSIS FOR ELEMENT TYPE C3D8T', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FILE, {
    'phase': BATCHPRE_PHASE, 
    'file': 'C:\\LocalUserData\\User-data\\nguyenb5\\Abaqus-UEL-Multiphysics\\(UEL) cube_C3D8T_multiphysics\\elastic_plate_default_solver.odb', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(COMPLETED, {
    'phase': BATCHPRE_PHASE, 'message': 'Analysis phase complete', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STARTED, {
    'phase': STANDARD_PHASE, 'clientHost': 'L23-0203', 'handle': 13272, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STEP, {
    'phase': STANDARD_PHASE, 'stepId': 1, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 0, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(MEMORY_ESTIMATE, {
    'phase': STANDARD_PHASE, 'jobName': 'elastic_plate_default_solver', 
    'memory': 76.0})
mdb.jobs['elastic_plate_default_solver']._Message(PHYSICAL_MEMORY, {
    'phase': STANDARD_PHASE, 'physical_memory': 16017.0, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(MINIMUM_MEMORY, {
    'minimum_memory': 20.0, 'phase': STANDARD_PHASE, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 10000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 1, 'stepTime': 10000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 2, 
    'phase': STANDARD_PHASE, 'equilibrium': 2})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 1, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 20000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 2, 'stepTime': 20000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 2, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 30000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 3, 'stepTime': 30000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 3, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 40000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 4, 'stepTime': 40000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 4, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 50000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 5, 'stepTime': 50000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 5, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 60000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 6, 'stepTime': 60000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 6, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 70000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 7, 'stepTime': 70000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 7, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 80000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 8, 'stepTime': 80000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 8, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 90000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 9, 'stepTime': 90000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 9, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 100000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 10, 'stepTime': 100000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 10, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 110000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 11, 'stepTime': 110000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 11, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 120000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 12, 'stepTime': 120000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 12, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 130000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 13, 'stepTime': 130000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 13, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 140000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 14, 'stepTime': 140000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 14, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 150000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 15, 'stepTime': 150000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 15, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 160000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 16, 'stepTime': 160000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 16, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 170000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 17, 'stepTime': 170000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 17, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 180000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 18, 'stepTime': 180000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 18, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 190000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 19, 'stepTime': 190000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 19, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 200000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 20, 'stepTime': 200000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 20, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 210000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 21, 'stepTime': 210000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 21, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 220000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 22, 'stepTime': 220000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 22, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 230000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 23, 'stepTime': 230000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 23, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 240000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 24, 'stepTime': 240000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 24, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 250000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 25, 'stepTime': 250000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 25, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 260000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 26, 'stepTime': 260000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 26, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 270000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 27, 'stepTime': 270000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 27, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 280000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 28, 'stepTime': 280000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 28, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 290000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 29, 'stepTime': 290000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 29, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 300000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 30, 'stepTime': 300000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 30, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 310000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 31, 'stepTime': 310000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 31, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 320000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 32, 'stepTime': 320000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 32, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 330000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 33, 'stepTime': 330000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 33, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 340000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 34, 'stepTime': 340000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 34, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 350000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 35, 'stepTime': 350000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 35, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 360000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 36, 'stepTime': 360000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 36, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 370000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 37, 'stepTime': 370000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 37, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 380000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 38, 'stepTime': 380000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 38, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 390000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 39, 'stepTime': 390000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 39, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 400000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 40, 'stepTime': 400000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 40, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 410000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 41, 'stepTime': 410000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 41, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 420000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 42, 'stepTime': 420000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 42, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 430000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 43, 'stepTime': 430000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 43, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 440000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 44, 'stepTime': 440000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 44, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 450000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 45, 'stepTime': 450000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 45, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 460000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 46, 'stepTime': 460000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 46, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 470000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 47, 'stepTime': 470000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 47, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 480000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 48, 'stepTime': 480000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 48, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 490000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 49, 'stepTime': 490000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 49, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 500000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 50, 'stepTime': 500000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 50, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 510000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 51, 'stepTime': 510000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 51, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 520000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 52, 'stepTime': 520000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 52, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 530000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 53, 'stepTime': 530000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 53, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 540000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 54, 'stepTime': 540000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 54, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 550000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 55, 'stepTime': 550000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 55, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 560000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 56, 'stepTime': 560000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 56, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 570000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 57, 'stepTime': 570000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 57, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 580000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 58, 'stepTime': 580000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 58, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 590000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 59, 'stepTime': 590000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 59, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 600000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 60, 'stepTime': 600000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 60, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 610000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 61, 'stepTime': 610000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 61, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 620000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 62, 'stepTime': 620000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 62, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 630000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 63, 'stepTime': 630000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 63, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 640000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 64, 'stepTime': 640000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 64, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 650000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 65, 'stepTime': 650000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 65, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 660000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 66, 'stepTime': 660000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 66, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 670000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 67, 'stepTime': 670000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 67, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 680000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 68, 'stepTime': 680000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 68, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 690000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 69, 'stepTime': 690000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 69, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 700000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 70, 'stepTime': 700000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 70, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 710000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 71, 'stepTime': 710000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 71, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 720000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 72, 'stepTime': 720000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 72, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 730000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 73, 'stepTime': 730000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 73, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 740000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 74, 'stepTime': 740000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 74, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 750000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 75, 'stepTime': 750000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 75, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 760000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 76, 'stepTime': 760000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 76, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 770000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 77, 'stepTime': 770000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 77, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 780000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 78, 'stepTime': 780000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 78, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 790000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 79, 'stepTime': 790000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 79, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 800000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 80, 'stepTime': 800000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 80, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 810000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 81, 'stepTime': 810000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 81, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 820000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 82, 'stepTime': 820000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 82, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 830000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 83, 'stepTime': 830000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 83, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 840000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 84, 'stepTime': 840000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 84, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 850000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 85, 'stepTime': 850000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 85, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 860000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 86, 'stepTime': 860000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 86, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 870000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 87, 'stepTime': 870000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 87, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 880000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 88, 'stepTime': 880000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 88, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 890000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 89, 'stepTime': 890000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 89, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 900000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 90, 'stepTime': 900000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 90, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 910000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 91, 'stepTime': 910000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 91, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 920000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 92, 'stepTime': 920000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 92, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 930000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 93, 'stepTime': 930000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 93, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 940000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 94, 'stepTime': 940000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 94, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 950000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 95, 'stepTime': 950000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 95, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 960000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 96, 'stepTime': 960000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 96, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 970000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 97, 'stepTime': 970000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 97, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 980000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 98, 'stepTime': 980000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 98, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 990000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 99, 'stepTime': 990000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 99, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 100, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 1000000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 100, 'stepTime': 1000000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(END_STEP, {
    'phase': STANDARD_PHASE, 'stepId': 1, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(COMPLETED, {
    'phase': STANDARD_PHASE, 'message': 'Analysis phase complete', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(JOB_COMPLETED, {
    'time': 'Mon Apr  7 20:13:00 2025', 
    'jobName': 'elastic_plate_default_solver'})
mdb.models['elastic_plate_default_solver'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('NT', 'RF', 'RFL', 'S', 'SDV', 'U', 'HFL', 'TEMP'))
mdb.jobs['elastic_plate_default_solver'].submit(consistencyChecking=OFF)
mdb.jobs['elastic_plate_default_solver']._Message(STARTED, {
    'phase': BATCHPRE_PHASE, 'clientHost': 'L23-0203', 'handle': 0, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': 'THE ABSOLUTE ZERO TEMPERATURE HAS NOT BEEN SPECIFIED FOR COMPUTING INTERNAL THERMAL ENERGY USING THE ABSOLUTE ZERO PARAMETER ON THE *PHYSICAL CONSTANTS OPTION. A DEFAULT VALUE OF 0.0000 WILL BE ASSUMED.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': '2 elements are distorted. Either the isoparametric angles are out of the suggested limits or the triangular or tetrahedral quality measure is bad. The elements have been identified in element set WarnElemDistorted.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': 'OUTPUT VARIABLE SDV HAS NO COMPONENTS IN THIS ANALYSIS FOR ELEMENT TYPE C3D8T', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FILE, {
    'phase': BATCHPRE_PHASE, 
    'file': 'C:\\LocalUserData\\User-data\\nguyenb5\\Abaqus-UEL-Multiphysics\\(UEL) cube_C3D8T_multiphysics\\elastic_plate_default_solver.odb', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(COMPLETED, {
    'phase': BATCHPRE_PHASE, 'message': 'Analysis phase complete', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STARTED, {
    'phase': STANDARD_PHASE, 'clientHost': 'L23-0203', 'handle': 30676, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STEP, {
    'phase': STANDARD_PHASE, 'stepId': 1, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 0, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(MEMORY_ESTIMATE, {
    'phase': STANDARD_PHASE, 'jobName': 'elastic_plate_default_solver', 
    'memory': 76.0})
mdb.jobs['elastic_plate_default_solver']._Message(PHYSICAL_MEMORY, {
    'phase': STANDARD_PHASE, 'physical_memory': 16017.0, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(MINIMUM_MEMORY, {
    'minimum_memory': 20.0, 'phase': STANDARD_PHASE, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 10000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 1, 'stepTime': 10000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 2, 
    'phase': STANDARD_PHASE, 'equilibrium': 2})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 1, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 20000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 2, 'stepTime': 20000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 2, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 30000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 3, 'stepTime': 30000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 3, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 40000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 4, 'stepTime': 40000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 4, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 50000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 5, 'stepTime': 50000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 5, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 60000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 6, 'stepTime': 60000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 6, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 70000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 7, 'stepTime': 70000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 7, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 80000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 8, 'stepTime': 80000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 8, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 90000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 9, 'stepTime': 90000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 9, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 100000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 10, 'stepTime': 100000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 10, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 110000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 11, 'stepTime': 110000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 11, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 120000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 12, 'stepTime': 120000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 12, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 130000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 13, 'stepTime': 130000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 13, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 140000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 14, 'stepTime': 140000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 14, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 150000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 15, 'stepTime': 150000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 15, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 160000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 16, 'stepTime': 160000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 16, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 170000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 17, 'stepTime': 170000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 17, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 180000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 18, 'stepTime': 180000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 18, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 190000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 19, 'stepTime': 190000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 19, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 200000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 20, 'stepTime': 200000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 20, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 210000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 21, 'stepTime': 210000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 21, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 220000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 22, 'stepTime': 220000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 22, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 230000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 23, 'stepTime': 230000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 23, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 240000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 24, 'stepTime': 240000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 24, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 250000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 25, 'stepTime': 250000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 25, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 260000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 26, 'stepTime': 260000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 26, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 270000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 27, 'stepTime': 270000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 27, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 280000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 28, 'stepTime': 280000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 28, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 290000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 29, 'stepTime': 290000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 29, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 300000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 30, 'stepTime': 300000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 30, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 310000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 31, 'stepTime': 310000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 31, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 320000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 32, 'stepTime': 320000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 32, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 330000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 33, 'stepTime': 330000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 33, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 340000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 34, 'stepTime': 340000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 34, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 350000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 35, 'stepTime': 350000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 35, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 360000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 36, 'stepTime': 360000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 36, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 370000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 37, 'stepTime': 370000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 37, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 380000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 38, 'stepTime': 380000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 38, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 390000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 39, 'stepTime': 390000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 39, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 400000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 40, 'stepTime': 400000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 40, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 410000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 41, 'stepTime': 410000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 41, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 420000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 42, 'stepTime': 420000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 42, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 430000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 43, 'stepTime': 430000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 43, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 440000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 44, 'stepTime': 440000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 44, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 450000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 45, 'stepTime': 450000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 45, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 460000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 46, 'stepTime': 460000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 46, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 470000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 47, 'stepTime': 470000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 47, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 480000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 48, 'stepTime': 480000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 48, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 490000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 49, 'stepTime': 490000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 49, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 500000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 50, 'stepTime': 500000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 50, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 510000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 51, 'stepTime': 510000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 51, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 520000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 52, 'stepTime': 520000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 52, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 530000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 53, 'stepTime': 530000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 53, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 540000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 54, 'stepTime': 540000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 54, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 550000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 55, 'stepTime': 550000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 55, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 560000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 56, 'stepTime': 560000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 56, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 570000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 57, 'stepTime': 570000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 57, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 580000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 58, 'stepTime': 580000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 58, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 590000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 59, 'stepTime': 590000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 59, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 600000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 60, 'stepTime': 600000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 60, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 610000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 61, 'stepTime': 610000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 61, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 620000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 62, 'stepTime': 620000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 62, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 630000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 63, 'stepTime': 630000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 63, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 640000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 64, 'stepTime': 640000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 64, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 650000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 65, 'stepTime': 650000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 65, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 660000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 66, 'stepTime': 660000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 66, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 670000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 67, 'stepTime': 670000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 67, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 680000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 68, 'stepTime': 680000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 68, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 690000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 69, 'stepTime': 690000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 69, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 700000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 70, 'stepTime': 700000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 70, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 710000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 71, 'stepTime': 710000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 71, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 720000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 72, 'stepTime': 720000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 72, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 730000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 73, 'stepTime': 730000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 73, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 740000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 74, 'stepTime': 740000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 74, 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(WARNING, {
    'phase': STANDARD_PHASE, 
    'message': 'There is zero HEAT FLUX everywhere in the model based on the default criterion. please check the value of the average HEAT FLUX during the current iteration to verify that the HEAT FLUX is small enough to be treated as zero. if not, please use the solution controls to reset the criterion for zero HEAT FLUX.', 
    'jobName': 'elastic_plate_default_solver'})
mdb.jobs['elastic_plate_default_solver']._Message(STATUS, {
    'totalTime': 750000000.0, 'attempts': 1, 'timeIncrement': 10000000.0, 
    'increment': 75, 'stepTime': 750000000.0, 'step': 1, 
    'jobName': 'elastic_plate_default_solver', 'severe': 0, 'iterations': 1, 
    'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['elastic_plate_default_solver']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 75, 
    'jobName': 'elastic_plate_default_solver'})
#--- End of Recover file ------
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL) cube_C3D8T_multiphysics/elastic_plate_default_solver.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL) cube_C3D8T_multiphysics/elastic_plate_default_solver.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL) cube_C3D8T_multiphysics/elastic_plate_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL) cube_C3D8T_multiphysics/elastic_plate_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       11
#: Number of Node Sets:          8
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT12', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_#71_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.119747, 
    farPlane=0.208442, width=0.0794154, height=0.0362329, 
    viewOffsetX=-0.000777391, viewOffsetY=0.00856189)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_#70_U_HEAT', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_#71_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.12016, 
    farPlane=0.208029, width=0.0683937, height=0.0312043, 
    viewOffsetX=-0.00751581, viewOffsetY=0.00538282)
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_#72_TEMP_GRAD_X', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.125349, 
    farPlane=0.202839, width=0.041049, height=0.0187284, 
    viewOffsetX=-0.00792018, viewOffsetY=0.00546075)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL) cube_C3D8T_multiphysics/elastic_plate_default_solver.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(
    plotState=CONTOURS_ON_DEF)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RFL11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'HFL1'), )
session.viewports['Viewport: 1'].view.setValues(session.views['Left'])
session.viewports['Viewport: 1'].view.setValues(session.views['Right'])
session.viewports['Viewport: 1'].view.setValues(session.views['Front'])
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.156477, 
    farPlane=0.163956, width=0.0213142, height=0.00972451, 
    viewOffsetX=-0.0222999, viewOffsetY=-0.0265797)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'HFL2'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.142707, 
    farPlane=0.177726, width=0.118379, height=0.0540099, 
    viewOffsetX=-0.0106751, viewOffsetY=-0.0150759)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'HFL3'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.140694, 
    farPlane=0.179739, width=0.132084, height=0.0602626, 
    viewOffsetX=-0.0078926, viewOffsetY=-0.018366)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL) cube_C3D8T_multiphysics/elastic_plate_UEL.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL) cube_C3D8T_multiphysics/elastic_plate_default_solver.odb'].close(
    )
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\(UEL) cube_C3D8T_multiphysics\cube_test_multiphysics.cae".
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\(UEL) cube_C3D8T_multiphysics\cube_test_multiphysics.cae".
