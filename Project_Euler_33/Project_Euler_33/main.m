//
//  main.m
//  Project_Euler_33
//
//  Created by Virata Yindeeyoungyeon on 6/4/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
 
 We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
 
 There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing two digits in the numerator and denominator.
 
 If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
 */
#import <Foundation/Foundation.h>

NSMutableArray *numToArray(int num)
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    while (num > 0) {
        int digit = num % 10;
        [array addObject:@(digit)];
        num = num / 10;
    }
    
    return array;
}

BOOL isNonTrivialFraction(int num, int denom)
{
    if (num >= denom) {
        return NO;
    }

    float expectedResult = (float)num / denom;
    
    NSMutableArray *numDigits = numToArray(num);
    NSMutableArray *denomDigits = numToArray(denom);
    
    for (NSNumber *n in numDigits){
        if ([n isNotEqualTo:@0] && [denomDigits containsObject:n]) {
            [numDigits removeObject:n];
            [denomDigits removeObject:n];
            break;
        }
    }
    
    if ([numDigits count] > 1 || [denomDigits count] > 1) {
        return NO;
    }
    
    int numFraction = [[numDigits componentsJoinedByString:@""] intValue];
    int denomFraction = [[denomDigits componentsJoinedByString:@""] intValue];
    
    if (denomFraction == 0 || numFraction > denomFraction) {
        return NO;
    }
    
    float result = (float)numFraction/denomFraction;
    
    if (result == expectedResult) {
        return YES;
    }
    
    return NO;
}

int GCD(int a, int b)
{
    int divisor = (a < b)?a:b;
    int divided = (a < b)?b:a;
    
    while (divided % divisor != 0) {
        divided = divisor;
        divisor = divided % divisor;
    }
    
    return divisor;
}

int denominatorForProductOfFourNonTrivailFractions()
{
    int numProduct = 1;
    int denomProduct = 1;
    for (int num = 10; num <= 99; num++) {
        for (int denom = 10; denom <= 99; denom++) {
            if (isNonTrivialFraction(num, denom)) {
                numProduct *= num;
                denomProduct *= denom;
            }
        }
    }
    
    int gcd = GCD(numProduct, denomProduct);
    
    return denomProduct / gcd;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", denominatorForProductOfFourNonTrivailFractions());
        //100
    }
    return 0;
}
