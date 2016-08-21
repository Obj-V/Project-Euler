#Project_Euler_9.py
#Virata Yindeeyoungyeon

"""
 A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 
 a2 + b2 = c2
 For example, 32 + 42 = 9 + 16 = 25 = 52.
 
 There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 Find the product abc.
"""
import math
def specialPythagoreanTriplet(sumTriplet):
	product = 0

	b = int(sumTriplet/3)
	c = b + 1
	a = int(math.sqrt(pow(c, 2) - pow(b, 2)))

	while (a+b+c < sumTriplet):
		for i in range(a,b):
			for j in range(b,c+1):
				k = c
				powI = pow(i,2)
				powJ = pow(j,2)
				powK = pow(k,2)
				if (powI+powJ==powK and i+j+k==sumTriplet):
					product = i * j * k
					return product
		c += 1

	return product

print(specialPythagoreanTriplet(1000))
#31875000 

		