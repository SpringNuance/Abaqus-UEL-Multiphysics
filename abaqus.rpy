# -*- coding: mbcs -*-
#
# Abaqus/CAE Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Mon Mar 24 13:44:44 2025
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
#: The model database "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae" has been opened.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=ON)
p = mdb.models['cube_C3D8_elastic_solver_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
mdb.models.changeKey(fromName='cube_C3D8_elastic_solver_nlgeom_off_nosymm', 
    toName='solver_cube_C3D8_elastic_nlgeom_off_nosymm')
p = mdb.models['solver_cube_C3D8_elastic_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_elastic_solver_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_elastic_solver_nlgeom_off_symm', 
    toName='solver_cube_C3D8_elastic_nlgeom_off_symm')
p = mdb.models['solver_cube_C3D8_elastic_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_elastic_solver_nlgeom_on_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_elastic_solver_nlgeom_on_nosymm', 
    toName='solver_cube_C3D8_elastic_nlgeom_on_nosymm')
p = mdb.models['solver_cube_C3D8_elastic_nlgeom_on_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_elastic_solver_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_elastic_solver_nlgeom_on_symm', 
    toName='solver_cube_C3D8_elastic_nlgeom_on_symm')
p = mdb.models['solver_cube_C3D8_elastic_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_elastic_srt_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_elastic_srt_nlgeom_off_nosymm', 
    toName='subroutine_cube_C3D8_elastic_nlgeom_off_nosymm')
p = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_elastic_srt_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_elastic_srt_nlgeom_off_symm', 
    toName='subroutine_cube_C3D8_elastic_nlgeom_off_symm')
p = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_elastic_srt_nlgeom_on_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_elastic_srt_nlgeom_on_nosymm', 
    toName='subroutine_cube_C3D8_elastic_nlgeom_on_nosymm')
p = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_elastic_srt_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_elastic_srt_nlgeom_on_symm', 
    toName='subroutine_cube_C3D8_elastic_nlgeom_on_symm')
p = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
p1 = mdb.models['cube_C3D8_plastic_solver_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models.changeKey(fromName='cube_C3D8_plastic_solver_nlgeom_on_symm', 
    toName='solver_cube_C3D8_plastic_nlgeom_on_symm')
p = mdb.models['solver_cube_C3D8_plastic_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
mdb.Model(name='solver_cube_C3D8_plastic_nlgeom_off_symm', 
    objectToCopy=mdb.models['solver_cube_C3D8_plastic_nlgeom_on_symm'])
#: The model "solver_cube_C3D8_plastic_nlgeom_off_symm" has been created.
p = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON, optimizationTasks=OFF, 
    geometricRestrictions=OFF, stopConditions=OFF)
mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'].steps['step1_tensile'].setValues(
    nlgeom=OFF)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
a = mdb.models['solver_cube_C3D8_elastic_nlgeom_on_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.models['solver_cube_C3D8_elastic_nlgeom_on_nosymm'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('LE', 'LODE', 'MISES', 'RF', 'S', 'TRIAX', 'U'))
a = mdb.models['solver_cube_C3D8_elastic_nlgeom_on_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.models['solver_cube_C3D8_elastic_nlgeom_on_symm'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('LE', 'LODE', 'MISES', 'RF', 'S', 'TRIAX', 'U'))
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON)
session.viewports['Viewport: 1'].partDisplay.geometryOptions.setValues(
    referenceRepresentation=OFF)
p1 = mdb.models['solver_cube_C3D8_plastic_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_on_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.models['solver_cube_C3D8_plastic_nlgeom_on_symm'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('LE', 'LODE', 'MISES', 'RF', 'S', 'TRIAX', 'U'))
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.Model(name='solver_cube_C3D8_plastic_nlgeom_on_nosymm', 
    objectToCopy=mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'])
#: The model "solver_cube_C3D8_plastic_nlgeom_on_nosymm" has been created.
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_on_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
mdb.models['solver_cube_C3D8_plastic_nlgeom_on_nosymm'].boundaryConditions['xsymm'].suppress(
    )
mdb.models['solver_cube_C3D8_plastic_nlgeom_on_nosymm'].boundaryConditions['zsymm'].suppress(
    )
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.Model(name='solver_cube_C3D8_plastic_nlgeom_off_nosymm', 
    objectToCopy=mdb.models['solver_cube_C3D8_plastic_nlgeom_off_symm'])
#: The model "solver_cube_C3D8_plastic_nlgeom_off_nosymm" has been created.
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
mdb.models['solver_cube_C3D8_plastic_nlgeom_off_nosymm'].boundaryConditions['zsymm'].suppress(
    )
mdb.models['solver_cube_C3D8_plastic_nlgeom_off_nosymm'].boundaryConditions['xsymm'].suppress(
    )
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_symm'].materials['user_subroutine'].density.setValues(
    table=((1.0, ), ))
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_symm'].materials['user_subroutine'].depvar.setValues(
    n=0)
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_nosymm'].materials['user_subroutine'].density.setValues(
    table=((1.0, ), ))
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_nosymm'].materials['user_subroutine'].depvar.setValues(
    n=0)
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_symm'].materials['user_subroutine'].density.setValues(
    table=((1.0, ), ))
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_symm'].materials['user_subroutine'].depvar.setValues(
    n=0)
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_nosymm'].materials['user_subroutine'].density.setValues(
    table=((1.0, ), ))
mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_nosymm'].materials['user_subroutine'].depvar.setValues(
    n=0)
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
a = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_on_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
del mdb.jobs['cube_C3D8_elastic_solver_nlgeom_off_nosymm']
del mdb.jobs['cube_C3D8_elastic_solver_nlgeom_off_symm']
del mdb.jobs['cube_C3D8_elastic_solver_nlgeom_on_nosymm']
del mdb.jobs['cube_C3D8_elastic_solver_nlgeom_on_symm']
del mdb.jobs['cube_C3D8_elastic_srt_nlgeom_off_nosymm']
del mdb.jobs['cube_C3D8_elastic_srt_nlgeom_off_symm']
del mdb.jobs['cube_C3D8_elastic_srt_nlgeom_on_nosymm']
del mdb.jobs['cube_C3D8_elastic_srt_nlgeom_on_symm']
p1 = mdb.models['subroutine_cube_C3D8_elastic_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
p1 = mdb.models['solver_cube_C3D8_plastic_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.Model(name='solver_cube_C3D8T_transient_nlgeom_on_4BC', 
    objectToCopy=mdb.models['solver_cube_C3D8_plastic_nlgeom_on_symm'])
#: The model "solver_cube_C3D8T_transient_nlgeom_on_4BC" has been created.
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].materials.changeKey(
    fromName='plastic', toName='thermomechanical')
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].sections['Section-1'].setValues(
    material='thermomechanical', thickness=None)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
del mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].steps['step1_tensile']
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].CoupledThermalElectricalStructuralStep(
    name='Step-1', previous='Initial', deltmx=100.0, nlgeom=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
del mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].historyOutputRequests['H-Output-1']
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00240233, 
    farPlane=0.00491475, width=0.00224751, height=0.00135727, 
    viewOffsetX=3.78502e-05, viewOffsetY=-2.14519e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00241348, 
    farPlane=0.00492033, width=0.00225793, height=0.00136357, cameraPosition=(
    0.00179344, 0.00165731, -0.00273731), cameraUpVector=(-0.737792, 0.58332, 
    0.339708), cameraTarget=(9.14113e-05, -1.86241e-05, 3.38341e-05), 
    viewOffsetX=3.80258e-05, viewOffsetY=-2.15514e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00258078, 
    farPlane=0.00490712, width=0.00241445, height=0.00145809, cameraPosition=(
    0.00332614, -0.000731366, 0.00155596), cameraUpVector=(-0.172712, 0.984892, 
    0.012579), cameraTarget=(5.81454e-05, -4.71193e-05, 6.03237e-05), 
    viewOffsetX=4.06616e-05, viewOffsetY=-2.30453e-05)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
region = a.sets['xsymm_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].XsymmBC(name='BC-1', 
    createStepName='Step-1', region=region, localCsys=None)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
region = a.sets['ysymm_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].YsymmBC(name='ysymm', 
    createStepName='Step-1', region=region, localCsys=None)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
region = a.sets['zsymm_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].ZsymmBC(name='zsymm', 
    createStepName='Step-1', region=region, localCsys=None)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].boundaryConditions.changeKey(
    fromName='BC-1', toName='xsymm')
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00248229, 
    farPlane=0.00492891, width=0.00232231, height=0.00140245, cameraPosition=(
    0.0029281, 0.00215568, 0.000715756), cameraUpVector=(-0.83364, 0.552307, 
    -0.00108963), cameraTarget=(4.34629e-05, 8.37485e-06, 4.28116e-05), 
    viewOffsetX=3.91099e-05, viewOffsetY=-2.21658e-05)
session.viewports['Viewport: 1'].view.setValues(session.views['Iso'])
#: 
#: Point 1: 500.E-06, -500.E-06, 500.E-06  Point 2: 500.E-06, 500.E-06, 500.E-06
#:    Distance: 1.E-03  Components: 0., 1.E-03, 0.
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00238635, 
    farPlane=0.00493073, width=0.00224169, height=0.00135376, 
    viewOffsetX=0.00014034, viewOffsetY=1.55296e-05)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
region = a.sets['top_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].TemperatureBC(
    name='temp', createStepName='Step-1', region=region, fixed=OFF, 
    distributionType=UNIFORM, fieldName='', magnitude=10.0, amplitude=UNSET)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
region = a.sets['top_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].ElectricPotentialBC(
    name='electric', createStepName='Step-1', region=region, fixed=OFF, 
    distributionType=UNIFORM, fieldName='', magnitude=5.0, amplitude=UNSET)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=ON, loads=OFF, 
    bcs=OFF, predefinedFields=OFF, connectors=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00220653, 
    farPlane=0.00511055, width=0.00310289, height=0.00141664, 
    viewOffsetX=0.000259209, viewOffsetY=9.81183e-06)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=OFF, 
    engineeringFeatures=OFF, mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00229702, 
    farPlane=0.00502006, width=0.00252193, height=0.0011514, 
    viewOffsetX=8.0289e-05, viewOffsetY=7.74572e-05)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
p.deleteMesh()
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
p.seedPart(size=0.0002, deviationFactor=0.1, minSizeFactor=0.1)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
p.seedPart(size=2e-05, deviationFactor=0.1, minSizeFactor=0.1)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00223029, 
    farPlane=0.00508679, width=0.00317495, height=0.00144954, 
    viewOffsetX=0.000658153, viewOffsetY=1.85562e-05)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
e = p.edges
pickedEdges = e.getSequenceFromMask(mask=('[#fff ]', ), )
p.seedEdgeByNumber(edges=pickedEdges, number=5, constraint=FINER)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
c = p.cells
pickedRegions = c.getSequenceFromMask(mask=('[#1 ]', ), )
p.generateMesh(regions=pickedRegions)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00218211, 
    farPlane=0.00513497, width=0.00310636, height=0.00141823, 
    viewOffsetX=0.000618869, viewOffsetY=-3.87007e-05)
