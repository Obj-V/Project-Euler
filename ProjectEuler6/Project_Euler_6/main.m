//
//  main.m
//  Project_Euler_6
//
//  Created by Virata Yindeeyoungyeon on 12/19/15.
//  Copyright © 2015 Virata. All rights reserved.
//

/*
The sum of the squares of the first ten natural numbers is,

12 + 22 + ... + 102 = 385
The square of the sum of the first ten natural numbers is,

(1 + 2 + ... + 10)2 = 552 = 3025
Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
*/

#import <Foundation/Foundation.h>

int sumSquareDifference(int num)
{
    NSIndexSet *range = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, num)];
    
    __block int sumOfSquare = 0;
    __block int sqaureOfSum = 0;
    
    [range enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        sumOfSquare += pow(idx, 2);
        sqaureOfSum += idx;
    }];
    
    sqaureOfSum = pow(sqaureOfSum, 2);
    
    return (sqaureOfSum - sumOfSquare);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", sumSquareDifference(100)); //25164150
    }
    return 0;
}
