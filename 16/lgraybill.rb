# http://projecteuler.net/index.php?section=problems&id=16
# 
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2^1000?

num = 2**1000
sum = 0
single_num =  num.to_s.split('') #split the number into single digits

single_num.each do |num| 
  sum = sum + num.to_i # add each digit to the sum
end

puts sum.to_s