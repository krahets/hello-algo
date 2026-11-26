=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Array-backed stack ###
class ArrayStack
  ### Constructor ###
  def initialize
    @stack = []
  end

  ### Get the stack size ###
  def size
    @stack.length
  end

  ### Check whether the stack is empty ###
  def is_empty?
    @stack.empty?
  end

  ### Push an element onto the stack ###
  def push(item)
    @stack << item
  end

  ### Remove and return the top element ###
  def pop
    raise IndexError, 'Stack is empty' if is_empty?

    @stack.pop
  end

  ### Peek at the top element ###
  def peek
    raise IndexError, 'Stack is empty' if is_empty?

    @stack.last
  end

  ### Return the backing array for printing ###
  def to_array
    @stack
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the stack
  stack = ArrayStack.new

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
