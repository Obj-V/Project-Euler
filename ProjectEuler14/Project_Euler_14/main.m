//
//  main.m
//  Project_Euler_14
//
//  Created by Virata Yindeeyoungyeon on 12/30/15.
//  Copyright © 2015 Virata. All rights reserved.
//
/*
 The following iterative sequence is defined for the set of positive integers:
 
 n → n/2 (n is even)
 n → 3n + 1 (n is odd)
 
 Using the rule above and starting with 13, we generate the following sequence:
 
 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 
 Which starting number, under one million, produces the longest chain?
 
 NOTE: Once the chain starts the terms are allowed to go above one million.
 */
#import <Foundation/Foundation.h>

int longestCollatzSequence(int startingNumber)
{
    int longestChain = 0;
    int numWithLongestChain = startingNumber;
    int num = startingNumber;
    
    while (num > startingNumber/2) {
        
        int chain = 1;
        long n = num;
        while (n > 1) {
            if (n % 2 == 0) {
                n = n / 2;
                chain++;
            } else {
                n = (n * 3) + 1;
                chain++;
            }
        }
        if (chain > longestChain) {
            longestChain = chain;
            numWithLongestChain = num;
            
        }
        num--;
    }
    
    return numWithLongestChain;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", longestCollatzSequence(1000000));
        //837799
    }
    return 0;
}
