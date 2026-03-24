import numpy as np

def simulate_avalanche():
    current_gen = [1] 
    total_size = 0

    while current_gen:
        next_gen = []
        for _ in current_gen:
            total_size += 1
            
            if np.random.rand() < 0.5:
                offspring = 0
            else:
                offspring = 2
            next_gen.extend([1] * offspring)
        current_gen = next_gen

    return total_size


# simulate
num_sims = 10**3
sizes = [simulate_avalanche() for _ in range(num_sims)]

# estimation
estimate = sum(1 for s in sizes if s == 3) / num_sims

print("Estimated P(X=3):", estimate)