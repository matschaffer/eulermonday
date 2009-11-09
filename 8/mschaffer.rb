number = File.read('problem.txt').scan(/^\d+/).join

products = []

0.upto(number.length - 5) do |i|
  products << number[i..(i+4)].scan(/./).map(&:to_i).inject(&:*)
end

puts products.max

=begin

a b c d e f g h i j k l m n o p q

[abc(de)] [bc(de)f] [c(de)fg] [(de)fgh] [] [] []

=end