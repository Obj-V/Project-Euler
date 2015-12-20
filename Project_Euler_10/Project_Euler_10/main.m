//
//  main.m
//  Project_Euler_10
//
//  Created by Virata Yindeeyoungyeon on 12/19/15.
//  Copyright © 2015 Virata. All rights reserved.
//
/*
 The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 
 Find the sum of all the primes below two million.
 */
#import <Foundation/Foundation.h>

unsigned long sumOfPrimes(int upperLimit)
{
    unsigned long sum = 0;
    
    NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, upperLimit)];
    NSMutableArray *boolArray = [[NSMutableArray alloc] init];
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        [boolArray addObject:[NSNumber numberWithBool:YES]];
    }];
    
    for (int i = 2; i < [boolArray count]; i++) {
        if ([boolArray[i] isEqual:[NSNumber numberWithBool:YES]]) {
            for (int j = i+i; j < [boolArray count]; j+=i) {
                boolArray[j] = [NSNumber numberWithBool:NO];
            }
        }
    }
    
    for (int i = 2; i < [boolArray count]; i++) {
        if ([boolArray[i] isEqual:[NSNumber numberWithBool:YES]]) {
            sum += i;
        }
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%lu", sumOfPrimes(2000000));
        //142913828922
    }
    return 0;
}
