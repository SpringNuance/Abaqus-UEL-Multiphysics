import os 
import shutil 
import argparse
import numpy as np
import pandas as pd
import copy
import time

# Going to current directory
os.chdir(os.getcwd())


def return_description_properties(properties_path_excel,  fRD_path, fDD_path, fTD_path, fEB_path, rRD_path, rDD_path, rTD_path):
    description_properties_dict = {
        "mechanical_properties": {},
        "hydrogen_diffusion_properties": {},
        "flow_curve_properties": {},
    }

    # Loading the properties file
    # Cast to string to avoid issues with the mixed types in the excel file
    properties_df = pd.read_excel(properties_path_excel, dtype=str)

    mechanical_descriptions_list = properties_df["mechanical_descriptions"].dropna().tolist()
    mechanical_values_list = properties_df["mechanical_values"].dropna().tolist()

    hydrogen_diffusion_descriptions_list = properties_df["hydrogen_diffusion_descriptions"].dropna().tolist()
    hydrogen_diffusion_values_list = properties_df["hydrogen_diffusion_values"].dropna().tolist()


    # Loading the flow curve files
    # Cast to string to avoid issues with the mixed types in the excel file

    RD_stress_df = pd.read_excel(fRD_path, dtype=str)
    DD_stress_df = pd.read_excel(fDD_path, dtype=str)
    TD_stress_df = pd.read_excel(fTD_path, dtype=str)
    EB_stress_df = pd.read_excel(fEB_path, dtype=str)
    RD_rvalue_df = pd.read_excel(rRD_path, dtype=str)
    DD_rvalue_df = pd.read_excel(rDD_path, dtype=str)
    TD_rvalue_df = pd.read_excel(rTD_path, dtype=str)

    # "strain/-" is shared across all files

    equivalent_plastic_strain = RD_stress_df["strain/-"].dropna().tolist()
    RD_equivalent_plastic_stress = RD_stress_df["stress/Pa"].dropna().tolist()
    DD_equivalent_plastic_stress = DD_stress_df["stress/Pa"].dropna().tolist()
    TD_equivalent_plastic_stress = TD_stress_df["stress/Pa"].dropna().tolist()
    EB_equivalent_plastic_stress = EB_stress_df["stress/Pa"].dropna().tolist()
    RD_rvalue = RD_rvalue_df["rvalue/-"].dropna().tolist()
    DD_rvalue = DD_rvalue_df["rvalue/-"].dropna().tolist()
    TD_rvalue = TD_rvalue_df["rvalue/-"].dropna().tolist()

    ### Now we add the values to the dictionary

    description_properties_dict["mechanical_properties"] = dict(zip(mechanical_descriptions_list, mechanical_values_list))
    description_properties_dict["hydrogen_diffusion_properties"] = dict(zip(hydrogen_diffusion_descriptions_list, hydrogen_diffusion_values_list))
    
    description_properties_dict["flow_curve_properties"]["equivalent_plastic_strain"] = equivalent_plastic_strain
    description_properties_dict["flow_curve_properties"]["RD_equivalent_plastic_stress"] = RD_equivalent_plastic_stress
    description_properties_dict["flow_curve_properties"]["DD_equivalent_plastic_stress"] = DD_equivalent_plastic_stress
    description_properties_dict["flow_curve_properties"]["TD_equivalent_plastic_stress"] = TD_equivalent_plastic_stress
    description_properties_dict["flow_curve_properties"]["EB_equivalent_plastic_stress"] = EB_equivalent_plastic_stress
    description_properties_dict["flow_curve_properties"]["RD_rvalue"] = RD_rvalue
    description_properties_dict["flow_curve_properties"]["DD_rvalue"] = DD_rvalue
    description_properties_dict["flow_curve_properties"]["TD_rvalue"] = TD_rvalue

    return description_properties_dict


