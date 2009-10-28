#!/usr/bin/python

import math
import sys

def palindrome(n):
    s = str(n)
    for i in xrange(int(math.ceil(len(s)/2))):
        if s[i] != s[len(s)-1-i]: return False
    return True

best = -1
for i in xrange(100,1000):
    for j in xrange(100,1000):
        n1 = 1099 - i
        n2 = 1099 - j
        prod = n1 * n2
        if palindrome(prod) and prod > best:
            best = prod
print best
