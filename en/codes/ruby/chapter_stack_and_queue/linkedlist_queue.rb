=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Queue implemented with a linked list ###
class LinkedListQueue
  ### Get the queue size ###
  attr_reader :size

  ### Constructor ###
  def initialize
    @front = nil  # Head node front
    @rear = nil   # Tail node rear
    @size = 0
  end

  ### Check whether the queue is empty ###
  def is_empty?
    @front.nil?
  end

  ### Enqueue ###
  def push(num)
    # Add num after the tail node
    node = ListNode.new(num)

    # If the queue is empty, point both the head and tail to this node
    if @front.nil?
      @front = node
      @rear = node
    # If the queue is not empty, append this node after the tail
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### Dequeue ###
  def pop
    num = peek
    # Remove the head node
    @front = @front.next
    @size -= 1
    num
  end

  ### Access the front element ###
  def peek
    raise IndexError, 'Queue is empty' if is_empty?

    @front.val
  end

  ### Convert the linked list to an Array and return it ###
  def to_array
    queue = []
    temp = @front
    while temp
      queue << temp.val
      temp = temp.next
    end
    queue
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the queue
  queue = LinkedListQueue.new

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
  pop_front = queue.pop
  puts "Dequeued element pop_front = #{pop_front}"
  puts "After dequeueing, queue = #{queue.to_array}"

  # Get the queue size
  size = queue.size
  puts "Queue size = #{size}"

  # Check whether the queue is empty
  is_empty = queue.is_empty?
  puts "Is the queue empty? #{is_empty}"
end
