#!/usr/bin/env python

def factors(n):
	result = {}

	if n % 2 == 0:
		result[2] = 0
		while n % 2 == 0:
			result[2] += 1
			n /= 2

	factor = 3
	while n > 1:
		if n % factor == 0:
			result[factor] = 0
			while n % factor == 0:
				result[factor] += 1
				n /= factor
		factor += 2

	return result

factor_table = {}
for i in range(2, 21):
	f = factors(i)
	for k in f.keys():
		if not factor_table.has_key(k) or factor_table[k] < f[k]:
			factor_table[k] = f[k]

result = 1
for k in factor_table.keys():
	result *= k ** factor_table[k]

print(result)
