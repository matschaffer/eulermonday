#!/usr/bin/env ruby

# Project Euler #6
# Linus Graybill 10/27/2009

# Output for n=100:
# Sum of the squares: 338350
# Square of the sum: 25502500
# The difference: 25164150

def solve_euler_6(n)
  sum_of_squares = 0
  tmp_square_of_sums = 0
  (1..n).each { |num| sqrd_num = num ** 2; sum_of_squares += sqrd_num; }
  (1..n).each { |num| tmp_square_of_sums += num }
  square_of_sums = tmp_square_of_sums ** 2
  the_diff = square_of_sums - sum_of_squares
  puts "The difference: " + the_diff.to_s
end

#start = Time.now
solve_euler_6(100)
#puts "Took: #{Time.now - start} seconds"
