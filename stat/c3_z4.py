import pandas as pd
from scipy.stats import ttest_ind

df = pd.read_csv('stat/napoje.csv', delimiter=';')

ttest_okocim_lech = ttest_ind(df['okocim'], df['lech']).pvalue
ttest_fanta_regionalne = ttest_ind(df['fanta'], df['regionalne']).pvalue
ttest_cola_pepsi = ttest_ind(df['cola'], df['pepsi']).pvalue

print(f"P-value dla równości średnich okocim - lech: {ttest_okocim_lech}")
print(f"P-value dla równości średnich fanta - regionalne: {ttest_fanta_regionalne}")
print(f"P-value dla równości średnich cola - pepsi: {ttest_cola_pepsi}")
