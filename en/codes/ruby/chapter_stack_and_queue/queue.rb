=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # Initialize the queue
  # Ruby's built-in Thread::Queue has no methods for peeking or iterating, so use an Array as a queue
  queue = []

  # Enqueue elements
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "queue = #{queue}"

  # Peek at the front element
  peek = queue.first
  puts "Front element (peek) = #{peek}"

  # Dequeue an element
  # Array#shift takes O(n) time because the queue uses an array
  pop = queue.shift
  puts "Dequeued element (pop) = #{pop}"
  puts "After removal, queue = #{queue}"

  # Get the queue size
  size = queue.length
  puts "Queue size = #{size}"

  # Check whether the queue is empty
  is_empty = queue.empty?
  puts "Queue is empty = #{is_empty}"
end
