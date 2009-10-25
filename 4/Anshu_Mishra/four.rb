#
#A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91  99.
#
#Find the largest palindrome made from the product of two 3-digit numbers
#
# Observations :
# Number = xyzzyx = 100001*x + 100010*y + 1100*z  (which is divisible by 11)
#
#




def largest_palindrome_for_even_digits(n)
  max_val = 0
  multiplier_x = get_multiplier_x(n)
  n.downto(100) { |y|
    multiplier_x.each { |x|
      product = x * y
      if product.to_s == product.to_s.reverse
        max_val = [max_val, product].max
      end
    }
  }
 max_val
end


def get_multiplier_x (n)
  multipliers = []
  current_val = n/11*11
  while current_val > 100
    multipliers << current_val
    current_val-=11
  end
  multipliers
end

puts largest_palindrome_for_even_digits(999)