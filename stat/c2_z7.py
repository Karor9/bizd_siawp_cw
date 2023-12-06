import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

mu1, sigma1 = 1, 2

mu_standard, sigma_standard = 0, 1

mu_density, sigma_density = -1, 0.5

data_normal = np.random.normal(mu1, sigma1, 1000)

plt.hist(data_normal, bins=30, density=True, alpha=0.7, label='Rozkład normalny (μ=1, σ=2)')

x_standard = np.linspace(mu_standard - 4 * sigma_standard, mu_standard + 4 * sigma_standard, 100)
y_standard = norm.pdf(x_standard, mu_standard, sigma_standard)
plt.plot(x_standard, y_standard, 'r-', label='Rozkład standardowy')

x_density = np.linspace(mu_density - 4 * sigma_density, mu_density + 4 * sigma_density, 100)
y_density = norm.pdf(x_density, mu_density, sigma_density)
plt.plot(x_density, y_density, 'g--', label='Gęstość (μ=-1, σ=0.5)')

plt.title('Histogram i Wykresy Rozkładów Normalnych')
plt.xlabel('Wartość')
plt.ylabel('Gęstość prawdopodobieństwa')
plt.legend()

plt.show()
