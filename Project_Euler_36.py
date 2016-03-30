#Project_Euler_36.py
#Virata Yindeeyoungyeon
"""
The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)
"""
def isPalindromic(num):
    strNum = str(num)
    strNumLength = len(str(num))
    i = 0
    j = strNumLength - 1

    while i < j:
        if strNum[i] != strNum[j]:
            return False
        i += 1
        j -= 1

    return True

def binaryInt(num):
    return bin(num)[2:]

def doublebasePalindromes(upperLimit):
    sumPalindromes = 0
    for i in xrange(0,upperLimit):
        if isPalindromic(i) and isPalindromic(binaryInt(i)):
            sumPalindromes += i
    return sumPalindromes

print(doublebasePalindromes(1000000))
#872187

