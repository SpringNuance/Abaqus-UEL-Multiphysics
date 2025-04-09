subroutine pause(seconds)
    ! Pauses the program execution for the specified number of seconds.
    integer, intent(in) :: seconds
    integer :: start_time, end_time, rate

    ! Get the system clock rate (ticks per second)
    call system_clock(count_rate = rate)

    ! Get the current time in clock ticks
    call system_clock(start_time)

    ! Loop until the required time has passed
    do
        call system_clock(end_time)
        if ((end_time - start_time) >= seconds * rate) exit
    end do
end


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

subroutine calc_matrix_sym(matrix, matrix_sym, ndim)
    use precision
    integer :: ndim
    real(kind=dp), dimension(ndim, ndim) :: matrix, matrix_sym

    matrix_sym = 0.5d0 * (matrix + transpose(matrix))
end

subroutine calc_matrix_asym(matrix, matrix_asym, ndim)
    use precision
    integer :: ndim
    real(kind=dp), dimension(ndim, ndim) :: matrix, matrix_asym

    matrix_asym = 0.5d0 * (matrix - transpose(matrix))
end

subroutine stran_voigt_to_tensor(voigt, tensor, ntens, ndim)
    use precision
    integer :: ndim
    real(kind=dp), dimension(ndim, ndim) :: tensor
    real(kind=dp), dimension(ntens) :: voigt

    tensor(1,1) = voigt(1)
    tensor(2,2) = voigt(2)
    tensor(3,3) = voigt(3)
    tensor(1,2) = 0.5d0 * voigt(4)
    tensor(2,1) = 0.5d0 * voigt(4)
    tensor(1,3) = 0.5d0 * voigt(5)
    tensor(3,1) = 0.5d0 * voigt(5)
    tensor(2,3) = 0.5d0 * voigt(6)
    tensor(3,2) = 0.5d0 * voigt(6)
end

subroutine stran_tensor_to_voigt(voigt, tensor, ntens, ndim)
    use precision
    integer :: ndim
    real(kind=dp), dimension(ndim, ndim) :: tensor
    real(kind=dp), dimension(ntens) :: voigt

    voigt(1) = tensor(1,1)
    voigt(2) = tensor(2,2)
    voigt(3) = tensor(3,3)
    voigt(4) = 2.0d0 * tensor(1,2)
    voigt(5) = 2.0d0 * tensor(1,3)
    voigt(6) = 2.0d0 * tensor(2,3)
end

subroutine stress_voigt_to_tensor(voigt, tensor, ntens, ndim)
    use precision
    integer :: ndim
    real(kind=dp), dimension(ndim, ndim) :: tensor
    real(kind=dp), dimension(ntens) :: voigt

    tensor(1,1) = voigt(1)
    tensor(2,2) = voigt(2)
    tensor(3,3) = voigt(3)
    tensor(1,2) = voigt(4)
    tensor(2,1) = voigt(4)
    tensor(1,3) = voigt(5)
    tensor(3,1) = voigt(5)
    tensor(2,3) = voigt(6)
    tensor(3,2) = voigt(6)
end

subroutine stress_tensor_to_voigt(voigt, tensor, ntens, ndim)
    use precision
    integer :: ndim
    real(kind=dp), dimension(ndim, ndim) :: tensor
    real(kind=dp), dimension(ntens) :: voigt

    voigt(1) = tensor(1,1)
    voigt(2) = tensor(2,2)
    voigt(3) = tensor(3,3)
    voigt(4) = tensor(1,2)
    voigt(5) = tensor(1,3)
    voigt(6) = tensor(2,3)
end

pure integer function kronecker_delta(i,j)
    integer, intent(in) :: i, j
    kronecker_delta = 0
    if (i == j) kronecker_delta = 1
end function


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

