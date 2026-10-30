=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Stack implemented with an array ###
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

  ### Push ###
  def push(item)
    @stack << item
  end

  ### Pop ###
  def pop
    raise IndexError, 'Stack is empty' if is_empty?

    @stack.pop
  end

  ### Access the top element ###
  def peek
    raise IndexError, 'Stack is empty' if is_empty?

    @stack.last
  end

  ### Return a list for printing ###
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
  puts "Stack stack = #{stack.to_array}"

  # Access the top element
  peek = stack.peek
  puts "Top element peek = #{peek}"

  # Pop an element from the stack
  pop = stack.pop
  puts "Popped element pop = #{pop}"
  puts "After popping, stack = #{stack.to_array}"

  # Get the stack size
  size = stack.size
  puts "Stack size = #{size}"

  # Check whether it is empty
  is_empty = stack.is_empty?
  puts "Is the stack empty? #{is_empty}"
end
