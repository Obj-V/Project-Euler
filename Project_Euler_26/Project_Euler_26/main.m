//
//  main.m
//  Project_Euler_26
//
//  Created by Virata Yindeeyoungyeon on 2/26/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 A unit fraction contains 1 in the numerator. The decimal representation of the unit fractions with denominators 2 to 10 are given:
 
 1/2	= 	0.5
 1/3	= 	0.(3)
 1/4	= 	0.25
 1/5	= 	0.2
 1/6	= 	0.1(6)
 1/7	= 	0.(142857)
 1/8	= 	0.125
 1/9	= 	0.(1)
 1/10	= 	0.1
 Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can be seen that 1/7 has a 6-digit recurring cycle.
 
 Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
 */

#import <Foundation/Foundation.h>

int longestReciprocalCycle(int upperLimit)
{
    int maxLength = 0;
    int maxIndex = 1;
    for (int i = 1; i < upperLimit; i++) {
        NSMutableArray *foundRemainders = [[NSMutableArray alloc] init];
        for (int j = 0; j <= i; j++) {
            [foundRemainders addObject:@0];
        }
        
        int value = 1;
        int position = 0;
        //if the remaider is repeated, a recurring cycle occurs.
        while ([foundRemainders[value] intValue] == 0 && value != 0) {
            foundRemainders[value] = @(position);
            value *= 10;
            value %= i;
            position++;
        }
        
        if (position - [foundRemainders[value] intValue] > maxLength) {
            maxLength = position - [foundRemainders[value] intValue];
            maxIndex = i;
        }
    }
    
    return maxIndex;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", longestReciprocalCycle(1000));
        //983
    return 0;
    }
}
