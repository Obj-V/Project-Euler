#Project_Euler_39.py
#Virata Yindeeyoungyeon
"""
If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.

{20,48,52}, {24,45,51}, {30,40,50}

For which value of p <= 1000, is the number of solutions maximised?
"""
def intergerRightTriangles(upperLimit):
    maxSolutions = 0
    maxPValue = 1

    numList = []
    for pValue in xrange(1,upperLimit+1):
        numList.append(pValue)

        numberOfSolutions = 0
        i = 0
        j = len(numList) - 1

        while i < j:
            a = numList[i]
            a2 = a ** 2
            c = numList[j]
            c2 = c ** 2
            b2 =  (pValue - a - c) ** 2

            if c2-a2 == b2:
                numberOfSolutions += 1
                i += 1
                j -= 1
            elif c2-a2 < b2:
                i += 1
            else: #c2-a2 > b2
                j -= 1

            if numberOfSolutions > maxSolutions:
                maxSolutions = numberOfSolutions
                maxPValue = pValue
                
    return maxPValue

print(intergerRightTriangles(1000))
#840

