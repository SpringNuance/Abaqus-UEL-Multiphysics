import os 
import shutil 
import argparse
import numpy as np
import pandas as pd
import copy

# Going to current directory
os.chdir(os.getcwd())

# multiprocessing mode in Abaqus can be either mpi or threads or hybrid
# For mpi case:
# abaqus job=input_file_name cpus=n threads_per_mpi_process=1

# For threads case:
# abaqus job=input_file_name cpus=n threads_per_mpi_process=n

# For hybrid case:
# abaqus job=input_file_name cpus=n threads_per_mpi_process=m where m must be divisible by n

# mp_mode = "mpi"
mp_mode = "threads"
# mp_mode = "hybrid"

def return_description_properties(properties_path_excel, flow_curve_excel_path):
    description_properties_dict = {
        "field_properties": {},
        "mechanical_properties": {},
        "flow_curve_properties": {},
        "heat_transfer_properties": {},
        "hydrogen_diffusion_properties": {},
        "phase_field_damage_properties": {},
    }

    # Loading the properties file
    # Cast to string to avoid issues with the mixed types in the excel file
    properties_df = pd.read_excel(properties_path_excel, dtype=str)
    
    field_descriptions_list = properties_df["field_descriptions"].dropna().tolist()
    field_values_list = properties_df["field_values"].dropna().tolist()

    mechanical_descriptions_list = properties_df["mechanical_descriptions"].dropna().tolist()
    mechanical_values_list = properties_df["mechanical_values"].dropna().tolist()

    heat_transfer_descriptions_list = properties_df["heat_transfer_descriptions"].dropna().tolist()
    heat_transfer_values_list = properties_df["heat_transfer_values"].dropna().tolist()

    hydrogen_diffusion_descriptions_list = properties_df["hydrogen_diffusion_descriptions"].dropna().tolist()
    hydrogen_diffusion_values_list = properties_df["hydrogen_diffusion_values"].dropna().tolist()

    phase_field_damage_descriptions_list = properties_df["phase_field_damage_descriptions"].dropna().tolist()
    phase_field_damage_values_list = properties_df["phase_field_damage_values"].dropna().tolist()

    # Loading the flow curve file
    # Cast to string to avoid issues with the mixed types in the excel file

    flow_curve_df = pd.read_excel(flow_curve_excel_path, dtype=str)

    equivalent_plastic_stress = flow_curve_df["stress/Pa"].dropna().tolist()
    equivalent_plastic_strain = flow_curve_df["strain/-"].dropna().tolist()

    ### Now we add the values to the dictionary

    description_properties_dict["field_properties"] = dict(zip(field_descriptions_list, field_values_list))
    description_properties_dict["mechanical_properties"] = dict(zip(mechanical_descriptions_list, mechanical_values_list))
    description_properties_dict["flow_curve_properties"]["equivalent_plastic_strain"] = equivalent_plastic_strain
    description_properties_dict["flow_curve_properties"]["equivalent_plastic_stress"] = equivalent_plastic_stress
    description_properties_dict["heat_transfer_properties"] = dict(zip(heat_transfer_descriptions_list, heat_transfer_values_list))
    description_properties_dict["hydrogen_diffusion_properties"] = dict(zip(hydrogen_diffusion_descriptions_list, hydrogen_diffusion_values_list))
    description_properties_dict["phase_field_damage_properties"] = dict(zip(phase_field_damage_descriptions_list, phase_field_damage_values_list))

    return description_properties_dict


