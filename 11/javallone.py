#!/usr/bin/env python

grid = []

# Load the grid
f = open('javallone_data.txt')
for i in f:
	row = [ int(x) for x in i.split("  ") ]
	row.extend([0, 0, 0, 0])
	grid.append(row)
f.close()

height = len(grid)
width = len(grid[0]) - 4

for i in range(0, 4): grid.append([0] * (width + 4))

# Find the product
coords = [ (r, c) for r in range(0, height) for c in range(0, width) ]
mappers = [
	lambda r, c: grid[r][c] * grid[r][c+1] * grid[r][c+2] * grid[r][c+3], # Horizontal
	lambda r, c: grid[r][c] * grid[r+1][c] * grid[r+2][c] * grid[r+3][c], # Vertical
	lambda r, c: grid[r][c] * grid[r+1][c+1] * grid[r+2][c+2] * grid[r+3][c+3], # Diagonal \
	lambda r, c: grid[r][c] * grid[r-1][c+1] * grid[r-2][c+2] * grid[r-3][c+3] # Diagonal /
]

print(reduce(max, map(
	lambda m: reduce(max,  map(
		lambda coordinate: m(*coordinate), coords
	)), mappers
)))
