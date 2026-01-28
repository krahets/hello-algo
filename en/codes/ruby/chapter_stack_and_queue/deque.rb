=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Get the length of the double-ended queue
  # Ruby has no built-in deque, can only use Array as deque
  deque = []

  # Element enqueues
  deque << 2
  deque << 5
  deque << 4
  # Note: due to array, Array#unshift method has O(n) time complexity
  deque.unshift(3)
  deque.unshift(1)
  puts "Deque deque = #{deque}"

  # Update element
  peek_first = deque.first
  puts "Front element peek_first = #{peek_first}"
  peek_last = deque.last
  puts "Rear element peek_last = #{peek_last}"

  # Element dequeue
  # Note: due to array, Array#shift method has O(n) time complexity
  pop_front = deque.shift
  puts "Dequeue front element pop_front = #{pop_front}, after dequeue deque = #{deque}"
  pop_back = deque.pop
  puts "Dequeue rear element pop_back = #{pop_back}, after dequeue deque = #{deque}"

  # Get the length of the double-ended queue
  size = deque.length
  puts "Deque length size = #{size}"

  # Check if the double-ended queue is empty
  is_empty = size.zero?
  puts "Is deque empty = #{is_empty}"
end
