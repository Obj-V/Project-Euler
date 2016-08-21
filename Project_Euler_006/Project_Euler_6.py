#Project_Euler_6.py
#Virata Yindeeyoungyeon

"""
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
"""
import math

def sumSquareDifference(num):
	listNum = range(1, num+1)
	sumOfSquares = 0;
	squareOfSum = 0;

	for i in listNum:
		sumOfSquares += i ** 2
		squareOfSum += i
	squareOfSum = squareOfSum ** 2

	return (squareOfSum - sumOfSquares)

print(sumSquareDifference(100)); #25164150

		