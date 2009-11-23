n = 2000000
source = range(2, n + 1)
primes = []
i = 0
max = n - 1

while i < max:
  prime = source[i]
  if prime:
    primes.append(prime)
    j = i
    while j < max:
      source[j] = False
      j += prime
  i += 1
  
print sum(primes)