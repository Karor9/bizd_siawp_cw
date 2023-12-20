import pandas as pd
from scipy.stats import ttest_ind

df = pd.read_csv('stat/napoje.csv', delimiter=';')
df_reklama = pd.read_csv('stat/napoje_po_reklamie.csv', delimiter=';')

srednia_cola_2016 = df.loc[df['rok'] == 2016, 'cola'].mean()
srednia_fanta_2016 = df.loc[df['rok'] == 2016, 'fanta'].mean()
srednia_pepsi_2016 = df.loc[df['rok'] == 2016, 'pepsi'].mean()

srednia_cola_po_reklamie = df_reklama['cola'].mean()
srednia_fanta_po_reklamie = df_reklama['fanta'].mean()
srednia_pepsi_po_reklamie = df_reklama['pepsi'].mean()

ttest_cola = ttest_ind(df.loc[df['rok'] == 2016, 'cola'], df_reklama['cola']).pvalue
ttest_fanta = ttest_ind(df.loc[df['rok'] == 2016, 'fanta'], df_reklama['fanta']).pvalue
ttest_pepsi = ttest_ind(df.loc[df['rok'] == 2016, 'pepsi'], df_reklama['pepsi']).pvalue

print(f"Średnia dla coli w 2016 roku: {srednia_cola_2016}")
print(f"Średnia dla fanty w 2016 roku: {srednia_fanta_2016}")
print(f"Średnia dla pepsi w 2016 roku: {srednia_pepsi_2016}")

print(f"Średnia dla coli po reklamie: {srednia_cola_po_reklamie}")
print(f"Średnia dla fanty po reklamie: {srednia_fanta_po_reklamie}")
print(f"Średnia dla pepsi po reklamie: {srednia_pepsi_po_reklamie}")

print(f"P-value dla równości średnich coli między 2016 a po reklamie: {ttest_cola}")
print(f"P-value dla równości średnich fanty między 2016 a po reklamie: {ttest_fanta}")
print(f"P-value dla równości średnich pepsi między 2016 a po reklamie: {ttest_pepsi}")