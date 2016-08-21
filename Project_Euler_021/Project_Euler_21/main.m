//
//  main.m
//  Project_Euler_21
//
//  Created by Virata Yindeeyoungyeon on 2/17/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
 If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
 
 For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
 
 Evaluate the sum of all the amicable numbers under 10000.
 */
#import <Foundation/Foundation.h>

int d(int n)
{
    int sum = 0;
    for (int i = 1; i < n; i++) {
        if (n%i == 0) {
            sum += i;
        }
    }
    return sum;
}

int sumAmicableNumbers(int n)
{
    NSMutableSet *amicableSet = [[NSMutableSet alloc] init];
    int sumAmicable = 0;
    
    for (int i = 1; i < n; i++) {
        if (![amicableSet containsObject:@(i)]) {
            int sumI = d(i);
            int sumDI = d(sumI);
            if (i != sumI && i == sumDI && sumI < n) {
                [amicableSet addObject:@(i)];
                [amicableSet addObject:@(sumI)];
                sumAmicable += i;
                sumAmicable += sumI;
            }
        }
    }
    
    return sumAmicable;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", sumAmicableNumbers(10000));
        //31626
    }
    return 0;
}
