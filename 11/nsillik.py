#!/opt/local/bin/python2.6

import numpy
f = open('nsillik.txt')

data = []

for line in f.readlines():
    data.append([int(x, 10) for x in line.replace("\n", "").split(" ")])
data = numpy.array(data)

cur_max = 0
for i in range(data.shape[0]):
    for j in range(data.shape[1]):
        try:
            down = data[i:i+4,j]
        except IndexError:
            down = numpy.array([0])
        try:
            right = data[i,j:j+4]
        except IndexError:
            right = numpy.array([0])
        try:
            diag = numpy.array([data[i,j], data[i+1,j+1], data[i+2,j+2], data[i+3,j+3]])
        except IndexError:
            diag = numpy.array([0])
        try:
            diag2 = numpy.array([data[i,j], data[i+1,j-1], data[i+2,j-2], data[i+3,j-3]])
        except IndexError:
            diag = numpy.array([0])
        this_max = max(down.prod(), right.prod(), diag.prod(), diag2.prod())
        if this_max > cur_max:
            print down, right, diag, diag2
            cur_max = this_max

print cur_max
