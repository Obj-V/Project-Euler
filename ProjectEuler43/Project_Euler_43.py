#Project_Euler_43.py
#Virata Yindeeyoungyeon
"""
The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:

d2d3d4=406 is divisible by 2
d3d4d5=063 is divisible by 3
d4d5d6=635 is divisible by 5
d5d6d7=357 is divisible by 7
d6d7d8=572 is divisible by 11
d7d8d9=728 is divisible by 13
d8d9d10=289 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
"""
def hasDivisibilityProperty(num):
    divisors = [1,2,3,5,7,11,13,17]

    numStr = str(num)

    for i in xrange(1,8):
        subStr = numStr[i:i+3]
        currentNum = int(subStr)
        divisor = divisors[i]
        if currentNum % divisor != 0:
            return False

    return True

def isPandigitalNumber(num):
    if len(str(num)) < 10: 
        return False

    numList = []

    while num > 0:
        digit = num % 10
        if digit in numList:
            return False
        numList.append(digit)
        num = num / 10

    return True

def listPermutationRecursive(numStr):
    outputList = []
    if len(numStr) == 1:
        outputList.append(numStr)
        return outputList

    insertedStr = numStr[len(numStr)-1]
    remainingStr = numStr[:len(numStr)-1]
    permutationList = listPermutationRecursive(remainingStr)

    for pStr in permutationList:
        for i in xrange(0,len(pStr)+1):
            permutatedStr = pStr[:i] + insertedStr + pStr[i:]
            outputList.append(permutatedStr)

    return outputList

def subStringDivisibility():
    sumPandigitalNumbers = 0
    numList = listPermutationRecursive("0123456789")

    for numStr in numList:
        num = int(numStr)
        if isPandigitalNumber(num) and hasDivisibilityProperty(num):
            sumPandigitalNumbers += num

    return sumPandigitalNumbers

print(subStringDivisibility())
#16695334890

