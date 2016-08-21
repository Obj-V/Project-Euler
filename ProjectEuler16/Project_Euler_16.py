#Project_Euler_16.py
#Virata Yindeeyoungyeon
"""
215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 21000?
"""

def powerDigitSum(powerOfTwoInt):
	powerOfTwo = pow(2, powerOfTwoInt)

	digitSum = 0
	while powerOfTwo!=0:
		remainder = powerOfTwo % 10 
		digitSum = digitSum + remainder
		powerOfTwo = powerOfTwo/10

	return digitSum

print(powerDigitSum(1000))
#1366