def return_UMAT_property(description_properties_dict): 
    mechanical_properties_list = list(description_properties_dict["mechanical_properties"].values())
    mechanical_description_list = list(description_properties_dict["mechanical_properties"].keys())
    
    flow_curve_true_strain = description_properties_dict["flow_curve_properties"]["equivalent_plastic_strain"]
    
    flow_curve_RD_stress = description_properties_dict["flow_curve_properties"]["RD_equivalent_plastic_stress"]
    flow_curve_DD_stress = description_properties_dict["flow_curve_properties"]["DD_equivalent_plastic_stress"]
    flow_curve_TD_stress = description_properties_dict["flow_curve_properties"]["TD_equivalent_plastic_stress"]
    flow_curve_EB_stress = description_properties_dict["flow_curve_properties"]["EB_equivalent_plastic_stress"]
    
    flow_curve_RD_rvalue = description_properties_dict["flow_curve_properties"]["RD_rvalue"]
    flow_curve_DD_rvalue = description_properties_dict["flow_curve_properties"]["DD_rvalue"]
    flow_curve_TD_rvalue = description_properties_dict["flow_curve_properties"]["TD_rvalue"]
    
    zipped = zip(flow_curve_true_strain, flow_curve_RD_stress, flow_curve_DD_stress, flow_curve_TD_stress, flow_curve_EB_stress, flow_curve_RD_rvalue, flow_curve_DD_rvalue, flow_curve_TD_rvalue)
    
    flow_curve_zipped = []
    for strain, RDstress, DDstress, TDstress, EBstress, RDrvalue, DDrvalue, TDrvalue in zipped:
        flow_curve_zipped.append(strain)
        
        flow_curve_zipped.append(RDstress)
        flow_curve_zipped.append(DDstress)
        flow_curve_zipped.append(TDstress)
        flow_curve_zipped.append(EBstress)
        
        flow_curve_zipped.append(RDrvalue)
        flow_curve_zipped.append(DDrvalue)
        flow_curve_zipped.append(TDrvalue)
    

    # Abaqus needs to define 8 properties each line
    mech_prop_num_lines = int(np.ceil(len(mechanical_properties_list)/8))
    mech_prop_num_properties = int(mech_prop_num_lines*8)
    flow_curve_num_lines = int(np.ceil(len(flow_curve_zipped)/8))
    flow_curve_num_properties = int(flow_curve_num_lines*8)

    total_UMAT_num_properties = mech_prop_num_properties + flow_curve_num_properties

    UMAT_property = []
    
    # The last line would be padded with 0.0 and their corresponding description would be "none"
    # If the number of properties is not a multiple of 8

    # For mechanical properties
    UMAT_property.append("**")
    UMAT_property.append("** =====================")
    UMAT_property.append("**")
    UMAT_property.append("** MECHANICAL PROPERTIES")
    UMAT_property.append("**")
    
    for line_index in range(mech_prop_num_lines):
        if line_index != mech_prop_num_lines - 1:
            subset_properties = mechanical_properties_list[line_index*8:(line_index+1)*8]
            subset_description = mechanical_description_list[line_index*8:(line_index+1)*8]
            UMAT_property.append(", ".join(subset_properties))
            UMAT_property.append("** " + ", ".join(subset_description[0:4]))
            UMAT_property.append("** " + ", ".join(subset_description[4:8]))
        else:
            subset_properties = mechanical_properties_list[line_index*8:] + ["0.0"]*(8-len(mechanical_properties_list[line_index*8:]))
            subset_description = mechanical_description_list[line_index*8:] + ["none"]*(8-len(mechanical_description_list[line_index*8:]))
            UMAT_property.append(", ".join(subset_properties))
            UMAT_property.append("** " + ", ".join(subset_description[0:4]))
            UMAT_property.append("** " + ", ".join(subset_description[4:8]))
    
    # For flow curve properties
    # Important: DO NOT PAD THIS TIME FOR FLOW CURVE
    UMAT_property.append("**")
    UMAT_property.append("** =====================")
    UMAT_property.append("**")
    UMAT_property.append("** FLOW CURVE PROPERTIES")
    UMAT_property.append("**")
    
    UMAT_property.append("** eqplas, flow RD, flow DD, flow TD, flow EB, rvalue RD, rvalue DD, rvalue TD")
    for line_index in range(flow_curve_num_lines):
        if line_index != flow_curve_num_lines - 1:
            str_values = [str(value) for value in flow_curve_zipped[line_index*8:(line_index+1)*8]]
            UMAT_property.append(", ".join(str_values))
        else:
            str_values = [str(value) for value in flow_curve_zipped[line_index*8:]]
            UMAT_property.append(", ".join(str_values))
    
    UMAT_property.append("**")
    UMAT_property.append("*******************************************************")

    return UMAT_property, total_UMAT_num_properties


