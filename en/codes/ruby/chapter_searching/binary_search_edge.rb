=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### Binary search leftmost target ###
def binary_search_left_edge(nums, target)
  # Equivalent to finding the insertion point of target
  i = binary_search_insertion(nums, target)

  # Target not found, return -1
  return -1 if i == nums.length || nums[i] != target

  i # Found target, return index i
end

### Binary search rightmost target ###
def binary_search_right_edge(nums, target)
  # Convert to finding the leftmost target + 1
  i = binary_search_insertion(nums, target + 1)

  # j points to the rightmost target, i points to the first element greater than target
  j = i - 1

  # Target not found, return -1
  return -1 if j == -1 || nums[j] != target

  j # Found target, return index j
end

### Driver Code ###
if __FILE__ == $0
  # Array with duplicate elements
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nArray nums = #{nums}"

  # Binary search left and right boundaries
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "Leftmost element #{target} index is #{index}"
    index = binary_search_right_edge(nums, target)
    puts "Rightmost element #{target} index is #{index}"
  end
end
