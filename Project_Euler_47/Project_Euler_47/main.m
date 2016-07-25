//
//  main.m
//  Project_Euler_47
//
//  Created by Virata Yindeeyoungyeon on 6/12/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The first two consecutive numbers to have two distinct prime factors are:
 
 14 = 2 × 7
 15 = 3 × 5
 
 The first three consecutive numbers to have three distinct prime factors are:
 
 644 = 2² × 7 × 23
 645 = 3 × 5 × 43
 646 = 2 × 17 × 19.
 
 Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
 */

#import <Foundation/Foundation.h>

NSArray *globalPrimeArray;

BOOL isPrime(int num)
{
    if (num <= 1) {
        return NO;
    }
    
    for (int i = 2; i <= (int)sqrt(num); i++) {
        if (num % i == 0) {
            return NO;
        }
    }
    
    return YES;
}

NSArray* primeFactorArray()
{
    if (!globalPrimeArray) {
        NSMutableArray *primeArray = [[NSMutableArray alloc] init];
        for (int i = 2; i < 1000; i++) {
            if (isPrime(i)) {
                [primeArray addObject:@(i)];
            }
        }
        globalPrimeArray = [primeArray copy];
    }
    
    return globalPrimeArray;
}

BOOL hasFourDistictPrimeFactors(int n)
{
    int count = 0;
    int i = 4;
    int num = n;
    NSArray *primeArray = primeFactorArray();
    NSMutableArray *distinctPrimeArray = [[NSMutableArray alloc] init];
    
    while (i > 0) {
        for (NSNumber *prime in primeArray) {
            if (num % [prime integerValue] == 0) {
                num = num / [prime integerValue];
                if (![distinctPrimeArray containsObject:prime]) {
                    [distinctPrimeArray addObject:prime];
                    count++;
                } else {
                    i++;
                }
                break;
            }
        }
        i--;
    }
    
    if (num != 1 || count != 4) {
        return NO;
    }
    
    return YES;
}

int firstFourConsecutiveIntegersWithFourDistinctPrimeFactors()
{
    int count = 0;
    int i = 1000;
    int firstNum = 1;
    
    while (count != 4) {
        if (hasFourDistictPrimeFactors(i)) {
            count++;
            if (count == 1) {
                firstNum = i;
            }
        } else {
            count = 0;
        }
        i++;
    }
    
    return firstNum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", firstFourConsecutiveIntegersWithFourDistinctPrimeFactors());
        //134043
    }
    return 0;
}
