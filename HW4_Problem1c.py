import random
import numpy as np

i=10
q=0.4
p=0.35
s=0.25

# play the game

def play_game(i, p, q, s):
    x = i
    
    while True:
        r = random.random()
        
        if r < p:
            x += 1
        elif r < p + q:
            x -= 1
        else:
            return x
        
        if x == 0:
            return 0


# simulate it 100k times
def simulate(i, p, q, s, trials=100000):
    results = []
    
    for _ in range(trials):
        final_money = play_game(i, p, q, s)
        results.append(final_money)
    
    return np.mean(results)

expected_value = simulate(i, p, q, s, trials=100000)
print(expected_value)