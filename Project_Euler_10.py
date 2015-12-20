#Project_Euler_9.py
#Virata Yindeeyoungyeon

"""
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"""

def sumOfPrimes(upperLimit):
	sumPrimes = 0

	boolList = [True] * upperLimit
	boolList[0] = False 
	boolList[1] = False

	for i in range(0,len(boolList)):
		if boolList[i] == True:
			for j in range(i+i,upperLimit,i):
				boolList[j] = False

	for k in range(0,len(boolList)):
		if boolList[k] == True:
			sumPrimes += k

	return sumPrimes

print(sumOfPrimes(2000000))
#142913828922

		