import pandas as pd
import numpy as np
import statistics

df = open('stat/Wzrost.csv')
arr = []

for i in df:
    arr.append(i)

arr = arr[0].split(',')
for x in range(len(arr)):
    arr[x] = int(arr[x])

avg = statistics.mean(arr)
arr.sort()
median = statistics.median(arr)
quantiles = statistics.quantiles(arr)
s = statistics.stdev(arr)
v = statistics.variance(arr)
print(s, v)
print(s**2)