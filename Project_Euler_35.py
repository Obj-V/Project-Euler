#Project_Euler_35.py
#Virata Yindeeyoungyeon
"""
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
"""
import math

def isPrime(num):
    if num <= 1:
        return False
    if num == 2:
        return True

    squaredNum = int(math.sqrt(num))
    for i in xrange(2,squaredNum+1):
        if num % i == 0:
            return False
            
    return True

def allRotations(num):

    if not isPrime(num):
        return None

    rotationList = [num]
    numLength = len(str(num))
    rotatedDivisor = 10 ** (numLength-1)

    for i in xrange(0,numLength-1):
        currentNum = rotationList[i]
        rotatedDigit = currentNum / rotatedDivisor
        currentNum = currentNum % rotatedDivisor
        currentNum *= 10
        currentNum += rotatedDigit
        if not isPrime(currentNum):
            return None
        rotationList.append(currentNum)

    return rotationList

def circularPrime(upperLimit):
    setCircularPrime = set([])

    for i in xrange(0,upperLimit):
        result = allRotations(i)
        if result:
            for primeNum in result:
                setCircularPrime.add(primeNum)

    return len(setCircularPrime)

print(circularPrime(1000000))
#55

