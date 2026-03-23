import numpy as np

a = 0.49
p = 1 - a
num_sims = 10**3
max_gen = 200

extinctions = 0

for _ in range(num_sims):
    X = 1

    for _ in range(max_gen):
        if X == 0:
            break

        Z = np.random.binomial(X, p)
        X = 2 * Z

    if X == 0:
        extinctions += 1

ext_prob = extinctions / num_sims
print("Estimated extinction probability:", ext_prob)