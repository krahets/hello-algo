=begin
File: binary_search_recur.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Binary search: problem f(i, j) ###
def dfs(nums, target, i, j)
  # An empty interval contains no target, so return -1
  return -1 if i > j
  
  # Compute the middle index m
  m = (i + j) / 2

  if nums[m] < target
    # Recursively solve f(m+1, j)
    return dfs(nums, target, m + 1, j)
  elsif nums[m] > target
    # Recursively solve f(i, m-1)
    return dfs(nums, target, i, m - 1)
  else
    # Target found: return its index
    return m
  end
end

### Binary search ###
def binary_search(nums, target)
  n = nums.length
  # Solve f(0, n-1)
  dfs(nums, target, 0, n - 1)
end

### Driver code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # Binary search (closed interval)
  index = binary_search(nums, target)
  puts "Index of target 6 = #{index}"
end
