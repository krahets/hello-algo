=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # Initialize the deque
  # Ruby has no built-in deque class; use an Array as a deque
  deque = []

  # Enqueue elements
  deque << 2
  deque << 5
  deque << 4
  # Front insertion in a simple array takes O(n); Ruby implementations can optimize Array#unshift
  deque.unshift(3)
  deque.unshift(1)
  puts "Deque deque = #{deque}"

  # Access an element
  peek_first = deque.first
  puts "Front element peek_first = #{peek_first}"
  peek_last = deque.last
  puts "Rear element peek_last = #{peek_last}"

  # Dequeue an element
  # Front removal in a simple array takes O(n); Ruby implementations can optimize Array#shift
  pop_front = deque.shift
  puts "Element dequeued from the front: pop_front = #{pop_front}; deque = #{deque}"
  pop_back = deque.pop
  puts "Element dequeued from the rear: pop_back = #{pop_back}; deque = #{deque}"

  # Get the deque size
  size = deque.length
  puts "Deque size = #{size}"

  # Check whether the deque is empty
  is_empty = size.zero?
  puts "Is the deque empty? #{is_empty}"
end
