#!/usr/bin/env python

# Based on algorithm from http://en.wikipedia.org/wiki/Calculating_the_day_of_the_week

month_table = {
	False: [1, 4, 4, 7, 2, 5, 7, 3, 6, 1, 4, 6],
	True:  [7, 3, 4, 7, 2, 5, 7, 3, 6, 1, 4, 6]
}

count = 0
for year in range(1901, 2001):
	leap_year = (year % 4 == 0) and (year % 100 != 0 or year % 400 == 0)
	c = 2 * (3 - (year / 100) % 4)
	y = int((year % 100) * 1.25)
	for m in month_table[leap_year]:
		if (c + y + m) % 7 == 0:
			count += 1

print(count)
