=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Binary search (closed interval) ###
def binary_search(nums, target)
  # Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
  i, j = 0, nums.length - 1

  # Loop until the search interval is empty (when i > j)
  while i <= j
    # Ruby integers can grow arbitrarily large, limited by available memory, so integer overflow is not a concern here
    m = (i + j) / 2   # Calculate the midpoint index m
  
    if nums[m] < target
      i = m + 1 # In this case, target must be in [m+1, j] if it exists
    elsif nums[m] > target
      j = m - 1 # In this case, target must be in [i, m-1] if it exists
    else
      return m  # The target element was found; return its index
    end
  end

  -1  # The target element was not found; return -1
end

### Binary search (left-closed, right-open interval) ###
def binary_search_lcro(nums, target)
  # Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
  i, j = 0, nums.length

  # Loop until the search interval is empty (when i = j)
  while i < j
    # Calculate the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # In this case, target must be in [m+1, j) if it exists
    elsif nums[m] > target
      j = m - 1 # In this case, target must be in [i, m) if it exists
    else
      return m  # The target element was found; return its index
    end
  end

  -1  # The target element was not found; return -1
end

### Driver code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # Binary search (closed interval)
  index = binary_search(nums, target)
  puts "Index of target element 6 = #{index}"

  # Binary search (left-closed, right-open interval)
  index = binary_search_lcro(nums, target)
  puts "Index of target element 6 = #{index}"
end
