import numpy as np
import matplotlib.pyplot as plt

np.random.seed(0)

T = 48
lamda = 3

def simulate_times(rate, T):
    t = 0
    times = []
    while True:
        t += np.random.exponential(1/rate)
        if t > T:
            break
        times.append(t)
    return np.array(times)

times_A = simulate_times(lamda, T)
times_B = simulate_times(lamda, T)

plt.figure()

# Team A
for t in times_A:
    plt.axvline(t, ymin=0.5, ymax=1.0, color='red')

# Team B
for t in times_B:
    plt.axvline(t, ymin=0.0, ymax=0.5, color='blue')

plt.ylim(0,1)
plt.xlim(0, T)
plt.xlabel("Time (minutes)")
plt.ylabel("Team")
plt.title("Simulated Basket Times (Red = A, Blue = B)")
plt.show()