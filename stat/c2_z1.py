import numpy as np
import statistics

wartosci = np.array([1, 2, 3, 4, 5, 6])
prawdopodobienstwa = np.array([1/6, 1/6, 1/6, 1/6, 1/6, 1/6])

srednia = np.sum(wartosci*prawdopodobienstwa)
wariancja = np.sum((wartosci - srednia)**2 * prawdopodobienstwa)
odchylenie = np.sqrt(wariancja)