def return_UEL_property(description_properties_dict): 

    field_properties_list = list(description_properties_dict["field_properties"].values())
    field_description_list = list(description_properties_dict["field_properties"].keys())

    mechanical_properties_list = list(description_properties_dict["mechanical_properties"].values())
    mechanical_description_list = list(description_properties_dict["mechanical_properties"].keys())

    flow_curve_true_strain = description_properties_dict["flow_curve_properties"]["equivalent_plastic_strain"]
    flow_curve_true_stress = description_properties_dict["flow_curve_properties"]["equivalent_plastic_stress"]

    flow_curve_zipped = []
    for stress, strain in zip(flow_curve_true_stress, flow_curve_true_strain):
        flow_curve_zipped.append(stress)
        flow_curve_zipped.append(strain)

    heat_transfer_properties_list = list(description_properties_dict["heat_transfer_properties"].values())
    heat_transfer_description_list = list(description_properties_dict["heat_transfer_properties"].keys())

    hydrogen_diffusion_properties_list = list(description_properties_dict["hydrogen_diffusion_properties"].values())
    hydrogen_diffusion_description_list = list(description_properties_dict["hydrogen_diffusion_properties"].keys())

    phase_field_properties_list = list(description_properties_dict["phase_field_damage_properties"].values())
    phase_field_description_list = list(description_properties_dict["phase_field_damage_properties"].keys())

    # Abaqus needs to define 8 properties each line

    field_prop_num_lines = int(np.ceil(len(field_properties_list)/8))
    field_prop_num_properties = int(field_prop_num_lines*8)

    mech_prop_num_lines = int(np.ceil(len(mechanical_properties_list)/8))
    mech_prop_num_properties = int(mech_prop_num_lines*8)

    flow_curve_num_lines = int(np.ceil(len(flow_curve_zipped)/8))
    flow_curve_num_properties = int(flow_curve_num_lines*8)

    heat_transfer_prop_num_lines = int(np.ceil(len(heat_transfer_properties_list)/8))
    heat_transfer_prop_num_properties = int(heat_transfer_prop_num_lines*8)

    hydrogen_diffusion_prop_num_lines = int(np.ceil(len(hydrogen_diffusion_properties_list)/8))
    hydrogen_diffusion_prop_num_properties = int(hydrogen_diffusion_prop_num_lines*8)

    phase_field_prop_num_lines = int(np.ceil(len(phase_field_properties_list)/8))
    phase_field_prop_num_properties = int(phase_field_prop_num_lines*8)

    total_num_properties = mech_prop_num_properties + flow_curve_num_properties + heat_transfer_prop_num_properties +\
                        hydrogen_diffusion_prop_num_properties + phase_field_prop_num_properties

    UEL_property = [
        "*******************************************************",
        "*UEL PROPERTY, ELSET=SOLID                             ",
    ]
    
    props_indices = {}

    current_start = 1  # Abaqus properties are 1-based

    # The last line would be padded with 0.0 and their corresponding description would be "none"
    # If the number of properties is not a multiple of 8

    # For field flags properties

    UEL_property.append("**")
    UEL_property.append("** =====================")
    UEL_property.append("**")
    UEL_property.append("** FIELD INFO PROPERTIES")
    UEL_property.append("**")

    for line_index in range(field_prop_num_lines):
        if line_index != field_prop_num_lines - 1:
            subset_properties = field_properties_list[line_index*8:(line_index+1)*8]
            subset_description = field_description_list[line_index*8:(line_index+1)*8]
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))

        else:   
            subset_properties = field_properties_list[line_index*8:] + ["0"]*(8-len(field_properties_list[line_index*8:]))
            subset_description = field_description_list[line_index*8:] + ["none"]*(8-len(field_description_list[line_index*8:]))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))
    
    # Field flags
    props_indices["start_field_flag_idx"] = current_start
    props_indices["end_field_flag_idx"] = current_start + len(field_properties_list) - 1
    current_start = current_start + field_prop_num_properties

    # For mechanical properties

    UEL_property.append("**")
    UEL_property.append("** =====================")
    UEL_property.append("**")
    UEL_property.append("** MECHANICAL PROPERTIES")
    UEL_property.append("**")

    for line_index in range(mech_prop_num_lines):
        if line_index != mech_prop_num_lines - 1:
            subset_properties = mechanical_properties_list[line_index*8:(line_index+1)*8]
            subset_description = mechanical_description_list[line_index*8:(line_index+1)*8]
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))
        else:
            subset_properties = mechanical_properties_list[line_index*8:] + ["0.0"]*(8-len(mechanical_properties_list[line_index*8:]))
            subset_description = mechanical_description_list[line_index*8:] + ["none"]*(8-len(mechanical_description_list[line_index*8:]))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))

    props_indices["start_mech_props_idx"] = current_start
    props_indices["end_mech_props_idx"] = current_start + len(mechanical_properties_list) - 1
    current_start = current_start + mech_prop_num_properties

    # For flow curve properties

    UEL_property.append("**")
    UEL_property.append("** =====================")
    UEL_property.append("**")
    UEL_property.append("** FLOW CURVE PROPERTIES")
    UEL_property.append("**")
    
    UEL_property.append("** True stress (Pa) - PEEQ (dimless) value pairs")
    for line_index in range(flow_curve_num_lines):
        if line_index != flow_curve_num_lines - 1:
            str_values = [str(value) for value in flow_curve_zipped[line_index*8:(line_index+1)*8]]
            UEL_property.append(", ".join(str_values))
        else:
            str_values = [str(value) for value in flow_curve_zipped[line_index*8:]] + ["none"]*(8-len(flow_curve_zipped[line_index*8:]))
            UEL_property.append(", ".join(str_values))

    props_indices["start_flow_props_idx"] = current_start
    props_indices["end_flow_props_idx"] = current_start + len(flow_curve_zipped) - 1
    current_start = current_start + flow_curve_num_properties

    # For hydrogen diffusion properties
    UEL_property.append("**")
    UEL_property.append("** =============================")
    UEL_property.append("**")
    UEL_property.append("** HYDROGEN DIFFUSION PROPERTIES")
    UEL_property.append("**")

    for line_index in range(hydrogen_diffusion_prop_num_lines):
        if line_index != hydrogen_diffusion_prop_num_lines - 1:
            subset_properties = hydrogen_diffusion_properties_list[line_index*8:(line_index+1)*8]
            subset_description = hydrogen_diffusion_description_list[line_index*8:(line_index+1)*8]
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))
            
        else:
            subset_properties = hydrogen_diffusion_properties_list[line_index*8:] + ["0.0"]*(8-len(hydrogen_diffusion_properties_list[line_index*8:]))
            subset_description = hydrogen_diffusion_description_list[line_index*8:] + ["none"]*(8-len(hydrogen_diffusion_description_list[line_index*8:]))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))

    props_indices["start_CL_mol_props_idx"] = current_start
    props_indices["end_CL_mol_props_idx"] = current_start + len(hydrogen_diffusion_properties_list) - 1
    current_start = current_start + hydrogen_diffusion_prop_num_properties
    
    # For heat transfer properties
    UEL_property.append("**")
    UEL_property.append("** =============================")
    UEL_property.append("**")
    UEL_property.append("** HEAT TRANSFER PROPERTIES")
    UEL_property.append("**")

    for line_index in range(heat_transfer_prop_num_lines):
        if line_index != heat_transfer_prop_num_lines - 1:
            subset_properties = heat_transfer_properties_list[line_index*8:(line_index+1)*8]
            subset_description = heat_transfer_description_list[line_index*8:(line_index+1)*8]
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))
        else:
            subset_properties = heat_transfer_properties_list[line_index*8:] + ["0.0"]*(8-len(heat_transfer_properties_list[line_index*8:]))
            subset_description = heat_transfer_description_list[line_index*8:] + ["none"]*(8-len(heat_transfer_description_list[line_index*8:]))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))

    props_indices["start_temp_props_idx"] = current_start
    props_indices["end_temp_props_idx"] = current_start + len(heat_transfer_properties_list) - 1
    current_start = current_start + heat_transfer_prop_num_properties

    # For phase field properties 
    UEL_property.append("**")
    UEL_property.append("** ======================")
    UEL_property.append("**")
    UEL_property.append("** PHASE FIELD PROPERTIES")
    UEL_property.append("**")
    for line_index in range(phase_field_prop_num_lines):
        if line_index != phase_field_prop_num_lines - 1:
            subset_properties = phase_field_properties_list[line_index*8:(line_index+1)*8]
            subset_description = phase_field_description_list[line_index*8:(line_index+1)*8]
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))
            
        else:
            subset_properties = phase_field_properties_list[line_index*8:] + ["0.0"]*(8-len(phase_field_properties_list[line_index*8:]))
            subset_description = phase_field_description_list[line_index*8:] + ["none"]*(8-len(phase_field_description_list[line_index*8:]))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            UEL_property.append(", ".join(subset_properties))
            
    UEL_property.append("**")
    UEL_property.append("*******************************************************")

    props_indices["start_damage_props_idx"] = current_start
    props_indices["end_damage_props_idx"] = current_start + len(phase_field_properties_list) - 1
    current_start = current_start + phase_field_prop_num_properties

    return UEL_property, total_num_properties, props_indices


