class Euler17
  attr_accessor :sum, :num_as_word
  def initialize(min, max, debug)
    @range = (min..max)
    @sum = 0
    @num_as_words
    @current_num 
    @tmp_num
    (@range).each do |n|
      @current_num = n
      gen_word(@current_num)
      if debug == true
          p @num_as_word #comment out for cleaner output
      end
      add_this_shit_up
      @num_as_word = "" #reset
    end
  end
  
  # Set variables accessible to the outside
  def sum=(set_sum)
    @sum = set_sum
  end

  def gen_word(num)
    @num_as_word = case num
      # Gotta define some stuff manually
      when 1 then "one"
      when 2 then "two"
      when 3 then "three"
      when 4 then "four"
      when 5 then "five"
      when 6 then "six"
      when 7 then "seven"
      when 8 then "eight"
      when 9 then "nine"
      when 10 then "ten"
      when 11 then "eleven"
      when 12 then "twelve"
      when 13 then "thirteen"
      when 15 then "fifteen"
      when 18 then "eighteen"
      when 14, 16, 17, 19 then convert_digit(1, 1) + "teen"
      # Before you can start to define programatically
      when 20..29 then "twenty" + convert_digit(1, 1)
      when 30..39 then "thirty" + convert_digit(1, 1)
      when 40..49 then "forty" + convert_digit(1, 1)
      when 50..59 then "fifty" + convert_digit(1, 1)
      when 80..89 then "eighty" + convert_digit(1, 1)
      when 60..79, 90..99 
        then convert_digit(2, 1) + "ty" + convert_digit(1, 1)
      when 100, 200, 300, 400, 500, 600, 700, 800, 900 
        then convert_digit(3, 1) + "hundred"
      when 101..199, 201..299, 301..399, 401..499, 501..599, 601..699, 701..799, 801..899, 901..999 
        then convert_digit(3, 1) + "hundred" + "and" + convert_digit(2, 2)
      when 1000 then "onethousand"
      end      
    end
  end

  # convert a set of digits to a word (start digit, length of num)
  def convert_digit(dig, len)
    dig = ("-" + dig.to_s).to_i
    @tmp_num = (@current_num.to_s[dig, len]).to_i
    gen_word(@tmp_num).to_s       
  end

  def add_this_shit_up
    eng_len = @num_as_word.to_s.length #length of the word
    @sum += eng_len
  end


solution = Euler17.new(1, 1000, false)
p "The solution is #{solution.sum}"