import numpy as np
from math import comb

p = 0.9
q = 0.1
n = 5

T = np.zeros(n+1) 

for i in range(1, n+1):
    sum = 0
    for j in range(1, i):
        sum += comb(i, j) * (p**j) * (q**(i-j)) * T[j]
    T[i] = (1 + sum) / (1 - p**i)

print(T[5])