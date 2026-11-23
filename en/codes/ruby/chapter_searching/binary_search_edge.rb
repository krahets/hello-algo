=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### Find the leftmost occurrence of target using binary search ###
def binary_search_left_edge(nums, target)
  # This is equivalent to finding the insertion point of target
  i = binary_search_insertion(nums, target)

  # If target was not found, return -1
  return -1 if i == nums.length || nums[i] != target

  i # Target was found; return index i
end

### Find the rightmost occurrence of target using binary search ###
def binary_search_right_edge(nums, target)
  # For integer elements, find the leftmost insertion point of target + 1
  i = binary_search_insertion(nums, target + 1)

  # i is the index of the first element greater than target (or the array length); j is the candidate rightmost target index
  j = i - 1

  # If target was not found, return -1
  return -1 if j == -1 || nums[j] != target

  j # Target was found; return index j
end

### Driver code ###
if __FILE__ == $0
  # Array containing duplicate elements
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nArray nums = #{nums}"

  # Find the left and right boundaries using binary search
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "Index of the leftmost occurrence of #{target}: #{index}"
    index = binary_search_right_edge(nums, target)
    puts "Index of the rightmost occurrence of #{target}: #{index}"
  end
end
