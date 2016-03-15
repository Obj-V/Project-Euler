//
//  main.m
//  Project_Euler_31
//
//  Created by Virata Yindeeyoungyeon on 3/15/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:
 
 1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
 It is possible to make £2 in the following way:
 
 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
 How many different ways can £2 be made using any number of coins?
 */

#import <Foundation/Foundation.h>

int coinSums(int pound, int pence)
{
    int totalPence = (pound * 100) + pence;
    NSArray *coins = @[@1,@2,@5,@10,@20,@50,@100,@200];
    NSMutableArray *ways = [[NSMutableArray alloc] init];
    
    [ways addObject:@1];
    for (int k=1; k<=totalPence; k++) {
        [ways addObject:@0];
    }
    
    for (int i=0; i < [coins count]; i++) {
        int j = [coins[i] intValue];
        for (; j <= totalPence; j++) {
            int offset = j - [coins[i]intValue];
            int value = [ways[j] intValue] + [ways[offset] intValue];
            ways[j] = @(value);
        }
    }
    
    return [[ways lastObject] intValue];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", coinSums(2, 0));
        //73682
    }
    return 0;
}
