import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as sts
import statistics

n = 10000
p = 0.3

bernoulli = np.random.choice([0, 1], size=n, p=[1-p, p])

binomial_trials = np.random.binomial(n, p, size=n)

poisson = np.random.poisson(10 ,n)

avg_bern = np.mean(bernoulli)
avg_bino = np.mean(binomial_trials)
avg_pois = np.mean(poisson)

var_bern = sts.variation(bernoulli)
var_bino = sts.variation(binomial_trials)
var_pois = sts.variation(poisson)

kur_bern = sts.kurtosis(bernoulli)
kur_bino = sts.kurtosis(binomial_trials)
kur_pois = sts.kurtosis(poisson)

ske_bern = sts.skew(bernoulli)
ske_bino = sts.skew(binomial_trials)
ske_pois = sts.skew(poisson)