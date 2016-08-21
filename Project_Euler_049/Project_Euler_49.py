#Project_Euler_49.py
#Virata Yindeeyoungyeon
"""
 The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
 
 There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
 
 What 12-digit number do you form by concatenating the three terms in this sequence?
"""
import math
from sets import Set

def isPermutation(num1, num2):
    set1 = Set([])
    set2 = Set([])

    while num1 > 0:
        set1.add(num1%10)
        set2.add(num2%10)
        num1 = num1/10
        num2 = num2/10


    if set1 != set2:
        return False

    return True 

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
    for i in xrange(1000,10000):
        if isPrime(i):
            pList.append(i)
    return pList

def primePermutationSequence():
    pList = primeList()
    outputList = []

    for i in xrange(0,len(pList)):
        for j in xrange(i+1,len(pList)):
            if isPermutation(pList[i], pList[j]):
                firstNum = pList[i]
                secondNum = pList[j]
                difference = secondNum - firstNum
                thirdNum = secondNum + difference
                if thirdNum in pList and isPermutation(secondNum, thirdNum):
                    outputStr = str(firstNum)+str(secondNum)+str(thirdNum)
                    outputList.append(outputStr)

    return outputList

print(primePermutationSequence())
#296962999629

