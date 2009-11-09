#!/usr/bin/env ruby

# Project Euler #1
# Linus Graybill 11/5/2009

# http://projecteuler.net/index.php?section=problems&id=1
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# 
# Find the sum of all the multiples of 3 or 5 below 1000.

def euler_1
  number = 1
  sum = 0
  while number < 1000
    if (number % 3 == 0 || number % 5 == 0)
      sum += number  
    end
    number += 1
  end
  p sum
end

euler_1()