//
//  main.m
//  Project_Euler_4
//
//  Created by Virata Yindeeyoungyeon on 12/18/15.
//  Copyright © 2015 Virata. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL isPolindrome(int result)
{
    NSString *numStr = [NSString stringWithFormat:@"%i", result];
    NSMutableString *reverseStr = [[NSMutableString alloc]initWithCapacity:[numStr length]];
    
    for (int i = [numStr length] - 1; i >= 0; i--) {
        [reverseStr appendString:[NSString stringWithFormat:@"%c", [numStr characterAtIndex:i]]];
    }
    
    if ([numStr isEqualToString:reverseStr]) {
        return YES;
    }
    
    return NO;
}

int largestPalindrome(int digit)
{
    int highestPolindrome = 0;
    int highestNumber = pow(10, digit) - 1;
    
    for (int i = highestNumber; i > 0; i--) {
        for (int j = highestNumber; j > 0; j--) {
            int result = i * j;
            if (isPolindrome(result) && result > highestPolindrome) {
                highestPolindrome = result;
            }
        }
    }
    return highestPolindrome;
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"%i", largestPalindrome(3));
    }
    return 0;
}
