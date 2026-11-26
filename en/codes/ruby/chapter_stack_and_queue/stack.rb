=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # Initialize the stack
  # Ruby has no built-in stack class, so use an Array as a stack
  stack = []

  # Push elements onto the stack
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "stack = #{stack}"

  # Peek at the top element
  peek = stack.last
  puts "Top element (peek) = #{peek}"

  # Pop the top element
  pop = stack.pop
  puts "Popped element (pop) = #{pop}"
  puts "After the pop, stack = #{stack}"

  # Get the stack size
  size = stack.length
  puts "Stack size = #{size}"

  # Check whether the stack is empty
  is_empty = stack.empty?
  puts "Stack is empty = #{is_empty}"
end