def return_UMATHT_property(description_properties_dict): 

    hydrogen_diffusion_properties_list = list(description_properties_dict["hydrogen_diffusion_properties"].values())
    hydrogen_diffusion_description_list = list(description_properties_dict["hydrogen_diffusion_properties"].keys())

    # Abaqus needs to define 8 properties each line
    hydrogen_diffusion_prop_num_lines = int(np.ceil(len(hydrogen_diffusion_properties_list)/8))
    hydrogen_diffusion_prop_num_properties = int(hydrogen_diffusion_prop_num_lines*8)

    total_UMATHT_num_properties = hydrogen_diffusion_prop_num_properties 
    
    UMATHT_property = []
    
    # The last line would be padded with 0.0 and their corresponding description would be "none"
    # If the number of properties is not a multiple of 8

    # For hydrogen diffusion properties
    UMATHT_property.append("**")
    UMATHT_property.append("** =============================")
    UMATHT_property.append("**")
    UMATHT_property.append("** HYDROGEN DIFFUSION PROPERTIES")
    UMATHT_property.append("**")

    for line_index in range(hydrogen_diffusion_prop_num_lines):
        if line_index != hydrogen_diffusion_prop_num_lines - 1:
            subset_properties = hydrogen_diffusion_properties_list[line_index*8:(line_index+1)*8]
            subset_description = hydrogen_diffusion_description_list[line_index*8:(line_index+1)*8]
            UMATHT_property.append(", ".join(subset_properties))
            UMATHT_property.append("** " + ", ".join(subset_description[0:4]))
            UMATHT_property.append("** " + ", ".join(subset_description[4:8]))
        else:
            subset_properties = hydrogen_diffusion_properties_list[line_index*8:] + ["0.0"]*(8-len(hydrogen_diffusion_properties_list[line_index*8:]))
            subset_description = hydrogen_diffusion_description_list[line_index*8:] + ["none"]*(8-len(hydrogen_diffusion_description_list[line_index*8:]))
            UMATHT_property.append(", ".join(subset_properties))
            UMATHT_property.append("** " + ", ".join(subset_description[0:4]))
            UMATHT_property.append("** " + ", ".join(subset_description[4:8]))

    UMATHT_property.append("**")
    UMATHT_property.append("*******************************************************")

    return UMATHT_property, total_UMATHT_num_properties


def return_depvar(depvar_excel_path):

    depvar_df = pd.read_excel(depvar_excel_path, dtype=str)
    nstatev = len(depvar_df)
    #print("The number of state variables is: ", nstatev)

    DEPVAR = [
        "*Depvar       ",
        f"  {nstatev},      ",  
    ]

    depvar_index = depvar_df["depvar_index"].tolist()
    depvar_name = depvar_df["depvar_name"].tolist()
    # print("The depvar names are: ", depvar_name)
    # time.sleep(180)
    output_UVARM = [int(flag) for flag in depvar_df["output_UVARM"].tolist()]

    for i in range(1, nstatev + 1):
        index = depvar_index[i-1]
        name = depvar_name[i-1]
        DEPVAR.append(f"{index}, AR{index}_{name}, AR{index}_{name}")

    # Output UVARM is only a list of binary. Number 0 means this SDV will not be output
    # and number 1 means this SDV will be output
    # We must use UVARM because if we output all SDV, the odb file would be very heavy
    # Since fortran counts from 1, we must add 1 to the index
    
    chosen_output_UVARM = [i + 1 for i, flag in enumerate(output_UVARM) if flag == 1]
    nvars = sum(output_UVARM)
    
    return DEPVAR, depvar_name, nstatev, nvars, chosen_output_UVARM

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

    # print("The CONTROLS are:\n", "\n".join(CONTROLS))
    # time.sleep(180)
    return CONTROLS


