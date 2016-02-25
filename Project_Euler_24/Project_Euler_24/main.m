//
//  main.m
//  Project_Euler_24
//
//  Created by Virata Yindeeyoungyeon on 2/24/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:
 
 012   021   102   120   201   210
 
 What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
 */

#import <Foundation/Foundation.h>

NSArray* arrayPermutationRecursive(NSString *inputNumStr)
{
    if ((int)inputNumStr.length == 1) {
        return @[inputNumStr];
    }
    
    //inputStr: 012
    //insertingStr: 2
    //remainingStr: 01
    //permutatedArray : @[01,10];
    NSString *insertingStr = [inputNumStr substringWithRange:NSMakeRange(inputNumStr.length-1, 1)];
    NSString *remainingStr = [inputNumStr substringWithRange:NSMakeRange(0, inputNumStr.length-1)];
    NSArray *permutatedArray = arrayPermutationRecursive(remainingStr);
    
    NSMutableArray *outputArray = [[NSMutableArray alloc] init];
    
    //outputArray : @[201,021,012,210,120,102];
    for (NSString *permutedStr in permutatedArray) {
        for (int i = 0; i <= permutedStr.length; i++) {
            NSMutableString *mutablePermutedStr = [permutedStr mutableCopy];
            [mutablePermutedStr insertString:insertingStr atIndex:i];
            NSString *newPermuatedStr = [mutablePermutedStr copy];
            [outputArray addObject:newPermuatedStr];
        }
    }
    
    return outputArray;
}

NSArray* arrayPermutationIterative(NSString *inputNumStr)
{
    NSMutableArray *numArray = [[NSMutableArray alloc] init];
    for (int i=0; i < inputNumStr.length; i++) {
        NSString *subCharStr = [inputNumStr substringWithRange:NSMakeRange(i, 1)];
        [numArray addObject:subCharStr];
    }
    
    NSArray *outputArray = @[@""];
    
    for (int i=0; i < [numArray count]; i++) {
        NSString *insertingStr = numArray[i];
        NSMutableArray *tempArray = [[NSMutableArray alloc] init];
        for (NSString *permutedStr in outputArray) {
            for (int j=i; j >= 0; j--) {
                NSMutableString *mutablePermutedStr = [permutedStr mutableCopy];
                [mutablePermutedStr insertString:insertingStr atIndex:j];
                NSString *newPermuatedStr = [mutablePermutedStr copy];
                [tempArray addObject:newPermuatedStr];
            }
        }
        outputArray = [tempArray copy];
    }

    return outputArray;
}

NSString* millionthLexicographicPermutation(NSString *inputNumStr)
{
    NSArray *arrayPermutation = arrayPermutationRecursive(inputNumStr); //or arrayPermutationIterative(inputNumStr)
    arrayPermutation = [arrayPermutation sortedArrayUsingSelector:@selector(compare:)];
    return arrayPermutation[999999];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%@", millionthLexicographicPermutation(@"0123456789"));
        //2783915460
    }
    return 0;
}
