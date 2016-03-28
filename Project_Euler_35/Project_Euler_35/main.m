//
//  main.m
//  Project_Euler_35
//
//  Created by Virata Yindeeyoungyeon on 3/26/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.
 
 There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
 
 How many circular primes are there below one million?
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
    
    for (int i = 2; i <= (int)sqrt(num); i++) {
        if (num%i == 0) {
            return NO;
        }
    }
    return YES;
}

NSArray* allRotations(int num)
{
    if (!isPrime(num)) {
        return nil;
    }
    
    NSString *strNum = [NSString stringWithFormat:@"%i", num];
    NSMutableArray *outputArray = [[NSMutableArray alloc] init];
    [outputArray addObject:@(num)];
    
    int rotatedPower = (int)strNum.length - 1;
    int rotatedDivisor = pow(10, rotatedPower);
    
    for (int i = 0; i < rotatedPower ; i++) {
        int currNum = [outputArray[i] intValue];
        int rotatedDigit = currNum / rotatedDivisor;
        int newNum = currNum % rotatedDivisor;
        newNum *= 10;
        newNum += rotatedDigit;
        if (!isPrime(newNum)) {
            return nil;
        }
        [outputArray addObject:@(newNum)];
    }
    
    return [outputArray copy];
}

int circularPrime(int upperLimit)
{
    NSMutableSet *numSet = [[NSMutableSet alloc] init];
    for (int i = 1; i < upperLimit; i++) {
        NSArray *rotationsArray = allRotations(i);
        if (rotationsArray) {
            [numSet addObjectsFromArray:rotationsArray];
        }
    }
    
    return (int)[numSet count];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", circularPrime(1000000));
        //55
    }
    return 0;
}
