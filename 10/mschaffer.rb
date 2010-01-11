n = 2_000_000
list = (2..n).to_a
primes = []
i = 0
max = n - 1

while i < max
  prime = list[i]
  if prime
    primes << prime
    j = i
    while j < max
      list[j] = nil
      j += prime
    end
  end
  i += 1
end

# more straightforward, but gc kills you
# while !list.empty?
#   prime = list.first
#   primes << prime
#   list = list.select { |n| n % prime != 0 }
# end

p primes.select{|n|n}.inject &:+
