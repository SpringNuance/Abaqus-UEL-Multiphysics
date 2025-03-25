# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Tue Mar 25 15:40:28 2025
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=193.276031494141, 
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
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
p1 = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00232929, 
    farPlane=0.00498779, width=0.00227266, height=0.0014, 
    viewOffsetX=0.000193851, viewOffsetY=-7.72047e-06)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=OFF, 
    engineeringFeatures=OFF, mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON, mesh=OFF)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=OFF)
mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].materials['thermomechanical'].UserMaterial(
    mechanicalConstants=(0.0, ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=OFF, 
    engineeringFeatures=OFF, mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00227708, 
    farPlane=0.00504, width=0.0025144, height=0.00155585, 
    viewOffsetX=0.000367612, viewOffsetY=1.88358e-05)
elemType1 = mesh.ElemType(elemCode=C3D8, elemLibrary=STANDARD, 
    secondOrderAccuracy=OFF, distortionControl=DEFAULT)
elemType2 = mesh.ElemType(elemCode=C3D6, elemLibrary=STANDARD)
elemType3 = mesh.ElemType(elemCode=C3D4, elemLibrary=STANDARD)
p = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
c = p.cells
cells = c.getSequenceFromMask(mask=('[#1 ]', ), )
pickedRegions =(cells, )
p.setElementType(regions=pickedRegions, elemTypes=(elemType1, elemType2, 
    elemType3))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
a = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
a.regenerate()
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    optimizationTasks=OFF, geometricRestrictions=OFF, stopConditions=OFF)
mdb.jobs['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "subroutine_cube_C3D8T_transient_nlgeom_on_4NP.inp".
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON, mesh=OFF)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=OFF)
p1 = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].materials['thermomechanical'].userMaterial.setValues(
    type=THERMOMECHANICAL, thermalConstants=(0.0, ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=OFF, 
    engineeringFeatures=OFF, mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
elemType1 = mesh.ElemType(elemCode=C3D8T, elemLibrary=STANDARD, 
    secondOrderAccuracy=OFF, distortionControl=DEFAULT)
elemType2 = mesh.ElemType(elemCode=C3D6T, elemLibrary=STANDARD)
elemType3 = mesh.ElemType(elemCode=C3D4T, elemLibrary=STANDARD)
p = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].parts['cube']
c = p.cells
cells = c.getSequenceFromMask(mask=('[#1 ]', ), )
pickedRegions =(cells, )
p.setElementType(regions=pickedRegions, elemTypes=(elemType1, elemType2, 
    elemType3))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
a = mdb.models['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
a.regenerate()
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['subroutine_cube_C3D8T_transient_nlgeom_on_4NP'].writeInput(
    consistencyChecking=OFF)
#: The job input file has been written to "subroutine_cube_C3D8T_transient_nlgeom_on_4NP.inp".
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00184802, 
    farPlane=0.0051085, width=0.00297008, height=0.00182962, 
    viewOffsetX=0.000256182, viewOffsetY=0.000255691)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
#: Warning: The selected Primary Variable is not available in the current frame for any elements in the current display group.
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0018728, 
    farPlane=0.00508372, width=0.00284088, height=0.00175003, 
    viewOffsetX=0.000168258, viewOffsetY=0.000135214)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00182115, 
    farPlane=0.00513537, width=0.00311372, height=0.00191811, 
    viewOffsetX=0.00024928, viewOffsetY=0.00015737)
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00220407, 
    farPlane=0.005113, width=0.00327699, height=0.00181986, 
    viewOffsetX=0.000280036, viewOffsetY=-5.00858e-05)
session.Viewport(name='Viewport: 2', origin=(5.375, 61.8761558532715), 
    width=191.932281494141, height=118.391204833984)
session.viewports['Viewport: 2'].makeCurrent()
session.viewports['Viewport: 2'].maximize()
session.viewports['Viewport: 1'].restore()
session.viewports['Viewport: 2'].restore()
session.viewports['Viewport: 1'].setValues(origin=(0.0, 61.8761520385742), 
    width=111.307289123535, height=123.752311706543)
session.viewports['Viewport: 2'].setValues(origin=(111.307289123535, 
    61.8761520385742), width=111.307289123535, height=123.752311706543)
