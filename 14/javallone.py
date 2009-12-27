#!/usr/bin/env python

memo = {}
def sequence(n):
	def internal(n):
		if n == 1: return 1

		if n % 2 == 0:
			next = n / 2
		else:
			next = 3 * n + 1
		return 1 + sequence(next)

	if not memo.has_key(n):
		memo[n] = internal(n)
	return memo[n]

longest = 0
start = 0
for i in range(1, 1000001):
	s = sequence(i)
	if s > longest:
		longest = s
		start = i

print start
