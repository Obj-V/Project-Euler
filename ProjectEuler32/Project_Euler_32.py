#Project_Euler_32.py
#Virata Yindeeyoungyeon
"""
We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 x 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
"""

def isPandigital(m,n):
    product = m * n
    string = str(m) + str(n) + str(product)
    sortedString = ''.join(sorted(string))

    if sortedString == "123456789":
        return True
    return False

def pandigitalProducts():
    sumPandigitalProducts = 0
    productList = []

    for i in xrange(1,100):
        for j in xrange(100,10000):
            if isPandigital(i,j):
                product = i * j
                if not product in productList:
                    productList.append(product)
                    sumPandigitalProducts += product
    return sumPandigitalProducts

print(pandigitalProducts())
#45228

