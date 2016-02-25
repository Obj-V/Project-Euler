#Project_Euler_24.py
#Virata Yindeeyoungyeon
"""
A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
"""
def listPermutationRecursive(inputNumStr):
	outputList = []
	if len(inputNumStr) == 1:
		outputList.append(inputNumStr)
		return outputList

	insertCharStr = inputNumStr[len(inputNumStr)-1]
	remainingCharStr = inputNumStr[0:len(inputNumStr)-1]
	permutationList = listPermutationRecursive(remainingCharStr)

	for numStr in permutationList:
		tempStr = str(numStr)
		for i in xrange(0,len(tempStr)+1):
			permutedStr = tempStr[:i] + insertCharStr + tempStr[i:]
			outputList.append(permutedStr)
	return outputList

def millionthLexicographicPermutation(inputNumStr):
	permutationList = listPermutationRecursive(inputNumStr)
	permutationList = sorted(permutationList)
	return permutationList[999999]

print(millionthLexicographicPermutation("0123456789"))
#2783915460
