"""This package contains FE function for TOPT
Author: Tien-Dung Dinh
Gent, Jan 20th 2022"""
import numpy as np
from scipy import sparse

def BMech(X, xi, eta, zeta):
    # '''
    # This matrix is the B matrix of a hexahedral element for mechanical field in 3D
    # xi, eta, zeta are natural coordinates
    # '''
    GN = np.array([[-0.125 * (1 + zeta) * (1 + eta), -0.125 * (1 + zeta) * (1 - eta), -0.125 * (1 - zeta) * (1 - eta),
                    -0.125 * (1 - zeta) * (1 + eta), \
                    0.125 * (1 + zeta) * (1 + eta), 0.125 * (1 + zeta) * (1 - eta), 0.125 * (1 - zeta) * (1 - eta),
                    0.125 * (1 - zeta) * (1 + eta)], \
                   [0.125 * (1 + zeta) * (1 - xi), -0.125 * (1 + zeta) * (1 - xi), -0.125 * (1 - zeta) * (1 - xi),
                    0.125 * (1 - zeta) * (1 - xi), \
                    0.125 * (1 + zeta) * (1 + xi), -0.125 * (1 + zeta) * (1 + xi), -0.125 * (1 - zeta) * (1 + xi),
                    0.125 * (1 - zeta) * (1 + xi)], \
                   [0.125 * (1 + eta) * (1 - xi), 0.125 * (1 - eta) * (1 - xi), -0.125 * (1 - eta) * (1 - xi),
                    -0.125 * (1 + eta) * (1 - xi), \
                    0.125 * (1 + eta) * (1 + xi), 0.125 * (1 - eta) * (1 + xi), -0.125 * (1 - eta) * (1 + xi),
                    -0.125 * (1 + eta) * (1 + xi)]])
    Jac = np.dot(GN, X)
    detJac = np.linalg.det(Jac)
    invJ = np.linalg.inv(Jac)
    dNdx = np.dot(invJ, GN)
    BMatI = np.array([[dNdx[0, 0], 0, 0], [0, dNdx[1, 0], 0], [0, 0, dNdx[2, 0]], \
                      [dNdx[1, 0], dNdx[0, 0], 0], [dNdx[2, 0], 0, dNdx[0, 0]], [0, dNdx[2, 0], dNdx[1, 0]]])
    BMatII = np.array([[dNdx[0, 1], 0, 0], [0, dNdx[1, 1], 0], [0, 0, dNdx[2, 1]], \
                       [dNdx[1, 1], dNdx[0, 1], 0], [dNdx[2, 1], 0, dNdx[0, 1]], [0, dNdx[2, 1], dNdx[1, 1]]])
    BMatIII = np.array([[dNdx[0, 2], 0, 0], [0, dNdx[1, 2], 0], [0, 0, dNdx[2, 2]], \
                        [dNdx[1, 2], dNdx[0, 2], 0], [dNdx[2, 2], 0, dNdx[0, 2]], [0, dNdx[2, 2], dNdx[1, 2]]])
    BMatIV = np.array([[dNdx[0, 3], 0, 0], [0, dNdx[1, 3], 0], [0, 0, dNdx[2, 3]], \
                       [dNdx[1, 3], dNdx[0, 3], 0], [dNdx[2, 3], 0, dNdx[0, 3]], [0, dNdx[2, 3], dNdx[1, 3]]])
    BMatV = np.array([[dNdx[0, 4], 0, 0], [0, dNdx[1, 4], 0], [0, 0, dNdx[2, 4]], \
                      [dNdx[1, 4], dNdx[0, 4], 0], [dNdx[2, 4], 0, dNdx[0, 4]], [0, dNdx[2, 4], dNdx[1, 4]]])
    BMatVI = np.array([[dNdx[0, 5], 0, 0], [0, dNdx[1, 5], 0], [0, 0, dNdx[2, 5]], \
                       [dNdx[1, 5], dNdx[0, 5], 0], [dNdx[2, 5], 0, dNdx[0, 5]], [0, dNdx[2, 5], dNdx[1, 5]]])
    BMatVII = np.array([[dNdx[0, 6], 0, 0], [0, dNdx[1, 6], 0], [0, 0, dNdx[2, 6]], \
                        [dNdx[1, 6], dNdx[0, 6], 0], [dNdx[2, 6], 0, dNdx[0, 6]], [0, dNdx[2, 6], dNdx[1, 6]]])
    BMatVIII = np.array([[dNdx[0, 7], 0, 0], [0, dNdx[1, 7], 0], [0, 0, dNdx[2, 7]], \
                         [dNdx[1, 7], dNdx[0, 7], 0], [dNdx[2, 7], 0, dNdx[0, 7]], [0, dNdx[2, 7], dNdx[1, 7]]])
    return np.hstack((BMatI, BMatII, BMatIII, BMatIV, BMatV, BMatVI, BMatVII, BMatVIII)), detJac


