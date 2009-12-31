class Euler17
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
      add_this_shit_up
      p @num_as_word #comment out for cleaner output
      @num_as_word = "" #reset
    end
  end
  
  # Set variables accessible to the outside
  def sum=(set_sum)
    @sum = set_sum
  end

  # Generators for @num_as_word
  def gen_single(num)
    @num_as_word = {
      1=>"one",
      2=>"two",
      3=>"three",
      4=>"four",
      5=>"five",
      6=>"six",
      7=>"seven",
      8=>"eight",
      9=>"nine"
    }[num]
  end

  def gen_duple(num)
      @num_as_word = case num
      when 10 then "ten"
      when 11 then "eleven"
      when 12 then "twelve"
      when 13 then "thirteen"
      when 15 then "fifteen"
      when 18 then "eighteen"
      when 14, 16, 17, 19 then convert_digit(1).to_s + "teen"
      when 20..29 then "twenty" + convert_digit(1).to_s
      when 30..39 then "thirty" + convert_digit(1).to_s
      when 40..49 then "forty" + convert_digit(1).to_s
      when 50..59 then "fifty" + convert_digit(1).to_s
      when 60..99 
        then convert_digit(2).to_s + "ty" + convert_digit(1).to_s
      end
  end
  
  def gen_triple(num)
    @num_as_word = case num
    # If first digit is a 1, @hundred = "onehundred" ?
    when 100, 200, 300, 400, 500, 600, 700, 800, 900 
      then convert_digit(3).to_s + "hundred"
    when 101..199, 201..299, 301..399, 401..499, 501..599, 601..699, 701..799, 801..899, 901..999 
      then convert_digit(3).to_s + "hundred" + "and" + convert_double_digit.to_s
    end
  end


  # Handles raw incoming number
  def build_words(num)
    num_len = num.to_s.length
    @num_as_word = {
      1=> gen_single(@current_num),
      2=> gen_duple(@current_num),
      3=> gen_triple(@current_num),
      4=> "onethousand"
    }[num_len]
  end


  # Read single digits and hand them off to the appropriate generator
  def convert_double_digit
      n_s = @current_num.to_s
      lst_n = n_s[-1,1] # gets last digit
      scnd_n = n_s[-2,1] # gets second digit
      dupl_n = scnd_n + lst_n # that's the two-digit num    
      if scnd_n.to_i === 0
        # if the first digit of n_s is 0
        @tmp_num = lst_n.to_i   
        gen_single(@tmp_num)
      else
        @tmp_num = dupl_n.to_i
        gen_duple(@tmp_num)
      end
  end

  # Return specified digit index as singlie digit word
  def convert_digit(dig) 
    dig = ("-" + dig.to_s).to_i
    @tmp_num = (@current_num.to_s[dig, 1]).to_i
    gen_single(@tmp_num) 
  end

  def add_this_shit_up
    eng_len = @num_as_word.to_s.length
    @sum += eng_len
  end
  
end

solution = Euler17.new(1, 1000)
p "The solution is #{solution.sum}"