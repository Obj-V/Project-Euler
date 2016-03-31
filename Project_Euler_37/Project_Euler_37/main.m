//
//  main.m
//  Project_Euler_37
//
//  Created by Virata Yindeeyoungyeon on 3/30/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right, and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
 
 Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
 
 NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
 */

#import <Foundation/Foundation.h>

BOOL isPrime(int num)
{
    if (num <= 1) {
        return NO;
    }
    
    if (num == 2) {
        return YES;
    }
    
    for (int i=2; i <= (int)sqrt(num); i++) {
        if (num%i == 0) {
            return NO;
        }
    }
    
    return YES;
}

BOOL leftAndRightPrimes(int num)
{
    int leftTenthPower = (int)[[NSString stringWithFormat:@"%i", num] length] - 1;
    int leftCurrentNum = num;
    
    int rightTenthPower = 1;
    int rightCurrentNum = num;

    while (leftCurrentNum > 0 && rightCurrentNum > 0 && leftTenthPower >= 0) {
        if (isPrime(leftCurrentNum) && isPrime(rightCurrentNum)) {
            leftCurrentNum = leftCurrentNum % (int)pow(10, leftTenthPower);
            rightCurrentNum = rightCurrentNum / (int)pow(10, rightTenthPower);
            leftTenthPower--;
        } else {
            return NO;
        }
    }
    
    return YES;
}

int truncatablePrimes(int limit)
{
    int sumTruncatablePrimes = 0;
    int count = limit;
    
    for (int i = 10; count > 0; i++) {
        if (isPrime(i) && leftAndRightPrimes(i)) {
            sumTruncatablePrimes += i;
            count--;
        }
    }
    
    return sumTruncatablePrimes;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", truncatablePrimes(11));
        //748317
    }
    return 0;
}
