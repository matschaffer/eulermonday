#!/usr/bin/env python

def sieve(limit):
	list = set(range(2, limit+1))
	primes = []

	while len(list) > 0:
		p = list.pop()
		rem = p * p
		while rem <= limit:
			list.discard(rem)
			rem += p
		primes.append(p)

	return primes

prime_list = []
limit = 1000000
while len(prime_list) < 10001:
	prime_list = sieve(limit)
	limit *= 10

print(prime_list[10000])
