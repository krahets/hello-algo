=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### Queue based on linked list ###
class LinkedListQueue
  ### Get queue length ###
  attr_reader :size

  ### Constructor ###
  def initialize
    @front = nil  # Head node front
    @rear = nil   # Tail node rear
    @size = 0
  end

  ### Check if queue is empty ###
  def is_empty?
    @front.nil?
  end

  ### Enqueue ###
  def push(num)
    # Add num after the tail node
    node = ListNode.new(num)

    # If queue is empty, set both front and rear to this node
    if @front.nil?
      @front = node
      @rear = node
    # If queue is not empty, add this node after rear
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### Dequeue ###
  def pop
    num = peek
    # Delete head node
    @front = @front.next
    @size -= 1
    num
  end

  ### Access front element ###
  def peek
    raise IndexError, 'Queue is empty' if is_empty?

    @front.val
  end

  ### Convert linked list to Array and return ###
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

### Driver Code ###
if __FILE__ == $0
  # Access front of the queue element
  queue = LinkedListQueue.new

  # Element enqueues
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "Queue queue = #{queue.to_array}"

  # Return list for printing
  peek = queue.peek
  puts "Front element = #{peek}"

  # Element dequeue
  pop_front = queue.pop
  puts "Dequeue element pop = #{pop_front}"
  puts "After dequeue, queue = #{queue.to_array}"

  # Get the length of the queue
  size = queue.size
  puts "Queue length size = #{size}"

  # Check if the queue is empty
  is_empty = queue.is_empty?
  puts "Is queue empty = #{is_empty}"
end
