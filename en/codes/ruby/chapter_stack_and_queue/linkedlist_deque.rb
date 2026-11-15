=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Doubly linked list node
class ListNode
  attr_accessor :val
  attr_accessor :next # Reference to the next node
  attr_accessor :prev # Reference to the previous node

  ### Constructor ###
  def initialize(val)
    @val = val
  end
end

### Deque implemented with a doubly linked list ###
class LinkedListDeque
  ### Get the deque size ###
  attr_reader :size

  ### Constructor ###
  def initialize
    @front = nil  # Head node front
    @rear = nil   # Tail node rear
    @size = 0     # Deque size
  end

  ### Check whether the deque is empty ###
  def is_empty?
    size.zero?
  end

  ### Enqueue operation ###
  def push(num, is_front)
    node = ListNode.new(num)
    # If the list is empty, point both front and rear to node
    if is_empty?
      @front = @rear = node
    # Enqueue at the front
    elsif is_front
      # Add node to the head of the linked list
      @front.prev = node
      node.next = @front
      @front = node # Update the head node
    # Enqueue at the rear
    else
      # Add node to the tail of the linked list
      @rear.next = node
      node.prev = @rear
      @rear = node # Update the tail node
    end
    @size += 1 # Update the queue size
  end

  ### Enqueue at the front ###
  def push_first(num)
    push(num, true)
  end

  ### Enqueue at the rear ###
  def push_last(num)
    push(num, false)
  end

  ### Dequeue operation ###
  def pop(is_front)
    raise IndexError, 'Deque is empty' if is_empty?

    # When the queue size is 1, the head and tail point to the same node
    if @size == 1
      val = @front.val
      @front = nil
      @rear = nil
    # Dequeue from the front
    elsif is_front
      val = @front.val # Save the head node value
      # Remove the head node
      fnext = @front.next
      fnext.prev = nil
      @front.next = nil
      @front = fnext # Update the head node
    # Dequeue from the rear
    else
      val = @rear.val # Save the tail node value
      # Remove the tail node
      rprev = @rear.prev
      rprev.next = nil
      @rear.prev = nil
      @rear = rprev # Update the tail node
    end
    @size -= 1 # Update the queue size

    val
  end

  ### Dequeue from the front ###
  def pop_first
    pop(true)
  end

  ### Dequeue from the rear ###
  def pop_last
    pop(false)
  end

  ### Access the front element ###
  def peek_first
    raise IndexError, 'Deque is empty' if is_empty?

    @front.val
  end

  ### Access the rear element ###
  def peek_last
    raise IndexError, 'Deque is empty' if is_empty?

    @rear.val
  end

  ### Return an array for printing ###
  def to_array
    node = @front
    res = Array.new(size, 0)
    for i in 0...size
      res[i] = node.val
      node = node.next
    end
    res
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize the deque
  deque = LinkedListDeque.new
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
