#!/usr/bin/env python

def gcd(a, b):
	if b == 0:
		return a
	else:
		return gcd(b, a % b)

def lcm(a, b):
	return a * b / gcd(a, b)

result = 1
for i in range(2, 21):
	result = lcm(i, result)

print(result)
