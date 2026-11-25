=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # Initialize the deque
  # Ruby has no built-in deque, so use an Array as a deque
  deque = []

  # Add elements to the deque
  deque << 2
  deque << 5
  deque << 4
  # Array#unshift takes O(n) time because the deque uses an array
  deque.unshift(3)
  deque.unshift(1)
  puts "deque = #{deque}"

  # Peek at the front and rear elements
  peek_first = deque.first
  puts "Front element (peek_first) = #{peek_first}"
  peek_last = deque.last
  puts "Rear element (peek_last) = #{peek_last}"

  # Remove elements from both ends
  # Array#shift takes O(n) time because the deque uses an array
  pop_front = deque.shift
  puts "Removed from the front (pop_front) = #{pop_front}, deque after removal = #{deque}"
  pop_back = deque.pop
  puts "Removed from the rear (pop_back) = #{pop_back}, deque after removal = #{deque}"

  # Get the deque size
  size = deque.length
  puts "Deque size = #{size}"

  # Check whether the deque is empty
  is_empty = size.zero?
  puts "Deque is empty = #{is_empty}"
end
