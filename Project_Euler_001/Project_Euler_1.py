#Project_Euler_1.py
#Virata Yindeeyoungyeon

#If we list all the natural numbers below 10 that are multiples of 3 or 5, 
#we get 3, 5, 6 and 9. The sum of these multiples is 23.
#Find the sum of all the multiples of 3 or 5 below 1000.

def findSumOfMultiple(upperLimit, multiple1, multiple2):

	sum = 0

	for index in range(0,upperLimit):
		if (index % multiple1 == 0) or (index % multiple2 == 0):
			sum += index

	return sum

print(findSumOfMultiple(1000, 3, 5)) #233168



