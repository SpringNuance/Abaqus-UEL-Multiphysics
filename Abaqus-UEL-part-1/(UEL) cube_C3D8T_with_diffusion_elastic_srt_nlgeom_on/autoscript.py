import os 
import shutil 
import argparse
import numpy as np
import pandas as pd
import copy

# Going to current directory
os.chdir(os.getcwd())

def return_description_properties(geometry_path_excel, flow_curve_excel_path):
    description_properties_dict = {
        "mechanical_properties": {},
        "hydrogen_diffusion_properties": {},
        "phase_field_damage_properties": {},
        "flow_curve_properties": {},
    }

    # Loading the properties file
    # Cast to string to avoid issues with the mixed types in the excel file
    properties_df = pd.read_excel(geometry_path_excel, dtype=str)

    mechanical_descriptions_list = properties_df["mechanical_descriptions"].dropna().tolist()
    mechanical_values_list = properties_df["mechanical_values"].dropna().tolist()

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

    description_properties_dict["mechanical_properties"] = dict(zip(mechanical_descriptions_list, mechanical_values_list))
    description_properties_dict["hydrogen_diffusion_properties"] = dict(zip(hydrogen_diffusion_descriptions_list, hydrogen_diffusion_values_list))
    description_properties_dict["phase_field_damage_properties"] = dict(zip(phase_field_damage_descriptions_list, phase_field_damage_values_list))
    description_properties_dict["flow_curve_properties"]["equivalent_plastic_strain"] = equivalent_plastic_strain
    description_properties_dict["flow_curve_properties"]["equivalent_plastic_stress"] = equivalent_plastic_stress

    return description_properties_dict



def return_UEL_property(description_properties_dict): 
    mechanical_properties_list = list(description_properties_dict["mechanical_properties"].values())
    mechanical_description_list = list(description_properties_dict["mechanical_properties"].keys())

    hydrogen_diffusion_properties_list = list(description_properties_dict["hydrogen_diffusion_properties"].values())
    hydrogen_diffusion_description_list = list(description_properties_dict["hydrogen_diffusion_properties"].keys())

    phase_field_properties_list = list(description_properties_dict["phase_field_damage_properties"].values())
    phase_field_description_list = list(description_properties_dict["phase_field_damage_properties"].keys())

    flow_curve_true_strain = description_properties_dict["flow_curve_properties"]["equivalent_plastic_strain"]
    flow_curve_true_stress = description_properties_dict["flow_curve_properties"]["equivalent_plastic_stress"]
    
    flow_curve_zipped = []
    for stress, strain in zip(flow_curve_true_stress, flow_curve_true_strain):
        flow_curve_zipped.append(stress)
        flow_curve_zipped.append(strain)
        
    # Abaqus needs to define 8 properties each line
    mech_prop_num_lines = int(np.ceil(len(mechanical_properties_list)/8))
    mech_prop_num_properties = int(mech_prop_num_lines*8)

    hydrogen_diffusion_prop_num_lines = int(np.ceil(len(hydrogen_diffusion_properties_list)/8))
    hydrogen_diffusion_prop_num_properties = int(hydrogen_diffusion_prop_num_lines*8)

    phase_field_prop_num_lines = int(np.ceil(len(phase_field_properties_list)/8))
    phase_field_prop_num_properties = int(phase_field_prop_num_lines*8)

    flow_curve_num_lines = int(np.ceil(len(flow_curve_zipped)/8))
    flow_curve_num_properties = int(flow_curve_num_lines*8)

    total_num_properties = mech_prop_num_properties + phase_field_prop_num_properties +\
                        hydrogen_diffusion_prop_num_properties + flow_curve_num_properties
                
    #total_num_properties = mech_prop_num_properties + flow_curve_num_properties + hydrogen_diffusion_prop_num_properties

    UEL_property = [
        "*******************************************************",
        "*UEL PROPERTY, ELSET=SOLID                             ",
    ]
    
    # The last line would be padded with 0.0 and their corresponding description would be "none"
    # If the number of properties is not a multiple of 8

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
            UEL_property.append(", ".join(subset_properties))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
        else:
            subset_properties = mechanical_properties_list[line_index*8:] + ["0.0"]*(8-len(mechanical_properties_list[line_index*8:]))
            subset_description = mechanical_description_list[line_index*8:] + ["none"]*(8-len(mechanical_description_list[line_index*8:]))
            UEL_property.append(", ".join(subset_properties))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))

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
            UEL_property.append(", ".join(subset_properties))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
        else:
            subset_properties = hydrogen_diffusion_properties_list[line_index*8:] + ["0.0"]*(8-len(hydrogen_diffusion_properties_list[line_index*8:]))
            subset_description = hydrogen_diffusion_description_list[line_index*8:] + ["none"]*(8-len(hydrogen_diffusion_description_list[line_index*8:]))
            UEL_property.append(", ".join(subset_properties))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))

    UEL_property.append("**")
    UEL_property.append("** ======================")
    # For phase field properties
    UEL_property.append("**")
    UEL_property.append("** PHASE FIELD PROPERTIES")
    UEL_property.append("**")
    for line_index in range(phase_field_prop_num_lines):
        if line_index != phase_field_prop_num_lines - 1:
            subset_properties = phase_field_properties_list[line_index*8:(line_index+1)*8]
            subset_description = phase_field_description_list[line_index*8:(line_index+1)*8]
            UEL_property.append(", ".join(subset_properties))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
        else:
            subset_properties = phase_field_properties_list[line_index*8:] + ["0.0"]*(8-len(phase_field_properties_list[line_index*8:]))
            subset_description = phase_field_description_list[line_index*8:] + ["none"]*(8-len(phase_field_description_list[line_index*8:]))
            UEL_property.append(", ".join(subset_properties))
            UEL_property.append("** " + ", ".join(subset_description[0:4]))
            UEL_property.append("** " + ", ".join(subset_description[4:8]))
            
    # For flow curve properties
    # Important: DO NOT PAD THIS TIME FOR FLOW CURVE
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
            str_values = [str(value) for value in flow_curve_zipped[line_index*8:]]
            UEL_property.append(", ".join(str_values))
    
    UEL_property.append("**")
    UEL_property.append("*******************************************************")

    return UEL_property, total_num_properties