elemType1 = mesh.ElemType(elemCode=Q3D8, elemLibrary=STANDARD)
elemType2 = mesh.ElemType(elemCode=Q3D6, elemLibrary=STANDARD)
elemType3 = mesh.ElemType(elemCode=Q3D4, elemLibrary=STANDARD)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].parts['cube']
c = p.cells
cells = c.getSequenceFromMask(mask=('[#1 ]', ), )
pickedRegions =(cells, )
p.setElementType(regions=pickedRegions, elemTypes=(elemType1, elemType2, 
    elemType3))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON, mesh=OFF)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=OFF)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
a.regenerate()
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=OFF, loads=ON, 
    bcs=ON, predefinedFields=ON, connectors=ON)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=OFF)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
region = a.sets['top_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].DisplacementBC(
    name='top_disp', createStepName='Step-1', region=region, u1=UNSET, 
    u2=0.001, u3=UNSET, ur1=UNSET, ur2=UNSET, ur3=UNSET, amplitude='loading', 
    fixed=OFF, distributionType=UNIFORM, fieldName='', localCsys=None)
a = mdb.models['solver_cube_C3D8_elastic_nlgeom_off_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Step-1')
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00221668, 
    farPlane=0.0051004, width=0.002943, height=0.00133777, 
    viewOffsetX=0.000474713, viewOffsetY=0.00018348)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4BC'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('S', 'LE', 'U', 'RF', 'NT', 'HFL', 'EPOT', 'EPG'))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
mdb.models.changeKey(fromName='solver_cube_C3D8T_transient_nlgeom_on_4BC', 
    toName='solver_cube_Q3D8')
