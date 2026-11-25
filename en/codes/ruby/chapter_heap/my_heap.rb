=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### Max-heap ###
class MaxHeap
  attr_reader :max_heap

  ### Constructor: build a heap from the input list ###
  def initialize(nums)
    # Copy the list elements into the heap in their original order
    @max_heap = nums
    # Heapify all non-leaf nodes
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### Get the left child index ###
  def left(i)
    2 * i + 1
  end

  ### Get the right child index ###
  def right(i)
    2 * i + 2
  end

  ### Get the parent index ###
  def parent(i)
    (i - 1) / 2     # Floor division
  end

  ### Swap elements ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### Get the heap size ###
  def size
    @max_heap.length
  end

  ### Check whether the heap is empty ###
  def is_empty?
    size == 0
  end

  ### Peek at the root ###
  def peek
    @max_heap[0]
  end

  ### Push an element onto the heap ###
  def push(val)
    # Add a node
    @max_heap << val
    # Sift up
    sift_up(size - 1)
  end

  ### Sift up from node i ###
  def sift_up(i)
    loop do
      # Get the parent of node i
      p = parent(i)
      # Stop sifting at the root or when the node already satisfies the heap property
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # Swap the two nodes
      swap(i, p)
      # Continue sifting up
      i = p
    end
  end

  ### Pop an element from the heap ###
  def pop
    # Handle an empty heap
    raise IndexError, "Heap is empty" if is_empty?
    # Swap the root and the rightmost leaf (the first and last elements)
    swap(0, size - 1)
    # Remove the node
    val = @max_heap.pop
    # Sift down
    sift_down(0)
    # Return the root element
    val
  end

  ### Sift down from node i ###
  def sift_down(i)
    loop do
      # Store the index of the largest of nodes i, l, and r in ma
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # Stop if i is already largest or both child indices l and r are out of bounds
      break if ma == i

      # Swap the two nodes
      swap(i, ma)
      # Continue sifting down
      i = ma
    end
  end

  ### Print the heap as a binary tree###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver code ###
if __FILE__ == $0
  # Initialize a max-heap
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\nHeap built from the input list:"
  max_heap.__print__

  # Get the root element
  peek = max_heap.peek
  puts "\nRoot element: #{peek}"

  # Push an element onto the heap
  val = 7
  max_heap.push(val)
  puts "\nHeap after pushing #{val}:"
  max_heap.__print__

  # Pop the root
  peek = max_heap.pop
  puts "\nHeap after popping the root (#{peek}):"
  max_heap.__print__

  # Get the heap size
  size = max_heap.size
  puts "\nNumber of elements in the heap: #{size}"

  # Check whether the heap is empty
  is_empty = max_heap.is_empty?
  puts "\nIs the heap empty? #{is_empty}"
end