def return_userinputs_fortran(DEPVAR, depvar_name, total_elems, total_nodes, 
                            nvars, chosen_output_UVARM, element_file_path, element_name):

    element_information = {
        "C3D8": {
            "ndim": 3, "ninpt": 8, "nnode": 8, "ntensor": 6, "nmax_elems": 20  # Linear 3D hexahedral, full integration
        },
        "C3D8R": {
            "ndim": 3, "ninpt": 1, "nnode": 8, "ntensor": 6, "nmax_elems": 20  # Linear 3D hexahedral, reduced integration
        },
        "CPE4": {
            "ndim": 2, "ninpt": 4, "nnode": 4, "ntensor": 4, "nmax_elems": 10  # Linear 2D quadrilateral, full integration
        },
        "CPE4R": {
            "ndim": 2, "ninpt": 1, "nnode": 4, "ntensor": 4, "nmax_elems": 10  # Linear 2D quadrilateral, reduced integration
        },
    }

    USERINPUTS = []
    USERINPUTS.append("!***********************************************************************")
    USERINPUTS.append("")
    USERINPUTS.append("\t! State variables  ")

    starting_individual_statev = 0

    for depvar in DEPVAR[starting_individual_statev:]:
        USERINPUTS.append(f"\t! {depvar}")
    USERINPUTS.append("")

    USERINPUTS.append("module userinputs")
    USERINPUTS.append("\tuse precision")
    USERINPUTS.append("\timplicit none")

    USERINPUTS.append("\t! THESE TWO VALUES ARE HARD-CODED")
    USERINPUTS.append("\t! YOU MUST CHANGE IT TO THE ACTUAL NUMBER OF ELEMENTS AND NODES IN .INP FILE")
    USERINPUTS.append("\t! YOU CAN USE PYTHON SCRIPTING TO CHANGE VALUES AS WELL")
    USERINPUTS.append("")
    USERINPUTS.append(f"\tinteger, parameter :: total_elems = {total_elems} ! Storing the actual number of elements")
    USERINPUTS.append(f"\tinteger, parameter :: total_nodes = {total_nodes} ! Storing the actual number of nodes")
    USERINPUTS.append("")
    USERINPUTS.append("\t! Subset of SDVs indices that you want to output ")
    USERINPUTS.append(f"\tinteger, parameter :: uvar_indices({nvars}) = (/{', '.join([str(i) for i in chosen_output_UVARM])}/)")
    USERINPUTS.append("")
    USERINPUTS.append("\t! Index of statev in UMAT and UMATHT")

    count_index = starting_individual_statev
    # print("The depvar name is: ", depvar_name)
    # time.sleep(180)
    for name in depvar_name[starting_individual_statev:]:
        count_index += 1  # fortran counts from 0
        USERINPUTS.append(f"\tinteger, parameter :: {name}_idx = {count_index} ! Index of the {name} in statev")
          
    USERINPUTS.append("")
    USERINPUTS.append("\t! Path to the element file")
    USERINPUTS.append(f"\tcharacter(len=256), parameter :: element_file_path = \"{element_file_path}\"")
    USERINPUTS.append("")
    USERINPUTS.append("\tinteger, parameter :: before_flow_props_idx = 8 ! Index of the first flow curve data in props in UMAT")
    USERINPUTS.append("")

    element_info = element_information[element_name]
    ndim = element_info["ndim"]
    ninpt = element_info["ninpt"]
    nnode = element_info["nnode"]
    ntensor = element_info["ntensor"]
    nmax_elems = element_info["nmax_elems"]

    ndim = element_info["ndim"]
    ninpt = element_info["ninpt"]
    nnode = element_info["nnode"]
    ntensor = element_info["ntensor"]
    nmax_elems = element_info["nmax_elems"]

    USERINPUTS.append("\t! Element information")
    USERINPUTS.append(f"\tcharacter(len=256), parameter :: element_name = \"{element_name}\" ! Element type")
    USERINPUTS.append(f"\tinteger, parameter :: ndim = {ndim} ! Number of spatial dimensions")
    USERINPUTS.append(f"\tinteger, parameter :: ninpt = {ninpt} ! Number of integration points in the element")
    USERINPUTS.append(f"\tinteger, parameter :: nnode = {nnode} ! Number of nodes in the element")
    USERINPUTS.append(f"\tinteger, parameter :: ntensor = {ntensor} ! Number of Voigt notation stress/strain components")
    USERINPUTS.append(f"\tinteger, parameter :: nmax_elems = {nmax_elems} ! Maximum number of elements a node can belong to")
    USERINPUTS.append("")

    USERINPUTS.append("end module")

    return USERINPUTS

def return_field_output(field_output_path_excel):

    field_output_df = pd.read_excel(field_output_path_excel, dtype=str)
    node_output = field_output_df["node_output"]
    element_output = field_output_df["element_output"]
        
    return node_output, element_output

