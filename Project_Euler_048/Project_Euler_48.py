#Project_Euler_48.py
#Virata Yindeeyoungyeon
"""
The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.

Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
"""
import math

def sumSeries1000():
    sumSeries = 0
    modulo = 10000000000
    for i in xrange(1,1001):
        temp = i
        for j in xrange(1,i):
            temp *= i
            temp %= modulo
        sumSeries += temp
        sumSeries %= modulo
    return sumSeries

print(sumSeries1000())
#9110846700

