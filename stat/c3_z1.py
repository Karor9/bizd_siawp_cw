import numpy as np
from scipy.stats import ttest_1samp

srednia = 2
odchylenie_std = 30
liczba_elementow = 200

proba_losowa = np.random.normal(srednia, odchylenie_std, liczba_elementow)

srednia_teoretyczna = 2.5

statystyka_t, p_wartosc = ttest_1samp(proba_losowa, srednia_teoretyczna)

print(f"Statystyka t: {statystyka_t}")
print(f"P-wartość: {p_wartosc}")

poziom_istotnosci = 0.05
if p_wartosc < poziom_istotnosci:
    print("Odrzucamy hipotezę zerową - istnieją istotne różnice.")
else:
    print("Nie ma podstaw do odrzucenia hipotezy zerowej.")
