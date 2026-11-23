=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### Sift down from node i in a heap of size n ###
def sift_down(nums, n, i)
  while true
    # Find the node with the largest value among i, l, and r, and store its index in ma
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # Stop if node i is largest or both child indices l and r are out of bounds
    break if ma == i
    # Swap the two nodes
    nums[i], nums[ma] = nums[ma], nums[i]
    # Continue sifting down
    i = ma
  end
end

### Heap sort ###
def heap_sort(nums)
  # Build the heap by sifting down from every non-leaf node
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # Extract the largest element from the heap, repeating for n-1 rounds
  (nums.length - 1).downto(1) do |i|
    # Swap the root with the rightmost leaf on the last level (the first and last elements of the current heap)
    nums[0], nums[i] = nums[i], nums[0]
    # Sift down starting at the root
    sift_down(nums, i, 0)
  end
end

### Driver code ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "After heap sort, nums = #{nums.inspect}"
end