subroutine calc_stress_invariants(stress, ntens, invariant_p, invariant_q, invariant_r)
    
    use precision

    integer :: ntens
    real(kind=dp), dimension(ntens) :: stress
    real(kind=dp) :: sig_H, sig_trial_dev, sig_vonMises
    real(kind=dp) :: dev_sig11, dev_sig22, dev_sig33, dev_sig12, dev_sig13, dev_sig23
    real(kind=dp), intent(out) :: invariant_p, invariant_q, invariant_r

    real(kind=dp), parameter :: sqrt_three_half = sqrt(3.0d0/2.0d0), third = 1.0d0/3.0d0, nine_half = 9.0d0/2.0d0

    ! Hydrostatic stress
    sig_H = third * (stress(1) + stress(2) + stress(3))

    sig_vonMises = (stress(1) - stress(2))**2.0d0 + &
                   (stress(2) - stress(3))**2.0d0 + &
                   (stress(3) - stress(1))**2.0d0 + &
                    6.0d0 * (stress(4)**2.0d0 + stress(5)**2.0d0 + stress(6)**2.0d0)

    sig_vonMises = dsqrt(sig_vonMises/2.0d0)

    ! Deviatoric stress tensor
    dev_sig11 = stress(1) - sig_H
    dev_sig22 = stress(2) - sig_H
    dev_sig33 = stress(3) - sig_H
    dev_sig12 = stress(4)
    dev_sig13 = stress(5)
    dev_sig23 = stress(6)

    ! Magnitude of the deviatoric trial stress tensor
    sig_trial_dev = dsqrt(dev_sig11**2.0d0 + dev_sig22**2.0d0 + dev_sig33**2.0d0 + &
                          2.0d0 * (dev_sig12**2.0d0 + dev_sig13**2.0d0 + dev_sig23**2.0d0))

    ! Preventing divide by zero
    if (abs(sig_trial_dev) < 1.0d-6) sig_trial_dev = 1.0d-6

    ! First invariant
    invariant_p = - sig_H

    ! Second invariant
    invariant_q = sig_vonMises

    ! Third invariant calculation
    invariant_r = nine_half * ( &
                      dev_sig11 * (dev_sig11**2.0d0 + dev_sig12**2.0d0 + dev_sig23**2.0d0) &
                    + dev_sig22 * (dev_sig12**2.0d0 + dev_sig22**2.0d0 + dev_sig13**2.0d0) &
                    + dev_sig33 * (dev_sig23**2.0d0 + dev_sig13**2.0d0 + dev_sig33**2.0d0) &
            + 2.0d0 * dev_sig12 * (dev_sig11 * dev_sig12 + dev_sig22 * dev_sig12 + dev_sig23 * dev_sig13) &
            + 2.0d0 * dev_sig23 * (dev_sig11 * dev_sig23 + dev_sig12 * dev_sig13 + dev_sig33 * dev_sig23) &
            + 2.0d0 * dev_sig13 * (dev_sig12 * dev_sig23 + dev_sig22 * dev_sig13 + dev_sig33 * dev_sig13) &
            )

    ! Handling negative values for cube root
    if (invariant_r < 0.0d0) then
        invariant_r = - (abs(invariant_r)**third)
    else
        invariant_r = invariant_r**third
    endif

return
end

subroutine calc_triaxiality(invariant_p, invariant_q, triaxiality)

    use precision
    
    real(kind=dp) :: invariant_p, invariant_q
    real(kind=dp) :: triaxiality

    ! Stress triaxiality calculation
    triaxiality = -invariant_p / (invariant_q + 1.0d-12)

return
end


subroutine calc_normalized_lode(invariant_r, invariant_q, lode_norm)
    use precision
    real(kind=dp) :: invariant_r, invariant_q
    real(kind=dp) :: lode_norm
    real(kind=dp) :: ratio_invariant_r_q, cosine_3_lode, lode_unnorm
    real(kind=dp), parameter :: third = 1.0d0/3.0d0, inv_pi = 1.0d0/acos(-1.0d0)

    ! Calculating ratio and cosine of 3 times Lode angle
    ratio_invariant_r_q = invariant_r / (invariant_q + 1.0d-12)
    cosine_3_lode = ratio_invariant_r_q**3.0d0

    ! Ensuring cosine_3_lode stays between -1 and 1
    if (cosine_3_lode > 1.0d0) cosine_3_lode = 1.0d0
    if (cosine_3_lode < -1.0d0) cosine_3_lode = -1.0d0

    ! Unnormalized Lode angle
    lode_unnorm = third * acos(cosine_3_lode)

    ! Normalizing the Lode angle to range from -1 to 1
    lode_norm = 1.0d0 - 6.0d0 * lode_unnorm * inv_pi

