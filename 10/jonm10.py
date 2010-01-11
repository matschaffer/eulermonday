#!/usr/bin/python

import math

primes = [2]
sum = 2
for i in xrange(3,2000000):
    prime = True
    for p in primes:
        if i % p == 0:
            prime = False
            break
        if p > math.sqrt(i):
            break
    if prime:
        sum += i
        primes.append(i)
print sum
