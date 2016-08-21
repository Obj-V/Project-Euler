#Project_Euler_18.py
#Virata Yindeeyoungyeon
"""
n! means n x (n - 1) x ... x 3 x 2 x 1

For example, 10! = 10 x 9 x ... x 3 x 2 x 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
"""

def computeDigitSumFactorial(factorialNum):
	if factorialNum == 0:
		return 0

	total = 1
	while factorialNum > 0:
		total = total * factorialNum
		factorialNum -= 1

	digitSum = 0
	while total > 0:
		digitSum += total%10
		total = total/10

	return digitSum

print(computeDigitSumFactorial(100))
#648