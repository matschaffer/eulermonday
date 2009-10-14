#!/usr/bin/env python

digits = [(x, y, z) for x in range(1, 10) for y in range(0, 10) for z in range(0, 10)]
digits.reverse()

palindromes = []
palindromes.extend([x * 100001 + y * 10010 + z * 1100 for x, y, z in digits])	# 6-digit palindromes
palindromes.extend([x * 10001 + y * 1010 + z * 100 for x, y, z in digits])	# 5-digit palindromes

# Find the first palindrome made with the product of 2 3-digit numbers
for p in palindromes:
	for i in range(100, 1000):
		if p % i != 0: continue

		factor = p / i
		if len(str(factor)) == 3:
			print(p)
			exit(0)
