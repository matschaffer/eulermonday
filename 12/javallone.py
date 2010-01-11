#!/usr/bin/env python

def factorization(n):
	factor = 2

	if n % factor == 0:
		power = 1

		while n % factor == 0:
			n, power = n / factor, power + 1
		yield power
	
	factor = 3
	while n > 1:
		if n % factor == 0:
			power = 1
			
			while n % factor == 0:
				n, power = n / factor, power + 1
			yield power
		factor += 2

def num_factors(n):
	return reduce(
		lambda a, b: a * b,
		factorization(n), 1
	)

triangle = 1
v = 0

while True:
	v += triangle
	triangle += 1

	if num_factors(v) > 500:
		print v
		exit(0)
