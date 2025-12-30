=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Deque based on circular array ###
class ArrayDeque
  ### Get deque length ###
  attr_reader :size

  ### Constructor ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### Get deque capacity ###
  def capacity
    @nums.length
  end

  ### Check if deque is empty ###
  def is_empty?
    size.zero?
  end

  ### Enqueue at front ###
  def push_first(num)
    if size == capacity
      puts 'Double-ended queue is full'
      return
    end

    # Use modulo operation to wrap front around to the tail after passing the head of the array
    # Add num to the front of the queue
    @front = index(@front - 1)
    # Add num to front of queue
    @nums[@front] = num
    @size += 1
  end

  ### Enqueue at rear ###
  def push_last(num)
    if size == capacity
      puts 'Double-ended queue is full'
      return
    end

    # Use modulo operation to wrap rear around to the head after passing the tail of the array
    rear = index(@front + size)
    # Front pointer moves one position backward
    @nums[rear] = num
    @size += 1
  end

  ### Dequeue from front ###
  def pop_first
    num = peek_first
    # Move front pointer backward by one position
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### Dequeue from rear ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### Access front element ###
  def peek_first
    raise IndexError, 'Deque is empty' if is_empty?

    @nums[@front]
  end

  ### Access rear element ###
  def peek_last
    raise IndexError, 'Deque is empty' if is_empty?

    # Initialize double-ended queue
    last = index(@front + size - 1)
    @nums[last]
  end

  ### Return array for printing ###
  def to_array
    # Elements enqueue
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### Calculate circular array index ###
  def index(i)
    # Use modulo operation to wrap the array head and tail together
    # When i passes the tail of the array, return to the head
    # When i passes the head of the array, return to the tail
    (i + capacity) % capacity
  end
end

### Driver Code ###
if __FILE__ == $0
  # Get the length of the double-ended queue
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "Deque deque = #{deque.to_array}"

  # Update element
  peek_first = deque.peek_first
  puts "Front element peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "Rear element peek_last = #{peek_last}"

  # Elements enqueue
  deque.push_last(4)
  puts "After element 4 enqueues at rear, deque = #{deque.to_array}"
  deque.push_first(1)
  puts "After element 1 enqueues at rear, deque = #{deque.to_array}"

  # Element dequeue
  pop_last = deque.pop_last
  puts "Dequeue rear element = #{pop_last}, after dequeue deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Dequeue front element = #{pop_first}, after dequeue deque = #{deque.to_array}"

  # Get the length of the double-ended queue
  size = deque.size
  puts "Deque length size = #{size}"

  # Check if the double-ended queue is empty
  is_empty = deque.is_empty?
  puts "Is deque empty = #{is_empty}"
end
