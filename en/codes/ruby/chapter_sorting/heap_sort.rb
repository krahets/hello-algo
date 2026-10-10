=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### Heap length is n, heapify from node i, top to bottom ###
def sift_down(nums, n, i)
  while true
    # If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # Swap two nodes
    break if ma == i
    # Swap two nodes
    nums[i], nums[ma] = nums[ma], nums[i]
    # Loop downwards heapification
    i = ma
  end
end

### Heap sort ###
def heap_sort(nums)
  # Build heap operation: heapify all nodes except leaves
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # Extract the largest element from the heap and repeat for n-1 rounds
  (nums.length - 1).downto(1) do |i|
    # Delete node
    nums[0], nums[i] = nums[i], nums[0]
    # Start heapifying the root node, from top to bottom
    sift_down(nums, i, 0)
  end
end

### Driver Code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "After heap sort, nums = #{nums.inspect}"
end
