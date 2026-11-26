=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Queue backed by a linked list ###
class LinkedListQueue
  ### Get the queue size ###
  attr_reader :size

  ### Constructor ###
  def initialize
    @front = nil  # Head node (@front)
    @rear = nil   # Tail node (@rear)
    @size = 0
  end

  ### Check whether the queue is empty ###
  def is_empty?
    @front.nil?
  end

  ### Enqueue an element ###
  def push(num)
    # Add a node containing num after the tail
    node = ListNode.new(num)

    # If the queue is empty, point both the head and tail at the new node
    if @front.nil?
      @front = node
      @rear = node
    # If the queue has elements, link the new node after the tail
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### Remove and return the front element ###
  def pop
    num = peek
    # Remove the head node
    @front = @front.next
    @size -= 1
    num
  end

  ### Peek at the front element ###
  def peek
    raise IndexError, 'Queue is empty' if is_empty?

    @front.val
  end

  ### Return the linked list elements as an array ###
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
  puts "queue = #{queue.to_array}"

  # Peek at the front element
  peek = queue.peek
  puts "Front element (front) = #{peek}"

  # Dequeue an element
  pop_front = queue.pop
  puts "Dequeued element (pop) = #{pop_front}"
  puts "After removal, queue = #{queue.to_array}"

  # Get the queue size
  size = queue.size
  puts "Queue size = #{size}"

  # Check whether the queue is empty
  is_empty = queue.is_empty?
  puts "Queue is empty = #{is_empty}"
end
