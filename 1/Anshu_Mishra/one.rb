#If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
#The sum of these multiples is 23.
#
#Find the sum of all the multiples of 3 or 5 below 1000.
#
#3(1+2+3+....+333)+5(1+2+3+.....+199)-15(1+2+3+...+66)
#puts 3*333*334/2+5*199*200/2-15*66*67/2
#

def sum_of_n_consecutive_numbers (n)
  n*(n+1)/2
end

def sum_of_multiples_of_m(max,m)
  m*sum_of_n_consecutive_numbers(max/m)
end

puts sum_of_multiples_of_m(999,3)+sum_of_multiples_of_m(999,5)-sum_of_multiples_of_m(999,15)
