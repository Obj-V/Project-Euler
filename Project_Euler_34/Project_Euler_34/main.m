//
//  main.m
//  Project_Euler_34
//
//  Created by Virata Yindeeyoungyeon on 3/23/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
 
 Find the sum of all numbers which are equal to the sum of the factorial of their digits.
 
 Note: as 1! = 1 and 2! = 2 are not sums they are not included.
 */

#import <Foundation/Foundation.h>
NSArray* factorial()
{
    NSMutableArray *factorialArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        int factorialNum;
        if (i == 0) {
            factorialNum = 1;
        } else {
            factorialNum = i * [factorialArray[i-1] intValue];
        }
        [factorialArray addObject:@(factorialNum)];
    }
    
    return [factorialArray copy];
}

int sumDigitFactorials(int num, NSArray *factorialArray)
{
    int sum = 0;
    while (num > 0) {
        int digit = num % 10;
        sum += [factorialArray[digit] intValue];
        num = num / 10;
    }
    return sum;
}

int sumNumberDigitFactorials()
{
    int sum = 0;
    int upperLimit = (int)pow(10, 7);
    NSArray *factorialArray = factorial();
    
    for (int i = 3; i < upperLimit; i++) {
        int sumFactorials = sumDigitFactorials(i, factorialArray);
        if (sumFactorials == i) {
            sum += i;
        }
    }
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", sumNumberDigitFactorials());
        //40730
    }
    return 0;
}
