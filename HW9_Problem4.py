import numpy as np
import matplotlib.pyplot as plt

m_vals = np.arange(2, 200)

# deterministic
log_vals = np.log(m_vals)

# sum
summation = np.array([np.sum(1/np.arange(1, m)) for m in m_vals])

# plot
plt.figure()
plt.plot(m_vals, log_vals, label="log(m)")
plt.plot(m_vals, summation, label="Sum")
plt.xlabel("m")
plt.ylabel("Expected Time")
plt.title("Deterministic vs. Stochastic Method in Yule Process")
plt.legend()
plt.show()