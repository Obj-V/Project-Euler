#Project_Euler_3.py
#Virata Yindeeyoungyeon

#The prime factors of 13195 are 5, 7, 13 and 29.
#What is the largest prime factor of the number 600851475143 ?

import math

def largestPrimeFactor(number):
	factor = 2
	upperLimit = int(math.sqrt(number))

	while (factor <= upperLimit):
		if (number % factor == 0):
			new_number = number / factor
			return largestPrimeFactor(new_number)
		else:
			factor += 1
	return number

print(largestPrimeFactor(13195)) #29
print(largestPrimeFactor(600851475143)) #6857
		