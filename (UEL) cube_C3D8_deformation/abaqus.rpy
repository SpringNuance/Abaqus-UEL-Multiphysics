# -*- coding: mbcs -*-
#
# Abaqus/Viewer Release 2023.HF4 replay file
# Internal Version: 2023_07_21-20.45.57 RELr425 183702
# Run by nguyenb5 on Wed Oct  9 13:27:00 2024
#

# from driverUtils import executeOnCaeGraphicsStartup
# executeOnCaeGraphicsStartup()
#: Executing "onCaeGraphicsStartup()" in the site directory ...
from abaqus import *
from abaqusConstants import *
session.Viewport(name='Viewport: 1', origin=(0.0, 0.0), width=146.46875, 
    height=119.284721374512)
session.viewports['Viewport: 1'].makeCurrent()
session.viewports['Viewport: 1'].maximize()
from viewerModules import *
from driverUtils import executeOnCaeStartup
executeOnCaeStartup()
o2 = session.openOdb(name='cube_C3D8_deformation.odb')
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation/cube_C3D8_deformation.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       7
#: Number of Node Sets:          6
#: Number of Steps:              4
session.viewports['Viewport: 1'].setValues(displayedObject=o2)
session.viewports['Viewport: 1'].makeCurrent()
o1 = session.openOdb(
    name='C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation/cube_C3D8_deformation_UEL.odb')
session.viewports['Viewport: 1'].setValues(displayedObject=o1)
#: Model: C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation/cube_C3D8_deformation_UEL.odb
#: Number of Assemblies:         1
#: Number of Assembly instances: 0
#: Number of Part instances:     1
#: Number of Meshes:             1
#: Number of Element Sets:       9
#: Number of Node Sets:          6
#: Number of Steps:              4
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00175634, 
    farPlane=0.00500292, width=0.00319303, height=0.00143838, 
    viewOffsetX=0.000111194, viewOffsetY=0.000199885)
odb = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation/cube_C3D8_deformation.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=odb)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00160984, 
    farPlane=0.00512989, width=0.0038281, height=0.00172446, 
    viewOffsetX=0.000346664, viewOffsetY=5.01722e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.000985583, 
    farPlane=0.00441134, width=0.00234365, height=0.00105575, cameraPosition=(
    -0.00118204, 0.00182407, 0.00206157), cameraUpVector=(-0.0596635, 0.486809, 
    -0.871469), cameraTarget=(0.000115564, -0.000304868, -0.000615887), 
    viewOffsetX=0.000212236, viewOffsetY=3.07166e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00136905, 
    farPlane=0.00433489, width=0.0032555, height=0.00146652, cameraPosition=(
    0.000269855, 0.00223649, 0.00228846), cameraUpVector=(-0.440206, 0.427024, 
    -0.789854), cameraTarget=(-0.00036184, -0.000297699, -0.000273531), 
    viewOffsetX=0.000294812, viewOffsetY=4.26677e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00128469, 
    farPlane=0.00456063, width=0.00305489, height=0.00137615, cameraPosition=(
    0.0009731, 0.00198312, 0.00237103), cameraUpVector=(-0.574286, 0.535608, 
    -0.619128), cameraTarget=(-0.000468709, -0.000221085, -0.000168183), 
    viewOffsetX=0.000276646, viewOffsetY=4.00385e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00133647, 
    farPlane=0.00462886, width=0.00317803, height=0.00143162, cameraPosition=(
    0.00164248, 0.00218255, 0.00190517), cameraUpVector=(-0.710324, 0.498609, 
    -0.496819), cameraTarget=(-0.000480443, -0.00019087, 0.000103777), 
    viewOffsetX=0.000287797, viewOffsetY=4.16524e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00138868, 
    farPlane=0.00466085, width=0.00330217, height=0.00148754, cameraPosition=(
    0.00199668, 0.0022428, 0.00153988), cameraUpVector=(-0.702362, 0.5112, 
    -0.495341), cameraTarget=(-0.000507226, -8.09699e-05, 0.000230099), 
    viewOffsetX=0.000299039, viewOffsetY=4.32795e-05)
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=3, frame=0 )
session.viewports['Viewport: 1'].odbDisplay.setFrame(step=3, frame=0 )
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation/cube_C3D8_deformation_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00161126, 
    farPlane=0.005148, width=0.00380031, height=0.00171194, 
    viewOffsetX=0.000313133, viewOffsetY=0.000148009)
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation/cube_C3D8_deformation.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00132191, 
    farPlane=0.00472763, width=0.00378456, height=0.00170485, 
    viewOffsetX=0.000370661, viewOffsetY=4.82206e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00108637, 
    farPlane=0.00460396, width=0.00311022, height=0.00140107, cameraPosition=(
    0.000799977, 0.00241539, 0.00199683), cameraUpVector=(-0.485762, 0.422263, 
    -0.765329), cameraTarget=(-0.000595662, -0.000196266, -0.00015176), 
    viewOffsetX=0.000304616, viewOffsetY=3.96286e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00117581, 
    farPlane=0.00447286, width=0.00336628, height=0.00151643, cameraPosition=(
    0.000831432, 0.00189187, 0.0023698), cameraUpVector=(-0.624249, 0.516113, 
    -0.586465), cameraTarget=(-0.000503063, -0.000311451, -0.000228177), 
    viewOffsetX=0.000329695, viewOffsetY=4.28912e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00130362, 
    farPlane=0.00461309, width=0.0037322, height=0.00168127, cameraPosition=(
    0.00179858, 0.00194148, 0.00193284), cameraUpVector=(-0.690811, 0.580402, 
    -0.431177), cameraTarget=(-0.000591483, -0.000150678, 0.000117502), 
    viewOffsetX=0.000365533, viewOffsetY=4.75535e-05)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00112325, 
    farPlane=0.00469036, width=0.00321581, height=0.00144865, cameraPosition=(
    0.00115542, 0.00266571, 0.00162897), cameraUpVector=(-0.627186, 0.340327, 
    -0.700582), cameraTarget=(-0.000601037, -0.000151692, 9.20582e-05), 
    viewOffsetX=0.000314958, viewOffsetY=4.0974e-05)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='step1_tensile', frame=0)
session.viewports[session.currentViewportName].odbDisplay.setFrame(
    step='step1_tensile', frame=91)
session.viewports['Viewport: 1'].view.setValues(nearPlane=0.00133892, 
    farPlane=0.00463026, width=0.00383328, height=0.0017268, cameraPosition=(
    0.00177251, 0.0019022, 0.00197653), cameraUpVector=(-0.564249, 0.62845, 
    -0.535419), cameraTarget=(-0.000689466, -4.17743e-06, 5.57574e-05), 
    viewOffsetX=0.000375431, viewOffsetY=4.88412e-05)
o3 = session.odbs['C:/LocalUserData/User-data/nguyenb5/Abaqus-UEL-von-Mises-plasticity/(UEL) cube_C3D8_deformation/cube_C3D8_deformation_UEL.odb']
session.viewports['Viewport: 1'].setValues(displayedObject=o3)
session.viewports['Viewport: 1'].odbDisplay.display.setValues(plotState=(
    CONTOURS_ON_DEF, ))