def return_depvar(depvar_excel_path):

    depvar_df = pd.read_excel(depvar_excel_path, dtype=str)
    nstatev = depvar_df.shape[0]

    DEPVAR = [
        "*Depvar       ",
        f"  {nstatev},      ",  
    ]

    depvar_index = depvar_df["depvar_index"].tolist()
    depvar_name = depvar_df["depvar_name"].tolist()

    for i in range(1, nstatev + 1):
        index = depvar_index[i-1]
        name = depvar_name[i-1]
        DEPVAR.append(f"{index}, AR{index}_{name}, AR{index}_{name}")

    return DEPVAR, nstatev


def return_user_element(total_num_properties, ndim, nnodes, nsvars):
    USER_ELEMENT = [
        "*************************************************",
    f"*User element, nodes={nnodes}, type=U1, properties={total_num_properties}, coordinates={ndim}, variables={nsvars}",
        "1, 2, 3",
        "1, 11",
        # "1, 12",
        "*************************************************"
    ]
    return USER_ELEMENT

def constructing_visualization_mesh(input_file_path):
    """
    Visualization mesh is simply a copy of the original mesh
    Except that it has different element ID and a standard Abaqus element type
    in order to store values of the user element at integration points
    We cannot view the user element directly in Abaqus/Viewer since UEL subroutine
    only has knowledge to the stiffness matrix amatrx and residual right hand side rhs
    """

    # Open the file
    with open(input_file_path, 'r') as fid:
        flines = fid.readlines()

    # Process the lines
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
    num_elements = len(element_indices)
    #print("The number of elements is: ", num_elements)  

    # We would start to reconstruct an identical mesh, except that we replace node indices with new indices
    # New indices should start from a power of 10 that is at least greater than the number of elements
    # For example, if num_elements = 59, then the new indices should start from 101 to 159
    # If num_elements = 128, then the new indices should start from 1001 to 1128
    # If num_elements = 3456, then the new indices should start from 10001 to 13456

    # We would find the order of the number of elements
    order = int(np.floor(np.log10(num_elements)))
    offset = 10 * 10**order + 1

    new_element_indices = [i + offset for i in range(num_elements)]

    visualization_mesh = [
        "*ELEMENT, TYPE=C3D8, ELSET=VISUALIZATION",
    ]

    original_mesh = []
    for i in range(num_elements):
        reconstructed_line_visualization = ", ".join([str(value) for value in [new_element_indices[i]] + element_connvectivity[i]])
        reconstructed_line_original = " ".join([str(value) for value in [element_indices[i]] + element_connvectivity[i]])
        visualization_mesh.append(reconstructed_line_visualization)
        original_mesh.append(reconstructed_line_original)
    
    return visualization_mesh, original_mesh, num_elements, start_element_index, end_element_index
    

def create_filepath_module(filepath, num_elements, subroutine_file_name):

    filepath_module =\
f"""
module filepath
    character(len=256), parameter :: filename = "{filepath}/original_mesh.txt"
    integer, parameter :: nelem = {num_elements}
end module filepath
"""

    # Open the phase_field_3D.f90 file and append the filepath_module
    # right on the top of module precision line
    with open(f"{subroutine_file_name}.f90", 'r') as fid:
        flines = fid.readlines()
    
    # Fine the line starting with module precision
    precision_index = [i for i, line in enumerate(flines) if "module precision" in line.lower()][0]

    # Insert the filepath_module right above the module precision line
    flines_new = flines[:precision_index] + [filepath_module] + ["\n"] + flines[precision_index:]

    # Write the new file
    with open(f"{subroutine_file_name}_filepath.f90", 'w') as fid:
        for line in flines_new:
            fid.write(line)

