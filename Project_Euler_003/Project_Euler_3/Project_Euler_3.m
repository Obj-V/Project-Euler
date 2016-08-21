//
//  Project_Euler_3.m
//  Project_Euler_3
//
//  Created by Virata Yindeeyoungyeon on 12/17/15.
//  Copyright © 2015 Virata. All rights reserved.
//
/*
 #The prime factors of 13195 are 5, 7, 13 and 29.
 #What is the largest prime factor of the number 600851475143 ?
 */

#import <Foundation/Foundation.h>

long int largestPrimeFactor (long int number)
{
    int factor = 2;
    int upperLimit = (int)sqrt(number);
    
    while (factor <= upperLimit) {
        
        if (number % factor == 0) {
            long int newNumber = number/factor;
            return largestPrimeFactor(newNumber);
        } else {
            factor++;
        }
    }
    
    return number;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%li", largestPrimeFactor(600851475143));
        //NSLog(@"%i", (int)sqrt(13195));
    }
    return 0;
}
