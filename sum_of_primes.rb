# Sum of primes

def self.is_prime?( prime_test)
  return false if prime_test == 1 
  return true  if prime_test == 2
  for i in 2 .. (prime_test-1)
    mod = prime_test % i
    return false if (mod == 0) 
  end
  return true
end

primes = Array.new
num = 1

while primes.count < 1000 do
  if is_prime?( num )
    primes << num
  end
  num = num + 1
end

sum_of_primes = primes.inject(0){ |sum, e| sum + e }
puts sum_of_primes