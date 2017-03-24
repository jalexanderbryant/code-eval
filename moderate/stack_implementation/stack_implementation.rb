#!/usr/bin/ruby
=begin
  Problem Statement:
  Write a program which implements a stack interface for integers. 
  The interface should have ‘push’ and ‘pop’ functions. Your task is to ‘push’ 
  a series of integers and then ‘pop’ and print every alternate integer.
  
  Input:
  Your program should accept a file as its first argument. 
  The file contains a series of space delimited integers, one per line. For example
  1 2 3 4
  10 -2 3 4

  Output:
  Print to stdout every alternate space delimited integer, one per line.
  For example:
  4 2
  4 -2
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


def main
  # my_stack = Stack.new
  # my_stack.print
  # my_stack.pop

  # (2..13).each do |i|
  #   my_stack.push( i )
  # end

  # my_stack.print
  # my_stack.empty_stack
  # my_stack.print

  stack = Stack.new

  file = File.open( ARGV[0], 'r' )
  

  file.each do |line|
    line.split.each { |v | stack.push ( v ) }
    res = []    
    while !stack.empty?
      res << stack.pop
      stack.pop
    end
    puts res.join(' ')

    # Empty stack
    stack.clear
    
  end
end

# Start
main