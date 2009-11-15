#!/usr/bin/env python

# These implement Euclid Formula which will generate the triple based on 
# two positive integers m and n.
#  m > n
fa = lambda m, n: 2 * m * n
fb = lambda m, n: m * m - n * n
fc = lambda m, n: m * m + n * n

# By adding fa, fb, and fc above, we can get:
#  P = 2m(m + n)
# which simplifies to
#  n = P / (2m) - m
fn = lambda m: 500.0 / m - m

# Solving for fn = 0 above, we find that m cannot be greater than sqrt(500)
# (about 22.3) or else n becomes negative.
for m in range(1, 23):
	n = fn(m)
	if n == int(n) and m > n:
		print("(%i, %i, %i)" % (fa(m, n), fb(m, n), fc(m, n)))
		print("Answer: %i" % (fa(m, n) * fb(m, n) * fc(m, n)))
		exit(0)
