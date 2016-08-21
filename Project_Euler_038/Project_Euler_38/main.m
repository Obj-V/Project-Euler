//
//  main.m
//  Project_Euler_38
//
//  Created by Virata Yindeeyoungyeon on 4/1/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 Take the number 192 and multiply it by each of 1, 2, and 3:
 
 192 × 1 = 192
 192 × 2 = 384
 192 × 3 = 576
 By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
 
 The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
 
 What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
 */

#import <Foundation/Foundation.h>

BOOL isPandigital(NSString *numStr)
{
    NSArray *pandigitalArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    NSMutableArray *numArray = [[NSMutableArray alloc] init];
    for (int i=0; i < numStr.length; i++) {
        [numArray addObject:[numStr substringWithRange:NSMakeRange(i, 1)]];
    }
    NSArray *sortedNumArray = [numArray sortedArrayUsingSelector:@selector(compare:)];
    
    if ([pandigitalArray isEqualToArray:sortedNumArray]) {
        return YES;
    }
    return NO;
}

int largestPandigitalMultiples()
{
    int largestPandigital = 1;
    for (int i = 1; i < 10000; i++) {
        int n = 1;
        NSMutableString *numStr = [[NSMutableString alloc] init];
        while (numStr.length < 9) {
            [numStr appendFormat:@"%i",i * n];
            n += 1;
        }
        
        if (numStr.length == 9 && isPandigital([numStr copy])) {
            int num = [numStr intValue];
            if (num > largestPandigital) {
                largestPandigital = num;
            }
        }
    }
    
    return largestPandigital;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", largestPandigitalMultiples());
        //932718654
    }
    return 0;
}
