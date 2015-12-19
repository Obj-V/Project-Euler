#Project_Euler_5.py
#Virata Yindeeyoungyeon

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
import math

def smallestNumberForEvenlyDivisible(fromInt, toInt):
	notFoundNumber = True
	smallest = toInt
	listNum = range(fromInt, toInt+1)

	while notFoundNumber:
		for i in listNum:
			if smallest % i != 0:
				notFoundNumber = True
				smallest += toInt
				break
			else:
				notFoundNumber = False
	return smallest
print(smallestNumberForEvenlyDivisible(1,20)); #232792560
		