return
end


subroutine calc_matrix_inv(matrix, matrix_inv, determinant, ndim)
    use precision
    implicit none

    integer, intent(in) :: ndim
    real(kind=dp), intent(in) :: matrix(ndim, ndim)
    real(kind=dp), intent(out) :: matrix_inv(ndim, ndim), determinant

    if (ndim == 2) then
        ! 2x2 Determinant Calculation
        determinant = matrix(1,1) * matrix(2,2) - matrix(1,2) * matrix(2,1)

        ! Check for singularity
        if (abs(determinant) < 0.0d0) then
            print *, "WARNING: determinant is nonpositive!"
            determinant = 0.0d0
            matrix_inv = 0.0d0
            return
        endif

        ! 2x2 Inverse Calculation
        matrix_inv(1,1) = matrix(2,2) / determinant
        matrix_inv(1,2) = -matrix(1,2) / determinant
        matrix_inv(2,1) = -matrix(2,1) / determinant
        matrix_inv(2,2) = matrix(1,1) / determinant

    else if (ndim == 3) then
        ! 3x3 Determinant Calculation
        determinant =  matrix(1,1)*matrix(2,2)*matrix(3,3) + matrix(2,1)*matrix(3,2)*matrix(1,3) &
                     + matrix(3,1)*matrix(2,3)*matrix(1,2) - matrix(3,1)*matrix(2,2)*matrix(1,3) &
                     - matrix(2,1)*matrix(1,2)*matrix(3,3) - matrix(1,1)*matrix(2,3)*matrix(3,2)



        ! 3x3 Inverse Calculation (Adjugate Matrix / Determinant)
        matrix_inv(1,1) = (matrix(2,2) * matrix(3,3) - matrix(2,3) * matrix(3,2)) / determinant
        matrix_inv(1,2) = (matrix(1,3) * matrix(3,2) - matrix(1,2) * matrix(3,3)) / determinant
        matrix_inv(1,3) = (matrix(1,2) * matrix(2,3) - matrix(1,3) * matrix(2,2)) / determinant
        matrix_inv(2,1) = (matrix(2,3) * matrix(3,1) - matrix(2,1) * matrix(3,3)) / determinant
        matrix_inv(2,2) = (matrix(1,1) * matrix(3,3) - matrix(1,3) * matrix(3,1)) / determinant
        matrix_inv(2,3) = (matrix(1,3) * matrix(2,1) - matrix(1,1) * matrix(2,3)) / determinant
        matrix_inv(3,1) = (matrix(2,1) * matrix(3,2) - matrix(2,2) * matrix(3,1)) / determinant
        matrix_inv(3,2) = (matrix(1,2) * matrix(3,1) - matrix(1,1) * matrix(3,2)) / determinant
        matrix_inv(3,3) = (matrix(1,1) * matrix(2,2) - matrix(1,2) * matrix(2,1)) / determinant

        ! Check for singularity
        if (abs(determinant) < 0.0d0) then
            print *, "WARNING: determinant is nonpositive!"
        endif

    else
        print *, "ERROR: Only 2x2 and 3x3 matrices are supported!"
        determinant = 0.0d0
        matrix_inv = 0.0d0
    endif

end

subroutine sort_descending(input_values, sorted_values, n)
    
    use precision
    integer, intent(in) :: n
    real(kind=dp), dimension(n), intent(in) :: input_values
    real(kind=dp), dimension(n), intent(out) :: sorted_values
    integer :: i, j
    real(kind=dp) :: temp

    ! Copy input values to sorted values
    sorted_values = input_values

    ! Simple sorting (descending order) using bubble sort
    do i = 1, n-1
        do j = i+1, n
            if (sorted_values(i) < sorted_values(j)) then
                temp = sorted_values(i)
                sorted_values(i) = sorted_values(j)
                sorted_values(j) = temp
            end if
        end do
    end do

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