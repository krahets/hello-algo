=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Queue implemented with a circular array ###
class ArrayQueue
  ### Get the queue size ###
  attr_reader :size

  ### Constructor ###
  def initialize(size)
    @nums = Array.new(size, 0) # Array that stores the queue elements
    @front = 0 # Front pointer, pointing to the first element
    @size = 0 # Queue size
  end

  ### Get the queue capacity ###
  def capacity
    @nums.length
  end

  ### Check whether the queue is empty ###
  def is_empty?
    size.zero?
  end

  ### Enqueue ###
  def push(num)
    raise IndexError, 'Queue is full' if size == capacity

    # Calculate the rear pointer, which points one position past the last element
    # Use modulo to wrap rear to the beginning when it passes the end of the array
    rear = (@front + size) % capacity
    # Add num to the rear
    @nums[rear] = num
    @size += 1
  end

  ### Dequeue ###
  def pop
    num = peek
    # Advance the front pointer by one position, wrapping to the beginning if it passes the end
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### Access the front element ###
  def peek
    raise IndexError, 'Queue is empty' if is_empty?

    @nums[@front]
  end

  ### Return a list for printing ###
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

### Driver code ###
if __FILE__ == $0
  # Initialize the queue
  queue = ArrayQueue.new(10)

  # Enqueue elements
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Queue queue = #{queue.to_array}"

  # Access the front element
  peek = queue.peek
  puts "Front element peek = #{peek}"

  # Dequeue an element
  pop = queue.pop
  puts "Dequeued element pop = #{pop}"
  puts "After dequeueing, queue = #{queue.to_array}"

  # Get the queue size
  size = queue.size
  puts "Queue size = #{size}"

  # Check whether the queue is empty
  is_empty = queue.is_empty?
  puts "Is the queue empty? #{is_empty}"

  # Test the circular array
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "After enqueueing and dequeueing in round #{i}, queue = #{queue.to_array}"
  end
end
