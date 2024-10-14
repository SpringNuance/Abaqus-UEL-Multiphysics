

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

    ! subroutine dsyev	(JOBZ, UPLO, N, A, LDA, W, WORK, LWORK, INFO)	

    ! https://netlib.org/lapack/explore-html-3.6.1/d2/d8a/group__double_s_yeigen_ga442c43fca5493590f8f26cf42fed4044.html

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



subroutine calc_stress_invariants(stress, ntens, invariant_p, invariant_q, invariant_r)
    
    use precision
    implicit none
    integer :: ntens
    real(kind=dp), dimension(ntens) :: stress
    real(kind=dp) :: sig_hydrostatic, sig_trial_dev
    real(kind=dp) :: dev_S11, dev_S22, dev_S33, dev_S12, dev_S13, dev_S23
    real(kind=dp), intent(out) :: invariant_p, invariant_q, invariant_r

    real(kind=dp), parameter :: sqrt_three_half = sqrt(3.0d0/2.0d0), third = 1.0d0/3.0d0, nine_half = 9.0d0/2.0d0

    ! Hydrostatic stress
    sig_hydrostatic = third * (stress(1) + stress(2) + stress(3))

    ! Deviatoric stress tensor
    dev_S11 = stress(1) - sig_hydrostatic
    dev_S22 = stress(2) - sig_hydrostatic
    dev_S33 = stress(3) - sig_hydrostatic
    dev_S12 = stress(4)
    dev_S13 = stress(5)
    dev_S23 = stress(6)

    ! Magnitude of the deviatoric trial stress tensor
    sig_trial_dev = dsqrt(dev_S11**2 + dev_S22**2 + dev_S33**2 + &
                          2.0d0 * (dev_S12**2 + dev_S13**2 + dev_S23**2))

    ! Preventing divide by zero
    if (abs(sig_trial_dev) < 1.0d-6) sig_trial_dev = 1.0d-6

    ! First invariant
    invariant_p = -sig_hydrostatic

    ! Second invariant
    invariant_q = sqrt_three_half * sig_trial_dev

    ! Third invariant calculation
    invariant_r = nine_half * ( &
                      dev_S11 * (dev_S11**2 + dev_S12**2 + dev_S23**2) &
                    + dev_S22 * (dev_S12**2 + dev_S22**2 + dev_S13**2) &
                    + dev_S33 * (dev_S23**2 + dev_S13**2 + dev_S33**2) &
            + 2.0d0 * dev_S12 * (dev_S11 * dev_S12 + dev_S22 * dev_S12 + dev_S23 * dev_S13) &
            + 2.0d0 * dev_S23 * (dev_S11 * dev_S23 + dev_S12 * dev_S13 + dev_S33 * dev_S23) &
            + 2.0d0 * dev_S13 * (dev_S12 * dev_S23 + dev_S22 * dev_S13 + dev_S33 * dev_S13) &
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
    implicit none
    real(kind=dp), intent(in) :: invariant_p, invariant_q
    real(kind=dp), intent(out) :: triaxiality

    ! Stress triaxiality calculation
    triaxiality = -invariant_p / invariant_q

return
end


subroutine calc_normalized_lode(invariant_r, invariant_q, lode_norm)
    use precision
    implicit none
    real(kind=dp), intent(in) :: invariant_r, invariant_q
    real(kind=dp), intent(out) :: lode_norm
    real(kind=dp) :: ratio_invariant_r_q, cosine_3_lode, lode_unnorm
    real(kind=dp), parameter :: third = 1.0d0/3.0d0, inv_pi = 1.0d0/acos(-1.0d0)

    ! Calculating ratio and cosine of 3 times Lode angle
    ratio_invariant_r_q = invariant_r / invariant_q
    cosine_3_lode = ratio_invariant_r_q**3

    ! Ensuring cosine_3_lode stays between -1 and 1
    if (cosine_3_lode > 1.0d0) cosine_3_lode = 1.0d0
    if (cosine_3_lode < -1.0d0) cosine_3_lode = -1.0d0

    ! Unnormalized Lode angle
    lode_unnorm = third * acos(cosine_3_lode)

    ! Normalizing the Lode angle to range from -1 to 1
    lode_norm = 1.0d0 - 6.0d0 * lode_unnorm * inv_pi

return
end


subroutine kbmatrix_full(N_deriv_global_kinpt,ntens,nnode,ndim,Bu_kinpt)
    !   Full strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt
    real(kind=dp), dimension(ntens, ndim * nnode) :: Bu_kinpt
    integer :: current_node_idx
    
    Bu_kinpt = 0.0d0
    
    do knode=1,nnode
        current_node_idx = ndim * knode - ndim
        ! Normal components
        Bu_kinpt(1,current_node_idx+1) = N_deriv_global_kinpt(1,knode)
        Bu_kinpt(2,current_node_idx+2) = N_deriv_global_kinpt(2,knode)
        Bu_kinpt(3,current_node_idx+3) = N_deriv_global_kinpt(3,knode)
        ! Shear components
        Bu_kinpt(4,current_node_idx+1) = N_deriv_global_kinpt(2,knode)
        Bu_kinpt(4,current_node_idx+2) = N_deriv_global_kinpt(1,knode)
        Bu_kinpt(5,current_node_idx+1) = N_deriv_global_kinpt(3,knode)
        Bu_kinpt(5,current_node_idx+3) = N_deriv_global_kinpt(1,knode)
        Bu_kinpt(6,current_node_idx+2) = N_deriv_global_kinpt(3,knode)
        Bu_kinpt(6,current_node_idx+3) = N_deriv_global_kinpt(2,knode)
        
    end do

return
end


subroutine kbmatrix_vol(N_deriv_global_kinpt,ntens,nnode,ndim,Bu_vol_kinpt)

    !   Volumetric strain displacement matrix
    !   Notation, strain tensor: e11, e22, e33, e12, e13, e23
    use precision
    include 'aba_param.inc'

    real(kind=dp), dimension(ndim,nnode) :: N_deriv_global_kinpt
    real(kind=dp), dimension(ntens,ndim*nnode) :: Bu_vol_kinpt
    integer :: current_node_idx
    
    Bu_vol_kinpt = 0.0d0
    
    ! Loop through each node
    do knode = 1, nnode
        ! Normal strain components in e11, e22, e33
        current_node_idx = ndim * knode - ndim
        Bu_vol_kinpt(1,current_node_idx+1) = N_deriv_global_kinpt(1, knode)
        Bu_vol_kinpt(1,current_node_idx+2) = N_deriv_global_kinpt(2, knode)
        Bu_vol_kinpt(1,current_node_idx+3) = N_deriv_global_kinpt(3, knode)
        Bu_vol_kinpt(2,current_node_idx+1) = N_deriv_global_kinpt(1, knode)
        Bu_vol_kinpt(2,current_node_idx+2) = N_deriv_global_kinpt(2, knode)
        Bu_vol_kinpt(2,current_node_idx+3) = N_deriv_global_kinpt(3, knode)
        Bu_vol_kinpt(3,current_node_idx+1) = N_deriv_global_kinpt(1, knode)
        Bu_vol_kinpt(3,current_node_idx+2) = N_deriv_global_kinpt(2, knode)
        Bu_vol_kinpt(3,current_node_idx+3) = N_deriv_global_kinpt(3, knode)
        
        ! Shear strain components in e12, e13, e23
        ! No contribution, all are zero
    end do
    
    Bu_vol_kinpt = Bu_vol_kinpt / 3.0d0

return
end
