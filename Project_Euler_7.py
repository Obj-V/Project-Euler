#Project_Euler_7.py
#Virata Yindeeyoungyeon

"""
By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.

What is the 10 001st psime number?
"""
import math

def primePosition(position):
	count = 0;
	num = 1;

	while (count < position):
		num += 1
		if (isPrime(num)):
			count += 1
	return num

def isPrime(num):
	factor = 2;
	while (factor * factor <= num):
		if (num % factor == 0):
			return False
		factor += 1
	return True

print(primePosition(10001)); #104743

		