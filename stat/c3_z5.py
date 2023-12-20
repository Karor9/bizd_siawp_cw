import pandas as pd
from scipy.stats import levene

df = pd.read_csv('stat/napoje.csv', delimiter=';')
wariancja_okocim_lech = levene(df['okocim'], df['lech']).pvalue
wariancja_zywiec_fanta = levene(df['żywiec'], df['fanta']).pvalue
wariancja_regionalne_cola = levene(df['regionalne'], df['cola']).pvalue

print(f"P-value dla równości wariancji okocim - lech: {wariancja_okocim_lech}")
print(f"P-value dla równości wariancji żywiec - fanta: {wariancja_zywiec_fanta}")
print(f"P-value dla równości wariancji regionalne - cola: {wariancja_regionalne_cola}")

