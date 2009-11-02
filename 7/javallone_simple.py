#!/usr/bin/env python

from math import sqrt

def memoize(func):
	memo = {}

	def new_func(*args):
		if not memo.has_key(args):
			memo[args] = func(*args)
		return memo[args]

	return new_func

@memoize
def isPrime(check):
	root = sqrt(check)
	if (root == int(root)):
		return False

	for i in range(2, int(root) + 1):
		if not isPrime(i):
			continue

		if (check % i == 0):
			return False

	return True

count = 1
check = 3
while True:
	if isPrime(check):
		count += 1
	if count == 10001:
		print(check)
		break
	check += 2
