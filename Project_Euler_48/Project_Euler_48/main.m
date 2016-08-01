//
//  main.m
//  Project_Euler_48
//
//  Created by Virata Yindeeyoungyeon on 7/30/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
 
 Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
 */

#import <Foundation/Foundation.h>

long long sumSeries1000 ()
{
    long long result = 0;
    long long modulo = 10000000000;
    
    for (int i = 1; i <= 1000; i++) {
        long long temp = i;
        for (int j = 1; j < i; j++) {
            temp *= i;
            temp %= modulo;
        }
        
        result += temp;
        result %= modulo;
    }
    
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%lli", sumSeries1000());
        //9110846700
    }
    return 0;
}
