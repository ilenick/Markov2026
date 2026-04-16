import numpy as np
import matplotlib.pyplot as plt

# theoretical y1(t)
def y1_theoretical(t):
    return (
        1/4
        - (1/12)*np.exp(-2*t)
        + np.exp(-t)*( (1/6)*np.cos(t) - (1/3)*np.sin(t) )
    )

# simulate f(t)
def simulate_fraction(N, t_grid):
    f = []
    
    # sample initial states: 1 with prob 1/3, 2 with prob 2/3
    init = np.random.choice([1, 2], size=N, p=[1/3, 2/3])
    
    for t in t_grid:
        jumps = np.random.poisson(t, size=N)
        states = (init - 1 + jumps) % 4 + 1
        f.append(np.mean(states == 1))
    
    return np.array(f)


t_grid = np.linspace(0, 5, 200)

Ns = [100, 1000, 10000, 100000]

plt.figure(figsize=(10,6))

# theoretical curve
plt.plot(t_grid, y1_theoretical(t_grid), linewidth=3, label="Theoretical")

# simulations
for N in Ns:
    f = simulate_fraction(N, t_grid)
    plt.plot(t_grid, f, alpha=0.7, label=f"N={N}")

plt.xlim(0, 5)
plt.ylim(0, 0.5)
plt.xlabel("t")
plt.ylabel("f(t) = fraction in state 1")
plt.title("Simulation vs. Theory for y_1(t)")
plt.legend()
plt.grid()

plt.show()