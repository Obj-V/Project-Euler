#Project_Euler_17.py
#Virata Yindeeyoungyeon
"""
 If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 
 If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 
 
 NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
"""

def setUpList():
	listDigits = []
	listDigits.append("zero")
	listDigits.append("one")
	listDigits.append("two")
	listDigits.append("three")
	listDigits.append("four")
	listDigits.append("five")
	listDigits.append("six")
	listDigits.append("seven")
	listDigits.append("eight")
	listDigits.append("nine")
	listDigits.append("ten")
	listDigits.append("eleven")
	listDigits.append("twelve")
	listDigits.append("thirteen")
	listDigits.append("fourteen")
	listDigits.append("fifteen")
	listDigits.append("sixteen")
	listDigits.append("seventeen")
	listDigits.append("eighteen")
	listDigits.append("nineteen")
	return listDigits

def numberLetterCounts(inputNum):
	listDigits = setUpList()
	sumStr = 0

	for i in xrange(1,inputNum+1):
		numStr = ""
		index = i

		if index >= 1000:
			thousandDigit = index/1000
			numStr += str(listDigits[thousandDigit])
			numStr += "thousand"
			index = index % 1000

		if index >= 100 and index <= 999:
			hundredDigit = index/100
			numStr += str(listDigits[hundredDigit])
			numStr += "hundred"
			index = index % 100
			if index > 0:
				numStr += "and"

		if index >= 20 and index <= 99:
			tenDigit = index/10
			if tenDigit == 9:
				tempStr = str(listDigits[9]) + "ty"
			elif tenDigit == 8:
				tempStr = str(listDigits[8]) + "y"
			elif tenDigit == 7:
				tempStr = str(listDigits[7]) + "ty"
			elif tenDigit == 6:
				tempStr = str(listDigits[6]) + "ty"
			elif tenDigit == 5:
				tempStr = "fifty"
			elif tenDigit == 4:
				tempStr = "forty"
			elif tenDigit == 3:
				tempStr = "thirty"
			elif tenDigit == 2:
				tempStr = "twenty"
			numStr += tempStr
			index = index % 10

		if index > 0 and index <= 19:
			numStr += listDigits[index]

		#print(numStr)
		sumStr += len(numStr) 

	return sumStr

print(numberLetterCounts(1000))
#21124