import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

n = 10000
p = 0.3

bernoulli = np.random.choice([0, 1], size=n, p=[1-p, p])

binomial_trials = np.random.binomial(n, p, size=n)

poisson = np.random.poisson(10 ,n)
