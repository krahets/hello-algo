=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### Use binary search to find the leftmost occurrence of target ###
def binary_search_left_edge(nums, target)
  # Equivalent to finding the insertion point for target
  i = binary_search_insertion(nums, target)

  # Target not found. Return -1
  return -1 if i == nums.length || nums[i] != target

  i # Found target. Return index i
end

### Use binary search to find the rightmost occurrence of target ###
def binary_search_right_edge(nums, target)
  # Search for the leftmost occurrence of target + 1
  i = binary_search_insertion(nums, target + 1)

  # j points to the rightmost occurrence of target, and i to the first larger element
  j = i - 1

  # Target not found. Return -1
  return -1 if j == -1 || nums[j] != target

  j # Found target. Return index j
end

### Driver code ###
if __FILE__ == $0
  # Array with duplicates
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nArray nums = #{nums}"

  # Find the left and right boundaries using binary search
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "Index of the leftmost occurrence of #{target} = #{index}"
    index = binary_search_right_edge(nums, target)
    puts "Index of the rightmost occurrence of #{target} = #{index}"
  end
end
