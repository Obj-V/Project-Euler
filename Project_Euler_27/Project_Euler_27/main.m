//
//  main.m
//  Project_Euler_27
//
//  Created by Virata Yindeeyoungyeon on 6/4/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 Euler discovered the remarkable quadratic formula:
 
 n² + n + 41
 
 It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39. However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.
 
 The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
 
 Considering quadratics of the form:
 
 n² + an + b, where |a| < 1000 and |b| < 1000
 
 where |n| is the modulus/absolute value of n
 e.g. |11| = 11 and |−4| = 4
 Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0.
 */

#import <Foundation/Foundation.h>

BOOL isPrime(int n)
{
    if (n <= 1) {
        return NO;
    }
    
    for (int i = 2; i <= (int)sqrt(n); i++) {
        if (n % i == 0) {
            return NO;
        }
    }
    
    return YES;
}

int quadraticPrimes()
{
    int maxN = 0;
    int maxA = 0;
    int maxB = 0;
    
    for (int a = -999; a < 1000; a++) {
        for (int b = -999; b < 1000; b++) {
            int n = 0;
            while (isPrime(n*n + a*n + b)) {
                n++;
            }
            
            if (n > maxN) {
                maxN = n;
                maxA = a;
                maxB = b;
            }
        }
    }

    return maxA * maxB;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", quadraticPrimes());
        //-59231
    }
    return 0;
}
