#Project_Euler_15.py
#Virata Yindeeyoungyeon
"""
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
How many such routes are there through a 20×20 grid?
"""

def latticePaths(grid):
	listGrid = []
	for i in xrange(0,grid):
		innerList = []
		for j in xrange(0,grid):
			if (i-1 < 0):
				num1 = 1
			if (j-1 < 0):
				num2 = 1
			if (i-1 >= 0):
				num1 = listGrid[i-1][j]
			if (j-1 >= 0):
				num2 = innerList[j-1]
			innerList.append(num1 + num2)
		listGrid.append(innerList)

	return listGrid[grid-1][grid-1];

print(latticePaths(20))
#137846528820