//
//  main.m
//  Project_Euler_7
//
//  Created by Virata Yindeeyoungyeon on 12/19/15.
//  Copyright © 2015 Virata. All rights reserved.
/*
 By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
 
 What is the 10 001st psime number?
*/

#import <Foundation/Foundation.h>

BOOL isNumPrime(int num)
{
    int factor = 2;
    while (factor * factor <= num) {
        if (num % factor == 0) {
            return NO;
        }
        factor++;
    }
    return YES;
}

int primePosition(int position)
{
    int count = 0;
    int num = 1;
    
    while (count < position) {
        num++;
        if (isNumPrime(num)) {
            count++;
        }
    }
    
    return num;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSLog(@"%i", primePosition(10001));
    }
    return 0;
}