def main():
    
    # Create the parser
    parser = argparse.ArgumentParser(description="Process geometry flag.")
    # Add the --geometry flag, expecting a string argument
    parser.add_argument('--input', type=str, required=True, help='input file name')
    parser.add_argument('--subroutine', type=str, required=True, help='subroutine file name')
    
    # Parse the command-line arguments
    args = parser.parse_args()
    # Access the geometry argument
    inp_file_name = args.input
    subroutine_file_name = args.subroutine

    output_simulation_path = os.getcwd()
    combined_original_inp_path = os.path.join(os.getcwd(), f"{inp_file_name}.inp")
    combined_UEL_inp_path = os.path.join(os.getcwd(), f"{inp_file_name}_UEL.inp")

    ########################################
    # STEP 0: Deleting previous sim files  #
    ########################################

    # Delete all files ending in .lck in output_simulation_path
    for file in os.listdir(output_simulation_path):
        if file.endswith(".lck"):
            os.remove(os.path.join(output_simulation_path, file))

    ###########################################
    # STEP 1: Modifying normal inp to UEL inp #
    ###########################################

    geometry_path_excel = f"properties.xlsx"
    flow_curve_excel_path = f"flow_curve.xlsx"
    depvar_excel_path = f"depvar.xlsx"

    description_properties_dict = return_description_properties(geometry_path_excel, flow_curve_excel_path)
    UEL_PROPERTY, total_num_properties = return_UEL_property(description_properties_dict)

    # The user element variables can be defined so as to order the degrees of freedom on the element 
    # in any arbitrary fashion. You specify a list of degrees of freedom for the first node on the element. 
    # All nodes with a nodal connectivity number that is less than the next connectivity number for which a 
    # list of degrees of freedom is specified will have the first list of degrees of freedom. The second list 
    # of degrees of freedom will be used for all nodes until a new list is defined, etc. If a new list of degrees 
    # of freedom is encountered with a nodal connectivity number that is less than or equal to that given with 
    # the previous list, the previous list's degrees of freedom will be assigned through the last node of 
    # the element. This generation of degrees of freedom can be stopped before the last node on the element 
    # by specifying a nodal connectivity number with an empty (blank) list of degrees of freedom.

    ndim = 3
    nnodes = 8
        
    DEPVAR, nstatev = return_depvar(depvar_excel_path)
    nsvars = nnodes * nstatev

    USER_ELEMENT = return_user_element(total_num_properties, ndim, nnodes, nsvars)

    VISUALIZATION_MESH, original_mesh, num_elements, start_element_index, end_element_index =\
        constructing_visualization_mesh(combined_original_inp_path)

    # Write the original mesh
    with open("original_mesh", 'w') as fid:
        for line in original_mesh:
            fid.write(line + "\n")

    # Create the subroutine file
    # create_filepath_module(os.getcwd(), num_elements, subroutine_file_name)

    # Open the file
    with open(combined_original_inp_path, 'r') as fid:
        flines = fid.readlines()

    # Process the lines
    flines = [line.strip() for line in flines]

    # Now, we would reconstruct the input file as follows

    # 1. Replace the original *ELEMENT section line with this line
    #    *Element, type=U1, elset=SOLID

    # 2. Add the USER ELEMENT section just above the *ELEMENT section in step 1

    # 3. Add the UEL property just below the element connectivity section of the original mesh *ELEMENT above

    # 4. Add the visualization mesh just below the USER ELEMENT section

    # 5. Finally, in **SECTION, we change to this 
    # ** Section: Section-1
    # *Solid Section, elset=VISUALIZATION, material=(whatever material you define here)

    # 6. We would also modify the *Depvar section to include the key descriptions

    # do step 1

    
    flines_new = copy.deepcopy(flines)
    flines_new[start_element_index] = "*ELEMENT, TYPE=U1, ELSET=SOLID"

    # do step 2 to 4

    flines_new = flines_new[:start_element_index] + USER_ELEMENT\
                + flines_new[start_element_index:end_element_index] + UEL_PROPERTY\
                + VISUALIZATION_MESH + flines_new[end_element_index:]

    # do step 5
    solid_section_index = [i for i, line in enumerate(flines_new) if '*SOLID SECTION' in line.upper()][0]

    # we should change this line
    # *Solid Section, elset=<whatever name>, material=<whatever name>
    # to *Solid Section, elset=VISUALIZATION, material=<whatever name>

    # find the index where the word material is found
    starting_index_string = flines_new[solid_section_index].find("material")
    # print("The starting index of the word material is: ", starting_index_string)
    flines_new[solid_section_index] = "*Solid Section, elset=VISUALIZATION, " + flines_new[solid_section_index][starting_index_string:]

    # do step 6

    # find the index of the *Depvar section
    depvar_index = [i for i, line in enumerate(flines_new) if '*DEPVAR' in line.upper()][0]
    flines_new = flines_new[:depvar_index] + DEPVAR + flines_new[depvar_index+2:]
    
    with open(combined_UEL_inp_path, 'w') as fid:
        for line in flines_new:
            fid.write(line + "\n")
    

if __name__ == "__main__":
    main()
