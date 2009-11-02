#!/usr/bin/python

import math

def prime(n):
    if n < 4: return True
    max = int(math.floor(math.sqrt(float(n))))
    for i in xrange(max+1):
        if i < 2: continue
        if (n % i == 0): return False
    return True

x = 600851475143
out = -1
max = int(math.floor(math.sqrt(x)))
best = -1
for i in xrange(1,max+1):
    if (x % i == 0):
        other = x / i
        if (prime(other)):
            out = other
            break
        if (prime(i)):
            best = i
if out == -1:
    print best
else:
    print out