def main():
    
    # Create the parser
    parser = argparse.ArgumentParser(description="Process geometry flag.")
    # Add the --geometry flag, expecting a string argument
    parser.add_argument('--input', type=str, required=True, help='input file name')
    parser.add_argument('--path', type=str, required=False, help='processing input path')
    # Parse the command-line arguments
    args = parser.parse_args()
    # Access the geometry argument
    inp_file_name = args.input
    processing_input_path = args.path

    output_simulation_path = os.getcwd()
    combined_original_inp_path = os.path.join(os.getcwd(), f"{inp_file_name}.inp")
    processed_inp_path = os.path.join(os.getcwd(), f"{inp_file_name}_processed.inp")

    ##############################
    # STEP 0: Deleting lck file  #
    ##############################

    # Delete all files ending in .lck in output_simulation_path
    for file in os.listdir(output_simulation_path):
        if file.endswith(".lck"):
            os.remove(os.path.join(output_simulation_path, file))

    #################################################
    # STEP 1: Modifying normal inp to processed inp #
    #################################################

    # Write this to the start of the input file

    unit_convention = [
        "**************** UNITS: SI (m) ****************",
        "**",
        "** Length: m",
        "** Time: s",
        "** Force: N",
        "** Stress: Pa",
        "** Mass: kg = (N*s^2)/m",
        "** Density: kg/m^3",
        "**",
        "************************************************"
    ]

    # Read the original file content
    with open(combined_original_inp_path, 'r') as fid:
        flines = fid.readlines()  # Read file as a list of lines
    flines = [line.strip() for line in flines]  # Remove trailing and newline symbols

    # Insert unit convention at the beginning
    flines = unit_convention + flines  # Add newline for spacing

    # time.sleep(180)

    #########################################
    # STEP 1: Extracting the nodes.inc file #
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

    ############################################
    # STEP 2: Extracting the mesh connectivity #
    ############################################

    original_mesh, total_elems, start_element_idx, end_element_idx =\
        constructing_mesh(flines)

    element_name = original_mesh[0].split("=")[1]

    if element_name[-1] == "T":
        element_name = element_name[:-1]

    # Write the original mesh. We must avoid empty line at the end
    with open(f"{processing_input_path}/elements.inc", 'w') as fid:
        for line_idx in range(len(original_mesh) - 1):
            fid.write(original_mesh[line_idx] + "\n")
        fid.write(original_mesh[-1])

    # Now, we remove everything between start_element_idx and end_element_idx, and insert
    include_elements = [
        "**",
        f"*INCLUDE, INPUT=\"{processing_input_path}/elements.inc\"",
        "**",
    ]
    
    flines = flines[:start_element_idx] +  include_elements + flines[end_element_idx:]

    #####################################################
    # STEP 3: Extracting the UMAT and UMATHT properties #
    #####################################################

    properties_path_excel   = f"{processing_input_path}/properties.xlsx"
    
    fRD_path                = f"{processing_input_path}/flow_curves/RD_flow.xlsx"
    fDD_path                = f"{processing_input_path}/flow_curves/DD_flow.xlsx"
    fTD_path                = f"{processing_input_path}/flow_curves/TD_flow.xlsx"
    fEB_path                = f"{processing_input_path}/flow_curves/EB_flow.xlsx"
    
    rRD_path                = f"{processing_input_path}/rvalue_curves/RD_rvalue.xlsx"
    rDD_path                = f"{processing_input_path}/rvalue_curves/DD_rvalue.xlsx"
    rTD_path                = f"{processing_input_path}/rvalue_curves/TD_rvalue.xlsx"

    description_properties_dict = return_description_properties(properties_path_excel, fRD_path, fDD_path, fTD_path, fEB_path, rRD_path, rDD_path, rTD_path)
    UMAT_PROPERTY, total_UMAT_num_properties = return_UMAT_property(description_properties_dict)
    UMATHT_PROPERTY, total_UMATHT_num_properties = return_UMATHT_property(description_properties_dict)
    
    # 1. Replace the UMAT properties

    # Replacing UMAT properties
    umat_index = [i for i, line in enumerate(flines) if '*USER MATERIAL' in line.upper() and 'MECHANICAL' in line.upper()][0]
    
    # Find where the current UMAT section ends (by finding the next line that starts with '*')
    next_star_line_umat = next(i for i in range(umat_index + 1, len(flines)) if flines[i].startswith('*'))
    
    # Replace the number of constants in the *User Material line
    flines[umat_index] = f"*User Material, constants={total_UMAT_num_properties}, type=MECHANICAL"
    
    # Replace the content under UMAT
    flines = flines[:umat_index + 1] + UMAT_PROPERTY + flines[next_star_line_umat:]

    # 2. Replace the UMATHT properties

    # Replacing UMATHT properties
    umatht_index = [i for i, line in enumerate(flines) if '*USER MATERIAL' in line.upper() and 'THERMAL' in line.upper()][0]
    
    # Find where the current UMATHT section ends (by finding the next line that starts with '*')
    next_star_line_umatht = next(i for i in range(umatht_index + 1, len(flines)) if flines[i].startswith('*'))
    
    # Replace the number of constants in the *User Material line
    flines[umatht_index] = f"*User Material, constants={total_UMATHT_num_properties}, type=THERMAL"
    
    # Replace the content under UMATHT
    flines = flines[:umatht_index + 1] + UMATHT_PROPERTY + flines[next_star_line_umatht:]

    # 3. We would also modify the *Depvar section to include the key descriptions
    
    #########################################
    # STEP 4: Extracting the DEPVAR section #
    #########################################

    # Replacing Depvar section

    # find the index of the *Depvar section
    depvar_index = [i for i, line in enumerate(flines) if '*DEPVAR' in line.upper()][0]
    
    depvar_excel_path = f"{processing_input_path}/depvar.xlsx"
    DEPVAR, depvar_name, nstatev, nvars, chosen_output_UVARM = return_depvar(depvar_excel_path)
    flines = flines[:depvar_index] + DEPVAR + flines[depvar_index+2:]
    

    # INITIAL_CONDITIONS = [
    #     "*Initial Conditions, Type=Solution"
    # ]
    # # We initialize all sdv as zeros
    # #print("The number of state variables is: ", nstatev)
    # if (nstatev < 8):
    #     INITIAL_CONDITIONS.append("whole_part, " + ", ".join(["0.0"]*nstatev))
    # else:
    #     INITIAL_CONDITIONS.append("whole_part, " + ", ".join(["0.0"]*7))
    #     for i in range(nstatev//8 - 1):
    #         INITIAL_CONDITIONS.append(", ".join(["0.0"]*8))
    #     INITIAL_CONDITIONS.append(", ".join(["0.0"]*(nstatev%8 + 1)))

    #print("The initial conditions are: ", INITIAL_CONDITIONS)

    # Now insert the initial conditions right under nvars
    # flines = flines[:output_var_index + 2] + INITIAL_CONDITIONS + flines[output_var_index + 2:]

    # ###############################
    # # STEP 5: Adding the controls #
    # ###############################

    controls_path_excel = f"{processing_input_path}/controls.xlsx"
    CONTROLS = return_control_settings(controls_path_excel)
    # print("The CONTROLS are:\n", "\n".join(CONTROLS))

    # https://help.3ds.com/2024/english/dssimulia_established/simacaecaerefmap/simacae-t-simothergencontrols.htm?contextscope=all


    # We have to add it two lines after the line that starts with ** STEP for all STEP
    step_indices = [i + 3 for i, line in enumerate(flines) if line.upper().startswith("*STEP, NAME")]
    # add index zero to the list
    step_indices = [0] + step_indices + [len(flines)]
    # print(step_indices[-2])
    # print(step_indices[-1])
    # print("The field variable indices are: ", step_indices)
    # time.sleep(180)

    flines_array = []
    for i in range(len(step_indices) - 2):
        index_before = step_indices[i]
        index_after = step_indices[i + 1]
        flines_array += flines[index_before:index_after] + CONTROLS
    flines_array += flines[step_indices[-2]:step_indices[-1]]
    
    flines = flines_array

    ################################
    # STEP 5: Replace field output #
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

    #########################################
    # STEP 6: Changing the output variables #
    #########################################

    # Replacing User Output Variables
    output_var_index = [i for i, line in enumerate(flines) if line.upper().startswith('*USER OUTPUT VARIABLES')][0]
    
    # The line below it is to be replaced
    flines[output_var_index + 1] = f"{nvars},"
    
    with open(processed_inp_path, 'w') as fid:
        for line in flines:
            fid.write(line + "\n")

    element_file_path = f"/{processing_input_path}/elements.inc"
    # Finally, we would write the fortran file userinputs.f90 to the source_code folder
    USERINPUTS = return_userinputs_fortran(DEPVAR, depvar_name, total_elems, total_nodes, 
                                            nvars, chosen_output_UVARM, element_file_path, element_name)

    with open("source_code/userinputs.f90", 'w') as fid:
        for line in USERINPUTS:
            fid.write(line + "\n")

if __name__ == "__main__":
    main()
