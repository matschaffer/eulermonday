=begin maths
  a^2 + b^2 = c^2
  a + b + c = 1000 or c = 1000 - a - b
  
  (1000 - a - b)(1000 - a - b) = 
        10^6 - 1000a - 1000b
             - 1000a         + a^2 + ab
                     - 1000b       + ab + b^2
        _____________________________________
  c^2 = 10^6 - 2000a - 2000b + a^2 + 2ab + b^2
  
  a^2 + b^2 = 10^6 - 2000a - 2000b + a^2 + 2ab + b^2
  0 = 10^6 - 2000a - 2000b + 2ab
  
  2000a + 2000b - 2ab = 10^6
  a + b < 1000
  
  so we brute force that and bail on the first hit
=end

apocalypse = lambda { |a, b| a * b }

for satan in 2..1000
  for jesus in 2..1000
    if 2000 * satan + 2000 * jesus - 2 * satan * jesus == 1_000_000
      puts [satan, jesus, Math.sqrt(satan**2 + jesus**2).to_i].inject &apocalypse
      abort
    end
  end
end