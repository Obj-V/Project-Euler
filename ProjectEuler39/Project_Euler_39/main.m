//
//  main.m
//  Project_Euler_39
//
//  Created by Virata Yindeeyoungyeon on 4/13/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120.
 
 {20,48,52}, {24,45,51}, {30,40,50}
 
 For which value of p ≤ 1000, is the number of solutions maximised?
 */

#import <Foundation/Foundation.h>

int integerRightTriangles(int upperLimit)
{
    int maxSolutions = 0;
    int maxPValue = 1;
    
    NSMutableArray *numArray = [[NSMutableArray alloc] init];
    for (int pValue = 1; pValue <= upperLimit; pValue++) {
        [numArray addObject:@(pValue)];
        
        int numberOfSolutions = 0;
        int i = 0;
        int j = (int)[numArray count] - 1;
        
        while (i < j) {
            //a2 + b2 == c2
            //b2 == c2-a2
            //pValue == a+b+c
            //(pValue-a-c)^2 == c2-a2
            int a = [numArray[i] intValue];
            int a2 = (int)pow(a, 2);
            int c = [numArray[j] intValue];
            int c2 = (int)pow(c, 2);
            int b2 = (int)pow(pValue-a-c, 2);
            
            if (c2-a2 == b2) {
                numberOfSolutions++;
                i++;
                j--;
            } else if (c2-a2 < b2) {
                i++;
            } else if (c2-a2 > b2) {
                j--;
            }
        }
        
        if (numberOfSolutions > maxSolutions) {
            maxSolutions = numberOfSolutions;
            maxPValue = pValue;
        }
    }
    
    return maxPValue;
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", integerRightTriangles(1000));
        //840
    }
    return 0;
}
