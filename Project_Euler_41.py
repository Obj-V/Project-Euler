#Project_Euler_41.py
#Virata Yindeeyoungyeon
"""
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.

What is the largest n-digit pandigital prime that exists?
"""
import math

def isPandigital(num):
    pandigitalList = [1,2,3,4,5,6,7,8,9]
    numList = []

    while num > 0:
        digit = num % 10
        numList.append(digit)
        num = num / 10

    subPandigitalList = pandigitalList[:len(numList)];

    if set(numList) == set(subPandigitalList):
        return True

    return False


def isPrime(num):
    if num <= 1:
        return False

    upperBound = int(math.sqrt(num)) + 1
    for i in xrange(2,upperBound):
        if num % i == 0:
            return False

    return True

def isSumDividedByThree(num):
    sumNum = 0
    while num > 0:
        digit = num % 10
        sumNum += digit
        num = num / 10

    if sumNum % 3 == 0:
        return True
    return False

def largestPandigitalPrime():
    maxPandigitalPrime = -1

    #If a sum of all the digits of a number can be divided by 3, the number can be divided by 3. Thus, it's not a prime number
    #1+2+3 = 6 ---> 6 can be divided by 3, so 123 is not a prime number
    num = 123456789
    while isSumDividedByThree(num):
        num = num / 10

    lowerBound = num
    upperBound = 0

    #Reverse num to get the upper bound
    while num > 0:
        digit = num % 10
        upperBound = upperBound * 10 + digit
        num = num / 10

    i = upperBound
    while not (isPrime(i) and isPandigital(i) and maxPandigitalPrime < i) and lowerBound <= i:
        i -= 1
    maxPandigitalPrime = i

    return maxPandigitalPrime

print(largestPandigitalPrime())
#7652413

