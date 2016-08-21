#Project_Euler_40.py
#Virata Yindeeyoungyeon
"""
 An irrational decimal fraction is created by concatenating the positive integers:
 
 0.123456789101112131415161718192021...
 
 It can be seen that the 12th digit of the fractional part is 1.
 
 If dn represents the nth digit of the fractional part, find the value of the following expression.
 
 d1 x d10 x d100 x d1000 x d10000 x d100000 x d1000000
"""
def ChampernowneConstant():
    value = 1
    numStr = ""
    i = 1
    while len(numStr) < 1000000:
        numStr += str(i)
        i += 1

    j = 0
    while j <= 6:
        index = 10 ** j - 1
        value *= int(numStr[index])
        j += 1
        
    return value

print(ChampernowneConstant())
#210

