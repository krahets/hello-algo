=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver code ###
if __FILE__ == $0
  # [region]{init_queue}
  # Initialize the queue
  # The built-in Ruby queue (Thread::Queue) has no peek or traversal methods; use an Array as a queue
  queue = []
  # [endregion]{init_queue}

  # [region]{push}
  # Enqueue elements
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  # [endregion]{push}
  puts "Queue queue = #{queue}"

  # [region]{peek}
  # Access a queue element
  peek = queue.first
  # [endregion]{peek}
  puts "Front element peek = #{peek}"

  # [region]{pop}
  # Dequeue an element
  # Note that Array#shift has O(n) time complexity because the underlying structure is an array
  pop = queue.shift
  # [endregion]{pop}
  puts "Dequeued element pop = #{pop}"
  puts "After dequeueing, queue = #{queue}"

  # [region]{size}
  # Get the queue size
  size = queue.length
  # [endregion]{size}
  puts "Queue size = #{size}"

  # [region]{is_empty}
  # Check whether the queue is empty
  is_empty = queue.empty?
  # [endregion]{is_empty}
  puts "Is the queue empty? #{is_empty}"
end
