//
//  main.m
//  Project_Euler_9
//
//  Created by Virata Yindeeyoungyeon on 12/19/15.
//  Copyright © 2015 Virata. All rights reserved.
//
/*
 A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
 
 a2 + b2 = c2
 For example, 32 + 42 = 9 + 16 = 25 = 52.
 
 There exists exactly one Pythagorean triplet for which a + b + c = 1000.
 Find the product abc.
 */

#import <Foundation/Foundation.h>

int specialPythagoreanTriplet(int sumTriplet)
{
    int product = 0;
    
    int b = sumTriplet / 3; //Ave of middle num
    int c = b + 1;
    int a = (int)sqrt(pow(c, 2) - pow(b, 2));
    
    while (a+b+c < sumTriplet) {
        for (int i = a; i < b; i++) {
            for (int j = b, k = c; j<=k; j++) {
                int powI = pow(i, 2);
                int powJ = pow(j, 2);
                int powK = pow(k, 2);
                if (powI+powJ==powK && i+j+k==sumTriplet) {
                    product = i * j * k;
                    return product;
                }
            }
        }
        c++;
    }
    
    return product;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", specialPythagoreanTriplet(1000));
        //31875000
    }
    return 0;
}
