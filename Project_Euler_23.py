#Project_Euler_23.py
#Virata Yindeeyoungyeon
"""
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
"""
def isSumOfTwoAbundant(num, abundantList):
	i = 0
	j = len(abundantList) - 1
	while i <= j:
		sumAbundantNums = abundantList[i] + abundantList[j]
		if sumAbundantNums < num:
			i += 1
		elif sumAbundantNums > num:
			j -= 1
		else:
			return True
	return False

def nonAbundantSums(upperLimit):
	abundantList = []
	nonAbundantSum = 1

	for i in xrange(2,upperLimit+1):
		sumDivisors = 0
		for j in xrange(1,i):
			if (i%j == 0):
				sumDivisors += j

		if (sumDivisors > i):
			abundantList.append(i)

		if not isSumOfTwoAbundant(i, abundantList):
			nonAbundantSum += i
			
	return nonAbundantSum

print(nonAbundantSums(28123))
#4179871
