//
//  main.m
//  Project_Euler_46
//
//  Created by Virata Yindeeyoungyeon on 5/1/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
 
 9 = 7 + 2×1^2
 15 = 7 + 2×2^2
 21 = 3 + 2×3^2
 25 = 7 + 2×3^2
 27 = 19 + 2×2^2
 33 = 31 + 2×1^2
 
 It turns out that the conjecture was false.
 
 What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
 */

#import <Foundation/Foundation.h>

BOOL isOddCompositeNumber(int num)
{
    if (num % 2 == 0) {
        return NO;
    }
    
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) {
            return YES;
        }
    }
    
    return NO;
}

BOOL isPrime(int num)
{
    if (num <= 1) {
        return NO;
    }
    
    for (int i = 2; i <= sqrt(num); i++) {
        if (num % i == 0) {
            return NO;
        }
    }
    
    return YES;
}

BOOL isGoldbachConjecture(int num, int prime)
{
    //num = prime + (2 * x^2)
    int total = 0;
    int i = 1;
    while (total < num) {
        total = prime + (2 * pow(i, 2));
        i += 1;
    }
    
    if (total == num) {
        return YES;
    }
    
    return NO;
}

int smallestGoldbachsOtherConjecture()
{
    
    int i = 0;
    NSMutableArray *primeNumbers = [[NSMutableArray alloc] init];
    
    BOOL notFound = YES;
    while (notFound) {
        i += 1;
        
        if (isPrime(i)) {
            [primeNumbers addObject:@(i)];
        }
        
        if (isOddCompositeNumber(i)) {
            notFound = NO;
            for (NSNumber *primeNum in primeNumbers) {
                int prime = [primeNum intValue];
                if (isGoldbachConjecture(i, prime)) {
                    notFound = YES;
                    break;
                }
            }
        }
    }
    
    return i;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", smallestGoldbachsOtherConjecture());
        //5777
    }
    return 0;
}
