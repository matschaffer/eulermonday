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

class NumberInEnglish
  attr_accessor :sum, :english
  def initialize(min, max, sum)
    @range = (min..max)
    @sum = sum
    @english = english
    (@range).each do |n|
      build_words(n)
    end
  end
  def sum=(set_sum)
    @sum = set_sum
  end
  def english=(set_english)
    english = set_english
  end
  def gen_single(num)
    n_s = num.to_s
    #  could this be a hash table?
    if n_s =~ /^1/ then @english = "one"    
    elsif n_s =~ /^2/ then @english = "two"
    elsif n_s =~ /^3/ then @english = "three"
    elsif n_s =~ /^4/ then @english = "four"  
    elsif n_s =~ /^5/ then @english = "five"
    elsif n_s =~ /^6/ then @english = "six"  
    elsif n_s =~ /^7/ then @english = "seven"
    elsif n_s =~ /^8/ then @english = "eight"
    elsif n_s =~ /^9/ then @english = "nine"
    else
      @english = ""     
    end
    p @english
  end
  def get_digit(num)
    # get the second digit
      n_s = num.to_s
      n_s = n_s[-1,1] # gets last digit
      n_s = n_s.to_i
      # convert it using gen_single
      poo = gen_single(n_s)
      # if poo ends in "t", cut off the t
      if poo =~ /t/
        poo = poo.chop
      end
  end
  def gen_duple(num)
    if num === 10 then english = "ten"
    elsif num === 11 then english = "eleven"
    elsif num === 12 then english = "twelve"
    elsif num === 13 then english = "thirteen"
    elsif num === 14 then english = "fourteen"
    elsif num === 15 then english = "fifteen"
    elsif num >= 16 && num < 20
      poo = get_digit(num)
      # english = poo + "teen"  
    end
    p english
  end
  def gen_triple(num)
    
  end
  def add_this_shit_up
    eng_len = @english.length
    @sum += eng_len
  end
  def build_words(num)
    num_len = num.to_s.length
    # p num_len
    if num_len == 1 then gen_single(num)
    elsif num_len == 2 then gen_duple(num)
    elsif num_len == 3 then gen_triple(num)
    else
      p "poo!"  
    end
    add_this_shit_up
  end
end
solution = NumberInEnglish.new(1, 5, 0)
p "our solution is " + solution.sum.to_s