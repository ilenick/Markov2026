import numpy as np
import matplotlib.pyplot as plt

np.random.seed(1)

T = 48
lambda_total = 6

def simulate_both(rate, T):
    t = 0
    times = []
    while True:
        t += np.random.exponential(1/rate)
        if t > T:
            break
        times.append(t)
    return np.array(times)


times = simulate_both(lambda_total, T)

is_A = np.random.rand(len(times)) < 0.5
times_A = times[is_A]
times_B = times[~is_A]

plt.figure()

for t in times_A:
    plt.axvline(t, ymin=0.5, ymax=1.0, color='red')

for t in times_B:
    plt.axvline(t, ymin=0.0, ymax=0.5, color='blue')

plt.ylim(0,1)
plt.xlim(0, T)
plt.xlabel("Time (minutes)")
plt.ylabel("Team")
plt.title("Simulated Basket Method 2 (Red = A, Blue = B)")
plt.show()