a = mdb.models['solver_cube_Q3D8'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.Job(name='solver_cube_Q3D8', model='solver_cube_Q3D8', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
p1 = mdb.models['solver_cube_Q3D8'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['solver_cube_Q3D8'].materials.changeKey(fromName='thermomechanical', 
    toName='thermo_electro_mechanical')
a = mdb.models['solver_cube_Q3D8'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
p1 = mdb.models['solver_cube_Q3D8'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['solver_cube_Q3D8'].sections['Section-1'].setValues(
    material='thermo_electro_mechanical', thickness=None)
mdb.models['solver_cube_Q3D8'].materials['thermo_electro_mechanical'].plastic.setValues(
    scaleStress=None)
mdb.models['solver_cube_Q3D8'].materials['thermo_electro_mechanical'].Conductivity(
    table=((50.0, ), ))
mdb.models['solver_cube_Q3D8'].materials['thermo_electro_mechanical'].SpecificHeat(
    table=((450.0, ), ))
mdb.models['solver_cube_Q3D8'].materials['thermo_electro_mechanical'].ElectricalConductivity(
    table=((6000000.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
a = mdb.models['solver_cube_Q3D8'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['solver_cube_Q3D8'].submit(consistencyChecking=OFF)
#: The job input file "solver_cube_Q3D8.inp" has been submitted for analysis.
#: Error in job solver_cube_Q3D8: *SPECIFIC HEAT REQUIRES THE USE OF *DENSITY
#: Job solver_cube_Q3D8: Analysis Input File Processor aborted due to errors.
#: Error in job solver_cube_Q3D8: Analysis Input File Processor exited with an error - Please see the  solver_cube_Q3D8.dat file for possible error messages if the file exists.
#: Job solver_cube_Q3D8 aborted due to errors.
p1 = mdb.models['solver_cube_Q3D8'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['solver_cube_Q3D8'].materials['thermo_electro_mechanical'].Density(
    table=((7900.0, ), ))
a = mdb.models['solver_cube_Q3D8'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['solver_cube_Q3D8'].submit(consistencyChecking=OFF)
#: The job input file "solver_cube_Q3D8.inp" has been submitted for analysis.
#: Job solver_cube_Q3D8: Analysis Input File Processor completed successfully.
#: Job solver_cube_Q3D8: Abaqus/Standard completed successfully.
#: Job solver_cube_Q3D8 completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       6
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00222198, 
    farPlane=0.00509405, width=0.00293801, height=0.0013355, 
    viewOffsetX=0.000120946, viewOffsetY=-2.30939e-06)
a = mdb.models['solver_cube_Q3D8'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=ON, 
    adaptiveMeshConstraints=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=ON)
session.viewports['Viewport: 1'].setValues(
    displayedObject=session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb'])
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00214676, 
    farPlane=0.00516927, width=0.00321248, height=0.00146027, 
    viewOffsetX=0.000190537, viewOffsetY=-9.58828e-05)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
a = mdb.models['solver_cube_Q3D8'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=OFF, loads=ON, 
    bcs=ON, predefinedFields=ON, connectors=ON)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
mdb.models['solver_cube_Q3D8'].steps['Step-1'].setValues(timePeriod=100.0, 
    initialInc=1.0, minInc=0.001, maxInc=1.0)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.jobs['solver_cube_Q3D8'].submit(consistencyChecking=OFF)
#: The job input file "solver_cube_Q3D8.inp" has been submitted for analysis.
#: Job solver_cube_Q3D8: Analysis Input File Processor completed successfully.
#: Job solver_cube_Q3D8: Abaqus/Standard completed successfully.
#: Job solver_cube_Q3D8 completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       6
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00182006, 
    farPlane=0.0052538, width=0.00372631, height=0.00169383, 
    viewOffsetX=0.000220867, viewOffsetY=0.000242118)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00217101, 
    farPlane=0.00512352, width=0.00444482, height=0.00202044, cameraPosition=(
    0.00286297, 0.00103974, 0.00192893), cameraUpVector=(-0.47374, 0.799123, 
    -0.370099), cameraTarget=(-3.31647e-05, -5.40225e-05, -2.06837e-05), 
    viewOffsetX=0.000263455, viewOffsetY=0.000288803)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00175623, 
    farPlane=0.0054541, width=0.00359563, height=0.00163443, cameraPosition=(
    0.00244174, 0.00238771, 0.00161138), cameraUpVector=(-0.709809, 0.503379, 
    -0.492727), cameraTarget=(0.000119335, 2.15225e-05, 6.46142e-05), 
    viewOffsetX=0.000213121, viewOffsetY=0.000233627)
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
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='Step-1', frame=98)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00197691, 
    farPlane=0.00524539, width=0.00316003, height=0.00143642, 
    viewOffsetX=0.00022001, viewOffsetY=0.000369874)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00254813, 
    farPlane=0.00472089, width=0.00407312, height=0.00185148, cameraPosition=(
    0.0031975, 0.000118442, 0.00133325), cameraUpVector=(-0.271215, 0.909936, 
    -0.313783), cameraTarget=(-0.000200595, -1.92485e-05, -1.54028e-05), 
    viewOffsetX=0.000283582, viewOffsetY=0.000476748)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00196806, 
    farPlane=0.00547088, width=0.00314589, height=0.00143, cameraPosition=(
    0.0030174, 0.00249863, 0.000479615), cameraUpVector=(-0.901191, 0.432191, 
    0.0326316), cameraTarget=(0.000437703, -8.42244e-06, -0.000187262), 
    viewOffsetX=0.000219026, viewOffsetY=0.000368219)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00194871, 
    farPlane=0.00529696, width=0.00311495, height=0.00141594, cameraPosition=(
    0.000956676, 0.00370879, 0.00127144), cameraUpVector=(-0.940113, -0.108167, 
    -0.323244), cameraTarget=(0.000481897, 0.000304338, 1.87717e-05), 
    viewOffsetX=0.000216872, viewOffsetY=0.000364598)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00195446, 
    farPlane=0.00529121, width=0.00312414, height=0.00142012, cameraPosition=(
    0.000927179, 0.00370335, 0.00129741), cameraUpVector=(-0.925714, 
    -0.0943443, -0.366269), cameraTarget=(0.0004524, 0.000298896, 4.47407e-05), 
    viewOffsetX=0.000217512, viewOffsetY=0.000365674)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00227654, 
    farPlane=0.00521157, width=0.00363898, height=0.00165415, cameraPosition=(
    0.0031471, 0.00227399, 0.000384692), cameraUpVector=(-0.761979, 0.53838, 
    -0.35991), cameraTarget=(0.000173362, 0.000158428, 0.000127513), 
    viewOffsetX=0.000253357, viewOffsetY=0.000425935)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0018798, 
    farPlane=0.00544211, width=0.0030048, height=0.00136588, cameraPosition=(
    0.00149945, 0.00336014, 0.00149283), cameraUpVector=(-0.686529, 0.219745, 
    -0.693102), cameraTarget=(-8.77546e-07, 0.000267908, 0.000239046), 
    viewOffsetX=0.000209204, viewOffsetY=0.000351706)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00209607, 
    farPlane=0.00508994, width=0.00335049, height=0.00152302, cameraPosition=(
    0.00253429, 0.00198385, 0.00179194), cameraUpVector=(-0.604754, 0.623747, 
    -0.495189), cameraTarget=(-8.43369e-05, 6.28336e-05, 0.000107497), 
    viewOffsetX=0.000233272, viewOffsetY=0.000392169)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=98 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=99 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='U', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00202182, 
    farPlane=0.00533207, width=0.00323185, height=0.00146907, cameraPosition=(
    0.000233347, 0.00403978, 0.000919984), cameraUpVector=(-0.688349, 
    -0.201689, -0.696777), cameraTarget=(0.000143172, 0.000434895, 
    0.000302316), viewOffsetX=0.000225009, viewOffsetY=0.000378277)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00244175, 
    farPlane=0.00483073, width=0.0039031, height=0.00177419, cameraPosition=(
    0.00325087, 0.000365242, 0.00129893), cameraUpVector=(-0.43052, 0.888617, 
    -0.158155), cameraTarget=(-0.000114276, -0.000132385, -4.75388e-05), 
    viewOffsetX=0.000271743, viewOffsetY=0.000456844)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00231694, 
    farPlane=0.00495553, width=0.0037036, height=0.0016835, cameraPosition=(
    0.00310958, 0.000643399, 0.00154924), cameraUpVector=(-0.244293, 0.775732, 
    -0.58186), cameraTarget=(-0.000255562, 0.000145772, 0.000202766), 
    viewOffsetX=0.000257853, viewOffsetY=0.000433493)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00185803, 
    farPlane=0.00539065, width=0.00297003, height=0.00135005, cameraPosition=(
    -0.000503979, 0.00397556, 0.000935382), cameraUpVector=(-0.366244, 
    -0.229032, -0.901892), cameraTarget=(-0.000103766, 0.000389508, 
    0.000331353), viewOffsetX=0.00020678, viewOffsetY=0.000347632)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00228777, 
    farPlane=0.00492795, width=0.00365695, height=0.0016623, cameraPosition=(
    0.0028803, 0.00121219, 0.00176249), cameraUpVector=(-0.38464, 0.741555, 
    -0.549679), cameraTarget=(-0.000201961, 6.82904e-05, 0.000157515), 
    viewOffsetX=0.000254605, viewOffsetY=0.000428034)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00182013, 
    farPlane=0.00533318, width=0.00290943, height=0.00132251, cameraPosition=(
    9.49894e-05, 0.00367775, 0.00155512), cameraUpVector=(-0.44277, 
    -0.00340971, -0.896629), cameraTarget=(-7.58032e-05, 0.0002483, 
    0.000292391), viewOffsetX=0.000202561, viewOffsetY=0.000340539)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00197149, 
    farPlane=0.00511523, width=0.00315137, height=0.00143249, cameraPosition=(
    0.00166955, 0.00242952, 0.00226693), cameraUpVector=(-0.515681, 0.497712, 
    -0.697392), cameraTarget=(-0.00012441, 4.89114e-05, 0.000145802), 
    viewOffsetX=0.000219405, viewOffsetY=0.000368857)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00190333, 
    farPlane=0.00518338, width=0.00344321, height=0.00156514, 
    viewOffsetX=0.000257154, viewOffsetY=0.000308701)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00190603, 
    farPlane=0.00516884, width=0.0034481, height=0.00156737, cameraPosition=(
    0.00176347, 0.00215883, 0.00238592), cameraUpVector=(-0.504048, 0.568739, 
    -0.649978), cameraTarget=(-0.000136792, 1.66657e-05, 0.000108885), 
    viewOffsetX=0.00025752, viewOffsetY=0.00030914)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
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
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=100 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='LE', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Max. Principal'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='HFL', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='EPG', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='EPG', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'EPG1'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='EPG', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'EPG2'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='EPG', outputPosition=INTEGRATION_POINT, refinement=(
    COMPONENT, 'EPG3'), )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=9 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=8 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=7 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=6 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=5 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=4 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=3 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=1 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=2 )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='EPOT', outputPosition=NODAL, )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=0, frame=0 )
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
p1 = mdb.models['solver_cube_Q3D8'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['solver_cube_Q3D8'].materials['thermo_electro_mechanical'].conductivity.setValues(
    table=((0.1, ), ))
a = mdb.models['solver_cube_Q3D8'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['solver_cube_Q3D8'].submit(consistencyChecking=OFF)
#: The job input file "solver_cube_Q3D8.inp" has been submitted for analysis.
#: Job solver_cube_Q3D8: Analysis Input File Processor completed successfully.
#: Error in job solver_cube_Q3D8: Too many increments needed to complete the step
#: Error in job solver_cube_Q3D8: THE ANALYSIS HAS BEEN TERMINATED DUE TO PREVIOUS ERRORS. ALL OUTPUT REQUESTS HAVE BEEN WRITTEN FOR THE LAST CONVERGED INCREMENT.
#: Job solver_cube_Q3D8: Abaqus/Standard aborted due to errors.
#: Error in job solver_cube_Q3D8: Abaqus/Standard Analysis exited with an error - Please see the  message file for possible error messages if the file exists.
#: Job solver_cube_Q3D8 aborted due to errors.
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       6
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00193575, 
    farPlane=0.00514575, width=0.00350183, height=0.00159179, 
    viewOffsetX=0.000231358, viewOffsetY=0.000185637)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0018974, 
    farPlane=0.00518409, width=0.00343247, height=0.00156026, 
    viewOffsetX=0.000259121, viewOffsetY=0.000235956)
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='EPG', outputPosition=INTEGRATION_POINT, refinement=(
    INVARIANT, 'Magnitude'), )
