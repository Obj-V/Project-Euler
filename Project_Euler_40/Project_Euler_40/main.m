//
//  main.m
//  Project_Euler_40
//
//  Created by Virata Yindeeyoungyeon on 4/16/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 An irrational decimal fraction is created by concatenating the positive integers:
 
 0.123456789101112131415161718192021...
 
 It can be seen that the 12th digit of the fractional part is 1.
 
 If dn represents the nth digit of the fractional part, find the value of the following expression.
 
 d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
 */

#import <Foundation/Foundation.h>

int ChampernowneConstant()
{
    int value = 1;
    NSMutableString *decimalString = [[NSMutableString alloc] init];
    int i = 1;
    while (decimalString.length < 1000000) {
        [decimalString appendFormat:@"%i", i];
        i++;
    }
    
    for (int j = 0; j <= 6; j++) {
        int index = (int)pow(10, j) - 1;
        value *= [[decimalString substringWithRange:NSMakeRange(index, 1)] intValue];
    }
    
    return value;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", ChampernowneConstant());
        //210
    }
    return 0;
}
