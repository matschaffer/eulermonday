#
# Directly using the ruby library
# require 'rational'
# puts (1..20).inject(1) { |result, n| result.lcm n }
#
# The other solution (Code below) Steps :
# 1. Fetch all the primes less than "n" in an array (it would be automatically sorted, which will save our efforts later)
# 2. For the smallest member "k" of the prime list, find the maxm power "m" such that k**m <=n (For, e.g. 2**4<20)
# 3. Replace the smallest member from the array with k**m (For e.g. replace 2 with 16, because anything divisible by k**m
#    would be itself be divisible by k**0..m-1)
# 4. Repeat the steps 2-3, for the next member of the array (starting with the power #m-1). when the power becomes 1, no need
#    to iterate.
# 5. Multiply the members of the final array.
#
# Sample runs :
# For n = 10
#
# All the primes :
# [2, 3, 5, 7]
# All the multipliers :
# [8, 9, 5, 7]
# 2520
#
# For n = 20
#
# All the primes :
# [2, 3, 5, 7, 11, 13, 17, 19]
# All the multipliers :
# [16, 9, 5, 7, 11, 13, 17, 19]
# 232792560
#

require 'mathn'

def collect_primes(n)
  primes_list = []
  primes = Prime.new
  primes.each { |x| break if x >= n; primes_list<<x;  }
  puts "All the primes :"
  p primes_list
  primes_list
end

def root(arg, base)
  arg**(1/base)
end

def get_all_the_multipliers(n)
  primes_list = collect_primes(n)
  max_base = get_max_base_for_two(n)

  primes_list.each_with_index do |item, index|
    primes_list[index]=item**max_base
    max_base = get_max_base_for_current_number(n,max_base,primes_list[index+1])
    if max_base <=1 then break
    end
  end
  puts "All the multipliers :"
  p primes_list
  primes_list
end

def get_mulitiplied_value(n)
  list_of_multipliers = get_all_the_multipliers(n)
  list_of_multipliers.inject(1){|total, i| total*i}
end

def get_max_base_for_two(n)
  i=2
  while root(n,i) >= 2
    i = i+1;
  end
  return i-1
end

def get_max_base_for_current_number(n,max_base, current_number)
  base = max_base - 1
  while current_number**base > n
    base = base - 1
  end
  return base
end


puts get_mulitiplied_value(20)
#puts get_mulitiplied_value(10)
