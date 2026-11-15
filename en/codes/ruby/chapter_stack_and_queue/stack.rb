=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # [region]{init_stack}
  # Initialize the stack
  # Ruby has no built-in stack class; use an Array as a stack
  stack = []
  # [endregion]{init_stack}

  # [region]{push}
  # Push elements onto the stack
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  # [endregion]{push}
  puts "Stack stack = #{stack}"

  # [region]{peek}
  # Access the top element
  peek = stack.last
  # [endregion]{peek}
  puts "Top element peek = #{peek}"

  # [region]{pop}
  # Pop an element from the stack
  pop = stack.pop
  # [endregion]{pop}
  puts "Popped element pop = #{pop}"
  puts "After popping, stack = #{stack}"

  # [region]{size}
  # Get the stack size
  size = stack.length
  # [endregion]{size}
  puts "Stack size = #{size}"

  # [region]{is_empty}
  # Check whether it is empty
  is_empty = stack.empty?
  # [endregion]{is_empty}
  puts "Is the stack empty? #{is_empty}"
end
