=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # Initialize the queue
  # The built-in Ruby queue (Thread::Queue) has no peek or traversal methods; use an Array as a queue
  queue = []

  # Enqueue elements
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Queue queue = #{queue}"

  # Access a queue element
  peek = queue.first
  puts "Front element peek = #{peek}"

  # Dequeue an element
  # Front removal in a simple array takes O(n); Ruby implementations can optimize Array#shift
  pop = queue.shift
  puts "Dequeued element pop = #{pop}"
  puts "After dequeueing, queue = #{queue}"

  # Get the queue size
  size = queue.length
  puts "Queue size = #{size}"

  # Check whether the queue is empty
  is_empty = queue.empty?
  puts "Is the queue empty? #{is_empty}"
end
