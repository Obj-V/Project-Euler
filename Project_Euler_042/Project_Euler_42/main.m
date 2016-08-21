//
//  main.m
//  Project_Euler_42
//
//  Created by Virata Yindeeyoungyeon on 4/24/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 The nth term of the sequence of triangle numbers is given by, tn = 1/2n(n+1); so the first ten triangle numbers are:
 
 1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
 
 By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
 
 Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?
 */

#import <Foundation/Foundation.h>

double nthTerm(int wordVal)
{
    /*
     wordVal = 1/2n(n+1)
     (wordVal * 2) = n(n+1)
     (wordVal * 2) = n^2 + n
     0 = n^2 + n - (wordVal * 2)
     
     a = 1, b = 1, c = -(wordVal * 2)
     
     Quadratic Formula
     nthTerm = (-b +- sqrt(b^2 -4ac))/2
     */
    int a = 1;
    int b = 1;
    int c = -1 * wordVal * 2;
    
    double x1 = ((-1*b)+sqrt((pow(b, 2)-(4*a*c))))/(2*a);
    double x2 = ((-1*b)-sqrt((pow(b, 2)-(4*a*c))))/(2*a);
    
    return MAX(x1, x2);
}

int wordValue(NSString *word)
{
    int sumVal = 0;
    for (int i = 0; i < [word length]; i++) {
        unichar character = [word characterAtIndex:i];
        sumVal += (int)character - 64;
    }
    
    return sumVal;
}

NSArray *wordArrayFromPath(NSString *path)
{
    //Get String
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    //Strip "" from content
    NSString *newContent = [content stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    //Get array
    NSArray *wordArray = [newContent componentsSeparatedByString:@","];

    return wordArray;
}

int codedTriangleNumbers(NSString *path)
{
    int triangleWords = 0;
    NSArray *wordArray = wordArrayFromPath(path);
    for (NSString *str in wordArray) {
        int wordVal = wordValue(str);
        double n = nthTerm(wordVal);
        if (n == (int)n) {
            triangleWords += 1;
        }
    }
    return triangleWords;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path = @"/Users/virata_ble/Desktop/Project Euler/Project_Euler_42/p042_words.txt";
        NSLog(@"%i", codedTriangleNumbers(path));
        //162
    }
    return 0;
}
