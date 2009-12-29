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

class NumberAsWord
  attr_accessor :sum, :num_as_word
  def initialize(min, max)
    @range = (min..max)
    @sum = 0
    @num_as_word = num_as_word
    @current_num 
    @tmp_num
    (@range).each do |n|
      @current_num = n
      build_words(@current_num)
      p @num_as_word
      @num_as_word = ""
    end
    p "Final sum is: " + @sum.to_s
  end
  
  # Set variables
  def sum=(set_sum)
    @sum = set_sum
  end
  def num_as_word=(set_num_as_word)
    num_as_word = set_num_as_word
  end
  
  def gen_single(num)
    # p "gen_single" + num.to_s
    n_s = num.to_s
    #  could this be a hash table?
    if n_s =~ /^1/ then num = "one"    
    elsif n_s =~ /^2/ then num = "two"
    elsif n_s =~ /^3/ then num = "three"
    elsif n_s =~ /^4/ then num = "four"  
    elsif n_s =~ /^5/ then num = "five"
    elsif n_s =~ /^6/ then num = "six"  
    elsif n_s =~ /^7/ then num = "seven"
    elsif n_s =~ /^8/ then num = "eight"
    elsif n_s =~ /^9/ then num = "nine"
    else
      num = ""     
    end
    @num_as_word = num
  end
  
  def convert_single_digit
      n_s = @current_num.to_s || @tmp_num.to_s
      n_s = n_s[-1,1] # gets last digit
      @tmp_num = n_s.to_i
      # p "that single digit is: " + n_s.to_s
      # convert it using gen_single
      gen_single(@tmp_num)

  end
  
  def gen_duple(num)
    # p "duple num: " +num.to_s

    if num === 10 then @num_as_word = "ten"
    elsif num === 11 then @num_as_word = "eleven"
    elsif num === 12 then @num_as_word = "twelve"
    elsif num === 13 then @num_as_word = "thirteen"
    elsif num === 14 then @num_as_word = "fourteen"
    elsif num === 15 then @num_as_word = "fifteen"
    elsif num >= 16 && num < 20
      convert_single_digit
      # p @num_as_word
      # # if @num_as_word ends in "t", cut off the t      
      # if @num_as_word =~ /t/
      #   @num_as_word.chop
      # end
      @num_as_word = @num_as_word.to_s + "teen" 
      if @num_as_word == "eightteen" then @num_as_word = "eighteen" 
      end
    elsif num >= 20 && num < 30
      convert_single_digit
      @num_as_word = "twenty" + @num_as_word.to_s
    elsif num >= 30 && num < 40
      convert_single_digit
      @num_as_word = "thirty" + @num_as_word.to_s
    elsif num >= 40 && num < 50
      convert_single_digit
      @num_as_word = "forty" + @num_as_word.to_s
    elsif num >= 50 && num < 60
      convert_single_digit
      @num_as_word = "fifty" + @num_as_word.to_s
    elsif num >= 60 && num < 70
      convert_single_digit
      @num_as_word = "sixty" + @num_as_word.to_s
    elsif num >= 70 && num < 80
      convert_single_digit
      @num_as_word = "seventy" + @num_as_word.to_s
    elsif num >= 80 && num < 90
      convert_single_digit
      @num_as_word = "eighty" + @num_as_word.to_s
    elsif num >= 90 && num < 100
      convert_single_digit
      @num_as_word = "ninety" + @num_as_word.to_s
    end
  end

  def convert_duple_digit
      # p "convert_duple_digit" + @current_num.to_s
      n_s = @current_num.to_s
      lst_n = n_s[-1,1] # gets last digit
      scnd_n = n_s[-2,1] # gets second digit
      dupl_n = scnd_n + lst_n # that's the two-digit num

      # p "lst_n: " + lst_n
      # p "scnd_n: " + scnd_n.to_s
      # p "dupl_n: " + dupl_n

      if scnd_n.to_i === 0
        # if the first digit of n_s is 0
        @tmp_num = lst_n.to_i   
        gen_single(@tmp_num)
      else
        @tmp_num = dupl_n.to_i
        gen_duple(@tmp_num)
      end
  end

  def gen_triple(num)
    # p @current_num
    if @current_num === 100 then @num_as_word = "onehundred"
    elsif @current_num > 100 && @current_num < 200
      convert_duple_digit
      @num_as_word = "onehundredand" + @num_as_word.to_s
    elsif @current_num === 200 then @num_as_word = "twohundred"
    elsif @current_num > 200 && @current_num < 300
      convert_duple_digit
      @num_as_word = "twohundredand" + @num_as_word.to_s
    elsif @current_num === 300 then @num_as_word = "threehundred"
    elsif @current_num > 300 && @current_num < 400
      convert_duple_digit
      @num_as_word = "threehundredand" + @num_as_word.to_s
    elsif @current_num === 400 then @num_as_word = "fourhundred"
    elsif @current_num > 400 && @current_num < 500
      convert_duple_digit
      @num_as_word = "fourhundredand" + @num_as_word.to_s
    elsif @current_num === 500 then @num_as_word = "fivehundred"
    elsif @current_num > 500 && @current_num < 600
      convert_duple_digit
      @num_as_word = "fivehundredand" + @num_as_word.to_s
    elsif @current_num === 600 then @num_as_word = "sixhundred"
    elsif @current_num > 600 && @current_num < 700
      convert_duple_digit
      @num_as_word = "sixhundredand" + @num_as_word.to_s
    elsif @current_num === 700 then @num_as_word = "sevenhundred"
    elsif @current_num > 700 && @current_num < 800
      convert_duple_digit
      @num_as_word = "sevenhundredand" + @num_as_word.to_s
    elsif @current_num === 800 then @num_as_word = "eighthundred"
    elsif @current_num > 800 && @current_num < 900
      convert_duple_digit
      @num_as_word = "eighthundredand" + @num_as_word.to_s
    elsif @current_num === 900 then @num_as_word = "ninehundred"
    elsif @current_num > 900 && @current_num < 1000
      convert_duple_digit
      @num_as_word = "ninehundredand" + @num_as_word.to_s                                    
    end
  end
  
  def add_this_shit_up
    eng_len = @num_as_word.to_s.length
    @sum += eng_len
  end
  
  def build_words(num)
    num_len = num.to_s.length
    # p num_len
    if num_len == 1 then gen_single(@current_num)
    elsif num_len == 2 then gen_duple(@current_num)
    elsif num_len == 3 then gen_triple(@current_num)
    elsif num === 1000 then @num_as_word = "onethousand"
    else
      p "poo!"  
    end
    add_this_shit_up
  end
end

solution = NumberAsWord.new(1, 1000)
