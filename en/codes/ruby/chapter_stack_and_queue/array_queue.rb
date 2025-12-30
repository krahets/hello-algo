=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Queue based on circular array ###
class ArrayQueue
  ### Get queue length ###
  attr_reader :size

  ### Constructor ###
  def initialize(size)
    @nums = Array.new(size, 0) # Array for storing queue elements
    @front = 0 # Front pointer, points to the front of the queue element
    @size = 0 # Queue length
  end

  ### Get queue capacity ###
  def capacity
    @nums.length
  end

  ### Check if queue is empty ###
  def is_empty?
    size.zero?
  end

  ### Enqueue ###
  def push(num)
    raise IndexError, 'Queue is full' if size == capacity

    # Use modulo operation to wrap rear around to the head after passing the tail of the array
    # Add num to the rear of the queue
    rear = (@front + size) % capacity
    # Front pointer moves one position backward
    @nums[rear] = num
    @size += 1
  end

  ### Dequeue ###
  def pop
    num = peek
    # Move front pointer backward by one position, if it passes the tail, return to array head
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### Access front element ###
  def peek
    raise IndexError, 'Queue is empty' if is_empty?

    @nums[@front]
  end

  ### Return list for printing ###
  def to_array
    res = Array.new(size, 0)
    j = @front

    for i in 0...size
      res[i] = @nums[j % capacity]
      j += 1
    end

    res
  end
end

### Driver Code ###
if __FILE__ == $0
  # Access front of the queue element
  queue = ArrayQueue.new(10)

  # Elements enqueue
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Queue queue = #{queue.to_array}"

  # Return list for printing
  peek = queue.peek
  puts "Front element peek = #{peek}"

  # Element dequeue
  pop = queue.pop
  puts "Dequeue element pop = #{pop}"
  puts "After dequeue, queue = #{queue.to_array}"

  # Get the length of the queue
  size = queue.size
  puts "Queue length size = #{size}"

  # Check if the queue is empty
  is_empty = queue.is_empty?
  puts "Is queue empty = #{is_empty}"

  # Test circular array
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "After round #{i} of enqueue + dequeue, queue = #{queue.to_array}"
  end
end
