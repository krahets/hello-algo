=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Doubly linked list node
class ListNode
  attr_accessor :val
  attr_accessor :next # Successor node reference
  attr_accessor :prev # Predecessor node reference

  ### Constructor ###
  def initialize(val)
    @val = val
  end
end

### Deque based on doubly linked list ###
class LinkedListDeque
  ### Get deque length ###
  attr_reader :size

  ### Constructor ###
  def initialize
    @front = nil  # Head node front
    @rear = nil   # Tail node rear
    @size = 0     # Length of the double-ended queue
  end

  ### Check if deque is empty ###
  def is_empty?
    size.zero?
  end

  ### Enqueue operation ###
  def push(num, is_front)
    node = ListNode.new(num)
    # If list is empty, set both front and rear to node
    if is_empty?
      @front = @rear = node
    # Front of the queue enqueue operation
    elsif is_front
      # Add node to the head of the linked list
      @front.prev = node
      node.next = @front
      @front = node # Update head node
    # Rear of the queue enqueue operation
    else
      # Add node to the tail of the linked list
      @rear.next = node
      node.prev = @rear
      @rear = node # Update tail node
    end
    @size += 1 # Update queue length
  end

  ### Enqueue at front ###
  def push_first(num)
    push(num, true)
  end

  ### Enqueue at rear ###
  def push_last(num)
    push(num, false)
  end

  ### Dequeue operation ###
  def pop(is_front)
    raise IndexError, 'Deque is empty' if is_empty?

    # Temporarily store head node value
    if is_front
      val = @front.val # Delete head node
      # Delete head node
      fnext = @front.next
      unless fnext.nil?
        fnext.prev = nil
        @front.next = nil
      end
      @front = fnext # Update head node
    # Temporarily store tail node value
    else
      val = @rear.val # Delete tail node
      # Update tail node
      rprev = @rear.prev
      unless rprev.nil?
        rprev.next = nil
        @rear.prev = nil
      end
      @rear = rprev # Update tail node
    end
    @size -= 1 # Update queue length

    val
  end

  ### Dequeue from front ###
  def pop_first
    pop(true)
  end

  ### Dequeue from front ###
  def pop_last
    pop(false)
  end

  ### Access front element ###
  def peek_first
    raise IndexError, 'Deque is empty' if is_empty?

    @front.val
  end

  ### Access rear element ###
  def peek_last
    raise IndexError, 'Deque is empty' if is_empty?

    @rear.val
  end

  ### Return array for printing ###
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

### Driver Code ###
if __FILE__ == $0
  # Get the length of the double-ended queue
  deque = LinkedListDeque.new
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
  puts "After element 1 enqueues at front, deque = #{deque.to_array}"

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
