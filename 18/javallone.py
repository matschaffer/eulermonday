#!/usr/bin/env python

f = open("javallone_data.txt")
triangle = [ [ int(x) for x in line.split(" ") ] for line in f ]
f.close()

sum = triangle.pop()
triangle.reverse()

for row in triangle:
	sum = [ row[c] + max(sum[c], sum[c + 1]) for c in range(0, len(row)) ]

print(sum[0])
