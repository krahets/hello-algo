=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Binary search on a closed interval ###
def binary_search(nums, target)
  # Initialize the closed interval [0, n-1] with i at the first element and j at the last
  i, j = 0, nums.length - 1

  # Stop when the search interval is empty (i > j)
  while i <= j
    # Ruby integers can grow as large as memory allows, so overflow is not a concern here
    m = (i + j) / 2   # Compute the midpoint index m
  
    if nums[m] < target
      i = m + 1 # Any match must lie in [m+1, j]
    elsif nums[m] > target
      j = m - 1 # Any match must lie in [i, m-1]
    else
      return m  # Found the target. Return its index
    end
  end

  -1  # Target not found. Return -1
end

### Binary search on a left-closed, right-open interval ###
def binary_search_lcro(nums, target)
  # Initialize [0, n) with i at the first element and j one past the last
  i, j = 0, nums.length

  # Stop when the search interval is empty (i = j)
  while i < j
    # Compute the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # Any match must lie in [m+1, j)
    elsif nums[m] > target
      j = m # Any match must lie in [i, m)
    else
      return m  # Found the target. Return its index
    end
  end

  -1  # Target not found. Return -1
end

### Driver code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # Binary search on a closed interval
  index = binary_search(nums, target)
  puts "Index of target 6 = #{index}"

  # Binary search on a left-closed, right-open interval
  index = binary_search_lcro(nums, target)
  puts "Index of target 6 = #{index}"
end
