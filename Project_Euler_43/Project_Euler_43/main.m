//
//  main.m
//  Project_Euler_43
//
//  Created by Virata Yindeeyoungyeon on 4/26/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order, but it also has a rather interesting sub-string divisibility property.
 
 Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
 
 d2d3d4=406 is divisible by 2
 d3d4d5=063 is divisible by 3
 d4d5d6=635 is divisible by 5
 d5d6d7=357 is divisible by 7
 d6d7d8=572 is divisible by 11
 d7d8d9=728 is divisible by 13
 d8d9d10=289 is divisible by 17
 Find the sum of all 0 to 9 pandigital numbers with this property.
 */

#import <Foundation/Foundation.h>

BOOL hasDivisibilityProperty(long num)
{
    NSArray *divisors = @[@1, @2, @3, @5, @7, @11, @13, @17];
    NSString *numString = [NSString stringWithFormat:@"%li", num];
    for (int i = 1; i <= numString.length-3; i++) {
        NSString *subStr = [numString substringWithRange:NSMakeRange(i, 3)];
        int subNum = [subStr intValue];
        int divisor = [divisors[i] intValue];
        if (subNum % divisor != 0) {
            return NO;
        }
    }
    return YES;
}

BOOL isPandigitalNumber(long num)
{
    NSMutableArray *numArray = [[NSMutableArray alloc] init];
    while (num > 0) {
        int digit = num % 10;
        if ([numArray containsObject:@(digit)]) {
            return NO;
        }
        [numArray addObject:@(digit)];
        num = num/10;
    }
    
    if ([numArray count] < 10) {
        return NO;
    }
    
    return YES;
}

NSArray* arrayPermutationRecursive(NSString *inputNumStr)
{
    if ((int)inputNumStr.length == 1) {
        return @[inputNumStr];
    }
    
    NSString *insertingStr = [inputNumStr substringWithRange:NSMakeRange(inputNumStr.length-1, 1)];
    NSString *remainingStr = [inputNumStr substringWithRange:NSMakeRange(0, inputNumStr.length-1)];
    NSArray *permutatedArray = arrayPermutationRecursive(remainingStr);
    
    NSMutableArray *outputArray = [[NSMutableArray alloc] init];
    
    for (NSString *permutedStr in permutatedArray) {
        for (int i = 0; i <= permutedStr.length; i++) {
            NSMutableString *mutablePermutedStr = [permutedStr mutableCopy];
            [mutablePermutedStr insertString:insertingStr atIndex:i];
            NSString *newPermuatedStr = [mutablePermutedStr copy];
            [outputArray addObject:newPermuatedStr];
        }
    }
    
    return outputArray;
}


long subStringDivisibility()
{
    long sum = 0;
    NSArray *numArray = arrayPermutationRecursive(@"0123456789");
    
    for (int i = 0; i < [numArray count]; i++) {
        long n = [numArray[i] longLongValue];
        if (isPandigitalNumber(n) && hasDivisibilityProperty(n)) {
            sum += n;
        }
    }
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%li", subStringDivisibility());
        //16695334890
    }
    return 0;
}
