import pandas as pd
from scipy.stats import ttest_ind

df = pd.read_csv('stat/napoje.csv', delimiter=';')

srednia_regionalne_2001 = df.loc[df['rok'] == 2001, 'regionalne'].mean()
srednia_regionalne_2015 = df.loc[df['rok'] == 2015, 'regionalne'].mean()

ttest_regionalne = ttest_ind(df.loc[df['rok'] == 2001, 'regionalne'], df.loc[df['rok'] == 2015, 'regionalne']).pvalue

print(f"Średnia dla regionalnych w 2001 roku: {srednia_regionalne_2001}")
print(f"Średnia dla regionalnych w 2015 roku: {srednia_regionalne_2015}")
print(f"P-value dla równości średnich regionalnych między 2001 a 2015 rokiem: {ttest_regionalne}")

