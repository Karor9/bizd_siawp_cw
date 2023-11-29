import pandas as pd
import numpy as np
import statistics
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('stat/brain_size.csv', sep=";")

avg_viq = statistics.mean(df['VIQ'])
females = df['Gender'].value_counts()['Female']
female_male = (females, len(df['Gender']) - females)

fig, ax = plt.subplots(2, 3, figsize=(18, 10))
sns.histplot(data=df, x='VIQ', ax=ax[0,0])
sns.histplot(data=df, x='PIQ', ax=ax[0,1])
sns.histplot(data=df, x='FSIQ', ax=ax[0,2])

female_df = df.loc[df['Gender'] == 'Female']
sns.histplot(data=female_df, x='VIQ', ax=ax[1,0])
sns.histplot(data=female_df, x='PIQ', ax=ax[1,1])
sns.histplot(data=female_df, x='FSIQ', ax=ax[1,2])
plt.show()
