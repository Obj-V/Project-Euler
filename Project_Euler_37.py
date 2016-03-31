#Project_Euler_37.py
#Virata Yindeeyoungyeon
"""
 The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
 
 Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
 
 NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
"""
import math

def isPrime(num):
    if num <= 1:
        return False
    if num == 2:
        return True
    for i in xrange(2,int(math.sqrt(num))+1):
        if num % i == 0:
            return False
    return True

def leftAndRightPrimes(num):
    leftTenthPower = len(str(num)) - 1
    leftCurrentNum = num

    rightTenthPower = 1
    rightCurrentNum = num

    while leftCurrentNum > 0 and rightCurrentNum > 0 and leftTenthPower >= 0:
        if isPrime(leftCurrentNum) and isPrime(rightCurrentNum):
            leftCurrentNum = leftCurrentNum % (10 ** leftTenthPower)
            rightCurrentNum = rightCurrentNum / (10 ** rightTenthPower)
            leftTenthPower -= 1
        else:
            return False
    return True

def truncatablePrimes(limit):
    sumTruncatablePrimes = 0
    count = limit
    i = 10
    while count > 0:
        if isPrime(i) and leftAndRightPrimes(i):
            sumTruncatablePrimes += i
            count -= 1
        i += 1
    return sumTruncatablePrimes

print(truncatablePrimes(11))
#748317