p1 = mdb.models['solver_cube_Q3D8'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_Q3D8.odb'].close(
    )
session.viewports['Viewport: 1'].setValues(displayedObject=None)
session.viewports['Viewport: 1'].setValues(displayedObject=None)
mdb.Model(name='solver_cube_C3D8T_transient_nlgeom_off_symm', 
    objectToCopy=mdb.models['solver_cube_C3D8_elastic_nlgeom_off_symm'])
#: The model "solver_cube_C3D8T_transient_nlgeom_off_symm" has been created.
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
import part
import assembly
import material
import section
import interaction
p1 = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].materials.changeKey(
    fromName='elastic', toName='thermomechanical')
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].materials['thermomechanical'].Conductivity(
    table=((0.1, ), ))
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].materials['thermomechanical'].SpecificHeat(
    table=((400.0, ), ))
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].sections['Section-1'].setValues(
    material='thermomechanical', thickness=None)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF, adaptiveMeshConstraints=ON)
del mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].steps['step1_tensile']
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].CoupledTempDisplacementStep(
    name='step1_thermomechanical', previous='Initial', timePeriod=100.0, 
    initialInc=1.0, minInc=0.001, maxInc=1.0, deltmx=100.0, nlgeom=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_thermomechanical')
del mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].historyOutputRequests['H-Output-1']
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].fieldOutputRequests['F-Output-1'].setValues(
    variables=('NT', 'RF', 'U', 'S', 'TEMP'))
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
region = a.sets['xsymm_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].XsymmBC(name='xsymm', 
    createStepName='step1_thermomechanical', region=region, localCsys=None)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
region = a.sets['ysymm_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].YsymmBC(name='ysymm', 
    createStepName='step1_thermomechanical', region=region, localCsys=None)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
region = a.sets['zsymm_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].ZsymmBC(name='zsymm', 
    createStepName='step1_thermomechanical', region=region, localCsys=None)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
region = a.sets['top_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].DisplacementBC(
    name='top_disp', createStepName='step1_thermomechanical', region=region, 
    u1=UNSET, u2=0.001, u3=UNSET, ur1=UNSET, ur2=UNSET, ur3=UNSET, 
    amplitude='loading', fixed=OFF, distributionType=UNIFORM, fieldName='', 
    localCsys=None)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00230123, 
    farPlane=0.00501584, width=0.00222567, height=0.00130015, 
    viewOffsetX=0.00010295, viewOffsetY=3.60498e-06)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
region = a.sets['top_side']
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].TemperatureBC(
    name='heat_transfer', createStepName='step1_thermomechanical', 
    region=region, fixed=OFF, distributionType=UNIFORM, fieldName='', 
    magnitude=100.0, amplitude=UNSET)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=ON, loads=OFF, 
    bcs=OFF, predefinedFields=OFF, connectors=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=ON)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p)
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=OFF, 
    engineeringFeatures=OFF, mesh=ON)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=ON)
elemType1 = mesh.ElemType(elemCode=C3D8T, elemLibrary=STANDARD, 
    secondOrderAccuracy=OFF, distortionControl=DEFAULT)
