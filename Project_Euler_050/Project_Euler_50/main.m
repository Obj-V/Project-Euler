//
//  main.m
//  Project_Euler_50
//
//  Created by Virata Yindeeyoungyeon on 8/20/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The prime 41, can be written as the sum of six consecutive primes:
 
 41 = 2 + 3 + 5 + 7 + 11 + 13
 This is the longest sum of consecutive primes that adds to a prime below one-hundred.
 
 The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
 
 Which prime, below one-million, can be written as the sum of the most consecutive primes?
 */

#import <Foundation/Foundation.h>

BOOL isPrime(int n) {
    if (n <= 1) {
        return NO;
    }
    
    if (n == 2) {
        return YES;
    }
    
    int upperLimit = (int)(sqrt(n) + 1);
    for (int i = 2; i < upperLimit; i++) {
        if (n % i == 0) {
            return NO;
        }
    }
    
    return YES;
}

NSArray* primeArray() {
    NSMutableArray *pArray = [[NSMutableArray alloc] init];
    
    for (int i = 1; i <= 1000000; i++) {
        if (isPrime(i)) {
            [pArray addObject:@(i)];
        }
    }
    
    return [pArray copy];
}

NSArray* primeSumArray(NSArray *array) {
    NSMutableArray *primeSumArray = [[NSMutableArray alloc] init];
    [primeSumArray addObject:@0];
    for (int i = 0; i < [array count]; i++) {
        int primeSum = [array[i] intValue] + [primeSumArray[i] intValue];
        if (primeSum > 1000000) {
            break;
        }
        [primeSumArray addObject:@(primeSum)];
    }
    
    return [primeSumArray copy];
}

int longestPrimeOfConsecutivePrimesBelowOneMillion () {
    NSArray *pArray = primeArray();
    NSArray *pSumArray = primeSumArray(pArray);
    
    int primeCount = 0;
    int longestPrime = 2;
    
    for (int i = 0; i < [pSumArray count]; i++) {
        int primeSum = 0;
        int primeSumCount = 0;
        for (int j = i+1; j < [pSumArray count]; j++) {
            primeSum = [pSumArray[j] intValue] - [pSumArray[i] intValue];
            primeSumCount = j - i;
            if (primeSum > 1000000) {
                break;
            }
            if (primeSumCount > primeCount && isPrime(primeSum)) {
                primeCount = primeSumCount;
                longestPrime = primeSum;
            }
        }
    }
    
    return longestPrime;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", longestPrimeOfConsecutivePrimesBelowOneMillion());
        //997651
    }
    return 0;
}
