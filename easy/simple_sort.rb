#!/usr/bin/ruby
=begin
Problem Statement:
Write a program which sorts numbers.

Input:
Your program should accept as its first argument a path to a filename. Input 
example is the following:
70.920 -38.797 14.354 99.323 90.374 7.581
-37.507 -3.263 40.079 27.999 65.213 -55.552

Output:
Print sorted numbers in the following way. Please note, that you need to print
the numbers till the 3rd digit after the dot including trailing zeros.
-38.797 7.581 14.354 70.920 90.374 99.323
-55.552 -37.507 -3.263 27.999 40.079 65.213
=end

def insertion_sort( a )
  for i in (1..a.count-1) do 
    key = a[i]
    
    # Insert A[j] into the sorted sequence A[1..j-1]
    j = i - 1
    while ( j >= 0 ) && a[j] > key
      a[j+1] = a[j]
      j = j-1
    end
    a[j+1] = key
  end
  return a
end




def main
  input = File.open( ARGV[0], 'r' )

  input.each do |line|
    input_as_array = line.split    
    input_as_array.each_with_index{ |x, i| input_as_array[i] = x.to_f }
    insertion_sort( input_as_array ).each{ |x| printf("%#.3f ", x)}
    puts "\n"
    end
end 

# Start
main