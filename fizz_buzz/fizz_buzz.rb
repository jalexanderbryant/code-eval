#!/usr/bin/ruby

=begin
  Players generally sit in a circle. The first player says the number “1”, 
  and each player says next number in turn. However, any number divisible 
  by X (for example, three) is replaced by the word fizz, and any divisible
  by Y (for example, five) by the word buzz. Numbers divisible by both become 
  fizz buzz. A player who hesitates, or makes a mistake is eliminated from the game.

  Write a program that prints out the final series of numbers where those divisible by X,
  Y and both are replaced by “F” for fizz, “B” for buzz and “FB” for fizz buzz.


  Input:
  Your program should accept a file as its first argument. The file contains multiple
  separated lines; each line contains 3 numbers that are space delimited. The first 
  number is the first divider (X), the second number is the second divider (Y), and 
  the third number is how far you should count (N). You may assume that the input file 
  is formatted correctly and the numbers are valid positive integers.

  Output:
  Print out the series 1 through N replacing numbers divisible by X with “F”, numbers
   divisible by Y with “B” and numbers divisible by both with “FB”. Since the input 
   file contains multiple sets of values, your output should print out one line per set.
    Ensure that there are no trailing empty spaces in each line you print.
=end

# Fizz Buzz. All the magic happens here
def fizz_buzz( line )
  input = line.split
  fizz, buzz, count = input[0].to_i, input[1].to_i, input[2].to_i
  result = Array.new

  for i in 1 .. count do
    curr = case
      when (i % buzz ==0) && (i % fizz == 0) then "FB"
      when i % fizz == 0 then "F"
      when i % buzz == 0 then "B"
      else i
    end
    result << curr    
  end # End for loop

  return result.join(' ')
end

# Start
def main
  input = File.open(ARGV[0], "r")
  input.each do |line|
    puts fizz_buzz( line.strip )
  end
end

main 