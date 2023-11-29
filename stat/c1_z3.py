import pandas as pd
import numpy as np
import statistics
import scipy.stats as sts

df = pd.read_csv('stat/data.csv')
data = np.array(df['Value'])
avg = sts.tmean(data)

data.sort()
variation = sts.variation(data)
s = sts.tstd(data, limits=None)
desc = sts.describe(data)
modal = sts.mode(data, keepdims=True) #wartości występujące najczęściej
skew = sts.skew(data) #Współczynnik skrętności próbki
kurtosis = sts.kurtosis(data) #Szpiczastość rozkładu danych

