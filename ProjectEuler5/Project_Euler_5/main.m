//
//  main.m
//  Project_Euler_5
//
//  Created by Virata Yindeeyoungyeon on 12/19/15.
//  Copyright © 2015 Virata. All rights reserved.
//

#import <Foundation/Foundation.h>

int smallestNumberForEvenlyDivisible(int fromInt, int toInt)
{
    __block BOOL notFoundNumber = YES;
    __block int smallest = toInt;
    
    NSIndexSet *range = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(fromInt, toInt)];
    
    while (notFoundNumber) {
        [range enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            if (smallest % idx != 0) {
                notFoundNumber = YES;
                smallest += toInt;
                *stop = YES;
            } else {
                notFoundNumber = NO;
            }
        }];
    }
    
    return smallest;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", smallestNumberForEvenlyDivisible(1, 20)); //232792560
    }
    return 0;
}
