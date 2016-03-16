//
//  main.m
//  Project_Euler_32
//
//  Created by Virata Yindeeyoungyeon on 3/15/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once; for example, the 5-digit number, 15234, is 1 through 5 pandigital.
 
 The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier, and product is 1 through 9 pandigital.
 
 Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
 
 HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
 */

#import <Foundation/Foundation.h>

BOOL isPandigital(int m, int n)
{
    int product = m * n;
    NSString *str = [NSString stringWithFormat:@"%i%i%i", m,n,product];
    str = [str stringByFoldingWithOptions:NSCaseInsensitiveSearch locale:nil];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < str.length; i++) {
        NSString *tempStr = [str substringWithRange:NSMakeRange(i, 1)];
        [array addObject:tempStr];
    }
    array = [[array sortedArrayUsingSelector:@selector(compare:)] mutableCopy];
    str = [array componentsJoinedByString:@""];

    if ([str isEqualToString:@"123456789"]) {
        return YES;
    }
    return NO;
}

int pandigitalProducts()
{
    int sum = 0;
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    for (int i = 1; i < 100; i++) {
        for (int j = 100; j < 10000; j++) {
            if (isPandigital(i, j)) {
                int product = i * j;
                if (![set containsObject:@(product)]) {
                    sum += product;
                    [set addObject:@(product)];
                }
            }
        }
    }
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", pandigitalProducts());
        //45228
    }
    return 0;
}
