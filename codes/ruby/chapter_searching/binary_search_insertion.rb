=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分查找插入点（无重复元素） ###
def binary_search_insertion_simple(nums, target)
  # 初始化双闭区间 [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # 计算中点索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target 在区间 [m+1, j] 中
    elsif nums[m] > target
      j = m - 1 # target 在区间 [i, m-1] 中
    else
      return m  # 找到 target ，返回插入点 m
    end
  end

  i # 未找到 target ，返回插入点 i
end

### 二分查找插入点（存在重复元素） ###
def binary_search_insertion(nums, target)
  # 初始化双闭区间 [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # 计算中点索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target 在区间 [m+1, j] 中
    elsif nums[m] > target
      j = m - 1 # target 在区间 [i, m-1] 中
    else
      j = m - 1 # 首个小于 target 的元素在区间 [i, m-1] 中
    end
  end

  i # 返回插入点 i
end

### Driver Code ###
if __FILE__ == $0
  # 无重复元素的数组
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\n数组 nums = #{nums}"
  # 二分查找插入点
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "元素 #{target} 的插入点的索引为 #{index}"
  end

  # 包含重复元素的数组
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n数组 nums = #{nums}"
  # 二分查找插入点
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "元素 #{target} 的插入点的索引为 #{index}"
  end
end
