import numpy as np
from scipy.stats import describe

avg = 0 
std_dev = 2
n = 100

data =np.random.normal(avg, std_dev, n)
stats = describe(data)
print('Teoria {} (Średnia), {} (Odchylenie)'.format(avg, std_dev))
print('Praktyka {} (Średnia), {} (Odchylenie)'.format(stats.mean, np.sqrt(stats.variance)))

n = 10000

data =np.random.normal(avg, std_dev, n)

stats = describe(data)

print('Teoria {} (Średnia), {} (Odchylenie)'.format(avg, std_dev))
print('Praktyka {} (Średnia), {} (Odchylenie)'.format(stats.mean, np.sqrt(stats.variance)))

#W zależności od próby, zwiększenie liczby próbek zwiększa dokładność wyliczeń.

