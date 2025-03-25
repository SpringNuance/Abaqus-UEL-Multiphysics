! ========================================================
! BUILDING THE CONNECTIVITY MATRIX
! elems_to_nodes_matrix: (total_elems, nnode)
! nodes_to_elems_matrix: (total_nodes, nmax_elems, 2)
! ========================================================

! BEWARE: Make sure that the mesh txt file must not have any empty lines at the end

subroutine build_elems_to_nodes_matrix()
    use precision
    use common_block
    include 'aba_param.inc'    

    character(len=256) :: line, outdir, aelread, aelwrite, andread, andwrite, anelwrite
    integer, dimension(nnode + 1) :: values
    integer :: iostat, element_ID, node_id

    call getoutdir(outdir, lenoutdir)
    aelread = trim(outdir) // element_file_path

    open(unit=100, file=aelread, status="old", action="read")

    ! Read once to skip the first line in the elements.inc file
    read(100, '(A)', iostat=iostat) line

    ! Read the file line by line and populate the nodes_to_elems_matrix
    do line_idx = 1, total_elems

        read(100, '(A)', iostat=iostat) line

        ! Convert commas to spaces
        do i = 1, len(line)
            if (line(i:i) == ',') line(i:i) = ' '
        end do

        ! Convert the line into integers
        read(line, *) values  ! Read the 9 values (element ID and 8 nodes)

        ! values(1) is element ID of C3D8 element
        ! values(2:nnode+1) are the node ID of the C3D8 element

        ! Populate the elems_to_nodes_matrix

        do knode = 2, nnode + 1 ! Looping over the 8 nodes
            element_ID = values(1)
            node_ID = values(knode)
            elems_to_nodes_matrix(element_ID, knode-1) = node_ID
        end do
    end do

    ! Close the file
    close(100)

end


subroutine build_nodes_to_elems_matrix()
    use precision
    use common_block
    include 'aba_param.inc'

    character(len=256) :: line, outdir, aelread, aelwrite, andread, andwrite, anelwrite
    integer, dimension(nnode + 1) :: values
    integer :: iostat, element_ID, node_id

    call getoutdir(outdir, lenoutdir)

    aelread = trim(outdir) // element_file_path

    open(unit=100, file=aelread, status="old", action="read")

    ! Read once to skip the first line in the elements.inc file
    read(100, '(A)', iostat=iostat) line

    ! Initialize nodes_to_elems_matrix with 0 to indicate unused slots
    nodes_to_elems_matrix = 0
    num_elems_of_nodes_matrix = 0

    ! Read the file line by line and populate the nodes_to_elems_matrix
    do line_idx = 1, total_elems

        read(100, '(A)', iostat=iostat) line

        ! Convert commas to spaces
        do i = 1, len(line)
            if (line(i:i) == ',') line(i:i) = ' '
        end do

        ! Convert the line into integers
        read(line, *) values  ! Read the 9 values (element ID and 8 nodes)

        ! values(1) is element ID of C3D8 element
        ! values(2:nnode+1) are the node ID of the C3D8 element
        
        ! Populating the nodes_to_elems_matrix

        element_ID = values(1)
            
        ! Loop over each node in the current element
        do knode = 1, nnode  ! nnode is the number of nodes per element
            node_ID = elems_to_nodes_matrix(element_ID, knode)  ! Get the global node number

            num_elems_of_nodes_matrix(node_ID) = num_elems_of_nodes_matrix(node_ID) + 1
            kelem = num_elems_of_nodes_matrix(node_ID)  ! Get the current index for element containing this node

            ! Store the element ID and local node number in nodes_to_elems_matrix
            nodes_to_elems_matrix(node_ID, kelem, 1) = element_ID  ! Store the element ID
            nodes_to_elems_matrix(node_ID, kelem, 2) = knode  ! Store the local node number
        end do  ! End loop over nodes in the element

    end do

    ! Close the file
    close(100)

end