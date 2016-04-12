#Project_Euler_38.py
#Virata Yindeeyoungyeon
"""
 Take the number 192 and multiply it by each of 1, 2, and 3:
 
 192 x 1 = 192
 192 x 2 = 384
 192 x 3 = 576
 By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
 
 The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
 
 What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
"""
def isPandigital(num):
    pandigitalList = [1,2,3,4,5,6,7,8,9];
    numList = []
    while num > 0:
        n = num % 10
        numList.append(n)
        num = num / 10
    if set(pandigitalList) == set(numList):
        return True
    return False

def largestPandigitalMultiples():
    largestPandigital = 1
    for i in xrange(1,10000):
        n = 1
        currentNum = 0
        while len(str(currentNum)) < 9:
            product = i * n
            currentNum *= 10 ** len(str(product))
            currentNum += product
            n += 1
        if len(str(currentNum)) == 9 and isPandigital(currentNum) and currentNum > largestPandigital:
            largestPandigital = currentNum
    return largestPandigital

print(largestPandigitalMultiples())
#932718654

