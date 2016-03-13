//
//  main.m
//  Project_Euler_30
//
//  Created by Virata Yindeeyoungyeon on 3/13/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:
 
 1634 = 14 + 64 + 34 + 44
 8208 = 84 + 24 + 04 + 84
 9474 = 94 + 44 + 74 + 44
 As 1 = 14 is not a sum it is not included.
 
 The sum of these numbers is 1634 + 8208 + 9474 = 19316.
 
 Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
 */

#import <Foundation/Foundation.h>

int digitFifthPowers()
{
    int sum = 0;
    int upperLimit = pow(9, 5) * 5;
    
    for (int i = 2; i < upperLimit; i++) {
        int currentNum = i;
        int sumNum = 0;
        while (currentNum > 0) {
            int digit = currentNum % 10;
            sumNum += pow(digit, 5);
            currentNum = currentNum / 10;
        }
        if (sumNum == i) {
            sum += i;
        }
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", digitFifthPowers());
        //443839
    }
    return 0;
}
