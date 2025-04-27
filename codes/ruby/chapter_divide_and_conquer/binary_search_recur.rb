=begin
File: binary_search_recur.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二分查找：问题 f(i, j) ###
def dfs(nums, target, i, j)
  # 若区间为空，代表无目标元素，则返回 -1
  return -1 if i > j
  
  # 计算中点索引 m
  m = (i + j) / 2

  if nums[m] < target
    # 递归子问题 f(m+1, j)
    return dfs(nums, target, m + 1, j)
  elsif nums[m] > target
    # 递归子问题 f(i, m-1)
    return dfs(nums, target, i, m - 1)
  else
    # 找到目标元素，返回其索引
    return m
  end
end

### 二分查找 ###
def binary_search(nums, target)
  n = nums.length
  # 求解问题 f(0, n-1)
  dfs(nums, target, 0, n - 1)
end

### Driver Code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分查找（双闭区间）
  index = binary_search(nums, target)
  puts "目标元素 6 的索引 = #{index}"
end
