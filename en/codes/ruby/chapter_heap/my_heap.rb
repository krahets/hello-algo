=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### Max heap ###
class MaxHeap
  attr_reader :max_heap

  ### Constructor, build heap from input list ###
  def initialize(nums)
    # Add list elements to heap as is
    @max_heap = nums
    # Heapify all nodes except leaf nodes
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### Get left child index ###
  def left(i)
    2 * i + 1
  end

  ### Get right child index ###
  def right(i)
    2 * i + 2
  end

  ### Get parent node index ###
  def parent(i)
    (i - 1) / 2     # Floor division
  end

  ### Swap elements ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### Get heap size ###
  def size
    @max_heap.length
  end

  ### Check if heap is empty ###
  def is_empty?
    size == 0
  end

  ### Access heap top element ###
  def peek
    @max_heap[0]
  end

  ### Push element to heap ###
  def push(val)
    # Add node
    @max_heap << val
    # Heapify from bottom to top
    sift_up(size - 1)
  end

  ### Heapify from node i, bottom to top ###
  def sift_up(i)
    loop do
      # Get parent node of node i
      p = parent(i)
      # When "crossing root node" or "node needs no repair", end heapify
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # Swap two nodes
      swap(i, p)
      # Loop upward heapify
      i = p
    end
  end

  ### Pop element from heap ###
  def pop
    # Handle empty case
    raise IndexError, "Heap is empty" if is_empty?
    # Delete node
    swap(0, size - 1)
    # Remove node
    val = @max_heap.pop
    # Return top element
    sift_down(0)
    # Return heap top element
    val
  end

  ### Heapify from node i, top to bottom ###
  def sift_down(i)
    loop do
      # If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # Swap two nodes
      break if ma == i

      # Swap two nodes
      swap(i, ma)
      # Loop downwards heapification
      i = ma
    end
  end

  ### Print heap (binary tree) ###
  def __print__
    print_heap(@max_heap)
  end
end

### Driver Code ###
if __FILE__ == $0
  # Consider negating the elements before entering the heap, which can reverse the size relationship, thus implementing max heap
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\nAfter inputting list and building heap"
  max_heap.__print__

  # Check if heap is empty
  peek = max_heap.peek
  puts "\nHeap top element is #{peek}"

  # Element enters heap
  val = 7
  max_heap.push(val)
  puts "\nAfter element #{val} pushes to heap"
  max_heap.__print__

  # Time complexity is O(n), not O(nlogn)
  peek = max_heap.pop
  puts "\nAfter heap top element #{peek} pops from heap"
  max_heap.__print__

  # Get heap size
  size = max_heap.size
  puts "\nHeap size is #{size}"

  # Check if heap is empty
  is_empty = max_heap.is_empty?
  puts "\nIs heap empty #{is_empty}"
end
