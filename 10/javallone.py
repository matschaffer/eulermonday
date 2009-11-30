#!/usr/bin/env python

def simple_sieve(n):
	potentials = [ True for i in range(0, n + 1) ]

	results = []
	for i in range(2, n + 1):
		if not potentials[i]: continue

		results.append(i)

		x = i * i
		while x <= n:
			potentials[x] = False
			x += i

	return results

def wheel_factorize(seed, n):
	limit = reduce(lambda a, b: a * b, seed)
	
	potentials = [ True for i in range(0, limit + 1) ]
	for i in seed:
		x = i
		while x <= limit:
			potentials[x] = False
			x += i
	
	mods = []
	for i in range(1, limit + 1):
		if potentials[i]: mods.append(i)
	mods = set(mods)

	results = []
	for i in range(2, n + 1):
		if i % limit in mods:
			results.append(i)

	return results

def full_sieve(seed, n):
	potentials = [ False for i in range(0, n + 1) ]
	for i in wheel_factorize(seed, n): potentials[i] = True
	
	results = seed
	for i in range(2, n + 1):
		if not potentials[i]: continue

		results.append(i)

		x = i * i
		while x <= n:
			potentials[x] = False
			x += i

	return results

target = 2000000
print(reduce(
	lambda a, b: a + b,
	full_sieve([2, 3, 5, 7, 11, 13], target)
	#simple_sieve(target)
))
