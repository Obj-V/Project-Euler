#Project_Euler_34.py
#Virata Yindeeyoungyeon
"""
 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 
 Find the sum of all numbers which are equal to the sum of the factorial of their digits.
 
 Note: as 1! = 1 and 2! = 2 are not sums they are not included.
"""
def factorialList():
    factList = [1]
    for i in xrange(1,10):
        factorial = i * factList[i-1]
        factList.append(factorial)
    return factList

def sumDigitFactorials(num, factList):
    sumDigitFactorial = 0
    while num > 0:
        digit = num % 10
        sumDigitFactorial += factList[digit]
        num = num / 10
    return sumDigitFactorial

def sumNumberDigitFactorials():
    sumNumberDigitFactorial = 0
    upperLimit = 10**7
    factList = factorialList()

    for i in xrange(3,upperLimit):
        sumFactorial = sumDigitFactorials(i, factList)
        if sumFactorial == i:
            sumNumberDigitFactorial += i
    return sumNumberDigitFactorial

print(sumNumberDigitFactorials())
#40730

