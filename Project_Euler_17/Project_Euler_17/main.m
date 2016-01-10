//
//  main.m
//  Project_Euler_17
//
//  Created by Virata Yindeeyoungyeon on 1/9/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 
 If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 
 
 NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
 */
#import <Foundation/Foundation.h>

NSMutableArray* setupArray()
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:@"zero"];
    [array addObject:@"one"];
    [array addObject:@"two"];
    [array addObject:@"three"];
    [array addObject:@"four"];
    [array addObject:@"five"];
    [array addObject:@"six"];
    [array addObject:@"seven"];
    [array addObject:@"eight"];
    [array addObject:@"nine"];
    [array addObject:@"ten"];
    [array addObject:@"eleven"];
    [array addObject:@"twelve"];
    [array addObject:@"thirteen"];
    [array addObject:@"fourteen"];
    [array addObject:@"fifteen"];
    [array addObject:@"sixteen"];
    [array addObject:@"seventeen"];
    [array addObject:@"eighteen"];
    [array addObject:@"nineteen"];
    return array;
}


int numberLetterCounts(int inputNumber)
{
    NSMutableArray *array = setupArray();
    int sum = 0;
    
    for (int i = 1; i <= inputNumber; i++) {
        
        NSMutableString *str = [[NSMutableString alloc] init];
        int index = i;
        
        if (index >= 1000) {
            int thousandDigit = index/1000;
            [str appendString:[NSString stringWithFormat:@"%@%@", array[thousandDigit], @"thousand"]];
            index = index % 1000;
        }
        
        if (index >= 100 && index <= 999) {
            int hundredDigit = index/100;
            [str appendString:[NSString stringWithFormat:@"%@%@", array[hundredDigit], @"hundred"]];
            index = index % 100;
            if (index > 0) {
                [str appendString:@"and"];
            }
        }
        
        if (index >= 20 && index <= 99) {
            int tenDigit = index/10;
            switch (tenDigit) {
                case 9:
                    [str appendString:[NSString stringWithFormat:@"%@%@", array[tenDigit], @"ty"]];
                    break;
                case 8:
                    [str appendString:[NSString stringWithFormat:@"%@%@", array[tenDigit], @"y"]];
                    break;
                case 7:
                    [str appendString:[NSString stringWithFormat:@"%@%@", array[tenDigit], @"ty"]];
                    break;
                case 6:
                    [str appendString:[NSString stringWithFormat:@"%@%@", array[tenDigit], @"ty"]];
                    break;
                case 5:
                    [str appendString:@"fifty"];
                    break;
                case 4:
                    [str appendString:@"forty"];
                    break;
                case 3:
                    [str appendString:@"thirty"];
                    break;
                case 2:
                    [str appendString:@"twenty"];
                    break;
                default:
                    break;
            }
            index = index % 10;
        }
        
        if (index > 0 && index < 20) {
            [str appendString:array[index]];
        }
        NSLog(@"%@", str);
        sum += str.length;
    }
    
    return sum;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", numberLetterCounts(1000));
        //21124
    }
    return 0;
}
