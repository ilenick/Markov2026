import numpy as np
import math

np.random.seed(0)

l = 3
t = 48
n_sim = 100000

# total mean
mu = l * t
lam_total = 2 * mu 

#total basket
N = np.random.poisson(lam_total, size=n_sim)

N_A = np.random.binomial(N, 0.5)
N_B = N - N_A

D = 2 * (N_A - N_B)

# Estimates
E_est = np.mean(D)
Var_est = np.var(D)
P0_est = np.mean(D == 0)

# Theoretical values
E_th = 0
Var_th = 8 * l * t

P0_th = 1 / np.sqrt(4 * np.pi * mu)

print("Simulation results:")
print(f"E[D]      = {E_est}")
print(f"Var[D]    = {Var_est}")
print(f"P(D=0)    = {P0_est}")

print("\nTheoretical values:")
print(f"E[D]      = {E_th}")
print(f"Var[D]    = {Var_th}")
print(f"P(D=0) ≈  {P0_th}")