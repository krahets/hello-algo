=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### Binary search (closed interval) ###
def binary_search(nums, target)
  # Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
  i, j = 0, nums.length - 1

  # Loop, exit when the search interval is empty (empty when i > j)
  while i <= j
    # In theory, Ruby numbers can be infinitely large (limited by memory), no need to consider overflow
    m = (i + j) / 2   # Calculate the midpoint index m
  
    if nums[m] < target
      i = m + 1 # This means target is in the interval [m+1, j]
    elsif nums[m] > target
      j = m - 1 # This means target is in the interval [i, m-1]
    else
      return m  # Found the target element, return its index
    end
  end

  -1  # Target element not found, return -1
end

### Binary search (left-closed right-open interval) ###
def binary_search_lcro(nums, target)
  # Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
  i, j = 0, nums.length

  # Loop, exit when the search interval is empty (empty when i = j)
  while i < j
    # Calculate the midpoint index m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # This means target is in the interval [m+1, j)
    elsif nums[m] > target
      j = m - 1 # This means target is in the interval [i, m)
    else
      return m  # Found the target element, return its index
    end
  end

  -1  # Target element not found, return -1
end

### Driver Code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # Binary search (closed interval on both sides)
  index = binary_search(nums, target)
  puts "Index of target element 6 is #{index}"

  # Binary search (left-closed right-open interval)
  index = binary_search_lcro(nums, target)
  puts "Index of target element 6 is #{index}"
end
