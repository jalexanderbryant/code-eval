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
  def initialize( data )
    @data = data
    @next = nil
  end

  def get_data
  	return @data
  end

  def set_data( data )
  	@data = data
  end
  
  def get_next
  	return @next
  end

  def set_next( next_node )
  	@next = next_node
  end
end


class Stack  
  def initialize
    @head = nil
  end

  def push( data )
    new_node = Node.new(data)
    new_node.set_next( @head )
    @head = new_node
  end

  def pop
    if @head.nil?
      return nil
    end

    res = @head.get_data
    @head = @head.get_next
    return res
  end

  def top
    return @head.nil? ? nil : @head.get_data
  end

  def clear
    @head = nil
  end

  def empty?
    return (@head == nil)
  end

  def print
    node = @head

    stack_as_array = Array.new
    while node != nil
      stack_as_array << node.get_data
      node = node.get_next
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
  file = File.open( ARGV[0], 'r' )
  file.each do |line|
    puts valid_parenthesis( line.strip ).to_s.capitalize
  end
end

# Start
main