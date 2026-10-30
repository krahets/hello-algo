=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Deque implemented with a circular array ###
class ArrayDeque
  ### Get the deque size ###
  attr_reader :size

  ### Constructor ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### Get the deque capacity ###
  def capacity
    @nums.length
  end

  ### Check whether the deque is empty ###
  def is_empty?
    size.zero?
  end

  ### Enqueue at the front ###
  def push_first(num)
    if size == capacity
      puts 'Deque is full'
      return
    end

    # Move the front pointer one position to the left
    # Use modulo to wrap front to the end when it passes the beginning of the array
    @front = index(@front - 1)
    # Add num to the front
    @nums[@front] = num
    @size += 1
  end

  ### Enqueue at the rear ###
  def push_last(num)
    if size == capacity
      puts 'Deque is full'
      return
    end

    # Calculate the rear pointer, which points one position past the last element
    rear = index(@front + size)
    # Add num to the rear
    @nums[rear] = num
    @size += 1
  end

  ### Dequeue from the front ###
  def pop_first
    num = peek_first
    # Advance the front pointer by one position
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### Dequeue from the rear ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### Access the front element ###
  def peek_first
    raise IndexError, 'Deque is empty' if is_empty?

    @nums[@front]
  end

  ### Access the rear element ###
  def peek_last
    raise IndexError, 'Deque is empty' if is_empty?

    # Calculate the index of the last element
    last = index(@front + size - 1)
    @nums[last]
  end

  ### Return an array for printing ###
  def to_array
    # Convert only the list elements within the occupied range
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### Calculate an index in the circular array ###
  def index(i)
    # Use modulo to connect the end of the array to its beginning
    # When i passes the end of the array, wrap around to the beginning
    # When i passes the beginning of the array, wrap around to the end
    (i + capacity) % capacity
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the deque
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "Deque deque = #{deque.to_array}"

  # Access an element
  peek_first = deque.peek_first
  puts "Front element peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "Rear element peek_last = #{peek_last}"

  # Enqueue elements
  deque.push_last(4)
  puts "After enqueueing 4 at the rear, deque = #{deque.to_array}"
  deque.push_first(1)
  puts "After enqueueing 1 at the front, deque = #{deque.to_array}"

  # Dequeue an element
  pop_last = deque.pop_last
  puts "Element dequeued from the rear = #{pop_last}; deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Element dequeued from the front = #{pop_first}; deque = #{deque.to_array}"

  # Get the deque size
  size = deque.size
  puts "Deque size = #{size}"

  # Check whether the deque is empty
  is_empty = deque.is_empty?
  puts "Is the deque empty? #{is_empty}"
end
