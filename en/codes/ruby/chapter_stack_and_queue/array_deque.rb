=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Deque backed by a circular array ###
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

  ### Add an element at the front ###
  def push_first(num)
    if size == capacity
      puts 'Deque is full'
      return
    end

    # Move the front index one slot to the left
    # Use the remainder to wrap front to the end if it goes before the start
    @front = index(@front - 1)
    # Add num at the front
    @nums[@front] = num
    @size += 1
  end

  ### Add an element at the rear ###
  def push_last(num)
    if size == capacity
      puts 'Deque is full'
      return
    end

    # Compute the index one slot past the rear element
    rear = index(@front + size)
    # Add num at the rear
    @nums[rear] = num
    @size += 1
  end

  ### Remove and return the front element ###
  def pop_first
    num = peek_first
    # Advance the front index by one
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### Remove and return the rear element ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### Peek at the front element ###
  def peek_first
    raise IndexError, 'Deque is empty' if is_empty?

    @nums[@front]
  end

  ### Peek at the rear element ###
  def peek_last
    raise IndexError, 'Deque is empty' if is_empty?

    # Compute the index of the rear element
    last = index(@front + size - 1)
    @nums[last]
  end

  ### Return an array for printing ###
  def to_array
    # Copy only the elements currently in the deque
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### Compute the circular array index ###
  def index(i)
    # Use the remainder to wrap indices around the array
    # When i goes past the end, wrap it back to the start
    # When i goes before the start, wrap it around to the end
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
  puts "deque = #{deque.to_array}"

  # Peek at the front and rear elements
  peek_first = deque.peek_first
  puts "Front element (peek_first) = #{peek_first}"
  peek_last = deque.peek_last
  puts "Rear element (peek_last) = #{peek_last}"

  # Add elements to the deque
  deque.push_last(4)
  puts "After adding 4 at the rear, deque = #{deque.to_array}"
  deque.push_first(1)
  puts "After adding 1 at the front, deque = #{deque.to_array}"

  # Remove elements from both ends
  pop_last = deque.pop_last
  puts "Removed from the rear = #{pop_last}, deque after removal = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "Removed from the front = #{pop_first}, deque after removal = #{deque.to_array}"

  # Get the deque size
  size = deque.size
  puts "Deque size = #{size}"

  # Check whether the deque is empty
  is_empty = deque.is_empty?
  puts "Deque is empty = #{is_empty}"
end
