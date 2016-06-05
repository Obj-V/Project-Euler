#Project_Euler_33.py
#Virata Yindeeyoungyeon
"""
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
"""

def isNonTrivialFraction(num, denom):
    if num >= denom:
        return False

    expectedResult = float(num) / denom

    numList = list(str(num))
    denomList = list(str(denom))

    for n in numList:
        if n != "0" and n in denomList:
            numList.remove(n)
            denomList.remove(n)
            break

    if len(numList) > 1 or len(denomList) > 1:
        return False

    numFraction = int(numList[0])
    denomFraction = int(denomList[0])

    if denomFraction == 0 or numFraction > denomFraction:
        return False

    result = float(numFraction) / denomFraction
    if result == expectedResult:
        return True

    return False

def GCD(a,b):
    divisor = a if a < b else b
    divided = b if a < b else a

    while divided % divisor != 0:
        divided = divisor
        divisor = divided % divisor

    return divisor

def denominatorForProductOfFourNonTrivailFractions():
    numProduct = 1
    denomProduct = 1
    for num in xrange(10,100):
        for denom in xrange(10,100):
            if isNonTrivialFraction(num, denom):
                numProduct *= num
                denomProduct *= denom

    gcd = GCD(numProduct, denomProduct)
        
    return denomProduct / gcd

print(denominatorForProductOfFourNonTrivailFractions())
#100