def return_depvar(depvar_excel_path):

    depvar_df = pd.read_excel(depvar_excel_path, dtype=str)
    nstatev = depvar_df.shape[0]

    actual_output_nstatev = len(depvar_df[depvar_df["chosen_output"] == "1"])

    DEPVAR = [
        "*Depvar       ",
        f"  {actual_output_nstatev},      ",  
    ]

    depvar_index = depvar_df["depvar_index"].tolist()
    SDV_names = depvar_df["depvar_name"].tolist()
    SDV_field_names = depvar_df["field_name"].tolist()
    SDV_chosen_index_flags = depvar_df["chosen_output"].tolist()
    SDV_descriptions = depvar_df["description"].tolist()
    grad_SDV_flags = depvar_df["gradient_required"].tolist()

    count_chosen_index = 1
    for i in range(1, nstatev + 1):
        index = depvar_index[i-1]
        name = SDV_names[i-1]
        if str(SDV_chosen_index_flags[i-1]) == "1":
            DEPVAR.append(f"{count_chosen_index}, #{index}_{name}, #{index}_{name}")
            count_chosen_index += 1

    return DEPVAR, nstatev, SDV_names, SDV_field_names, SDV_chosen_index_flags, SDV_descriptions, grad_SDV_flags


def return_user_element(total_num_properties, nstatev):

    # The user element variables can be defined so as to order the degrees of freedom on the element 
    # in any arbitrary fashion. You specify a list of degrees of freedom for the first node on the element. 
    # All nodes with a nodal connectivity number that is less than the next connectivity number for which a 
    # list of degrees of freedom is specified will have the first list of degrees of freedom. The second list 
    # of degrees of freedom will be used for all nodes until a new list is defined, etc. If a new list of degrees 
    # of freedom is encountered with a nodal connectivity number that is less than or equal to that given with 
    # the previous list, the previous list's degrees of freedom will be assigned through the last node of 
    # the element. This generation of degrees of freedom can be stopped before the last node on the element 
    # by specifying a nodal connectivity number with an empty (blank) list of degrees of freedom.
    
    nnode = 8
    ndim = 3
    ninpt = 8
    nsvars = nstatev * nnode

    USER_ELEMENT = [
        "*************************************************",
    f"*User element, nodes={nnode}, type=U1, properties={total_num_properties}, coordinates={ndim}, variables={nsvars}",
        "1, 2, 3",
        "1, 11",
        "1, 12",
        "*************************************************"
    ]
    return USER_ELEMENT

