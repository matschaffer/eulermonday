#!/usr/bin/env python

primes = [2]
i = 3
while len(primes) < 10001:
    prime = True
    for p in primes:
        if i % p == 0:
            prime = False
            break
    if prime:
        primes.append(i)
    i += 1

print primes[-1]
