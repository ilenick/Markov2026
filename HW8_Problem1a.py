import numpy as np

A = np.array([[-1, 1, 0, 0], [0, -1, 1, 0], [0, 0, -1, 1], [1, 0, 0, -1]])

eigenvalues = np.linalg.eigvals(A)

vals, vecs = np.linalg.eig(A)

print("Eigenvalues:", vals)