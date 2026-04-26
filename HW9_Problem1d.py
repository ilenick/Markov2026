import numpy as np

# parameters
alpha = 1
beta = 1
L = 20
N = 1000

def simulate_one():
    i = 0
    t = 0.0
    
    while i < L:
        if i == 0:
            # only move right
            wait = np.random.exponential(1/alpha)
            i = 1
        else:
            # total rate = alpha + beta = 2
            wait = np.random.exponential(1/(alpha + beta))
            
            # choose direction
            if np.random.rand() < alpha / (alpha + beta):
                i += 1
            else:
                i -= 1
        
        t += wait
    
    return t

# run simulations
times = np.array([simulate_one() for _ in range(N)])

# estimates
mean_time = np.mean(times)
variance_time = np.var(times)

print("Estimated mean m_0:", mean_time)
print("Estimated variance:", variance_time)