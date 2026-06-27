=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Stack based on linked list ###
class LinkedListStack
  attr_reader :size

  ### Constructor ###
  def initialize
    @size = 0
  end

  ### Check if stack is empty ###
  def is_empty?
    @peek.nil?
  end

  ### Push ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### Pop ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### Access top element ###
  def peek
    raise IndexError, 'Stack is empty' if is_empty?

    @peek.val
  end

  ### Convert linked list to Array and return ###
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

### Driver Code ###
if __FILE__ == $0
  # Access top of the stack element
  stack = LinkedListStack.new

  # Elements push onto stack
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "Stack stack = #{stack.to_array}"

  # Return list for printing
  peek = stack.peek
  puts "Top element peek = #{peek}"

  # Element pop from stack
  pop = stack.pop
  puts "Pop element pop = #{pop}"
  puts "After pop, stack = #{stack.to_array}"

  # Get the length of the stack
  size = stack.size
  puts "Stack length size = #{size}"

  # Check if empty
  is_empty = stack.is_empty?
  puts "Is stack empty = #{is_empty}"
end