session.viewports['Viewport: 2'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].makeCurrent()
session. linkedViewportCommands.setValues(linkViewports=True)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(width=0.00203599, 
    height=0.00216416, viewOffsetX=0.000128554, viewOffsetY=-3.06272e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00203599, 
    height=0.00216416, viewOffsetX=0.000128554, viewOffsetY=-3.06272e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00289539, 
    height=0.00307767, viewOffsetX=0.000105321, viewOffsetY=-2.54645e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00289539, 
    height=0.00307767, viewOffsetX=0.000105321, viewOffsetY=-2.54645e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00254281, 
    height=0.00270289, viewOffsetX=2.50724e-05, viewOffsetY=-2.7421e-06)
session.viewports['Viewport: 2'].view.setValues(width=0.00254281, 
    height=0.00270289, viewOffsetX=2.50724e-05, viewOffsetY=-2.7421e-06)
session.viewports['Viewport: 1'].view.setValues(width=0.00293966, 
    height=0.00312473, viewOffsetX=-4.82675e-05, viewOffsetY=2.39325e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00293966, 
    height=0.00312473, viewOffsetX=-4.82675e-05, viewOffsetY=2.39325e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00284646, 
    height=0.00302565, viewOffsetX=-0.000118806, viewOffsetY=5.02909e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00284646, 
    height=0.00302565, viewOffsetX=-0.000118806, viewOffsetY=5.02909e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00309831, 
    height=0.00329337, viewOffsetX=-0.000173664, viewOffsetY=6.87798e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00309831, 
    height=0.00329337, viewOffsetX=-0.000173664, viewOffsetY=6.87798e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00309436, 
    height=0.00328917, viewOffsetX=-0.000215075, viewOffsetY=8.1872e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00309436, 
    height=0.00328917, viewOffsetX=-0.000215075, viewOffsetY=8.1872e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00291168, 
    height=0.00309498, viewOffsetX=-0.000210524, viewOffsetY=0.000108791)
session.viewports['Viewport: 2'].view.setValues(width=0.00291168, 
    height=0.00309498, viewOffsetX=-0.000210524, viewOffsetY=0.000108791)
session.viewports['Viewport: 1'].view.setValues(width=0.00286626, 
    height=0.0030467, viewOffsetX=-0.000215773, viewOffsetY=0.000140346)
session.viewports['Viewport: 2'].view.setValues(width=0.00286626, 
    height=0.0030467, viewOffsetX=-0.000215773, viewOffsetY=0.000140346)
session.viewports['Viewport: 1'].view.setValues(width=0.0027245, 
    height=0.00289602, viewOffsetX=-0.000213729, viewOffsetY=0.00016703)
session.viewports['Viewport: 2'].view.setValues(width=0.0027245, 
    height=0.00289602, viewOffsetX=-0.000213729, viewOffsetY=0.00016703)
session.viewports['Viewport: 1'].view.setValues(width=0.00264967, 
    height=0.00281648, viewOffsetX=-0.000216785, viewOffsetY=0.000197232)
session.viewports['Viewport: 2'].view.setValues(width=0.00264967, 
    height=0.00281648, viewOffsetX=-0.000216785, viewOffsetY=0.000197232)
