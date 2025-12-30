=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Binary search insertion point (no duplicates) ###
def binary_search_insertion_simple(nums, target)
  # Initialize closed interval [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Calculate the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target is in the interval [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target is in the interval [i, m-1]
    else
      return m  # Found target, return insertion point m
    end
  end

  i # Target not found, return insertion point i
end

### Binary search insertion point (with duplicates) ###
def binary_search_insertion(nums, target)
  # Initialize closed interval [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # Calculate the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target is in the interval [m+1, j]
    elsif nums[m] > target
      j = m - 1 # target is in the interval [i, m-1]
    else
      j = m - 1 # The first element less than target is in the interval [i, m-1]
    end
  end

  i # Return insertion point i
end

### Driver Code ###
if __FILE__ == $0
  # Array without duplicate elements
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\nArray nums = #{nums}"
  # Binary search for insertion point
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "Insertion point index for element #{target} is #{index}"
  end

  # Array with duplicate elements
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\nArray nums = #{nums}"
  # Binary search for insertion point
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "Insertion point index for element #{target} is #{index}"
  end
end
