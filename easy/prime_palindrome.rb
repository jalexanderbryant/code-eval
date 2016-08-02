=begin
  Problem Statment:
  Write a program which determines the largest prime palindrome less than 1000.

  Input:
  No input.

  Output: 
  Print to stdout the largest prime palindrome less than 1000.
=end

def self.is_prime?( prime_test)
  return false if ( prime_test == 1 || prime_test == 0)
  return true  if prime_test == 2
  for i in 2 .. (prime_test-1)
    mod = prime_test % i
    return false if (mod == 0) 
  end
  return true
end


# Convert integer input to string.
# Reverse it. True if reversed string equals original string
def is_a_palindrome?( palindrome_test )
  input_as_string = palindrome_test.to_s
  input_reversed = input_as_string.reverse
  return input_as_string == input_reversed
end


def main

  # Counter 
  i = 2
  largest_palindrome = nil
  
  while ( i < 1000 )
    largest_palindrome = i if is_prime?( i ) && is_a_palindrome?( i )
    i += 1
  end

  puts largest_palindrome.to_i

end

# Start 
main