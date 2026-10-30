=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### Push an element onto the heap ###
def push_min_heap(heap, val)
  # Negate the value
  heap.push(-val)
end

### Pop an element from the heap ###
def pop_min_heap(heap)
  # Negate the value
  -heap.pop
end

### Access the top element of the heap ###
def peek_min_heap(heap)
  # Negate the value
  -heap.peek
end

### Get the elements in the heap ###
def get_min_heap(heap)
  # Negate all elements in the heap
  heap.max_heap.map { |x| -x }
end

### Use a heap to find the k largest elements in an array ###
def top_k_heap(nums, k)
  # Initialize a min heap
  # Note: negate all values in the heap to simulate a min heap with a max heap
  max_heap = MaxHeap.new([])

  # Push the first k array elements onto the heap
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # Starting with element k+1, keep the heap size at k
  for i in k...nums.length
    # If the current element is larger than the heap top, pop the top element and push the current element
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### Driver code ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "The largest #{k} elements are:"
  print_heap(res)
end
