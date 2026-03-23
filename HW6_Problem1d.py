import numpy as np
import matplotlib.pyplot as plt

q_50 = np.array([0.1667, 0, 0.6667, 0, 0.1667])
pi = np.array([1/12, 1/4, 1/3, 1/4, 1/12])

states = np.arange(1, 6)

plt.figure()

plt.plot(states, q_50, marker='o', label=r'$q_{50}$')
plt.plot(states, pi, marker='s', linestyle='--', label=r'Stationary Distribution $\pi$')

plt.xlabel('State')
plt.ylabel('Probability')
plt.title('Comparison of $q_{50}$ and Stationary Distribution')
plt.xticks(states)
plt.legend()
plt.grid()

plt.show()