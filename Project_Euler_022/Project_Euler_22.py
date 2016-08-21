#Project_Euler_22.py
#Virata Yindeeyoungyeon
"""
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
"""
def wordValue(word):
	sumWordValue = 0
	for char in word:
		sumWordValue += ord(char)-64
	return sumWordValue

def sumAmicableNumbers():
	file_object = open("/Users/virata_ble/Desktop/Project Euler/Project_Euler_22/p022_names.txt")
	file_string = file_object.read()
	file_string_List = file_string.split(",")

	stringList = []
	for nameString in file_string_List:
		stringList.append(nameString.strip('"'))
	stringList.sort()

	wordDict = {}
	index = 1
	sumNameScores = 0
	for nameString in stringList:
		if not wordDict.has_key(nameString):
			wordDict[nameString] = wordValue(nameString)
		nameScore = wordDict[nameString] * index
		sumNameScores += nameScore
		index += 1

	return sumNameScores

print(sumAmicableNumbers())
#871198282
