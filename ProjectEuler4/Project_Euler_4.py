#Project_Euler_4.py
#Virata Yindeeyoungyeon

# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 x 99.

# Find the largest palindrome made from the product of two 3-digit numbers.

def largestPalindrome(digit):
	highestPolindrome = 0

	for i in range(pow(10,digit) - 1, 0, -1):
		for j in range(pow(10,digit) - 1, 0, -1):
			result = i * j
			if checkResult(result) and result > highestPolindrome:
				highestPolindrome = result

	return highestPolindrome

def checkResult(result):
	numStr = str(result);
	reverseNumStr = numStr[::-1]

	if numStr == reverseNumStr:
		return True
	return False

print(largestPalindrome(3)); #906609
		