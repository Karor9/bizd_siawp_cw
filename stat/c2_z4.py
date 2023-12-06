import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

n = 10000

p = 0.3
bernoulli = np.random.choice([0, 1], size=n, p=[1-p, p])
sns.histplot(bernoulli, bins=[-0.5, 0.5, 1.5])
plt.title('Rozkład Bernoulliego ')
plt.show()

p = 0.3
binomial_trials = np.random.binomial(n, p, size=n)
sns.histplot(binomial_trials, bins=np.arange(0, n+2)-0.5)
plt.title('Rozkład Dwumianowy')

plt.show()

poisson = np.random.poisson(10 ,n)
sns.histplot(poisson, bins=range(0,35))
plt.title('Rozkład Poissona')
plt.show()