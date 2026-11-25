=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Binary search for an insertion point (no duplicates) ###
def binary_search_insertion_simple(nums, target)
  # Initialize the closed interval [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Compute the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # Any match must lie in [m+1, j]
    elsif nums[m] > target
      j = m - 1 # Any match must lie in [i, m-1]
    else
      return m  # Found target. Return insertion point m
    end
  end

  i # Target not found. Return insertion point i
end

### Binary search for an insertion point (duplicates allowed) ###
def binary_search_insertion(nums, target)
  # Initialize the closed interval [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Compute the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # Any match must lie in [m+1, j]
    elsif nums[m] > target
      j = m - 1 # Any match must lie in [i, m-1]
    else
      j = m - 1 # Look in [i, m-1] for the rightmost element less than target
    end
  end

  i # Return insertion point i
end

### Driver code ###
if __FILE__ == $0
  # Array without duplicates
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\nArray nums = #{nums}"
  # Find the insertion point using binary search
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "Insertion index for #{target} = #{index}"
  end

  # Array with duplicates
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nArray nums = #{nums}"
  # Find the insertion point using binary search
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "Insertion index for #{target} = #{index}"
  end
end
