#Project_Euler_46.py
#Virata Yindeeyoungyeon
"""
 It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
 
 9 = 7 + 2x1^2
 15 = 7 + 2x2^2
 21 = 3 + 2x3^2
 25 = 7 + 2x3^2
 27 = 19 + 2x2^2
 33 = 31 + 2x1^2
 
 It turns out that the conjecture was false.
 
 What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
"""
import math

def isOddCompositeNumber(num):
    if num % 2 == 0:
        return False

    upperLimit = int(math.sqrt(num)) + 1
    for i in xrange(2,upperLimit):
        if num % i == 0:
            return True

    return False

def isPrime(num):
    if num <= 1:
        return False

    upperLimit = int(math.sqrt(num)) + 1
    for i in xrange(2,upperLimit):
        if num % i == 0:
            return False

    return True

def isGoldbachConjecture(num,prime):
    #num = prime + (2 * x^2)
    total = 0
    i = 1

    while total < num:
        total = prime + (2 * i**2)
        i += 1

    if total == num:
        return True

    return False

def smallestGoldbachsOtherConjecture():
    i = 0
    primeList = []
    notFound = True
    while notFound:
        i += 1

        if isPrime(i):
            primeList.append(i)

        if isOddCompositeNumber(i):
            notFound = False
            for prime in primeList:
                if isGoldbachConjecture(i,prime):
                    notFound = True
                    break
    return i

print(smallestGoldbachsOtherConjecture())
#5777

