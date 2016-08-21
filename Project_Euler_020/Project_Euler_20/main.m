//
//  main.m
//  Project_Euler_20
//
//  Created by Virata Yindeeyoungyeon on 2/9/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 n! means n × (n − 1) × ... × 3 × 2 × 1
 
 For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
 and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
 
 Find the sum of the digits in the number 100!
 */

#import <Foundation/Foundation.h>

NSArray* addTotalFromStrings(NSString *s1, NSString *s2)
{
    NSMutableString *str1 = [NSMutableString stringWithString:s1];
    NSMutableString *str2 = [NSMutableString stringWithString:s2];
    
    NSMutableArray *outputArray = [[NSMutableArray alloc] init];
    int length = (str1.length < str2.length ? (int)str1.length : (int)str2.length);
    
    int offset = 0;
    int str1Index = (int)str1.length - 1;
    int str2Index = (int)str2.length - 1;
    
    for (int i = length-1; i>=0; i--) {
        int digit1 = [[str1 substringWithRange:NSMakeRange(str1Index, 1)] intValue];
        [str1 deleteCharactersInRange:NSMakeRange(str1Index, 1)];
        int digit2 = [[str2 substringWithRange:NSMakeRange(str2Index, 1)] intValue];
        [str2 deleteCharactersInRange:NSMakeRange(str2Index, 1)];
        int total = digit1 + digit2 + offset;
        if (total >= 0 && str1Index == 0 && str2Index == 0) {
            while (total > 0) {
                int num = total%10;
                [outputArray insertObject:@(num) atIndex:0];
                total = total / 10;
            }
        } else if (total >= 0) {
            offset = total / 10;
            int num = total%10;
            [outputArray insertObject:@(num) atIndex:0];
        } else {
            offset = 0;
        }
        str1Index--;
        str2Index--;
    }
    
    if (str1.length != str2.length) {
        NSMutableString *remainingStr = (str1.length > str2.length ? str1 : str2);
        
        int i = (int)remainingStr.length - 1;
        for (; i >= 0; i--) {
            int digit1 = [[remainingStr substringWithRange:NSMakeRange(i, 1)] intValue];
            [remainingStr deleteCharactersInRange:NSMakeRange(i, 1)];
            int total = digit1 + offset;
            if (total >= 0 && remainingStr.length == 0) {
                while (total > 0) {
                    int num = total%10;
                    [outputArray insertObject:@(num) atIndex:0];
                    total = total / 10;
                }
            } else if (total >= 0) {
                offset = total / 10;
                int num = total%10;
                [outputArray insertObject:@(num) atIndex:0];
            } else {
                offset = 0;
            }
        }
    }

    return [outputArray copy];
}

NSString* computeSumString(int num, NSArray *array, int tenthPower)
{
    if (num == 0) {
        return @"0";
    }
    
    NSMutableString *sumStr = [[NSMutableString alloc] init];
    for (int i=tenthPower; i>0; i--) {
        [sumStr insertString:[NSString stringWithFormat:@"%i", 0] atIndex:0];
    }

    int offset = 0;
    for (int j=(int)[array count]-1; j>=0; j--) {
        int sum = 0;
        sum = (num * [array[j] intValue]) + offset;
        if (sum > 9 && j > 0) {
            offset = sum / 10;
            sum = sum % 10;
        } else {
            offset = 0;
        }
        [sumStr insertString:[NSString stringWithFormat:@"%i", sum] atIndex:0];
    }
    
    return [sumStr copy];
}

int computeDigitSumFactorial(int factorialNum) //[0-999]
{
    if (factorialNum == 0) {
        return 0;
    }
    
    __block int sumDigits = 0;
    NSArray *sumArray = @[@1];
    
    //Long multiplication method
    for (int i=2; i<=factorialNum; i++) {
        int firstDigit = i%10;
        int secondDigit = i/10;
        int thirdDigit = 0;
        if (secondDigit > 9) {
            thirdDigit = secondDigit/10;
            secondDigit = secondDigit%10;
        }
        
        NSString *sumFirstStr = computeSumString(firstDigit, sumArray, 0);
        NSString *sumSecondStr = computeSumString(secondDigit, sumArray, 1);
        NSString *sumThirdStr = computeSumString(thirdDigit, sumArray, 2);
        
        sumArray = addTotalFromStrings(sumFirstStr, sumSecondStr);
        
        if (thirdDigit > 0) {
            NSString *sumFirstSecondStr = [sumArray componentsJoinedByString:@""];
            sumArray = addTotalFromStrings(sumFirstSecondStr, sumThirdStr);
        }
    }
    
    //NSLog(@"sum array %@", [sumArray componentsJoinedByString:@""]);
    [sumArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        int num = [obj intValue];
        sumDigits += num;
    }];
    
    return sumDigits;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", computeDigitSumFactorial(100));
        //648
    }
    return 0;
}
