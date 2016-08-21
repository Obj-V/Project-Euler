//
//  main.m
//  Project_Euler_25
//
//  Created by Virata Yindeeyoungyeon on 2/25/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The Fibonacci sequence is defined by the recurrence relation:
 
 Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
 Hence the first 12 terms will be:
 
 F1 = 1
 F2 = 1
 F3 = 2
 F4 = 3
 F5 = 5
 F6 = 8
 F7 = 13
 F8 = 21
 F9 = 34
 F10 = 55
 F11 = 89
 F12 = 144
 The 12th term, F12, is the first term to contain three digits.
 
 What is the index of the first term in the Fibonacci sequence to contain 1000 digits?
 */
#import <Foundation/Foundation.h>

NSString* sumOfNumStrings(NSString *str1, NSString *str2) //Str1 length is longer than Str2 length
{
    NSMutableString *outputStr = [[NSMutableString alloc] init];
    int i = (int)str1.length - 1;
    int j = (int)str2.length - 1;
    int carry = 0;
    
    for (;j >= 0 ; j--,i--) {
        int numCharStr1 = [[str1 substringWithRange:NSMakeRange(i, 1)] intValue];
        int numCharStr2 = [[str2 substringWithRange:NSMakeRange(j, 1)] intValue];
        int sum = numCharStr1 + numCharStr2 + carry;
        if (sum > 9) {
            carry = sum / 10;
            sum = sum % 10;
        } else {
            carry = 0;
        }
        [outputStr insertString:[NSString stringWithFormat:@"%i", sum] atIndex:0];
    }
    
    if (str1.length > str2.length || carry > 0) {
        int sum = 0;
        if (str1.length > str2.length) {
            int numCharStr1 = [[str1 substringWithRange:NSMakeRange(0, 1)] intValue];
            sum += numCharStr1;
        }
        
        if (carry > 0) {
            sum += carry;
        }
        
        [outputStr insertString:[NSString stringWithFormat:@"%i", sum] atIndex:0];
    }

    return [outputStr copy];
}

int thousandDigitFibonacciNumber()
{
    NSMutableArray *fibonacciArray = [[NSMutableArray alloc] init];
    [fibonacciArray addObject:[NSNull null]];
    [fibonacciArray addObject:@"1"];
    [fibonacciArray addObject:@"1"];
    
    int n = 3;
    while (n > 0) {
        NSString *str1 = fibonacciArray[n-1];
        NSString *str2 = fibonacciArray[n-2];
        NSString *sumStr = sumOfNumStrings(str1, str2);
        [fibonacciArray addObject:sumStr];
        if (sumStr.length == 1000) {
            return n;
        }
        n++;
    }
    
    return -1;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", thousandDigitFibonacciNumber());
        //4782
    }
    return 0;
}