elemType2 = mesh.ElemType(elemCode=C3D6T, elemLibrary=STANDARD, 
    secondOrderAccuracy=OFF, distortionControl=DEFAULT)
elemType3 = mesh.ElemType(elemCode=C3D4T, elemLibrary=STANDARD, 
    secondOrderAccuracy=OFF, distortionControl=DEFAULT)
p = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].parts['cube']
c = p.cells
cells = c.getSequenceFromMask(mask=('[#1 ]', ), )
pickedRegions =(cells, )
p.setElementType(regions=pickedRegions, elemTypes=(elemType1, elemType2, 
    elemType3))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
a.regenerate()
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(mesh=OFF)
session.viewports['Viewport: 1'].assemblyDisplay.meshOptions.setValues(
    meshTechnique=OFF)
mdb.jobs['solver_cube_Q3D8'].submit(consistencyChecking=OFF)
#: The job input file "solver_cube_Q3D8.inp" has been submitted for analysis.
#: Job solver_cube_Q3D8: Analysis Input File Processor completed successfully.
#: Error in job solver_cube_Q3D8: Too many increments needed to complete the step
#: Error in job solver_cube_Q3D8: THE ANALYSIS HAS BEEN TERMINATED DUE TO PREVIOUS ERRORS. ALL OUTPUT REQUESTS HAVE BEEN WRITTEN FOR THE LAST CONVERGED INCREMENT.
#: Job solver_cube_Q3D8: Abaqus/Standard aborted due to errors.
#: Error in job solver_cube_Q3D8: Abaqus/Standard Analysis exited with an error - Please see the  message file for possible error messages if the file exists.
#: Job solver_cube_Q3D8 aborted due to errors.
mdb.models.changeKey(fromName='solver_cube_C3D8T_transient_nlgeom_off_symm', 
    toName='solver_cube_C3D8T_transient_nlgeom_on_symm')
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.Job(name='solver_cube_C3D8T_transient_nlgeom_on_symm', 
    model='solver_cube_C3D8T_transient_nlgeom_on_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_transient_nlgeom_on_symm.inp" has been submitted for analysis.
#: Error in job solver_cube_C3D8T_transient_nlgeom_on_symm: *SPECIFIC HEAT REQUIRES THE USE OF *DENSITY
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm: Analysis Input File Processor aborted due to errors.
#: Error in job solver_cube_C3D8T_transient_nlgeom_on_symm: Analysis Input File Processor exited with an error - Please see the  solver_cube_C3D8T_transient_nlgeom_on_symm.dat file for possible error messages if the file exists.
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm aborted due to errors.
session.viewports['Viewport: 1'].partDisplay.setValues(sectionAssignments=ON, 
    engineeringFeatures=ON, mesh=OFF)
session.viewports['Viewport: 1'].partDisplay.meshOptions.setValues(
    meshTechnique=OFF)
p1 = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].materials['thermomechanical'].Density(
    table=((7900.0, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_transient_nlgeom_on_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm completed successfully. 
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.0017396, 
    farPlane=0.00521692, width=0.00413502, height=0.00162557, 
    viewOffsetX=0.000471594, viewOffsetY=0.00017966)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='RF', outputPosition=NODAL, refinement=(INVARIANT, 
    'Magnitude'), )
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
p1 = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].materials['thermomechanical'].conductivity.setValues(
    table=((0.01, ), ))
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_transient_nlgeom_on_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_on_symm completed successfully. 
p1 = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
session.viewports['Viewport: 1'].setValues(displayedObject=None)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00184212, 
    farPlane=0.0051144, width=0.00386903, height=0.001521, 
    viewOffsetX=0.000390888, viewOffsetY=0.000152432)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00171517, 
    farPlane=0.00524135, width=0.00435493, height=0.00171201, 
    viewOffsetX=0.000446122, viewOffsetY=0.000166137)
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
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='TEMP', outputPosition=INTEGRATION_POINT, )
mdb.Model(name='solver_cube_C3D8T_transient_nlgeom_off_symm', 
    objectToCopy=mdb.models['solver_cube_C3D8T_transient_nlgeom_on_symm'])
#: The model "solver_cube_C3D8T_transient_nlgeom_off_symm" has been created.
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'].steps['step1_thermomechanical'].setValues(
    nlgeom=OFF)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
