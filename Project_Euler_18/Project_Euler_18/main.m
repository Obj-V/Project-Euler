//
//  main.m
//  Project_Euler_18
//
//  Created by Virata Yindeeyoungyeon on 1/13/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
 
 3
 7 4
 2 4 6
 8 5 9 3
 
 That is, 3 + 7 + 4 + 9 = 23.
 
 Find the maximum total from top to bottom of the triangle below:
 
 75
 95 64
 17 47 82
 18 35 87 10
 20 04 82 47 65
 19 01 23 75 03 34
 88 02 77 73 07 63 67
 99 65 04 28 06 16 70 92
 41 41 26 56 83 40 80 70 33
 41 48 72 33 47 32 37 16 94 29
 53 71 44 65 25 43 91 52 97 51 14
 70 11 33 28 77 73 17 78 39 68 17 57
 91 71 52 38 17 14 91 43 58 50 27 29 48
 63 66 04 68 89 53 67 30 73 16 69 87 40 31
 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
 */

#import <Foundation/Foundation.h>

int pathSum(int rowNum, int colNum, NSArray *doubleArray);

int maximumPathSum(NSString *inputString)
{
    NSMutableArray *strArray = [[inputString componentsSeparatedByString:@" "] mutableCopy];
    
    //Create doubleArray
    NSMutableArray *doubleArray = [[NSMutableArray alloc] init];
    int i = 0;
    while ([strArray count] != 0) {
        NSMutableArray *rowArray = [[NSMutableArray alloc] init];
        for (int j = 0; j <= i; j++) {
            int number = [strArray[0] intValue];
            [rowArray addObject:[NSNumber numberWithInt:number]];
            [strArray removeObjectAtIndex:0];
        }
        [doubleArray addObject:rowArray];
        i++;
    }
    
    //Recursive
    int totalSum = pathSum(0, 0, doubleArray);
    return totalSum;
}

int pathSum(int rowNum, int colNum, NSArray *doubleArray)
{
    int currentSum = [doubleArray[rowNum][colNum] intValue];
    
    if (rowNum >= [doubleArray count]-1) {
        return currentSum;
    }
    
    int leftSum = pathSum(rowNum+1, colNum,doubleArray);
    int rightSum = pathSum(rowNum+1, colNum+1,doubleArray);
    
    if (leftSum >= rightSum) {
        return currentSum + leftSum;
    } else {
        return currentSum + rightSum;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", maximumPathSum(@"75 95 64 17 47 82 18 35 87 10 20 04 82 47 65 19 01 23 75 03 34 88 02 77 73 07 63 67 99 65 04 28 06 16 70 92 41 41 26 56 83 40 80 70 33 41 48 72 33 47 32 37 16 94 29 53 71 44 65 25 43 91 52 97 51 14 70 11 33 28 77 73 17 78 39 68 17 57 91 71 52 38 17 14 91 43 58 50 27 29 48 63 66 04 68 89 53 67 30 73 16 69 87 40 31 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"));
        //1074
    }
    return 0;
}