def extracting_nodes_coordinates(flines):

    # Find the start index of the *NODE section

    flines_upper = [line.upper() for line in flines]

    start_node_idx = -1
    for i in range(len(flines_upper)):
        if "*NODE" in flines_upper[i]:
            start_node_idx = i
            break

    # Find the end index (first occurrence of *ELEMENT after *NODE)
    end_node_idx = len(flines)  # Default to end of file if *ELEMENT is not found
    for i in range(start_node_idx + 1, len(flines_upper)):
        if "*ELEMENT" in flines_upper[i]:
            end_node_idx = i
            break

    # Extract node coordinates (excluding the *NODE line)
    node_coordinates = flines[start_node_idx:end_node_idx]
    total_nodes = len(node_coordinates) - 1 # excluding the header *Node
    
    return node_coordinates, total_nodes, start_node_idx, end_node_idx

def constructing_mesh(flines):

    flines = [line.strip() for line in flines]
    flines_upper = [line.upper() for line in flines]
    start_elements = [i for i, line in enumerate(flines_upper) if '*ELEMENT' in line and '*ELEMENT OUTPUT' not in line]
    start_element_index = start_elements[0]
    element_indices = [] # list of element index
    element_connvectivity = [] # list of of list of nodes that make up the element

    #print("The starting element index is: ", start_element_index)
    #print(start_element_index)

    mesh_index = start_element_index + 1

    while flines_upper[mesh_index][0] != "*" and flines_upper[mesh_index][0] != " ":
    
        # remove all empty spaces and split by comma
        # each line look like this: 1,    35,     2,    36,  2503,  5502,  5503,  5504,  5505
        split_line = flines_upper[mesh_index].replace(" ", "").split(",")
        
        element_indices.append(split_line[0])
        element_connvectivity.append(split_line[1:])
        mesh_index += 1
    
    end_element_index = mesh_index

    # print("The element indices are: ", element_indices)
    # print("The element connectivity are: ", element_connvectivity)

    # Now we would count the number of elements 
    total_elems = len(element_indices)

    original_mesh = [flines[start_element_index]] # The first line is the *ELEMENT line
    # original_mesh = []
    for i in range(total_elems):
        reconstructed_line_original = ",".join([str(value) for value in [element_indices[i]] + element_connvectivity[i]])
        original_mesh.append(reconstructed_line_original)
    
    return original_mesh, total_elems, start_element_index, end_element_index

def return_control_settings(controls_path_excel):
    control_df = pd.read_excel(controls_path_excel)
    # Remove nan first
    solver_controls_values = control_df["solver_controls_values"].dropna().tolist()
    displacement_field_controls_values = control_df["displacement_field_controls_values"].dropna().tolist()
    diffusion_field_controls_values = control_df["diffusion_field_controls_values"].dropna().tolist()
    constraints_controls_values = control_df["constraints_controls_values"].dropna().tolist()
    time_incrementation_control_values = control_df["time_incrementation_controls_values"].dropna().tolist()
    line_search_controls_values = control_df["line_search_controls_values"].dropna().tolist()
    CONTROLS = []
    CONTROLS.append("*SOLVER CONTROLS")
    solver_controls_values = [" " if value == "default" else str(value) for value in solver_controls_values]
    CONTROLS.append(", ".join(solver_controls_values) + ",")
    CONTROLS.append("*CONTROLS, PARAMETERS=FIELD, FIELD=DISPLACEMENT")
    displacement_field_controls_values = [" " if value == "default" else str(value) for value in displacement_field_controls_values]
    CONTROLS.append(", ".join(displacement_field_controls_values[0:8]) + ",")
    CONTROLS.append(", ".join(displacement_field_controls_values[8:11]) + ",")
    CONTROLS.append("*CONTROLS, PARAMETERS=FIELD, FIELD=TEMPERATURE")
    diffusion_field_controls_values = [" " if value == "default" else str(value) for value in diffusion_field_controls_values]
    CONTROLS.append(", ".join(diffusion_field_controls_values[0:8]) + ",")
    CONTROLS.append(", ".join(diffusion_field_controls_values[8:11]) + ",")
    CONTROLS.append("*CONTROLS, PARAMETERS=CONSTRAINTS")
    constraints_controls_values = [" " if value == "default" else str(value) for value in constraints_controls_values]
    CONTROLS.append(", ".join(constraints_controls_values) + ",")
    CONTROLS.append("*CONTROLS, PARAMETERS=TIME INCREMENTATION")
    time_incrementation_control_values = [" " if value == "default" else str(value) for value in time_incrementation_control_values]
    CONTROLS.append(", ".join(time_incrementation_control_values[0:13]) + ",")
    CONTROLS.append(", ".join(time_incrementation_control_values[13:21]) + ",")
    CONTROLS.append(", ".join(time_incrementation_control_values[21:29]) + ",")
    CONTROLS.append(time_incrementation_control_values[29] + ",")
    CONTROLS.append("*CONTROLS, PARAMETERS=LINE SEARCH")
    line_search_controls_values = [" " if value == "default" else str(value) for value in line_search_controls_values]
    CONTROLS.append(", ".join(line_search_controls_values) + ",")

    return CONTROLS


