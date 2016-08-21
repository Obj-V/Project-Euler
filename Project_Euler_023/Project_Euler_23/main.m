//
//  main.m
//  Project_Euler_23
//
//  Created by Virata Yindeeyoungyeon on 2/22/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
 
 A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
 
 As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
 
 Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
 */

#import <Foundation/Foundation.h>

BOOL isSumOfTwoAbundant(int num, NSArray *abundantArray)
{
    int i = 0;
    int j = (int)[abundantArray count] - 1;
    
    while (i <= j) {
        int sum = [abundantArray[i] intValue] + [abundantArray[j] intValue];
        if (sum < num) {
            i++;
        } else if (sum > num) {
            j--;
        } else {
            return YES;
        }
    }
    return NO;
}

int nonAbundantSums(int upperLimit)
{
    NSMutableArray *abundantArray = [[NSMutableArray alloc] init];
    int sum = 1;
    
    for (int i = 2; i <= upperLimit; i++) {
        int sumDivisors = 0;
        for (int j = 1; j < i; j++) {
            if (i%j == 0) {
                sumDivisors += j;
            }
        }
        
        if (sumDivisors > i) {
            [abundantArray addObject:@(i)];
        }
        
        if (!isSumOfTwoAbundant(i, abundantArray)) {
            sum += i;
        }
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", nonAbundantSums(28123));
        //4179871
    }
    return 0;
}