session.viewports['Viewport: 2'].makeCurrent()
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb']
session.viewports['Viewport: 2'].setValues(displayedObject=odb)
session.viewports['Viewport: 2'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(width=0.00286858, 
    height=0.00304917, viewOffsetX=-0.000198171, viewOffsetY=0.000260464)
session.viewports['Viewport: 2'].view.setValues(width=0.00100992, 
    height=0.0010735, viewOffsetX=7.90104e-06, viewOffsetY=2.10357e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00289676, 
    height=0.00307913, viewOffsetX=-0.00016652, viewOffsetY=0.000303663)
session.viewports['Viewport: 2'].view.setValues(width=0.00103881, 
    height=0.0011042, viewOffsetX=1.53824e-05, viewOffsetY=4.05721e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00306044, 
    height=0.00325311, viewOffsetX=-0.000143692, viewOffsetY=0.0003593)
session.viewports['Viewport: 2'].view.setValues(width=0.00109975, 
    height=0.00116898, viewOffsetX=2.30986e-05, viewOffsetY=6.11196e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.0031247, 
    height=0.00332141, viewOffsetX=-0.000116541, viewOffsetY=0.000403774)
session.viewports['Viewport: 2'].view.setValues(width=0.00115791, 
    height=0.00123081, viewOffsetX=3.07785e-05, viewOffsetY=8.23322e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.0032694, 
    height=0.00347522, viewOffsetX=-9.22658e-05, viewOffsetY=0.000457991)
session.viewports['Viewport: 2'].view.setValues(width=0.0012196, 
    height=0.00129638, viewOffsetX=3.88125e-05, viewOffsetY=0.000104221)
session.viewports['Viewport: 1'].view.setValues(width=0.00334692, 
    height=0.00355763, viewOffsetX=-6.59009e-05, viewOffsetY=0.00050303)
session.viewports['Viewport: 2'].view.setValues(width=0.00128365, 
    height=0.00136447, viewOffsetX=4.71773e-05, viewOffsetY=0.000127011)
session.viewports['Viewport: 1'].view.setValues(width=0.0034858, 
    height=0.00370525, viewOffsetX=-9.73711e-05, viewOffsetY=0.000496538)
session.viewports['Viewport: 2'].view.setValues(width=0.00135036, 
    height=0.00143537, viewOffsetX=3.39239e-05, viewOffsetY=0.00012717)
session.viewports['Viewport: 1'].view.setValues(width=0.00356584, 
    height=0.00379032, viewOffsetX=-0.000128117, viewOffsetY=0.000481625)
session.viewports['Viewport: 2'].view.setValues(width=0.00141967, 
    height=0.00150905, viewOffsetX=1.97951e-05, viewOffsetY=0.000127334)
session.viewports['Viewport: 1'].view.setValues(width=0.0037061, 
    height=0.00393942, viewOffsetX=-0.000161467, viewOffsetY=0.000474862)
session.viewports['Viewport: 2'].view.setValues(width=0.00149164, 
    height=0.00158554, viewOffsetX=4.94048e-06, viewOffsetY=0.000127502)
session.viewports['Viewport: 1'].view.setValues(width=0.00377982, 
    height=0.00401778, viewOffsetX=-0.00019182, viewOffsetY=0.000459662)
session.viewports['Viewport: 2'].view.setValues(width=0.00156624, 
    height=0.00166484, viewOffsetX=-1.04645e-05, viewOffsetY=0.000127675)
session.viewports['Viewport: 1'].view.setValues(width=0.00393004, 
    height=0.00417745, viewOffsetX=-0.000225971, viewOffsetY=0.000453842)
session.viewports['Viewport: 2'].view.setValues(width=0.00164349, 
    height=0.00174696, viewOffsetX=-2.64192e-05, viewOffsetY=0.000127853)
session.viewports['Viewport: 1'].view.setValues(width=0.00398352, 
    height=0.0042343, viewOffsetX=-0.000254811, viewOffsetY=0.000440983)
session.viewports['Viewport: 2'].view.setValues(width=0.00172336, 
    height=0.00183186, viewOffsetX=-4.3133e-05, viewOffsetY=0.000129728)
session.viewports['Viewport: 1'].view.setValues(width=0.00444688, 
    height=0.00472683, viewOffsetX=-0.000262917, viewOffsetY=0.00051244)
session.viewports['Viewport: 2'].view.setValues(width=0.00192896, 
    height=0.00205039, viewOffsetX=-4.79513e-05, viewOffsetY=0.000162151)
session.viewports['Viewport: 1'].view.setValues(width=0.00399474, 
    height=0.00424623, viewOffsetX=-0.000214385, viewOffsetY=0.000472726)
session.viewports['Viewport: 2'].view.setValues(width=0.00197154, 
    height=0.00209566, viewOffsetX=-4.23044e-05, viewOffsetY=0.000175532)
session.viewports['Viewport: 1'].view.setValues(width=0.00501372, 
    height=0.00532936, viewOffsetX=-0.000232233, viewOffsetY=0.000609771)
session.viewports['Viewport: 2'].view.setValues(width=0.00207964, 
    height=0.00221056, viewOffsetX=-3.33631e-05, viewOffsetY=0.000195641)
session.viewports['Viewport: 1'].view.setValues(width=0.00350203, 
    height=0.0037225, viewOffsetX=-0.000131985, viewOffsetY=0.000436727)
session.viewports['Viewport: 2'].view.setValues(width=0.00216446, 
    height=0.00230072, viewOffsetX=-1.99737e-05, viewOffsetY=0.000213879)
session.viewports['Viewport: 1'].view.setValues(width=0.00584628, 
    height=0.00621433, viewOffsetX=-0.00019034, viewOffsetY=0.000722492)
session.viewports['Viewport: 2'].view.setValues(width=0.00199924, 
    height=0.00212511, viewOffsetX=-4.55961e-06, viewOffsetY=0.000191998)
session.viewports['Viewport: 1'].view.setValues(width=0.00177198, 
    height=0.00188353, viewOffsetX=-4.80193e-05, viewOffsetY=0.000216862)
session.viewports['Viewport: 2'].view.setValues(width=0.00194401, 
    height=0.00206639, viewOffsetX=9.93413e-06, viewOffsetY=0.000180948)
session.viewports['Viewport: 1'].view.setValues(width=0.00774884, 
    height=0.00823667, viewOffsetX=-0.000164993, viewOffsetY=0.000938462)
session.viewports['Viewport: 2'].view.setValues(width=0.00184771, 
    height=0.00196403, viewOffsetX=2.39697e-05, viewOffsetY=0.000166174)
session.viewports['Viewport: 2'].view.setValues(session.views['Iso'])
session.viewports['Viewport: 1'].view.setValues(width=0.00175212, 
    height=0.00186243, viewOffsetX=4.64114e-06, viewOffsetY=4.62915e-06)
session.viewports['Viewport: 2'].view.setValues(width=0.00175212, 
    height=0.00186243, viewOffsetX=4.64114e-06, viewOffsetY=4.62915e-06)
session.viewports['Viewport: 1'].view.setValues(width=0.00166066, 
    height=0.00176521, viewOffsetX=7.92002e-06, viewOffsetY=8.10363e-06)
session.viewports['Viewport: 2'].view.setValues(width=0.00166066, 
    height=0.00176521, viewOffsetX=7.92002e-06, viewOffsetY=8.10363e-06)
session.viewports['Viewport: 1'].view.setValues(width=0.00178524, 
    height=0.00189763, viewOffsetX=1.07496e-06, viewOffsetY=6.32413e-06)
session.viewports['Viewport: 2'].view.setValues(width=0.00178524, 
    height=0.00189763, viewOffsetX=1.07496e-06, viewOffsetY=6.32414e-06)
session.viewports['Viewport: 1'].view.setValues(width=0.00187227, 
    height=0.00199014, viewOffsetX=-1.19731e-05, viewOffsetY=1.37516e-07)
session.viewports['Viewport: 2'].view.setValues(width=0.00187227, 
    height=0.00199014, viewOffsetX=-1.19731e-05, viewOffsetY=1.37516e-07)
session.viewports['Viewport: 1'].view.setValues(width=0.00197176, 
    height=0.0020959, viewOffsetX=-2.80075e-05, viewOffsetY=-6.76942e-06)
session.viewports['Viewport: 2'].view.setValues(width=0.00197176, 
    height=0.0020959, viewOffsetX=-2.80075e-05, viewOffsetY=-6.76943e-06)
session.viewports['Viewport: 1'].view.setValues(width=0.00207328, 
    height=0.00220381, viewOffsetX=-5.02886e-05, viewOffsetY=-1.70093e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00207328, 
    height=0.00220381, viewOffsetX=-5.02886e-05, viewOffsetY=-1.70093e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.0021792, 
    height=0.0023164, viewOffsetX=-8.04278e-05, viewOffsetY=-3.0329e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.0021792, 
    height=0.0023164, viewOffsetX=-8.04278e-05, viewOffsetY=-3.0329e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00244505, 
    height=0.00259897, viewOffsetX=-0.000153214, viewOffsetY=-5.909e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00244505, 
    height=0.00259897, viewOffsetX=-0.000153214, viewOffsetY=-5.909e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00268913, 
    height=0.00285842, viewOffsetX=-0.000244036, viewOffsetY=-8.52787e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00268913, 
    height=0.00285843, viewOffsetX=-0.000244036, viewOffsetY=-8.52787e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00277352, 
    height=0.00294813, viewOffsetX=-0.00028802, viewOffsetY=-9.61403e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00277352, 
    height=0.00294813, viewOffsetX=-0.00028802, viewOffsetY=-9.61403e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00257875, 
    height=0.0027411, viewOffsetX=-0.000269509, viewOffsetY=-2.54799e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00257875, 
    height=0.0027411, viewOffsetX=-0.000269509, viewOffsetY=-2.54799e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00248555, 
    height=0.00264203, viewOffsetX=-0.000260549, viewOffsetY=3.96722e-05)
session.viewports['Viewport: 2'].view.setValues(width=0.00248555, 
    height=0.00264203, viewOffsetX=-0.000260549, viewOffsetY=3.96722e-05)
session.viewports['Viewport: 1'].view.setValues(width=0.00236409, 
    height=0.00251292, viewOffsetX=-0.000254804, viewOffsetY=0.00011107)
session.viewports['Viewport: 2'].view.setValues(width=0.00236409, 
    height=0.00251292, viewOffsetX=-0.000254804, viewOffsetY=0.00011107)
session.viewports['Viewport: 1'].view.setValues(width=0.00225614, 
    height=0.00239818, viewOffsetX=-0.000250263, viewOffsetY=0.000180454)
session.viewports['Viewport: 2'].view.setValues(width=0.00225614, 
    height=0.00239818, viewOffsetX=-0.000250263, viewOffsetY=0.000180454)
session.viewports['Viewport: 2'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=9 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=10 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=10 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=11 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=11 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=12 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=12 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=13 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=13 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=14 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=14 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=15 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=15 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=16 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=16 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=17 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=17 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=18 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=18 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=19 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=19 )
session.viewports['Viewport: 2'].odbDisplay.setFrame(step=0, frame=20 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=20 )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(solver case 11) cube_C3D8T_transient_nlgeom_on_4NP/solver_cube_C3D8T_transient_nlgeom_on_4NP.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb'].close(
    )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
