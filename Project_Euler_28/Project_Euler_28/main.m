//
//  main.m
//  Project_Euler_28
//
//  Created by Virata Yindeeyoungyeon on 3/7/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
 
 21 22 23 24 25
 20  7  8  9 10
 19  6  1  2 11
 18  5  4  3 12
 17 16 15 14 13
 
 It can be verified that the sum of the numbers on the diagonals is 101.
 
 What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
 */

#import <Foundation/Foundation.h>

int SumNumberSpiralDiagonals (int spiralNum)
{
    int upperLimit = spiralNum * spiralNum;
    int i = 1;
    int sum = i;
    int diagonalInteval = 2;
    
    while (i < upperLimit) {
        for (int j = 1; j <= 4; j++) {
            i += diagonalInteval;
            sum += i;
        }
        diagonalInteval += 2;
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", SumNumberSpiralDiagonals(1001));
        //669171001
    }
    return 0;
}
