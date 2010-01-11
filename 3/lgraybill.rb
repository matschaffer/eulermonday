#!/usr/bin/env ruby

# Project Euler #3
# Linus Graybill 11/7/2009

# http://projecteuler.net/index.php?section=problems&id=3
# 
# The prime factors of 13195 are 5, 7, 13 and 29.
# 
# What is the largest prime factor of the number 600851475143 ?

def largest_prime_factor(number)
  # start with the number and go backwards
  while number > 0
    numb_split = number.to_s.split('')
    numb_split_length = numb_split.length
    #p numb_split[numb_split_length - 1]
    if numb_split[numb_split_length - 1] == "5" || numb_split[numb_split_length - 1] == "0" 

      
    elsif number%2 == 0 && number > 2 
      # definitely not prime
    elsif number%2 == 0 && number%3 == 0
    
    
    else
      # test if number is prime
      # if number is prime
      

      p number.to_s
    end
    number -= 1    
  end

end

largest_prime_factor(1000)