=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Find an insertion point using binary search (no duplicates) ###
def binary_search_insertion_simple(nums, target)
  # Initialize the closed interval [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Calculate the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # Target must be in [m+1, j] if it exists
    elsif nums[m] > target
      j = m - 1 # Target must be in [i, m-1] if it exists
    else
      return m  # Target was found; return insertion point m
    end
  end

  i # Target was not found; return insertion point i
end

### Find an insertion point using binary search (with duplicates) ###
def binary_search_insertion(nums, target)
  # Initialize the closed interval [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Calculate the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # Target must be in [m+1, j] if it exists
    elsif nums[m] > target
      j = m - 1 # Target must be in [i, m-1] if it exists
    else
      j = m - 1 # Continue in [i, m-1] to find the rightmost element smaller than target
    end
  end

  i # Return insertion point i
end

### Driver code ###
if __FILE__ == $0
  # Array with no duplicate elements
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\nArray nums = #{nums}"
  # Find an insertion point using binary search
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "Insertion index for element #{target}: #{index}"
  end

  # Array containing duplicate elements
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nArray nums = #{nums}"
  # Find an insertion point using binary search
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "Insertion index for element #{target}: #{index}"
  end
end
