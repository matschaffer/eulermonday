#!/usr/bin/env python

# The number of paths from any point on the grid can is from Pascal's Triangle, just rotate the grid

memo = {}
def factorial(n):
	def internal(n):
		if n == 1: return 1
		return n * factorial(n-1)

	if not memo.has_key(n):
		memo[n] = internal(n)
	return memo[n]

def pascalTriangle(n, k):
	return factorial(n) / (factorial(k) * factorial(n - k))

gridSize = 20
print pascalTriangle(2 * gridSize, gridSize)
