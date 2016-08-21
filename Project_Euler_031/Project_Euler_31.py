#Project_Euler_31.py
#Virata Yindeeyoungyeon
"""
In England the currency is made up of pound and pence and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, 1pound (100p) and 2pound (200p).
It is possible to make 2pound in the following way:

1xpound1 + 1x50p + 2x20p + 1x5p + 1x2p + 3x1p
How many different ways can 2pound be made using any number of coins?
"""
def coinSums(pound,pence):
    totalPence = (pound * 100) + pence
    coins = [1,2,5,10,20,50,100,200]

    ways = [1]
    for x in xrange(0,totalPence):
        ways.append(0)

    for coin in coins:
        for i in xrange(coin,totalPence+1):
            ways[i] += ways[i-coin]

    return ways.pop()

print(coinSums(2,0))
#73682

