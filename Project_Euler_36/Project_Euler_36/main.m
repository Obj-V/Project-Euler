//
//  main.m
//  Project_Euler_36
//
//  Created by Virata Yindeeyoungyeon on 3/29/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
 
 Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
 
 (Please note that the palindromic number, in either base, may not include leading zeros.)
 */

#import <Foundation/Foundation.h>

BOOL isPalindromic(NSString *strNum)
{
    int i = 0;
    int j = (int)[strNum length] - 1;
    
    while (i < j) {
        NSString *leftStr = [strNum substringWithRange:NSMakeRange(i, 1)];
        NSString *rightStr = [strNum substringWithRange:NSMakeRange(j, 1)];
        if (![leftStr isEqualToString:rightStr]) {
            return NO;
        }
        i++;
        j--;
    }
    return YES;
}

NSString* binaryInt(int num)
{
    NSMutableString *binaryStr = [[NSMutableString alloc] init];
    
    for (int bitIndex = 0; bitIndex < sizeof(num) * 8; bitIndex++) {
        NSString *insertedStr = (num & 1 ? @"1" : @"0");
        [binaryStr insertString:insertedStr atIndex:0];
        num >>= 1;
    }
    
    //Remove leading zeros
    while ([binaryStr length] > 0 && [[binaryStr substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
        [binaryStr deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    return [binaryStr copy];
}

int doublebasePalindromes(int upperLimit)
{
    int sumPalindromes = 0;
    for (int i = 0; i < upperLimit; i++) {
        NSString *stri = [NSString stringWithFormat:@"%i", i];
        if (isPalindromic(stri) && isPalindromic(binaryInt(i))) {
            sumPalindromes += i;
        }
    }

    return sumPalindromes;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", doublebasePalindromes(1000000));
        //872187
    }
    return 0;
}
