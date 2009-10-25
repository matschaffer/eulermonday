#The prime factors of 13195 are 5, 7, 13 and 29.
#
#What is the largest prime factor of the number 600851475143
#
#Start dividing the number by the first prime (i.e. 2). Keep dividing by the current factor
#till the remainder is zero. So, the number left is n/(current_prime_factor)**m, where m is the no. of times
#current factor was able to divide the number without remainder. Repeat this process with the next
#prime factor and the number left as a result of previous division and so on, unless the result of
#division becomes 1. As the prime factor we are using to divide keeps on increasing, and the loop ends
#when the number is completely divided (or say n become 1), return the current prime factor. This is our
#largest prime factor

require 'mathn'

def find_largest_prime(n)
  primes = Prime.new
  while n > 1
    current_prime_factor = primes.next
    while n % current_prime_factor == 0
      n /= current_prime_factor
    end
  end
  current_prime_factor
end

puts find_largest_prime(600851475143)