mdb.Job(name='solver_cube_C3D8T_transient_nlgeom_off_symm', 
    model='solver_cube_C3D8T_transient_nlgeom_off_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_transient_nlgeom_off_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8T_transient_nlgeom_off_symm: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_off_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8T_transient_nlgeom_off_symm completed successfully. 
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_off_symm.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_off_symm.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
mdb.Model(name='solver_cube_C3D8T_steady_transient_nlgeom_off_symm', 
    objectToCopy=mdb.models['solver_cube_C3D8T_transient_nlgeom_off_symm'])
#: The model "solver_cube_C3D8T_steady_transient_nlgeom_off_symm" has been created.
mdb.models.changeKey(
    fromName='solver_cube_C3D8T_steady_transient_nlgeom_off_symm', 
    toName='solver_cube_C3D8T_steady_nlgeom_off_symm')
p1 = mdb.models['solver_cube_C3D8T_steady_nlgeom_off_symm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
a = mdb.models['solver_cube_C3D8T_steady_nlgeom_off_symm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
mdb.models['solver_cube_C3D8T_steady_nlgeom_off_symm'].steps['step1_thermomechanical'].setValues(
    response=STEADY_STATE, deltmx=None, cetol=None, creepIntegration=None, 
    amplitude=RAMP)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON, adaptiveMeshConstraints=OFF)
mdb.models['solver_cube_C3D8T_steady_nlgeom_off_symm'].TabularAmplitude(
    name='constant', timeSpan=STEP, smooth=SOLVER_DEFAULT, data=((0.0, 1.0), (
    100.0, 1.0)))
mdb.models['solver_cube_C3D8T_steady_nlgeom_off_symm'].boundaryConditions['heat_transfer'].setValues(
    amplitude='constant')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
mdb.Job(name='solver_cube_C3D8T_steady_nlgeom_off_symm', 
    model='solver_cube_C3D8T_steady_nlgeom_off_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.jobs['solver_cube_C3D8T_steady_nlgeom_off_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8T_steady_nlgeom_off_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8T_steady_nlgeom_off_symm: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8T_steady_nlgeom_off_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8T_steady_nlgeom_off_symm completed successfully. 
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_steady_nlgeom_off_symm.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_steady_nlgeom_off_symm.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              1
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00225162, 
    farPlane=0.00504236, width=0.00330956, height=0.00135885, 
    viewOffsetX=0.000152245, viewOffsetY=-7.40829e-05)
session.viewports['Viewport: 1'].odbDisplay.setPrimaryVariable(
    variableLabel='NT11', outputPosition=NODAL, )
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
del mdb.models['solver_cube_C3D8T_steady_nlgeom_off_symm']
mdb.models.changeKey(fromName='solver_cube_C3D8T_transient_nlgeom_off_symm', 
    toName='solver_cube_C3D8T_transient_nlgeom_off_4BC')
mdb.models.changeKey(fromName='solver_cube_C3D8T_transient_nlgeom_on_symm', 
    toName='solver_cube_C3D8T_transient_nlgeom_on_3NP')
mdb.models.changeKey(fromName='solver_cube_C3D8T_transient_nlgeom_on_3NP', 
    toName='solver_cube_C3D8T_transient_nlgeom_on_4NP')
mdb.models.changeKey(fromName='solver_cube_C3D8T_transient_nlgeom_off_4BC', 
    toName='solver_cube_C3D8T_transient_nlgeom_off_4NP')
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00217611, 
    farPlane=0.00514096, width=0.00340274, height=0.00139711, 
    viewOffsetX=0.000271874, viewOffsetY=-1.99745e-06)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
v1 = a.instances['cube_assembly'].vertices
verts1 = v1.getSequenceFromMask(mask=('[#36 ]', ), )
region = a.Set(vertices=verts1, name='four_NP')
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].boundaryConditions['heat_transfer'].setValues(
    region=region)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00223688, 
    farPlane=0.00508019, width=0.00348351, height=0.00143028, 
    viewOffsetX=0.000244102, viewOffsetY=8.79272e-05)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_4NP'].rootAssembly
v1 = a.instances['cube_assembly'].vertices
verts1 = v1.getSequenceFromMask(mask=('[#36 ]', ), )
region = a.Set(vertices=verts1, name='four_NP')
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_4NP'].boundaryConditions['heat_transfer'].setValues(
    region=region)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=OFF, bcs=OFF, 
    predefinedFields=OFF, connectors=OFF)
del mdb.jobs['solver_cube_C3D8T_steady_nlgeom_off_symm']
del mdb.jobs['solver_cube_C3D8T_transient_nlgeom_off_symm']
del mdb.jobs['solver_cube_Q3D8']
del mdb.jobs['solver_cube_C3D8T_transient_nlgeom_on_symm']
p1 = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_nosymm'].parts['cube']
session.viewports['Viewport: 1'].setValues(displayedObject=p1)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_tensile')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=ON)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    adaptiveMeshConstraints=OFF)
a = mdb.models['solver_cube_C3D8_elastic_nlgeom_off_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.Job(name='solver_cube_C3D8_elastic_nlgeom_off_nosymm', 
    model='solver_cube_C3D8_elastic_nlgeom_off_nosymm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='solver_cube_C3D8_elastic_nlgeom_off_symm', 
    model='solver_cube_C3D8_elastic_nlgeom_off_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='solver_cube_C3D8_elastic_nlgeom_on_nosymm', 
    model='solver_cube_C3D8_elastic_nlgeom_on_nosymm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='solver_cube_C3D8_elastic_nlgeom_on_symm', 
    model='solver_cube_C3D8_elastic_nlgeom_on_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
o7 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_steady_nlgeom_off_symm.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o7)
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_on_symm.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_transient_nlgeom_off_symm.odb'].close(
    )
session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-deformation-diffusion/solver_cube_C3D8T_steady_nlgeom_off_symm.odb'].close(
    )
