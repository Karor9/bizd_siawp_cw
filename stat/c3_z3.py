import pandas as pd
import matplotlib.pyplot as plt
from scipy.stats import shapiro, probplot

data = pd.read_csv('stat/napoje.csv', sep=';')
print(data)
for zmienna_do_analizy in ['pepsi', 'fanta', 'żywiec', 'okocim', 'regionalne', 'cola', 'lech']:
    stat, p_value = shapiro(data[zmienna_do_analizy])
    print(f'Statystyka testowa: {stat}, P-wartość: {p_value}')

    plt.figure(figsize=(12, 6))
    plt.subplot(1, 2, 1)
    plt.hist(data[zmienna_do_analizy], bins=20, color='blue', alpha=0.7)
    plt.title('Histogram')

    plt.subplot(1, 2, 2)
    probplot(data[zmienna_do_analizy], dist='norm', plot=plt)
    plt.title('QQ plot')

    plt.show()
