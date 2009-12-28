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
  assign_singleton_number = lambda { |num|
    p num
    n_s = num.to_s
    if n_s =~ /^1/ then english = "one"    
    elsif n_s =~ /^2/ then english = "two"
    elsif n_s =~ /^3/ then english = "three"
    elsif n_s =~ /^4/ then english = "four"  
    elsif n_s =~ /^5/ then english = "five"
    elsif n_s =~ /^6/ then english = "six"  
    elsif n_s =~ /^7/ then english = "seven"
    elsif n_s =~ /^8/ then english = "eight"
    elsif n_s =~ /^9/ then english = "nine"
    else
      english = "oh poop"     
    end
    return english
    # puts "from single: " + english
  }
  assign_duple_number = lambda { |num|
    # p "insude the duple"
    if num === 10
      engish = "ten"
    elsif num === 11
      english = "eleven"
    elsif num === 12
      english = "twelve"
    elsif num === 13
      english = "thirteen"
    elsif num === 14
      english = "fourteen"
    elsif num === 15
      english = "fifteen"
    elsif num >= 16 && n < 20
      # get the second digit
      lst = num.to_s
      lst = lst[-1,1]
      lst = lst.to_i
      # convert it using assign_singleton_number
      poo = assign_singleton_number[lst]
      english = poo + "teen"    
    else 
      p "uh uncatched"
    end
  }
  
  assign_triple_number = lambda { |n| 
    # p "assign_triple_number"
  }
  
  add_this_shit_up = lambda {|english|

    # puts "add_this_shit_up english: " + english
    our_number = our_number + english.length
    # p "add_this_shit_up" + our_number.to_s
  }
  
  lets_build_this_number = lambda { |n|
    # puts "inside lets_build_this_number"
    # puts "n_length = " + n_length 
    if n_length == "1"
      assign_singleton_number[n]
    # why does it sometimes want "==" and sometimes "="
    elsif n_length == "2"
      assign_duple_number[n]
    elsif n_length == "3"
      assign_triple_number
    elsif n_length == "4"
      # p "you haven't wrtten this yet"
    else
      p "it barfed"
    end
    add_this_shit_up[english]
  }
  
  lets_build_this_number[n]
  puts english
}


(1..20).each do |n|
  euler_17[n]

end
puts "the answer:" + our_number.to_s