#!/usr/bin/python

import math
import sys

for a in xrange(1,997):
    for b in xrange(a+1,998):
        for c in xrange(b+1,999):
            if (a*a + b*b == c*c
                and a + b + c == 1000):
                print a * b * c
                sys.exit(0)
