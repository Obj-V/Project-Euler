//
//  main.m
//  Project_Euler_16
//
//  Created by Virata Yindeeyoungyeon on 1/6/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 
 What is the sum of the digits of the number 21000?
 */

#import <Foundation/Foundation.h>

static NSMutableArray *array;

NSMutableArray* getArrayPowerOfTwo()
{
    if (!array) {
        array = [[NSMutableArray alloc] init];
    }
    return array;
}

NSString* breakUpStr(NSString *inputStr)
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableString *outputString = [[NSMutableString alloc] init];
    int carry = 0;
    int remainder = 0;
    for (int i = (int)inputStr.length-1; i >= 0; i--) {
        NSString *str = [inputStr substringWithRange:NSMakeRange(i, 1)];
        int tempInt = [str intValue];
        int sum = tempInt * 2 + carry;
        if (i != 0) {
            carry = sum/10;
            remainder = sum % 10;
            [array addObject:[NSString stringWithFormat:@"%i", remainder]];
        } else {
            [array addObject:[NSString stringWithFormat:@"%i", sum]];
        }
    }
    
    for (int j = (int)[array count]-1; j >= 0; j--) {
        [outputString appendString:array[j]];
    }
    
    return outputString;
}

int powerDigitSum(int powerOfTwoInt)
{
    //Keep each 2^i in an array
    //If the value is longer than 10 characters, break it up
    NSMutableArray *a = (NSMutableArray *)getArrayPowerOfTwo();
    for (int i = 0; i <= powerOfTwoInt; i++) {
        if (i == 0) {
            a[i] = @"1";
        } else {
            NSString *previousStr = a[i-1];
            if (previousStr.length > 10) {
                a[i] = breakUpStr(a[i-1]);
            } else {
                long long value = [a[i-1] longLongValue] * 2;
                a[i] = [NSString stringWithFormat:@"%lli", value];
            }
        }
    }
    
    NSString *finalString = a[powerOfTwoInt];
    int sum = 0;
    for (int j = 0; j<finalString.length; j++) {
        NSString *subStr = [finalString substringWithRange:NSMakeRange(j, 1)];
        int tempInt = [subStr intValue];
        sum += tempInt;
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", powerDigitSum(1000));
        //1366
    }
    return 0;
}
