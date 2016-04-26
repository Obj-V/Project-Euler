#Project_Euler_42.py
#Virata Yindeeyoungyeon
"""
The nth term of the sequence of triangle numbers is given by, tn = 1/2n(n+1); so the first ten triangle numbers are:

1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.

Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
"""
import math

def nthTerm(wordVal):
     # wordVal = 1/2n(n+1)
     # (wordVal * 2) = n(n+1)
     # (wordVal * 2) = n^2 + n
     # 0 = n^2 + n - (wordVal * 2)
     
     # a = 1, b = 1, c = -(wordVal * 2)
     
     # Quadratic Formula
     # nthTerm = (-b +- sqrt(b^2 -4ac))/2

     a = 1
     b = 1
     c = -2 * wordVal 

     n = ((-1*b)+math.sqrt((b**2-(4*a*c))))/(2*a)

     return n

def wordValue(word):
    sumVal = 0
    for char in word:
        sumVal += ord(char) - 64
    return sumVal

def wordListFromPath(path):
    file_object = open(path)
    file_content = file_object.read()
    file_list = file_content.split(",")

    wordList = []
    for string in file_list:
        wordList.append(string.strip('"'))

    return wordList

def codedTriangleNumbers(path):
    triangleWords = 0
    wordList = wordListFromPath(path)
    
    for word in wordList:
        wordVal = wordValue(word)
        n = nthTerm(wordVal)
        if n == int(n):
            triangleWords += 1

    return triangleWords

print(codedTriangleNumbers("/Users/virata_ble/Desktop/Project Euler/Project_Euler_42/p042_words.txt"))
#162