a = mdb.models['solver_cube_C3D8_elastic_nlgeom_off_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
a = mdb.models['solver_cube_C3D8_plastic_nlgeom_off_nosymm'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.Job(name='solver_cube_C3D8_plastic_nlgeom_off_nosymm', 
    model='solver_cube_C3D8_plastic_nlgeom_off_nosymm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='solver_cube_C3D8_plastic_nlgeom_off_symm', 
    model='solver_cube_C3D8_plastic_nlgeom_off_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='solver_cube_C3D8_plastic_nlgeom_on_nosymm', 
    model='solver_cube_C3D8_plastic_nlgeom_on_nosymm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.Job(name='solver_cube_C3D8_plastic_nlgeom_on_symm', 
    model='solver_cube_C3D8_plastic_nlgeom_on_symm', description='', 
    type=ANALYSIS, atTime=None, waitMinutes=0, waitHours=0, queue=None, 
    memory=90, memoryUnits=PERCENTAGE, getMemoryFromAnalysis=True, 
    explicitPrecision=SINGLE, nodalOutputPrecision=SINGLE, echoPrint=OFF, 
    modelPrint=OFF, contactPrint=OFF, historyPrint=OFF, userSubroutine='', 
    scratch='', resultsFormat=ODB, numThreadsPerMpiProcess=1, 
    multiprocessingMode=DEFAULT, numCpus=1, numGPUs=0)
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
mdb.jobs['solver_cube_C3D8_elastic_nlgeom_off_nosymm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_elastic_nlgeom_off_nosymm.inp" has been submitted for analysis.
mdb.jobs['solver_cube_C3D8_elastic_nlgeom_off_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_elastic_nlgeom_off_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8_elastic_nlgeom_off_nosymm: Analysis Input File Processor completed successfully.
mdb.jobs['solver_cube_C3D8_elastic_nlgeom_on_nosymm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_elastic_nlgeom_on_nosymm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8_elastic_nlgeom_off_symm: Analysis Input File Processor completed successfully.
mdb.jobs['solver_cube_C3D8_elastic_nlgeom_on_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_elastic_nlgeom_on_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8_elastic_nlgeom_off_nosymm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_elastic_nlgeom_off_nosymm completed successfully. 
#: Job solver_cube_C3D8_elastic_nlgeom_on_nosymm: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8_elastic_nlgeom_off_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_elastic_nlgeom_off_symm completed successfully. 
mdb.jobs['solver_cube_C3D8_plastic_nlgeom_off_nosymm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_plastic_nlgeom_off_nosymm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8_elastic_nlgeom_on_symm: Analysis Input File Processor completed successfully.
mdb.jobs['solver_cube_C3D8_plastic_nlgeom_off_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_plastic_nlgeom_off_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8_elastic_nlgeom_on_nosymm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_elastic_nlgeom_on_nosymm completed successfully. 
#: Job solver_cube_C3D8_elastic_nlgeom_on_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_plastic_nlgeom_off_nosymm: Analysis Input File Processor completed successfully.
mdb.jobs['solver_cube_C3D8_plastic_nlgeom_on_nosymm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_plastic_nlgeom_on_nosymm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8_elastic_nlgeom_on_symm completed successfully. 
#: Job solver_cube_C3D8_plastic_nlgeom_off_symm: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8_plastic_nlgeom_off_nosymm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_plastic_nlgeom_off_nosymm completed successfully. 
#: Job solver_cube_C3D8_plastic_nlgeom_on_nosymm: Analysis Input File Processor completed successfully.
#: Job solver_cube_C3D8_plastic_nlgeom_off_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_plastic_nlgeom_off_symm completed successfully. 
mdb.jobs['solver_cube_C3D8_plastic_nlgeom_on_symm'].submit(
    consistencyChecking=OFF)
#: The job input file "solver_cube_C3D8_plastic_nlgeom_on_symm.inp" has been submitted for analysis.
#: Job solver_cube_C3D8_plastic_nlgeom_on_nosymm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_plastic_nlgeom_on_nosymm completed successfully. 
#: Job solver_cube_C3D8_plastic_nlgeom_on_symm: Analysis Input File Processor completed successfully.
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
#: Job solver_cube_C3D8_plastic_nlgeom_on_symm: Abaqus/Standard completed successfully.
#: Job solver_cube_C3D8_plastic_nlgeom_on_symm completed successfully. 
mdb.Model(name='solver_cube_C3D8T_transient_nlgeom_off_1NP', 
    objectToCopy=mdb.models['solver_cube_C3D8T_transient_nlgeom_off_4NP'])
#: The model "solver_cube_C3D8T_transient_nlgeom_off_1NP" has been created.
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
mdb.Model(name='solver_cube_C3D8T_transient_nlgeom_on_1NP', 
    objectToCopy=mdb.models['solver_cube_C3D8T_transient_nlgeom_on_4NP'])
#: The model "solver_cube_C3D8T_transient_nlgeom_on_1NP" has been created.
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_1NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_thermomechanical')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(loads=ON, bcs=ON, 
    predefinedFields=ON, connectors=ON)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00224349, 
    farPlane=0.00507359, width=0.00279893, height=0.00119147, 
    viewOffsetX=7.59688e-05, viewOffsetY=3.96491e-05)
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_1NP'].rootAssembly.sets.changeKey(
    fromName='four_NP', toName='one_NP')
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_1NP'].rootAssembly
v1 = a.instances['cube_assembly'].vertices
verts1 = v1.getSequenceFromMask(mask=('[#4 ]', ), )
a.Set(vertices=verts1, name='one_NP')
#: The set 'one_NP' has been edited (1 vertex).
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_on_1NP'].rootAssembly
region = a.sets['one_NP']
mdb.models['solver_cube_C3D8T_transient_nlgeom_on_1NP'].boundaryConditions['heat_transfer'].setValues(
    region=region)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].rootAssembly
session.viewports['Viewport: 1'].setValues(displayedObject=a)
session.viewports['Viewport: 1'].assemblyDisplay.setValues(step='Initial')
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].rootAssembly.sets.changeKey(
    fromName='four_NP', toName='fou_NP')
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].rootAssembly.sets.changeKey(
    fromName='fou_NP', toName='one_NP')
session.viewports['Viewport: 1'].assemblyDisplay.setValues(
    step='step1_thermomechanical')
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].rootAssembly
region = a.sets['one_NP']
mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].boundaryConditions['heat_transfer'].setValues(
    region=region)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00225371, 
    farPlane=0.00506337, width=0.00318207, height=0.00135457, 
    viewOffsetX=0.000233164, viewOffsetY=6.47892e-05)
a = mdb.models['solver_cube_C3D8T_transient_nlgeom_off_1NP'].rootAssembly
v1 = a.instances['cube_assembly'].vertices
verts1 = v1.getSequenceFromMask(mask=('[#4 ]', ), )
a.Set(vertices=verts1, name='one_NP')
#: The set 'one_NP' has been edited (1 vertex).
mdb.save()
#: The model database has been saved to "C:\LocalUserData\User-data\nguyenb5\Abaqus-UEL-deformation-diffusion\cube_test.cae".
