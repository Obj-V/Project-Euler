#Project_Euler_19.py
#Virata Yindeeyoungyeon
"""
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
"""
import datetime

def dateFromComponents(day,month,year):
	date = datetime.date(year, month, day)
	return date

def countSundays(fromYear, toYear):
	fromDate = dateFromComponents(1,1,fromYear)
	toDate = dateFromComponents(31,12,toYear)

	sumSunday = 0
	date = fromDate
	while date <= toDate:
		if date.day == 1 and date.weekday() == 6:
			sumSunday += 1
		date += datetime.timedelta(days=1)

	return sumSunday

print(countSundays(1901,2000))
#171