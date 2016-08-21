//
//  main.m
//  Project_Euler_41
//
//  Created by Virata Yindeeyoungyeon on 4/19/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
 
 What is the largest n-digit pandigital prime that exists?
 */

#import <Foundation/Foundation.h>

BOOL isPandigital(int num)
{
    NSArray *pandigitalArray = @[@1,@2,@3,@4,@5,@6,@7,@8,@9];
    NSMutableArray *numArray = [[NSMutableArray alloc] init];
    while (num > 0) {
        int digit = num % 10;
        [numArray addObject:@(digit)];
        num = num / 10;
    }
    
    int numArrayLength = (int)[numArray count];
    NSArray *sortedNumArray = [numArray sortedArrayUsingSelector:@selector(compare:)];
    NSArray *subPandigitalArray = [pandigitalArray subarrayWithRange:NSMakeRange(0, numArrayLength)];
    
    if ([subPandigitalArray isEqualToArray:sortedNumArray]) {
        return YES;
    }
    
    return NO;
}

BOOL isPrime(int num)
{
    if (num <= 1) {
        return NO;
    }
    
    for (int i = 2; i <= sqrt(num); i++) {
        if (num%i == 0) {
            return NO;
        }
    }
    
    return YES;
}

BOOL isSumDividedByThree(int num)
{
    int sum = 0;
    while (num > 0) {
        int digit = num % 10;
        sum += digit;
        num = num / 10;
    }
    
    if (sum % 3 == 0) {
        return YES;
    }
    return NO;
}


int largestPandigitalPrime()
{
    int maxPandigitalPrime = -1;
    
    //If a sum of all the digits of a number can be divided by 3, the number can be divided by 3. Thus, it's not a prime number
    //1+2+3 = 6 ---> 6 can be divided by 3, so 123 is not a prime number
    int num = 123456789;
    while (isSumDividedByThree(num)) {
        num = num / 10;
    }
    int lowerBound = num;
    int upperBound = 0;
    
    //Reverse num to get the upper bound
    while (num > 0) {
        int digit = num % 10;
        upperBound = upperBound * 10 + digit;
        num = num / 10;
    }

    //Return the first largest pandigital prime number
    for (int i = upperBound; i >= lowerBound; i--) {
        if (isPrime(i) && isPandigital(i) && maxPandigitalPrime < i) {
            maxPandigitalPrime = i;
            break;
        }
    }
    return maxPandigitalPrime;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", largestPandigitalPrime());
        //7652413
    }
    return 0;
}
