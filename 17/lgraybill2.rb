class Euler17
  attr_accessor :sum, :word
  def initialize(min, max)
    @range = (min..max)
    @sum = 0
    @range.each do |n|
      @current_num = n
      assign_word(@current_num)
      # p @word # uncomment to see the numbers written out as words
      add_this_shiz_up
    end
  end

  # convert a set of digits to a word (start digit, length of num)
  def convert(dig, len)
    dig = ("-" + dig.to_s).to_i
    @tmp_num = (@current_num.to_s[dig, len]).to_i
    assign_word(@tmp_num).to_s       
  end

  def add_this_shiz_up
    eng_len = @word.to_s.length #length of the word
    @sum += eng_len
  end

  def assign_word(num)
    @word = case num
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
      when 18 then "eighteen" # manually removing extra 't'
      when 14, 16, 17, 19 then convert(1, 1) + "teen"
      # Now you can define stuff programatically
      when 20..29 then "twenty" + convert(1, 1)
      when 30..39 then "thirty" + convert(1, 1)
      when 40..49 then "forty" + convert(1, 1)
      when 50..59 then "fifty" + convert(1, 1)
      when 80..89 then "eighty" + convert(1, 1) # manually removing extra 't'
      when 60..79, 90..99 then convert(2, 1) + "ty" + convert(1, 1)
      when 100..999
        if num.to_s[-2,2] == "00" # don't append the "and"
          convert(3,1) + "hundred"
        else  
          convert(3, 1) + "hundred" + "and" + convert(2, 2)
        end  
      when 1000 then "onethousand"
      end      
    end
  end

solution = Euler17.new(1, 1000)
p "Booyah: #{solution.sum}"