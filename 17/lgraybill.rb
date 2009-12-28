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
write_out_number = lambda { |n|
  
  english = ""
  
  # use some wicked regex to write out the numbers to names
  n_string = n.to_s
  n_length = n_string.length.to_s

  # if n_string.length == 1, it's a single digit, don't append anything
  # if n_string.length == 2 ** /^1/, eleven, twelve, and then append "teen"
  # if n_string.length == 2 ** /^2/, prepend "twenty"
  # /^3/, prepend "thirty"
  # /^4/, prepend "forty"
  # /^5/, prepend "fifty"
  # /^6/, prepend "sixty"
  # /^7/, prepend "seventy"
  # /^8/, prepend "eighty"
  # /^9/, prepend "ninety"
  # if n_string.length == 3, append "hundred"

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


    if n_string.length > 1

      lambda { |n| 

        if n_length == 2
          english = english + "teen"

        end
        if n_string.length >= 2
          lambda { |n|
              if n_length >= 3

                english = english + "hundred"
                if n_length >= 4
                  lambda { |n|  
                    if n_length == 4
                      english = english + "thousand"
                    end
                  }
                  
                end
              end
          }

        end
  
      }

    end
  }

  # Should it have a single_num() { returns one, two, three...}
  # duple_num(){ returns eleven, twelve, teen, twenty, thirty, forty, fifty...}
  # triple_num(){ returns single_num() + hundred}

  assign_singleton_number[n]

  our_number = our_number + english.length
}



(1..5).each do |n|
  write_out_number[n]
end
puts "the answer:" + our_number.to_s