#* KeyError: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL 
#* case 11) 
#* cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
session.viewports['Viewport: 1'].makeCurrent()
del session.viewports['Viewport: 2']
session.viewports['Viewport: 1'].maximize()
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00179668, 
    farPlane=0.00515984, width=0.00387216, height=0.00215038, 
    viewOffsetX=0.000249623, viewOffsetY=0.000164611)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0016317, 
    farPlane=0.00510802, width=0.0033056, height=0.00183575, 
    viewOffsetX=0.000247181, viewOffsetY=0.000121428)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR34_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00210296, 
    farPlane=0.00485356, width=0.00398394, height=0.00222398, 
    viewOffsetX=0.000259794, viewOffsetY=7.72596e-05)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00208264, 
    farPlane=0.00487388, width=0.00394545, height=0.0022025, 
    viewOffsetX=0.000346284, viewOffsetY=0.000129763)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR8_STRAN22', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    UNDEFORMED, ))
#* VisError: The output database 
#* C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) 
#* cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb 
#* disk file has changed.
#* 
#* The current plot operation has been canceled, re-open the file to view the 
#* results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR34_SIG_VONMISES', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR7_STRAN11', outputPosition=INTEGRATION_POINT, )
#: Warning: The output database 'C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb' disk file has changed.
#: 
#: The current plot operation has been canceled, re-open the file to view the results
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-Multiphysics/(UEL case 11) cube_C3D8T_transient_nlgeom_on_4NP/subroutine_cube_C3D8T_transient_nlgeom_on_4NP_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          7
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00244554, 
    farPlane=0.00486683, width=0.00384804, height=0.00214812, 
    viewOffsetX=0.000298091, viewOffsetY=-1.43215e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR37_U_HEAT', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='SDV_AR38_TEMP', outputPosition=INTEGRATION_POINT, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-Multiphysics\cube_test.cae".
