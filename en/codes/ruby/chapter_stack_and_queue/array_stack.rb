=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Stack based on array ###
class ArrayStack
  ### Constructor ###
  def initialize
    @stack = []
  end

  ### Get stack length ###
  def size
    @stack.length
  end

  ### Check if stack is empty ###
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

  ### Access top element ###
  def peek
    raise IndexError, 'Stack is empty' if is_empty?

    @stack.last
  end

  ### Return list for printing ###
  def to_array
    @stack
  end
end

### Driver Code ###
if __FILE__ == $0
  # Access top of the stack element
  stack = ArrayStack.new

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
