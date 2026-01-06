=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Access top of the stack element
  # Ruby has no built-in stack class, can use Array as stack
  stack = []

  # Elements push onto stack
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "Stack stack = #{stack}"

  # Return list for printing
  peek = stack.last
  puts "Top element peek = #{peek}"

  # Element pop from stack
  pop = stack.pop
  puts "Pop element pop = #{pop}"
  puts "After pop, stack = #{stack}"

  # Get the length of the stack
  size = stack.length
  puts "Stack length size = #{size}"

  # Check if empty
  is_empty = stack.empty?
  puts "Is stack empty = #{is_empty}"
end
