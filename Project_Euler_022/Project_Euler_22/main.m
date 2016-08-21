//
//  main.m
//  Project_Euler_22
//
//  Created by Virata Yindeeyoungyeon on 2/18/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
 
 For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
 
 What is the total of all the name scores in the file?
 */

#import <Foundation/Foundation.h>
int wordValue(NSString *str)
{
    int sumWordValue = 0;
    for (int i = 0; i < str.length; i++) {
        int charValue = [str characterAtIndex:i]-64;
        sumWordValue += charValue;
    }
    return sumWordValue;
}

int totalNameScores(NSString *filePath)
{
    NSString *stringContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    stringContent = [stringContent stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    NSArray *stringArray = [stringContent componentsSeparatedByString:@","];
    stringArray = [stringArray sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    int sumNameScores = 0;
    
    for (int i=0; i < [stringArray count]; i++) {
        NSString *nameStr = stringArray[i];
        if (dict[nameStr] == nil) {
            int nameStrValue = wordValue(nameStr);
            dict[nameStr] = @(nameStrValue);
        }
        int nameScore = [dict[nameStr] intValue] * (i+1);
        sumNameScores += nameScore;
    }
    
    return sumNameScores;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath = @"/Users/virata_ble/Desktop/Project Euler/Project_Euler_22/p022_names.txt";
        NSLog(@"%i", totalNameScores(filePath));
        //871198282
    }
    return 0;
}
