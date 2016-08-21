#Project_Euler_27.py
#Virata Yindeeyoungyeon
"""
Euler discovered the remarkable quadratic formula:

n^2 + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.

The incredible formula  n^2 - 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, -79 and 1601, is -126479.

Considering quadratics of the form:

n^2 + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |-4| = 4
Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
"""
import math

def isPrime(n):
    if n <= 1:
        return False

    upperLimit = int(math.sqrt(n)) + 1
    for i in xrange(2,upperLimit):
        if n % i == 0:
            return False
        i += 1 

    return True

def quadraticPrimes():
    maxN = 0
    maxA = 0
    maxB = 0

    for a in xrange(-999,1000):
        for b in xrange(-999,1000):
            n = 0
            while isPrime(n*n + a*n + b):
                n += 1

            if n > maxN:
                maxN = n
                maxA = a
                maxB = b

    return maxA * maxB

print(quadraticPrimes())
#-59231