//
//  main.m
//  Project_Euler_19
//
//  Created by Virata Yindeeyoungyeon on 5/12/16.
//  Copyright © 2016 Virata. All rights reserved.
//
/*
 You are given the following information, but you may prefer to do some research for yourself.
 
 1 Jan 1900 was a Monday.
 Thirty days has September,
 April, June and November.
 All the rest have thirty-one,
 Saving February alone,
 Which has twenty-eight, rain or shine.
 And on leap years, twenty-nine.
 A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
 
 How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?
 */

#import <Foundation/Foundation.h>

NSDate* dateFromComponenets(int day, int month, int year)
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = day;
    dateComponents.month = month;
    dateComponents.year = year;
    
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *date = [gregorianCalendar dateFromComponents:dateComponents];
    
    return date;
}

int countSundays(int fromYear,int toYear)
{
    NSCalendar * gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDate *fromDate = dateFromComponenets(1,1,fromYear);
    NSDate *toDate = dateFromComponenets(31,12,toYear);
    NSDate *date = fromDate;
    
    int sumSunday = 0;
    
    while ([date compare: toDate] == NSOrderedAscending || [date compare: toDate] == NSOrderedSame) {
        
        NSDateComponents *dateComponents = [gregorianCalendar components:(NSCalendarUnitDay |
                                                                 NSCalendarUnitWeekday) fromDate:date];
        if (dateComponents.day == 1 && dateComponents.weekday == 1) {
            sumSunday += 1;
        }
        
        date = [date dateByAddingTimeInterval:(60*60*24)];
    }
    
    return sumSunday;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"%i", countSundays(1901, 2000));
        //171
    }
    return 0;
}
