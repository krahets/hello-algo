=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Stack backed by a linked list ###
class LinkedListStack
  attr_reader :size

  ### Constructor ###
  def initialize
    @size = 0
  end

  ### Check whether the stack is empty ###
  def is_empty?
    @peek.nil?
  end

  ### Push an element onto the stack ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### Remove and return the top element ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### Peek at the top element ###
  def peek
    raise IndexError, 'Stack is empty' if is_empty?

    @peek.val
  end

  ### Return the linked list elements as an array ###
  def to_array
    arr = []
    node = @peek
    while node
      arr << node.val
      node = node.next
    end
    arr.reverse
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the stack
  stack = LinkedListStack.new

  # Push elements onto the stack
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "stack = #{stack.to_array}"

  # Peek at the top element
  peek = stack.peek
  puts "Top element (peek) = #{peek}"

  # Pop the top element
  pop = stack.pop
  puts "Popped element (pop) = #{pop}"
  puts "After the pop, stack = #{stack.to_array}"

  # Get the stack size
  size = stack.size
  puts "Stack size = #{size}"

  # Check whether the stack is empty
  is_empty = stack.is_empty?
  puts "Stack is empty = #{is_empty}"
end
