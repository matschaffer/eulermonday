#!/usr/bin/env python

gcd = lambda a, b: (b == 0) and a or gcd(b, a % b)
print(reduce(lambda a, b: a * b / gcd(a, b), range(2, 21)))
