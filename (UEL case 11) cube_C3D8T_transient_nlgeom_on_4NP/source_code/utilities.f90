subroutine calc_matrix_log(matrix, log_matrix, ndim)
    use precision
    
    integer :: ndim
    real(kind=dp) :: matrix(ndim, ndim)
    real(kind=dp) :: log_matrix(ndim, ndim)
    real(kind=dp) :: eigen_vectors(ndim, ndim), eigen_values(ndim)
    real(kind=dp) :: temp_matrix(ndim, ndim)
    real(kind=dp) :: work(3*ndim-1)
    integer :: info, lwork, i, j

    ! 1. Perform eigenvalue decomposition using LAPACK
    ! Use dsyev for symmetric matrix eigenvalue decomposition (you can use dgeev for non-symmetric)

    ! Initialize log_matrix
    log_matrix = 0.0d0

    ! 1. Perform eigenvalue decomposition using LAPACK dsyev
    ! Copy matrix to eigen_vectors because dsyev will overwrite it
    eigen_vectors = matrix

    ! Call dsyev to compute the eigenvalues and eigenvectors
    call dsyev('V', 'U', ndim, eigen_vectors, ndim, eigen_values, work, size(work), info)

    if (info /= 0) then
        print *, 'Error: DSYEV failed with INFO = ', info
        return
    end if

    ! 2. Compute the logarithm of the eigenvalues
    do i = 1, ndim
        if (eigen_values(i) <= 0.0d0) then
            print *, 'Error: Eigenvalue less than or equal to zero, cannot compute log'
            return
        else
            eigen_values(i) = log(eigen_values(i))
        end if
    end do

    ! 3. Reconstruct the logarithm of the matrix using V * log(Λ) * V^T
    ! Construct the diagonal matrix from the log eigenvalues
    temp_matrix = 0.0d0
    do i = 1, ndim
        temp_matrix(i, i) = eigen_values(i)
    end do

    ! log_matrix = V * log(Λ) * V^T
    log_matrix = matmul(eigen_vectors, matmul(temp_matrix, transpose(eigen_vectors)))

return
end

subroutine calc_matrix_sqrt(matrix, matrix_sqrt, ndim)
    use precision
    integer :: ndim
    real(kind=dp) :: matrix(ndim, ndim)          ! Input matrix
    real(kind=dp) :: matrix_sqrt(ndim, ndim)     ! Output matrix square root
    real(kind=dp) :: eigen_vectors(ndim, ndim), eigen_values(ndim)
    real(kind=dp) :: temp_matrix(ndim, ndim)
    real(kind=dp) :: work(3*ndim-1)
    integer :: info, i, j

    ! Initialize matrix_sqrt to zero
    matrix_sqrt = 0.0d0

    ! Copy the input matrix to eigen_vectors because LAPACK routines will overwrite it
    eigen_vectors = matrix

    ! 1. Perform eigenvalue decomposition using LAPACK dsyev
    call dsyev('V', 'U', ndim, eigen_vectors, ndim, eigen_values, work, size(work), info)

    if (info /= 0) then
        print *, 'Error: DSYEV failed with INFO = ', info
        return
    end if

    ! 2. Take the square root of the eigenvalues
    do i = 1, ndim
        if (eigen_values(i) < 0.0d0) then
            print *, 'Error: Negative eigenvalue encountered, cannot compute square root'
            return
        else
            eigen_values(i) = sqrt(eigen_values(i))
        end if
    end do

    ! 3. Reconstruct the square root of the matrix using V * sqrt(Λ) * V^T
    ! Construct the diagonal matrix from the square root of the eigenvalues
    temp_matrix = 0.0d0
    do i = 1, ndim
        temp_matrix(i, i) = eigen_values(i)
    end do

    ! matrix_sqrt = V * sqrt(Λ) * V^T
    matrix_sqrt = matmul(eigen_vectors, matmul(temp_matrix, transpose(eigen_vectors)))

return
end


subroutine calc_matrix_inv(matrix, matrix_inv, ndim)
    use precision
    implicit none
    integer :: ndim
    real(kind=dp) :: matrix(ndim, ndim)         ! Input matrix
    real(kind=dp) :: matrix_inv(ndim, ndim)     ! Output inverse matrix
    real(kind=dp) :: work(3*ndim)               ! Workspace
    integer :: ipiv(ndim)                       ! Pivot indices for LU factorization
    integer :: info, lwork

    ! Copy the input matrix to matrix_inv because LAPACK routines will overwrite it
    matrix_inv = matrix

    ! 1. Perform LU factorization of the matrix using dgetrf
    call dgetrf(ndim, ndim, matrix_inv, ndim, ipiv, info)
    if (info /= 0) then
        print *, 'Error: DGETRF failed with INFO = ', info
        return
    end if

    ! 2. Use dgetri to compute the inverse of the matrix
    lwork = 3 * ndim
    call dgetri(ndim, matrix_inv, ndim, ipiv, work, lwork, info)
    if (info /= 0) then
        print *, 'Error: DGETRI failed with INFO = ', info
        return
    end if

return
end

subroutine test_matrix_subroutine()
    use precision
    integer :: i, j
    real(kind=dp) :: A(3,3), A_inv(3,3), A_log(3,3), A_sqrt(3,3)

    ! Initialize symmetric positive definite matrix
    A = reshape([ &
    4.0d0, 1.0d0, 1.0d0, &
    1.0d0, 3.0d0, 0.5d0, &
    1.0d0, 0.5d0, 2.0d0], [3,3])

    ! ========================
    ! 1. Test matrix inverse
    ! ========================
    call calc_matrix_inv(A, A_inv, 3)
    print *, "A_inv = "
    print *, A_inv

    ! ========================
    ! 2. Test matrix sqrt
    ! ========================
    call calc_matrix_sqrt(A, A_sqrt, 3)
    print *, "A_sqrt = "
    print *, A_sqrt

    ! ========================
    ! 3. Test matrix log
    ! ========================
    call calc_matrix_log(A, A_log, 3)
    print *, "A_log = "
    print *, A_log
return
end