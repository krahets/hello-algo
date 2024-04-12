=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分查找（双闭区间） ###
def binary_search(nums, target)
  # 初始化双闭区间 [0, n-1] ，即 i, j 分别指向数组首元素、尾元素
  i, j = 0, nums.length - 1

  # 循环，当搜索区间为空时跳出（当 i > j 时为空）
  while i <= j
    # 理论上 Ruby 的数字可以无限大（取决于内存大小），无须考虑大数越界问题
    m = (i + j) / 2   # 计算中点索引 m
  
    if nums[m] < target
      i = m + 1 # 此情况说明 target 在区间 [m+1, j] 中
    elsif nums[m] > target
      j = m - 1 # 此情况说明 target 在区间 [i, m-1] 中
    else
      return m  # 找到目标元素，返回其索引
    end
  end

  -1  # 未找到目标元素，返回 -1
end

### 二分查找（左闭右开区间） ###
def binary_search_lcro(nums, target)
  # 初始化左闭右开区间 [0, n) ，即 i, j 分别指向数组首元素、尾元素+1
  i, j = 0, nums.length

  # 循环，当搜索区间为空时跳出（当 i = j 时为空）
  while i < j
    # 计算中点索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # 此情况说明 target 在区间 [m+1, j) 中
    elsif nums[m] > target
      j = m - 1 # 此情况说明 target 在区间 [i, m) 中
    else
      return m  # 找到目标元素，返回其索引
    end
  end

  -1  # 未找到目标元素，返回 -1
end

### Driver Code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分查找（双闭区间）
  index = binary_search(nums, target)
  puts "目标元素 6 的索引 =  #{index}"

  # 二分查找（左闭右开区间）
  index = binary_search_lcro(nums, target)
  puts "目标元素 6 的索引 =  #{index}"
end