def return_userinputs_fortran(total_elems, total_nodes, props_indices, SDV_names, nstatev, 
                            SDV_chosen_index_flags, SDV_field_names, SDV_descriptions, grad_SDV_flags,element_file_path):

    USERINPUTS = []
    USERINPUTS.append("")
    USERINPUTS.append("!***********************************************************************")
    USERINPUTS.append("")

    USERINPUTS.append("module userinputs")
    USERINPUTS.append("\tuse precision")
    USERINPUTS.append("\timplicit none")
    USERINPUTS.append("")

    USERINPUTS.append("\t! TOTAL ELEMENTS AND NODES ARE HARD-CODED")
    USERINPUTS.append("\t! YOU MUST CHANGE IT TO THE ACTUAL NUMBER OF ELEMENTS AND NODES IN .INP FILE")
    USERINPUTS.append("\t! YOU CAN USE PYTHON SCRIPTING TO CHANGE VALUES AS WELL")
    USERINPUTS.append("")
    USERINPUTS.append(f"\tinteger, parameter :: total_elems = {total_elems} ! Storing the actual number of elements")
    USERINPUTS.append(f"\tinteger, parameter :: max_elem_idx = {total_elems * 2} ! Maximum element index for UEL and VISUAL elements")
    USERINPUTS.append(f"\tinteger, parameter :: total_nodes = {total_nodes} ! Storing the actual number of nodes")
    USERINPUTS.append(f"\tinteger, parameter :: nstatev = {nstatev} ! Number of state variables at integration points")
    USERINPUTS.append("")

    nmax_elems = 20
    ndim = 3
    ninpt = 8
    nnode = 8
    ntensor = 6
    ndirect = 3
    nshear = 3

    USERINPUTS.append("\t! Element information")
    USERINPUTS.append(f"\tcharacter(len=256), parameter :: element_file_path = \"{element_file_path}\" ! Path to the element file")
    USERINPUTS.append(f"\tcharacter(len=256), parameter :: element_name = 'C3D8' ! Element type")
    USERINPUTS.append(f"\tinteger, parameter :: nmax_elems = {nmax_elems} ! Maximum number of elements a node can belong to")
    USERINPUTS.append(f"\tinteger, parameter :: ndim = {ndim} ! Number of spatial dimensions")
    USERINPUTS.append(f"\tinteger, parameter :: ninpt = {ninpt} ! Number of integration points in the element")
    USERINPUTS.append(f"\tinteger, parameter :: nnode = {nnode} ! Number of nodes in the element")
    
    USERINPUTS.append(f"\tinteger, parameter :: ntensor = {ntensor} ! Number of Voigt notation stress/strain components")
    USERINPUTS.append(f"\tinteger, parameter :: ndirect = {ndirect} ! Number of direct stress/strain components")
    USERINPUTS.append(f"\tinteger, parameter :: nshear = {nshear} ! Number of shear stress/strain components")
    USERINPUTS.append("")

    USERINPUTS.append("\t! ========================================= ")
    USERINPUTS.append("\t! Start and end indices of each field props ")
    USERINPUTS.append("\t! ========================================= ")

    USERINPUTS.append("")
    USERINPUTS.append(f"\tinteger, parameter :: start_field_flag_idx = {props_indices['start_field_flag_idx']}     ! Index of the first field flag in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: end_field_flag_idx = {props_indices['end_field_flag_idx']}       ! Index of the last field flag in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: start_mech_props_idx = {props_indices['start_mech_props_idx']}     ! Index of the first mechanical property in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: end_mech_props_idx = {props_indices['end_mech_props_idx']}      ! Index of the last mechanical property in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: start_flow_props_idx = {props_indices['start_flow_props_idx']}    ! Index of the first flow curve data in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: end_flow_props_idx = {props_indices['end_flow_props_idx']}     ! Index of the last flow curve data in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: start_CL_mol_props_idx = {props_indices['start_CL_mol_props_idx']}   ! Index of the first hydrogen diffusion in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: end_CL_mol_props_idx = {props_indices['end_CL_mol_props_idx']}     ! Index of the last hydrogen diffusion in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: start_temp_props_idx = {props_indices['start_temp_props_idx']}   ! Index of the first temperature data in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: end_temp_props_idx = {props_indices['end_temp_props_idx']}     ! Index of the last temperature data in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: start_damage_props_idx = {props_indices['start_damage_props_idx']} ! Index of the first damage property in UEL props")
    USERINPUTS.append(f"\tinteger, parameter :: end_damage_props_idx = {props_indices['end_damage_props_idx']}   ! Index of the last damage property in UEL props")

    USERINPUTS.append("")

    SDV_chosen_indices = [index+1 for index, chosen_flag in enumerate(SDV_chosen_index_flags) if str(chosen_flag) == "1"]
    nuvarm = len(SDV_chosen_indices)
    num_uvar_indices_per_line = 10

    USERINPUTS.append("\t! Output SDVs indices")
    USERINPUTS.append(f"\tinteger, parameter :: nuvarm = {nuvarm} ! Number of chosen SDVs for output")
    
    line_start = f"\tinteger, parameter :: uvarm_indices({len(SDV_chosen_indices)}) = ["
    line = line_start
    count = 0

    for index, SDV_index in enumerate(SDV_chosen_indices):
        if count > 0:
            line += ", "
        
        line += str(SDV_index) # Fortran counts from 1
        count += 1

        # Every num_uvar_indices_per_line items or last item
        is_last = (index == len(SDV_chosen_indices) - 1)
        if count == num_uvar_indices_per_line or is_last:
            if not is_last:
                line += ", &"
            else:
                line += "]"
            USERINPUTS.append(line)
            # Start new line
            if not is_last:
                line = f"\t\t\t\t\t\t\t\t\t\t\t   "
                count = 0

    USERINPUTS.append("")

    grad_SDV_indices = [index+1 for index, chosen_flag in enumerate(grad_SDV_flags) if str(chosen_flag) == "1"]

    USERINPUTS.append("\t! SDV required for gradient calculation")
    USERINPUTS.append(f"\tinteger, parameter :: num_grad_SDVs = {len(grad_SDV_indices)} ! Number of SDVs required for gradient calculation")
    USERINPUTS.append(f"\tinteger, parameter :: grad_SDV_indices({len(grad_SDV_indices)}) = [{", ".join([str(index) for index in grad_SDV_indices])}]")

    USERINPUTS.append("")
    
    starting_individual_statev = 24
    count_index = starting_individual_statev

    SDV_indices = list(range(1, nstatev + 1))
    zipped = list(zip(SDV_indices, SDV_names, SDV_field_names, SDV_descriptions))

    USERINPUTS.append("\t! ===============================")
    USERINPUTS.append("\t! SDV indices of mechanical field")
    USERINPUTS.append("\t! ===============================")

    USERINPUTS.append("")
    USERINPUTS.append(f"\tinteger, parameter :: sig_start_idx = 1 ! Starting index of the stress component")
    USERINPUTS.append(f"\tinteger, parameter :: sig_end_idx = 6 ! Ending index of the stress component")
    USERINPUTS.append(f"\tinteger, parameter :: stran_start_idx = 7 ! Starting index of the total strain component")
    USERINPUTS.append(f"\tinteger, parameter :: stran_end_idx = 12 ! Ending index of the total strain component")
    USERINPUTS.append(f"\tinteger, parameter :: eelas_start_idx = 13 ! Starting index of the elastic strain component")
    USERINPUTS.append(f"\tinteger, parameter :: eelas_end_idx = 18 ! Ending index of the elastic strain component")
    USERINPUTS.append(f"\tinteger, parameter :: eplas_start_idx = 19 ! Starting index of the plastic strain component")
    USERINPUTS.append(f"\tinteger, parameter :: eplas_end_idx = 24 ! Ending index of the plastic strain component")

    starting_individual_statev = 25
    sdv_data = [(idx, name, desc) for idx, name, field, desc in zipped if field == "mechanical" and idx >= starting_individual_statev]
    sdv_data.sort()

    for idx, name, desc in sdv_data:
        USERINPUTS.append(f"\tinteger, parameter :: {name}_idx = {idx} ! SDV index of {desc}")

    USERINPUTS.append("")

    USERINPUTS.append("\t! =======================================")
    USERINPUTS.append("\t! SDV indices of hydrogen diffusion field")
    USERINPUTS.append("\t! =======================================")

    USERINPUTS.append("")

    sdv_data = [(idx, name, desc) for idx, name, field, desc in zipped if field == "hydrogen_diffusion"]
    sdv_data.sort()

    for idx, name, desc in sdv_data:
        USERINPUTS.append(f"\tinteger, parameter :: {name}_idx = {idx} ! SDV index of {desc}")

    USERINPUTS.append("")
    
    USERINPUTS.append("\t! ==================================")
    USERINPUTS.append("\t! SDV indices of heat transfer field")
    USERINPUTS.append("\t! ==================================")

    USERINPUTS.append("")

    sdv_data = [(idx, name, desc) for idx, name, field, desc in zipped if field == "heat_transfer"]
    sdv_data.sort()

    for idx, name, desc in sdv_data:
        USERINPUTS.append(f"\tinteger, parameter :: {name}_idx = {idx} ! SDV index of {desc}")

    USERINPUTS.append("")

    USERINPUTS.append("\t! =================================")
    USERINPUTS.append("\t! SDV indices of phase field damage")
    USERINPUTS.append("\t! =================================")

    USERINPUTS.append("")

    sdv_data = [(idx, name, desc) for idx, name, field, desc in zipped if field == "damage"]
    sdv_data.sort()

    for idx, name, desc in sdv_data:
        USERINPUTS.append(f"\tinteger, parameter :: {name}_idx = {idx} ! SDV index of {desc}")

    USERINPUTS.append("")

    if mp_mode == "threads":
        mp_mode_flag = "1"
    elif mp_mode == "mpi":
        mp_mode_flag = "2"
    elif mp_mode == "hybrid":
        mp_mode_flag = "3"

    USERINPUTS.append("\t! =============================")
    USERINPUTS.append("\t! Parallelization mode settings ")
    USERINPUTS.append("\t! =============================")

    USERINPUTS.append("")
    
    USERINPUTS.append("\tinteger, parameter :: mp_mode = 1 ! 1 for threads, 2 for mpi, 3 for hybrid")
    USERINPUTS.append(f"\tsave")
    USERINPUTS.append("end module")

    return USERINPUTS

