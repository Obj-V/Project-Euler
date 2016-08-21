#Project_Euler_50.py
#Virata Yindeeyoungyeon
"""
The prime 41, can be written as the sum of six consecutive primes:

41 = 2 + 3 + 5 + 7 + 11 + 13
This is the longest sum of consecutive primes that adds to a prime below one-hundred.

The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.

Which prime, below one-million, can be written as the sum of the most consecutive primes?
"""
import math

def isPrime(num):
    if num <= 1:
        return False
    if num == 2:
        return True

    upperLimit = int(math.sqrt(num) + 1)
    for i in xrange(2,upperLimit):
        if num % i == 0:
            return False

    return True

def primeList():
    pList = []
    for i in xrange(1,1000001):
        if isPrime(i):
            pList.append(i)
    return pList

def primeSumList(primeList):
    pSumList = [0]
    for i in xrange(0,len(primeList)):
        primeSum = pSumList[i] + primeList[i]
        if primeSum > 1000000:
            break
        pSumList.append(primeSum)
    return pSumList

def longestPrimeOfConsecutivePrimesBelowOneMillion():
    pList = primeList()
    pSumList = primeSumList(pList)

    primeCount = 0
    longestPrime = 2

    for i in xrange(0,len(pSumList)):
        primeSum = 0
        primeSumCount = 0
        for j in xrange(i+1,len(pSumList)):
            primeSum = pSumList[j] - pSumList[i]
            primeSumCount = j - i
            if primeSum > 1000000:
                break
            if primeSumCount > primeCount and isPrime(primeSum):
                primeCount = primeSumCount
                longestPrime = primeSum

    return longestPrime

print(longestPrimeOfConsecutivePrimesBelowOneMillion())
#997651

