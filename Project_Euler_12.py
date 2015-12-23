#Project_Euler_12.py
#Virata Yindeeyoungyeon

"""
The sequence of triangle numbers is generated by adding the natural numbers. So the 7th triangle number would be 1 + 2 + 3 + 4 + 5 + 6 + 7 = 28. The first ten terms would be:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

Let us list the factors of the first seven triangle numbers:

 1: 1
 3: 1,3
 6: 1,2,3,6
10: 1,2,5,10
15: 1,3,5,15
21: 1,3,7,21
28: 1,2,4,7,14,28
We can see that 28 is the first triangle number to have over five divisors.

What is the value of the first triangle number to have over five hundred divisors?
"""
import math
def numDivisors(num):
	countDivisors = 0

	if num == 1:
		return 1

	sqrtNum = int(math.sqrt(num))
	factor = 1
	while (factor <= sqrtNum):
		if (num % factor == 0):
			countDivisors += 2
		factor += 1

	return countDivisors

def highlyDivisibleTriangularNumber(numberOfDivisors):
	countDivisors = 0
	i = 2
	sumValue = 0

	while (countDivisors < numberOfDivisors):
		countDivisors = 0
		sumValue = 0
		for index in xrange(1,i):
			sumValue += index
		countDivisors = numDivisors(sumValue)
		i += 1
	return sumValue

print(highlyDivisibleTriangularNumber(500))
#76576500
		