def BMechVol(X, xi, eta, zeta):
    # '''
    # This matrix is the volumetric B matrix of a hexahedral element for mechanical field in 3D, which can be used for
    # construct the so-called selective reduced integration method
    # xi, eta, zeta are natural coordinates
    # '''
    GN = np.array([[-0.125 * (1 + zeta) * (1 + eta), -0.125 * (1 + zeta) * (1 - eta), -0.125 * (1 - zeta) * (1 - eta),
                    -0.125 * (1 - zeta) * (1 + eta), \
                    0.125 * (1 + zeta) * (1 + eta), 0.125 * (1 + zeta) * (1 - eta), 0.125 * (1 - zeta) * (1 - eta),
                    0.125 * (1 - zeta) * (1 + eta)], \
                   [0.125 * (1 + zeta) * (1 - xi), -0.125 * (1 + zeta) * (1 - xi), -0.125 * (1 - zeta) * (1 - xi),
                    0.125 * (1 - zeta) * (1 - xi), \
                    0.125 * (1 + zeta) * (1 + xi), -0.125 * (1 + zeta) * (1 + xi), -0.125 * (1 - zeta) * (1 + xi),
                    0.125 * (1 - zeta) * (1 + xi)], \
                   [0.125 * (1 + eta) * (1 - xi), 0.125 * (1 - eta) * (1 - xi), -0.125 * (1 - eta) * (1 - xi),
                    -0.125 * (1 + eta) * (1 - xi), \
                    0.125 * (1 + eta) * (1 + xi), 0.125 * (1 - eta) * (1 + xi), -0.125 * (1 - eta) * (1 + xi),
                    -0.125 * (1 + eta) * (1 + xi)]])
    Jac = np.dot(GN, X)
    detJac = np.linalg.det(Jac)
    invJ = np.linalg.inv(Jac)
    dNdx = np.dot(invJ, GN)
    BMatI = np.array([[dNdx[0, 0], dNdx[1, 0], dNdx[2, 0]], [dNdx[0, 0], dNdx[1, 0], dNdx[2, 0]],
                      [dNdx[0, 0], dNdx[1, 0], dNdx[2, 0]], \
                      [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    BMatII = np.array([[dNdx[0, 1], dNdx[1, 1], dNdx[2, 1]], [dNdx[0, 1], dNdx[1, 1], dNdx[2, 1]],
                       [dNdx[0, 1], dNdx[1, 1], dNdx[2, 1]], \
                       [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    BMatIII = np.array([[dNdx[0, 2], dNdx[1, 2], dNdx[2, 2]], [dNdx[0, 2], dNdx[1, 2], dNdx[2, 2]],
                        [dNdx[0, 2], dNdx[1, 2], dNdx[2, 2]], \
                        [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    BMatIV = np.array([[dNdx[0, 3], dNdx[1, 3], dNdx[2, 3]], [dNdx[0, 3], dNdx[1, 3], dNdx[2, 3]],
                       [dNdx[0, 3], dNdx[1, 3], dNdx[2, 3]], \
                       [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    BMatV = np.array([[dNdx[0, 4], dNdx[1, 4], dNdx[2, 4]], [dNdx[0, 4], dNdx[1, 4], dNdx[2, 4]],
                      [dNdx[0, 4], dNdx[1, 4], dNdx[2, 4]], \
                      [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    BMatVI = np.array([[dNdx[0, 5], dNdx[1, 5], dNdx[2, 5]], [dNdx[0, 5], dNdx[1, 5], dNdx[2, 5]],
                       [dNdx[0, 5], dNdx[1, 5], dNdx[2, 5]], \
                       [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    BMatVII = np.array([[dNdx[0, 6], dNdx[1, 6], dNdx[2, 6]], [dNdx[0, 6], dNdx[1, 6], dNdx[2, 6]],
                        [dNdx[0, 6], dNdx[1, 6], dNdx[2, 6]], \
                        [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    BMatVIII = np.array([[dNdx[0, 7], dNdx[1, 7], dNdx[2, 7]], [dNdx[0, 7], dNdx[1, 7], dNdx[2, 7]],
                         [dNdx[0, 7], dNdx[1, 7], dNdx[2, 7]], \
                         [0.0, 0.0, 0.0], [0.0, 0.0, 0.0], [0.0, 0.0, 0.0]])
    return 1.0/3.0 * np.hstack((BMatI, BMatII, BMatIII, BMatIV, BMatV, BMatVI, BMatVII, BMatVIII)), detJac


def BMechDev(X, xi, eta, zeta):
    bMech, detJac = BMech(X, xi, eta, zeta)
    bVol, detJac = BMechVol(X, xi, eta, zeta)
    return (bMech - bVol), detJac


def C0(nu):
    # '''
    # This function is used to calculate the stiffness at integration point.
    # At the moment, only the case of isotropic material for 3D is implemented
    # '''
    return 1.0 / ((1 + nu) * (1 - 2.0 * nu)) * np.array([[1 - nu, nu, nu, 0, 0, 0], \
                                                         [nu, 1 - nu, nu, 0, 0, 0], \
                                                         [nu, nu, 1 - nu, 0, 0, 0], \
                                                         [0, 0, 0, (1 - 2 * nu) / 2.0, 0, 0], \
                                                         [0, 0, 0, 0, (1 - 2 * nu) / 2.0, 0], \
                                                         [0, 0, 0, 0, 0, (1 - 2 * nu) / 2.0]])

def calElemStiff2(XCoords, nu):
    # '''
    # This part of element stiffness is const for elements in the mesh
    # To calculate the element stiffness at element i, we need to multiply this matrix with Ei
    # This stiffness matrix is calculated by using the selective reduced integration technique
    # '''
    GaussPoints = 1.0 / np.sqrt(3) * np.array([[-1, -1, 1], [1, -1, 1], [1, 1, 1], [-1, 1, 1], \
                                               [-1, -1, -1], [1, -1, -1], [1, 1, -1], [-1, 1, -1]])
    Ke = np.zeros([24, 24], dtype= float)
    CC = C0(nu)
    for i in range(8):
        # calculation of the deviatoric part
        xi, eta, zeta = GaussPoints[i]
        BMat, detJ = BMechDev(XCoords, xi, eta, zeta)
        Ke += np.dot(np.dot(BMat.T, CC), BMat) * detJ
    # calculate the volumetric part
    xi, eta, zeta = 0.0, 0.0, 0.0
    w1 = 8.0
    BMat, detJ = BMechVol(XCoords, xi, eta, zeta)
    Ke += w1 * np.dot(np.dot(BMat.T, CC), BMat) * detJ
    return Ke

if __name__ == '__main__':
    XCoords = np.array([[0.0, 1.0, 1.0],[0.0, 0.0, 1.0],[0.0, 0.0, 0.0],[0.0, 1.0, 0.0],\
                    [1.0, 1.0, 1.0],[1.0, 0.0, 1.0],[1.0, 0.0, 0.0],[1.0, 1.0, 0.0]], dtype=float)
    nu = 0.33
    myStiffness = calElemStiff2(XCoords, nu)

    # import stiffness matrix from Abaqus
    mtxFileName = 'Job-1_STIF2.mtdd'
    A_sparse = np.loadtxt(mtxFileName)
    i = A_sparse[:, 0].astype(np.int64)
    j = A_sparse[:, 1].astype(np.int64)
    M = i.max()
    N = j.max()
    A = sparse.coo_matrix((A_sparse[:, 2], (i - 1, j - 1)), shape=(M, N))
    A = A.tocsc()
    print('max. difference: ' + str(np.max(myStiffness - A)))