def return_field_output(field_output_path_excel):

    field_output_df = pd.read_excel(field_output_path_excel, dtype=str)
    node_output = field_output_df["node_output"]
    element_output = field_output_df["element_output"]
        
    return node_output, element_output

def main():
    
    # Create the parser
    parser = argparse.ArgumentParser(description="Process UEL input file")
    # Add the --geometry flag, expecting a string argument
    parser.add_argument('--input', type=str, required=True, help='input file name')
    parser.add_argument('--process', type=str, required=True, help='processing input folder')
    
    # Parse the command-line arguments
    args = parser.parse_args()
    # Access the geometry argument
    inp_file_name = args.input
    processing_input_path = args.process
    # subroutine_file_name = args.subroutine

    output_simulation_path = os.getcwd()
    combined_original_inp_path = os.path.join(os.getcwd(), f"{inp_file_name}.inp")
    combined_UEL_inp_path = os.path.join(os.getcwd(), f"{inp_file_name}_UEL.inp")

    # Read the original file content
    with open(combined_original_inp_path, 'r') as fid:
        flines = fid.readlines()  # Read file as a list of lines
    flines = [line.strip() for line in flines]  # Remove trailing and newline symbols

    ######################################
    # STEP 0: Deleting lck file          #
    #  and copy environment file         #
    # abaqus_v6.env into the main folder #
    ######################################

    # Delete all files ending in .lck in output_simulation_path
    for file in os.listdir(output_simulation_path):
        if file.endswith(".lck"):
            os.remove(os.path.join(output_simulation_path, file))

    # Copy abaqus_v6.env into the main folder
    shutil.copyfile(f"{processing_input_path}/abaqus_v6.env", f"{output_simulation_path}/abaqus_v6.env")

    ###################################
    # STEP 1: Adding unit description #
    ###################################

    # Write this to the start of the input file

    unit_convention = [
        "**************** UNITS: SI ****************",
        "**",
        "** Length: m",
        "** Time: s",
        "** Force: N",
        "** Stress: Pa",
        "** Mass: kg = (N*s^2)/m",
        "** Density: kg/m^3",
        "** Temperature: K",
        "** Energy: J (or N*m)",
        "** Amount of substance: mol",
        "** Concentration: mol/m^3",
        "**",
        "************************************************"
    ]

    # Insert unit convention at the beginning
    flines = unit_convention + flines  # Add newline for spacing

    ######################################
    # STEP 2: Extracting all information #
    ######################################

    properties_path_excel = f"{processing_input_path}/properties.xlsx"
    flow_curve_excel_path = f"{processing_input_path}/flow_curve.xlsx"
    depvar_excel_path = f"{processing_input_path}/depvar.xlsx"

    description_properties_dict = return_description_properties(properties_path_excel, flow_curve_excel_path)
    UEL_PROPERTY, total_num_properties, props_indices = return_UEL_property(description_properties_dict)
    DEPVAR, nstatev, SDV_names, SDV_field_names, SDV_chosen_index_flags, SDV_descriptions, grad_SDV_flags = return_depvar(depvar_excel_path)
    USER_ELEMENT = return_user_element(total_num_properties, nstatev)

    #########################################
    # STEP 3: Extracting the nodes.inc file #
    #########################################

    node_coordinates, total_nodes, start_node_idx, end_node_idx = extracting_nodes_coordinates(flines)

    with open(f"{processing_input_path}/nodes.inc", 'w') as fid:
        for line_idx in range(len(node_coordinates) - 1):
            fid.write(node_coordinates[line_idx] + "\n")
        fid.write(node_coordinates[-1])

    # Now, we remove everything between start_node_idx and end_node_idx, and insert
    include_nodes = [
        "**",
        f"*INCLUDE, INPUT=\"{processing_input_path}/nodes.inc\"",
        "**",
    ]

    flines = flines[:start_node_idx] + include_nodes + flines[end_node_idx:]

    ########################################################
    # STEP 4: Extracting the mesh connectivity             #
    #         and adding UEL element type and UEL property #
    ########################################################

    original_mesh, total_elems, start_element_idx, end_element_idx =\
        constructing_mesh(flines)

    # Now we create two mesh version, one for UEL and one for visualization
    original_mesh_UEL = copy.deepcopy(original_mesh)
    original_mesh_VISUAL = copy.deepcopy(original_mesh)

    # Now we change the first line of the UEL mesh and visualization mesh
    original_mesh_UEL[0] ="*ELEMENT, TYPE=U1, ELSET=SOLID"
    original_mesh_VISUAL[0] ="*ELEMENT, TYPE=C3D8, ELSET=VISUAL"

    # Offset element IDs in VISUAL mesh (skip the header line at index 0)
    for i in range(1, len(original_mesh_VISUAL)):
        line = original_mesh_VISUAL[i].strip()
        if not line:  # skip empty lines just in case
            continue

        parts = line.split(',')
        elem_id = int(parts[0])
        new_elem_id = elem_id + total_elems
        parts[0] = str(new_elem_id)
        original_mesh_VISUAL[i] = ','.join(parts)


    # Write the original mesh. We must avoid empty line at the end
    with open(f"{processing_input_path}/elements_UEL.inc", 'w') as fid:
        for line_idx in range(len(original_mesh_UEL) - 1):
            fid.write(original_mesh_UEL[line_idx] + "\n")
        fid.write(original_mesh_UEL[-1])

    with open(f"{processing_input_path}/elements_VISUAL.inc", 'w') as fid:
        for line_idx in range(len(original_mesh_VISUAL) - 1):
            fid.write(original_mesh_VISUAL[line_idx] + "\n")
        fid.write(original_mesh_VISUAL[-1])

    # Now, we remove everything between start_element_idx and end_element_idx, and insert
    include_UEL_elements = [
        "**",
        f"*INCLUDE, INPUT=\"{processing_input_path}/elements_UEL.inc\"",
        "**",
    ]

    include_VISUAL_elements = [
        "**",
        f"*INCLUDE, INPUT=\"{processing_input_path}/elements_VISUAL.inc\"",
        "**",
    ]
    
    
    flines = flines[:start_element_idx] + USER_ELEMENT + include_UEL_elements +\
                                          include_VISUAL_elements + UEL_PROPERTY +\
                                        flines[end_element_idx:]


    #############################################
    # STEP 5: Changing the elset name to VISUAL #
    #############################################

    # we should change this line
    # *Solid Section, elset=<whatever name>, material=<whatever name>
    # to *Solid Section, elset=VISUAL, material=<whatever name>

    solid_section_index = [i for i, line in enumerate(flines) if '*SOLID SECTION' in line.upper()][0]

    # find the index where the word material is found
    starting_index_string = flines[solid_section_index].find("material")
    # print("The starting index of the word material is: ", starting_index_string)
    flines[solid_section_index] = "*Solid Section, elset=VISUAL, " + flines[solid_section_index][starting_index_string:]

    ##############################################
    # STEP 6: Adding the *DEPVAR section         #
    ##############################################

    # find the index of the *Depvar section
    depvar_index = [i for i, line in enumerate(flines) if '*DEPVAR' in line.upper()][0]
    flines = flines[:depvar_index] + DEPVAR + flines[depvar_index+2:]

    # ###############################
    # # STEP 7: Adding the controls #
    # ###############################

    controls_path_excel = f"{processing_input_path}/controls.xlsx"
    CONTROLS = return_control_settings(controls_path_excel)
    # print("The CONTROLS are:\n", "\n".join(CONTROLS))

    # https://help.3ds.com/2024/english/dssimulia_established/simacaecaerefmap/simacae-t-simothergencontrols.htm?contextscope=all


    # We have to add it two lines after the line that starts with ** STEP for all STEP
    step_indices = [i + 3 for i, line in enumerate(flines) if line.upper().startswith("*STEP, NAME")]
    # add index zero to the list
    step_indices = [0] + step_indices + [len(flines)]

    flines_array = []
    for i in range(len(step_indices) - 2):
        index_before = step_indices[i]
        index_after = step_indices[i + 1]
        flines_array += flines[index_before:index_after] + CONTROLS
    flines_array += flines[step_indices[-2]:step_indices[-1]]
    
    flines = flines_array

    ################################
    # STEP 8: Replace field output #
    ################################
    
    field_output_path_excel = f"{processing_input_path}/field_output.xlsx"
    
    node_output, element_output = return_field_output(field_output_path_excel)

    # Find indices of all *Node Output and *Element Output lines
    node_indices = [i for i, line in enumerate(flines) if line.upper().startswith("*NODE OUTPUT")]
    element_indices = [i for i, line in enumerate(flines) if line.upper().startswith("*ELEMENT OUTPUT")]
    
    for index, (node_idx, elem_idx) in enumerate(zip(node_indices, element_indices)):
        # Replace the next line after *Node Output
        flines[node_idx + 1] = node_output[index]

        # Replace the next line after *Element Output
        flines[elem_idx + 1] = element_output[index]

    # Deletion step: remove lines where "none" appears in node_output or element_output
    lines_to_delete = set()  # Store indices to remove safely

    for index, (node_idx, elem_idx) in enumerate(zip(node_indices, element_indices)):
        if "none" in node_output[index].lower():
            lines_to_delete.update([node_idx, node_idx + 1])  # Delete *Node Output + the next line
        
        if "none" in element_output[index].lower():
            lines_to_delete.update([elem_idx, elem_idx + 1])  # Delete *Element Output + the next line

    # Convert set to sorted list in reverse order to prevent index shifting
    lines_to_delete = sorted(lines_to_delete, reverse=True)

    # Remove lines from the list safely
    for idx in lines_to_delete:
        del flines[idx]

    ##############################################
    # STEP 9: Saving the combined inp file       #
    ##############################################

    with open(combined_UEL_inp_path, 'w') as fid:
        for line in flines:
            fid.write(line + "\n")

    ##############################################
    # STEP 10: Modifying the userinputs.f90 file #
    ##############################################

    # Finally, we would write the fortran file userinputs.f90 to the source_code folder
    element_file_path = f"/{processing_input_path}/elements_UEL.inc"
    USERINPUTS = return_userinputs_fortran(total_elems, total_nodes, props_indices, SDV_names, nstatev, 
                            SDV_chosen_index_flags, SDV_field_names, SDV_descriptions, grad_SDV_flags, element_file_path)

    with open("source_code/userinputs.f90", 'w') as fid:
        for line in USERINPUTS:
            fid.write(line + "\n")

if __name__ == "__main__":
    main()
