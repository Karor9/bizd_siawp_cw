import numpy as np
from scipy.stats import binom

n = 20
p = 0.4
k = np.arange(0, 21)

binomial_trials = binom.pmf(k, n, p)

sum_bino = np.sum(binomial_trials)



print(sum_bino)
