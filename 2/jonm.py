#!/usr/bin/python

i_2 = 0
i_1 = 1
sum = 0
while True:
    i = i_1 + i_2
    if (i % 2 == 0): sum += i
    i_2 = i_1
    i_1 = i
    if i >= 4000000: break
print sum
