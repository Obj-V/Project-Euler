#Project_Euler_47.py
#Virata Yindeeyoungyeon
"""
The first two consecutive numbers to have two distinct prime factors are:

14 = 2 x 7
15 = 3 x 5

The first three consecutive numbers to have three distinct prime factors are:

644 = 2^2 x 7 x 23
645 = 3 x 5 x 43
646 = 2 x 17 x 19.

Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
"""
import math

def isPrime(num):
    if num <= 1:
        return False

    upperLimit = int(math.sqrt(num)) + 1
    for i in xrange(2,upperLimit):
        if num % i == 0:
            return False

    return True

def primeFactorList():
    primeList = []
    for i in xrange(2,1000):
        if isPrime(i):
            primeList.append(i)

    return primeList

primeList = primeFactorList()

def hasFourDistictPrimeFactors(n):
    count = 0
    i = 4
    num = n
    pList = primeList
    distinctPrimeList = []

    while i > 0:
        for prime in pList:
            if num % prime == 0:
                num = num / prime
                if not prime in distinctPrimeList:
                    distinctPrimeList.append(prime)
                    count += 1
                else:
                    i += 1
                break
        i -= 1

    if num != 1 or count != 4:
        return False

    return True

def firstFourConsecutiveIntegersWithFourDistinctPrimeFactors():
    count = 0
    i = 1000
    firstNum = 1

    while count != 4:
        if hasFourDistictPrimeFactors(i):
            count += 1
            if count == 1:
                firstNum = i
        else:
            count = 0
        i += 1

    return firstNum

print(firstFourConsecutiveIntegersWithFourDistinctPrimeFactors())
#134043

