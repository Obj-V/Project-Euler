//
//  main.m
//  Project_Euler_49
//
//  Created by Virata Yindeeyoungyeon on 8/10/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways: (i) each of the three terms are prime, and, (ii) each of the 4-digit numbers are permutations of one another.
 
 There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property, but there is one other 4-digit increasing sequence.
 
 What 12-digit number do you form by concatenating the three terms in this sequence?
 */

#import <Foundation/Foundation.h>

BOOL isPermutation (NSNumber *num1, NSNumber *num2) {
    int n1 = [num1 intValue];
    int n2 = [num2 intValue];
    NSMutableSet *n1_set = [[NSMutableSet alloc] init];
    NSMutableSet *n2_set = [[NSMutableSet alloc] init];
    
    while (n1 > 0) {
        int n1_digit = n1 % 10;
        int n2_digit = n2 % 10;
        n1 = n1 / 10;
        n2 = n2 / 10;
        
        [n1_set addObject:@(n1_digit)];
        [n2_set addObject:@(n2_digit)];
    }
    
    if (![n1_set isEqualToSet:n2_set]) {
        return NO;
    }
    
    return YES;
}

BOOL isPrime(int num) {
    
    if (num <= 1) {
        return NO;
    }
    
    if (num == 2) {
        return YES;
    }
    
    for (int i = 2; i <= (int)sqrt(num); i++) {
        if (num % i == 0) {
            return NO;
        }
    }
    
    return YES;
}

NSArray* primeArray(){
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int i = 1000; i < 10000; i++) {
        if (isPrime(i)) {
            [array addObject:@(i)];
        }
    }
    
    return [array copy];
}

NSMutableArray* primePermutationSequence (){
    
    NSArray *prime_array = primeArray();
    NSMutableArray *outputArray = [NSMutableArray array];
    
    for (int i = 0; i < prime_array.count; i++) {
        for (int j = i+1; j < prime_array.count; j++) {
            
            if (isPermutation(prime_array[i], prime_array[j])) {
                NSNumber *firstNum = prime_array[i];
                NSNumber *secondNum = prime_array[j];
                int difference = [secondNum intValue] - [firstNum intValue];
                NSNumber *thirdNum = @([secondNum intValue] + difference);
                
                if ([prime_array containsObject:thirdNum] && isPermutation(secondNum, thirdNum)) {
                    NSString *outputSequence = [NSString stringWithFormat:@"%@%@%@", firstNum,secondNum, thirdNum];
                    [outputArray addObject:outputSequence];
                }
            }
        }
    }
    
    return outputArray;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", primePermutationSequence());
        //296962999629
    }
    return 0;
}
