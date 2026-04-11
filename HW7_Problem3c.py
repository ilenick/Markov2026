import numpy as np
import matplotlib.pyplot as plt

np.random.seed(0)

def lam(t):
    return 0.5 * (1 + (t/30)**2)

T = 120

# lambda max
t_grid = np.linspace(0, T, 1000)
lambda_max = lam(t_grid).max()

t = 0
events = []

while True:
    t += np.random.exponential(1 / lambda_max)
    if t > T:
        break
    if np.random.rand() < lam(t) / lambda_max:
        events.append(t)

events = np.array(events)

# histo
bins = np.arange(0, T+1, 1)
plt.figure()
counts, _, _ = plt.hist(events, bins=bins)


plt.xlabel("Day")
plt.ylabel("Number of reports")
plt.title("Daily Reported Flu Symptoms")
plt.show()

# --- print number of events ---
print(f"Total events simulated: {len(events)}")