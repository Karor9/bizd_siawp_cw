import pandas as pd
import numpy as np
import statistics

df = pd.read_csv('stat/MDR_RR_TB_burden_estimates_2023-11-29.csv')

new_df = np.array(df['e_rr_pct_new'])

avg = sum(new_df)/len(new_df)
new_df.sort()
median = statistics.median(new_df)
min = min(new_df)
max = max(new_df)
q1 = np.percentile(new_df, 25)
q3 = np.percentile(new_df, 75)