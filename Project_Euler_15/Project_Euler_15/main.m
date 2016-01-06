//
//  main.m
//  Project_Euler_15
//
//  Created by Virata Yindeeyoungyeon on 12/30/15.
//  Copyright © 2015 Virata. All rights reserved.
//
/*
 Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
 
 How many such routes are there through a 20×20 grid?
 */

#import <Foundation/Foundation.h>

long latticePaths(int grid)
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < grid; i++ ) {
        NSMutableArray *subArray = [[NSMutableArray alloc] init];
        for (int j = 0; j < grid; j++) {
            long num1;
            long num2;
            
            if (i-1 < 0) {
                num1 = 1;
            }
            
            if (j-1 < 0) {
                num2 = 1;
            }
            
            if (i-1 >= 0) {
                num1 = [array[i-1][j] longValue];
            }
            
            if (j-1 >= 0) {
                num2 = [subArray[j-1] longValue];
            }
            
            [subArray addObject:[NSNumber numberWithLong:num1+num2]];
        }
        [array addObject:subArray];
    }
    
    return [array[grid-1][grid-1] longValue];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%li", latticePaths(20));
        //137846528820
    }
    return 0;
}
