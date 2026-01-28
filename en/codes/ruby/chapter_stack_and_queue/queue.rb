=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # Access front of the queue element
  # Ruby's built-in queue (Thread::Queue) has no peek and traversal methods, can use Array as queue
  queue = []

  # Elements enqueue
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Queue queue = #{queue}"

  # Access queue elements
  peek = queue.first
  puts "Front element peek = #{peek}"

  # Element dequeue
  # Note: due to array, Array#shift method has O(n) time complexity
  pop = queue.shift
  puts "Dequeue element pop = #{pop}"
  puts "After dequeue, queue = #{queue}"

  # Get the length of the queue
  size = queue.length
  puts "Queue length size = #{size}"

  # Check if the queue is empty
  is_empty = queue.empty?
  puts "Is queue empty = #{is_empty}"
end
