#!/usr/bin/env python

print(sum([ int(i) for i in str(reduce(lambda a, b: a * b, range(2, 101))) ]))
