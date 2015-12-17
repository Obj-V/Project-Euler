//
//  Project_Euler_1.m
//  Project_Euler_1
//
//  Created by Virata Yindeeyoungyeon on 12/17/15.
//  Copyright © 2015 Virata. All rights reserved.
//

/*
 #If we list all the natural numbers below 10 that are multiples of 3 or 5,
 #we get 3, 5, 6 and 9. The sum of these multiples is 23.
 #Find the sum of all the multiples of 3 or 5 below 1000.
 */

#import <Foundation/Foundation.h>

int findSumOfMultiple(int upperLimit, int multiple1, int multiple2)
{
    int sum = 0;
    
    for (int i = 0; i < upperLimit; i++) {
        if (i % multiple1 == 0 || i % multiple2 == 0) {
            sum += i;
        }
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", findSumOfMultiple(1000,3,5));
    }
    return 0;
}
