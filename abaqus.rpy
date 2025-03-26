# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Wed Mar 26 21:15:21 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=215.22395324707, 
    height=185.628463745117)
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
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].parts['cube']
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
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('S', 'LE', 'U', 'RF', 'NT', 'TEMP', 'HFL'))
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP'].submit(
    consistencyChecking=OFF)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STARTED, {
    'phase': BATCHPRE_PHASE, 'clientHost': 'L23-0203', 'handle': 0, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': 'THE ABSOLUTE ZERO TEMPERATURE HAS NOT BEEN SPECIFIED FOR COMPUTING INTERNAL THERMAL ENERGY USING THE ABSOLUTE ZERO PARAMETER ON THE *PHYSICAL CONSTANTS OPTION. A DEFAULT VALUE OF 0.0000 WILL BE ASSUMED.', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FILE, {
    'phase': BATCHPRE_PHASE, 
    'file': 'C:\\LocalUserData\\User-data\\nguyenb5\\Abaqus-UEL-Multiphysics\\solver_cube_C3D8T_transient_nlgeom_off_4NP.odb', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(COMPLETED, {
    'phase': BATCHPRE_PHASE, 'message': 'Analysis phase complete', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STARTED, {
    'phase': STANDARD_PHASE, 'clientHost': 'L23-0203', 'handle': 27388, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STEP, {
    'phase': STANDARD_PHASE, 'stepId': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 0, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(
    MEMORY_ESTIMATE, {'phase': STANDARD_PHASE, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'memory': 24.0})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(
    PHYSICAL_MEMORY, {'phase': STANDARD_PHASE, 'physical_memory': 16017.0, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(MINIMUM_MEMORY, 
    {'minimum_memory': 17.0, 'phase': STANDARD_PHASE, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 1.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 1, 
    'stepTime': 1.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 2, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 2.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 2, 
    'stepTime': 2.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 3, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 3.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 3, 
    'stepTime': 3.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 4, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 4.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 4, 
    'stepTime': 4.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 5, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 5.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 5, 
    'stepTime': 5.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 6, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 6.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 6, 
    'stepTime': 6.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 7, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 7.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 7, 
    'stepTime': 7.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 8, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 8.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 8, 
    'stepTime': 8.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 9, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 9.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 9, 
    'stepTime': 9.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 10, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 10.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 10, 
    'stepTime': 10.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 11, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 11.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 11, 
    'stepTime': 11.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 12, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 12.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 12, 
    'stepTime': 12.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 13, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 13.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 13, 
    'stepTime': 13.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 14, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 14.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 14, 
    'stepTime': 14.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 15, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 15.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 15, 
    'stepTime': 15.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 16, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 16.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 16, 
    'stepTime': 16.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 17, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 17.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 17, 
    'stepTime': 17.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 18, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 18.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 18, 
    'stepTime': 18.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 19, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 19.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 19, 
    'stepTime': 19.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 20, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 20.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 20, 
    'stepTime': 20.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 21, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 21.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 21, 
    'stepTime': 21.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 22, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 22.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 22, 
    'stepTime': 22.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 23, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 23.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 23, 
    'stepTime': 23.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 24, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 24.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 24, 
    'stepTime': 24.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 25, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 25.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 25, 
    'stepTime': 25.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 26, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 26.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 26, 
    'stepTime': 26.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 27, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 27.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 27, 
    'stepTime': 27.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 28, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 28.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 28, 
    'stepTime': 28.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 29, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 29.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 29, 
    'stepTime': 29.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 30, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 30.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 30, 
    'stepTime': 30.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 31, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 31.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 31, 
    'stepTime': 31.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 32, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 32.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 32, 
    'stepTime': 32.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 33, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 33.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 33, 
    'stepTime': 33.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 34, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 34.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 34, 
    'stepTime': 34.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 35, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 35.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 35, 
    'stepTime': 35.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 36, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 36.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 36, 
    'stepTime': 36.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 37, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 37.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 37, 
    'stepTime': 37.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 38, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 38.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 38, 
    'stepTime': 38.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 39, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 39.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 39, 
    'stepTime': 39.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 40, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 40.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 40, 
    'stepTime': 40.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 41, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 41.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 41, 
    'stepTime': 41.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 42, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 42.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 42, 
    'stepTime': 42.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 43, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 43.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 43, 
    'stepTime': 43.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 44, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 44.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 44, 
    'stepTime': 44.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 45, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 45.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 45, 
    'stepTime': 45.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 46, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 46.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 46, 
    'stepTime': 46.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 47, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 47.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 47, 
    'stepTime': 47.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 48, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 48.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 48, 
    'stepTime': 48.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 49, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 49.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 49, 
    'stepTime': 49.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 50, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 50.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 50, 
    'stepTime': 50.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 51, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 51.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 51, 
    'stepTime': 51.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 52, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 52.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 52, 
    'stepTime': 52.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 53, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 53.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 53, 
    'stepTime': 53.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 54, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 54.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 54, 
    'stepTime': 54.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 55, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 55.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 55, 
    'stepTime': 55.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 56, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 56.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 56, 
    'stepTime': 56.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 57, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 57.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 57, 
    'stepTime': 57.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 58, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 58.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 58, 
    'stepTime': 58.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 59, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 59.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 59, 
    'stepTime': 59.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 60, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 60.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 60, 
    'stepTime': 60.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 61, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 61.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 61, 
    'stepTime': 61.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 62, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 62.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 62, 
    'stepTime': 62.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 63, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 63.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 63, 
    'stepTime': 63.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 64, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 64.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 64, 
    'stepTime': 64.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 65, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 65.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 65, 
    'stepTime': 65.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 66, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 66.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 66, 
    'stepTime': 66.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 67, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 67.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 67, 
    'stepTime': 67.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 68, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 68.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 68, 
    'stepTime': 68.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 69, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 69.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 69, 
    'stepTime': 69.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 70, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 70.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 70, 
    'stepTime': 70.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 71, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 71.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 71, 
    'stepTime': 71.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 72, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 72.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 72, 
    'stepTime': 72.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 73, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 73.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 73, 
    'stepTime': 73.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 74, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 74.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 74, 
    'stepTime': 74.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 75, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 75.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 75, 
    'stepTime': 75.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 76, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 76.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 76, 
    'stepTime': 76.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 77, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 77.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 77, 
    'stepTime': 77.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 78, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 78.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 78, 
    'stepTime': 78.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 79, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 79.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 79, 
    'stepTime': 79.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 80, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 80.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 80, 
    'stepTime': 80.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 81, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 81.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 81, 
    'stepTime': 81.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 82, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 82.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 82, 
    'stepTime': 82.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 83, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 83.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 83, 
    'stepTime': 83.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 84, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 84.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 84, 
    'stepTime': 84.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 85, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 85.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 85, 
    'stepTime': 85.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 86, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 86.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 86, 
    'stepTime': 86.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 87, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 87.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 87, 
    'stepTime': 87.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 88, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 88.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 88, 
    'stepTime': 88.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 89, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 89.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 89, 
    'stepTime': 89.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 90, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 90.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 90, 
    'stepTime': 90.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 91, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 91.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 91, 
    'stepTime': 91.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 92, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 92.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 92, 
    'stepTime': 92.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 93, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 93.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 93, 
    'stepTime': 93.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 94, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 94.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 94, 
    'stepTime': 94.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 95, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 95.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 95, 
    'stepTime': 95.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 96, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 96.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 96, 
    'stepTime': 96.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 97, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 97.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 97, 
    'stepTime': 97.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 98, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 98.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 98, 
    'stepTime': 98.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 99, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 99.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 99, 
    'stepTime': 99.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 100, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(STATUS, {
    'totalTime': 100.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 100, 
    'stepTime': 100.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(END_STEP, {
    'phase': STANDARD_PHASE, 'stepId': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(COMPLETED, {
    'phase': STANDARD_PHASE, 'message': 'Analysis phase complete', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_4NP']._Message(JOB_COMPLETED, 
    {'time': 'Wed Mar 26 18:06:43 2025', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_off_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP'].submit(
    consistencyChecking=OFF)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STARTED, {
    'phase': BATCHPRE_PHASE, 'clientHost': 'L23-0203', 'handle': 0, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(WARNING, {
    'phase': BATCHPRE_PHASE, 
    'message': 'THE ABSOLUTE ZERO TEMPERATURE HAS NOT BEEN SPECIFIED FOR COMPUTING INTERNAL THERMAL ENERGY USING THE ABSOLUTE ZERO PARAMETER ON THE *PHYSICAL CONSTANTS OPTION. A DEFAULT VALUE OF 0.0000 WILL BE ASSUMED.', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FILE, {
    'phase': BATCHPRE_PHASE, 
    'file': 'C:\\LocalUserData\\User-data\\nguyenb5\\Abaqus-UEL-Multiphysics\\solver_cube_C3D8T_transient_nlgeom_on_4NP.odb', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(COMPLETED, {
    'phase': BATCHPRE_PHASE, 'message': 'Analysis phase complete', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STARTED, {
    'phase': STANDARD_PHASE, 'clientHost': 'L23-0203', 'handle': 27840, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STEP, {
    'phase': STANDARD_PHASE, 'stepId': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 0, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(MEMORY_ESTIMATE, 
    {'phase': STANDARD_PHASE, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'memory': 24.0})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(PHYSICAL_MEMORY, 
    {'phase': STANDARD_PHASE, 'physical_memory': 16017.0, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(MINIMUM_MEMORY, 
    {'minimum_memory': 17.0, 'phase': STANDARD_PHASE, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 1.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 1, 
    'stepTime': 1.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 2, 'phase': STANDARD_PHASE, 'equilibrium': 2})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 2, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 2.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 2, 
    'stepTime': 2.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 2, 'phase': STANDARD_PHASE, 'equilibrium': 2})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 3, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 3.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 3, 
    'stepTime': 3.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 4, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 4.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 4, 
    'stepTime': 4.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 5, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 5.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 5, 
    'stepTime': 5.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 6, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 6.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 6, 
    'stepTime': 6.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 7, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 7.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 7, 
    'stepTime': 7.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 8, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 8.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 8, 
    'stepTime': 8.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 9, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 9.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 9, 
    'stepTime': 9.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 10, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 10.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 10, 
    'stepTime': 10.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 11, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 11.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 11, 
    'stepTime': 11.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 12, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 12.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 12, 
    'stepTime': 12.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 13, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 13.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 13, 
    'stepTime': 13.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 14, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 14.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 14, 
    'stepTime': 14.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 15, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 15.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 15, 
    'stepTime': 15.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 16, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 16.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 16, 
    'stepTime': 16.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 17, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 17.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 17, 
    'stepTime': 17.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 18, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 18.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 18, 
    'stepTime': 18.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 19, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 19.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 19, 
    'stepTime': 19.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 20, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 20.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 20, 
    'stepTime': 20.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 21, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 21.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 21, 
    'stepTime': 21.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 22, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 22.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 22, 
    'stepTime': 22.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 23, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 23.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 23, 
    'stepTime': 23.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 24, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 24.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 24, 
    'stepTime': 24.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 25, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 25.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 25, 
    'stepTime': 25.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 26, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 26.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 26, 
    'stepTime': 26.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 27, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 27.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 27, 
    'stepTime': 27.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 28, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 28.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 28, 
    'stepTime': 28.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 29, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 29.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 29, 
    'stepTime': 29.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 30, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 30.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 30, 
    'stepTime': 30.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 31, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 31.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 31, 
    'stepTime': 31.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 32, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 32.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 32, 
    'stepTime': 32.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 33, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 33.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 33, 
    'stepTime': 33.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 34, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 34.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 34, 
    'stepTime': 34.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 35, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 35.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 35, 
    'stepTime': 35.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 36, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 36.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 36, 
    'stepTime': 36.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 37, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 37.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 37, 
    'stepTime': 37.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 38, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 38.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 38, 
    'stepTime': 38.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 39, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 39.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 39, 
    'stepTime': 39.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 40, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 40.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 40, 
    'stepTime': 40.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 41, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 41.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 41, 
    'stepTime': 41.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 42, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 42.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 42, 
    'stepTime': 42.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 43, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 43.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 43, 
    'stepTime': 43.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 44, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 44.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 44, 
    'stepTime': 44.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 45, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 45.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 45, 
    'stepTime': 45.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 46, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 46.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 46, 
    'stepTime': 46.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 47, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 47.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 47, 
    'stepTime': 47.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 48, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 48.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 48, 
    'stepTime': 48.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 49, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 49.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 49, 
    'stepTime': 49.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 50, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 50.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 50, 
    'stepTime': 50.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 51, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 51.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 51, 
    'stepTime': 51.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 52, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 52.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 52, 
    'stepTime': 52.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 53, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 53.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 53, 
    'stepTime': 53.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 54, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 54.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 54, 
    'stepTime': 54.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 55, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 55.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 55, 
    'stepTime': 55.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 56, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 56.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 56, 
    'stepTime': 56.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 57, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 57.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 57, 
    'stepTime': 57.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 58, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 58.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 58, 
    'stepTime': 58.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 59, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 59.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 59, 
    'stepTime': 59.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 60, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 60.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 60, 
    'stepTime': 60.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 61, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 61.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 61, 
    'stepTime': 61.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 62, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 62.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 62, 
    'stepTime': 62.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 63, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 63.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 63, 
    'stepTime': 63.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 64, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 64.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 64, 
    'stepTime': 64.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 65, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 65.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 65, 
    'stepTime': 65.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 66, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 66.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 66, 
    'stepTime': 66.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 67, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 67.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 67, 
    'stepTime': 67.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 68, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 68.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 68, 
    'stepTime': 68.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 69, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 69.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 69, 
    'stepTime': 69.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 70, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 70.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 70, 
    'stepTime': 70.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 71, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 71.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 71, 
    'stepTime': 71.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 72, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 72.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 72, 
    'stepTime': 72.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 73, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 73.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 73, 
    'stepTime': 73.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 74, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 74.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 74, 
    'stepTime': 74.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 75, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 75.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 75, 
    'stepTime': 75.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 76, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 76.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 76, 
    'stepTime': 76.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 77, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 77.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 77, 
    'stepTime': 77.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 78, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 78.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 78, 
    'stepTime': 78.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 79, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 79.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 79, 
    'stepTime': 79.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 80, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 80.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 80, 
    'stepTime': 80.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 81, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 81.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 81, 
    'stepTime': 81.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 82, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 82.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 82, 
    'stepTime': 82.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 83, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 83.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 83, 
    'stepTime': 83.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 84, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 84.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 84, 
    'stepTime': 84.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 85, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 85.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 85, 
    'stepTime': 85.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 86, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 86.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 86, 
    'stepTime': 86.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 87, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 87.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 87, 
    'stepTime': 87.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 88, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 88.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 88, 
    'stepTime': 88.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 89, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 89.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 89, 
    'stepTime': 89.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 90, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 90.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 90, 
    'stepTime': 90.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 91, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 91.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 91, 
    'stepTime': 91.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 92, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 92.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 92, 
    'stepTime': 92.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 93, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 93.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 93, 
    'stepTime': 93.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 94, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 94.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 94, 
    'stepTime': 94.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 95, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 95.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 95, 
    'stepTime': 95.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 96, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 96.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 96, 
    'stepTime': 96.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 97, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 97.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 97, 
    'stepTime': 97.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 98, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 98.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 98, 
    'stepTime': 98.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 99, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 99.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 99, 
    'stepTime': 99.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(ODB_FRAME, {
    'phase': STANDARD_PHASE, 'step': 0, 'frame': 100, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(STATUS, {
    'totalTime': 100.0, 'attempts': 1, 'timeIncrement': 1.0, 'increment': 100, 
    'stepTime': 100.0, 'step': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP', 'severe': 0, 
    'iterations': 1, 'phase': STANDARD_PHASE, 'equilibrium': 1})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(END_STEP, {
    'phase': STANDARD_PHASE, 'stepId': 1, 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(COMPLETED, {
    'phase': STANDARD_PHASE, 'message': 'Analysis phase complete', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP']._Message(JOB_COMPLETED, {
    'time': 'Wed Mar 26 18:08:27 2025', 
    'jobName': 'solver_cube_C3D8T_transient_nlgeom_on_4NP'})
#--- End of Recover file ------
p1 = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP-Copy', 
    objectToCopy=mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'])
#: The model "UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP-Copy" has been created.
p = mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP-Copy'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
mdb.models.changeKey(
    fromName='UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP-Copy', 
    toName='UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP')
p = mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
del mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].materials['thermomechanical'].conductivity
del mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].materials['thermomechanical'].elastic
del mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].materials['thermomechanical'].specificHeat
mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].materials['thermomechanical'].Depvar(
    )
mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].materials['thermomechanical'].UserMaterial(
    type=THERMOMECHANICAL, mechanicalConstants=(0.0, ), thermalConstants=(0.0, 
    ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
a = mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    optimizationTasks=OFF, geometricRestrictions=OFF, stopConditions=OFF)
mdb.Job(name='UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP', 
    model='UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP.inp".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_thermomechanical')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['UMAT_UMATHT_cube_C3D8T_transient_nlgeom_on_4NP'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('S', 'LE', 'U', 'RF', 'NT', 'TEMP', 'HFL', 'RFL'))
a = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_thermomechanical')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('RF', 'SDV', 'U', 'S', 'LE', 'TEMP', 'NT', 'HFL', 'RFL'))
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('HFL', 'LE', 'NT', 'RF', 'S', 'TEMP', 'U', 'RFL'))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_4NP'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_transient_nlgeom_on_4NP.inp" has been submitted for analysis.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_4NP completed successfully. 
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
