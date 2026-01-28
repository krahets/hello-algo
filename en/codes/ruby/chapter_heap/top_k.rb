=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### Push element to heap ###
def push_min_heap(heap, val)
  # Negate element
  heap.push(-val)
end

### Pop element from heap ###
def pop_min_heap(heap)
  # Negate element
  -heap.pop
end

### Access heap top element ###
def peek_min_heap(heap)
  # Negate element
  -heap.peek
end

### Get elements from heap ###
def get_min_heap(heap)
  # Negate all elements in heap
  heap.max_heap.map { |x| -x }
end

### Find largest k elements in array using heap ###
def top_k_heap(nums, k)
  # Python's heapq module implements min heap by default
  # Note: We negate all heap elements to simulate min heap using max heap
  max_heap = MaxHeap.new([])

  # Enter the first k elements of array into heap
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # Starting from the (k+1)th element, maintain heap length as k
  for i in k...nums.length
    # If current element is greater than top element, top element exits heap, current element enters heap
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "The largest #{k} elements are"
  print_heap(res)
end
