#!/usr/bin/env python

print(str(reduce(lambda a, b: a + b, [ int(i) for i in open('javallone_data.txt').readlines() ]))[0:10])
