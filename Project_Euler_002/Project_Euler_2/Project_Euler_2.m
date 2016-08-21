//
//  Project_Euler_2.m
//  Project_Euler_2
//
//  Created by Virata Yindeeyoungyeon on 12/17/15.
//  Copyright © 2015 Virata. All rights reserved.
//
/*
 # Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
 
 # 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 
 # By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

 */
#import <Foundation/Foundation.h>

int fibonacci(int index)
{
    if (index == 0) {
        return 1;
    } else if (index == 1){
        return 2;
    } else {
        return fibonacci(index - 2) + fibonacci(index -1);
    }
}

int computeSumOfEvenNumber(int upperLimit)
{
    int index = 0;
    int sumOfEvenNumber = 0;
    int value = 0;
    
    while (value < upperLimit) {
        value = fibonacci(index);
        if (value % 2 == 0) {
            sumOfEvenNumber += value;
        }
        index++;
    }
    return sumOfEvenNumber;
    
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%i", computeSumOfEvenNumber(4000000));
    }
    return 0;
}