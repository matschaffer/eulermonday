# # http://projecteuler.net/index.php?section=problems&id=17
# 
# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, 
# how many letters would be used?
# 
# 
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) 
# contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" 
# when writing out numbers is in compliance with British usage.

our_number = 0
euler_17 = lambda { |n|
  
  english = ""
  
  # use some wicked regex to write out the numbers to names
  n_string = n.to_s
  n_length = n_string.length.to_s

  # Assign the single number (1, 2, 3, 4, 5, 6...)
  assign_singleton_number = lambda { |n|
    if n_string =~ /^1/
      english = "one"    
    elsif n_string =~ /^2/
      english = "two"
    elsif n_string =~ /^3/
      english = "three"
    elsif n_string =~ /^4/
      english = "four"  
    elsif n_string =~ /^5/
      english = "five"
    elsif n_string =~ /^6/
      english = "six"  
    elsif n_string =~ /^7/
      english = "seven"
    elsif n_string =~ /^8/
      english = "eight"
    elsif n_string =~ /^9/
      english = "nine"
    else
      english = "oh poop"     
    end
    puts "from single: " + english
  }
  assign_duple_number = lambda { |n|
    p "assign_duple_number"
  }
  
  assign_triple_number = lambda { |n| 
    p "assign_triple_number"
  }
  
  add_this_shit_up = lambda {|english|
    puts "add_this_shit_up english: " + english
    our_number = our_number + english.length
  }
  
  lets_build_this_number = lambda { |n|
    # puts "inside lets_build_this_number"
    # puts "n_length = " + n_length 
    if n_length = 1
      assign_singleton_number[n]
    elsif n_length = 2
      assign_duple_number
    elsif n_length = 3
      assign_triple_number
    elsif n_length = 4
      
    end
    add_this_shit_up[english]
  }
  lets_build_this_number[n]

}


(1..5).each do |n|
  euler_17[n]
end
puts "the answer:" + our_number.to_s