import pandas as pd
import numpy as np

df = pd.read_csv('stat/napoje.csv', sep=';')

avg_lech = np.mean(df['lech'])
avg_cola = np.mean(df['cola'])
avg_regi = np.mean(df['regionalne'])

print(60500 * 0.95, avg_lech, 60500 * 1.05) #Tak
print(222000 * 0.95, avg_cola, 222000 * 1.05) #Tak
print(43500 * 0.95, avg_regi, 43500 * 1.05) #Nie - zdecydowanie więcej


