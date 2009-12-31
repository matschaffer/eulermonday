# http://projecteuler.net/index.php?section=problems&id=14
# 
# The following iterative sequence is defined for the set of positive integers:
# 
# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
# 
# 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
# 
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. 
# Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers 
# finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

lengths_of_sequences = Array.new

collect_the_lengths_of_the_sequences = lambda { |starting_number, length|
  h = Hash.new
  h["val"] = starting_number
  h["len"] = length

  # Sample code:
  # h = Hash.new {|hash, key| hash[key] = "Go Fish: #{key}" } 

  lengths_of_sequences << h
}

find_the_chain = lambda { |n|
  s_n = n
  seq = Array.new
  while n > 1
    seq << n
    if n%2 == 0 then n = n/2
    else n = 3*n + 1
    end 
  end
  seq << 1 # add the final 1
  collect_the_lengths_of_the_sequences[s_n, seq.length]
}

start = lambda { |num|
  while num > 1
    find_the_chain[num]
    num = num - 1
  end
  p lengths_of_sequences
  tmp_arr = Array.new
  lengths_of_sequences.each do |item|
    tmp_arr << item["len"]
    p "length: " + item["len"].to_s + " and value: " + item["val"].to_s
  end
  tmp_arr.sort! 
  
  last_index = tmp_arr[tmp_arr.length-1] # get last index
  p tmp_arr

  lengths_of_sequences.each do |item|
    if item["len"] == last_index
      p "HOLY SMOKES OUR VALUE IS: " + item["val"].to_s  
    end
  end
  # find highest len and associated val
}

start[13]


