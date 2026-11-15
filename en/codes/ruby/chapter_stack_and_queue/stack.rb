=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # Initialize the stack
  # Ruby has no built-in stack class; use an Array as a stack
  stack = []

  # Push elements onto the stack
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "Stack stack = #{stack}"

  # Access the top element
  peek = stack.last
  puts "Top element peek = #{peek}"

  # Pop an element from the stack
  pop = stack.pop
  puts "Popped element pop = #{pop}"
  puts "After popping, stack = #{stack}"

  # Get the stack size
  size = stack.length
  puts "Stack size = #{size}"

  # Check whether it is empty
  is_empty = stack.empty?
  puts "Is the stack empty? #{is_empty}"
end
