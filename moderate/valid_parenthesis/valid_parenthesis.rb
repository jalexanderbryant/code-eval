#!/usr/bin/ruby
=begin
  Problem Statement:
  Given a string comprising just of the characters (,),{,},[,] determine
  if it is well-formed or not.
  
  Input:
  Your program should accept as its first argument a path to a filename. Each line in this file contains a string comprising of the characters mentioned above. E.g.
  ()
  ([)]

  Output:
  Print out True or False if the string is well-formed. E.g.
  True
  False
=end

class Node
  attr_accessor :data
  attr_accessor :next

  def initialize( data )
    @data = data
    @next = nil
  end

end


class Stack  
  def initialize
    @head = nil
  end

  def push( data )
    new_node = Node.new(data)
    new_node.next = @head
    @head = new_node
  end

  def pop
    return nil if @head.nil?

    res = @head.data
    @head = @head.next
    res
  end

  def top
    return @head.nil? ? nil : @head.data
  end

  def clear
    @head = nil
  end

  def empty?
    return @head == nil
  end

  def print
    node = @head

    stack_as_array = Array.new
    while node != nil
      stack_as_array << node.data
      node = node.next
    end
    puts stack_as_array.join(' ')
  end
end

def valid_parenthesis( test_string )
  stack = Stack.new
  test_string.each_char do |c|
    case c
    when '(', '[', '{'
      stack.push( c )
    when ')'
      return false if stack.top != '('
      stack.pop
    when ']'
      return false if stack.top != '['
      stack.pop
    when '}'
      return false if stack.top != '{'
      stack.pop
    end
  end
  return stack.empty? ? true : false
end

def main
  stack = Stack.new
  
  if ARGV[0].nil?
    puts "USAGE: ./valid_parenthesis.rb <input file>"
    return
  end

  file = File.open( ARGV[0], 'r' )
  file.each do |line|
    puts valid_parenthesis( line.strip ).to_s.capitalize
  end
end

# Start
main