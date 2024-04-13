=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分搜尋（雙閉區間） ###
def binary_search(nums, target)
  # 初始化雙閉區間 [0, n-1] ，即 i, j 分別指向陣列首元素、尾元素
  i, j = 0, nums.length - 1

  # 迴圈，當搜尋區間為空時跳出（當 i > j 時為空）
  while i <= j
    # 理論上 Ruby 的數字可以無限大（取決於記憶體大小），無須考慮大數越界問題
    m = (i + j) / 2   # 計算中點索引 m
  
    if nums[m] < target
      i = m + 1 # 此情況說明 target 在區間 [m+1, j] 中
    elsif nums[m] > target
      j = m - 1 # 此情況說明 target 在區間 [i, m-1] 中
    else
      return m  # 找到目標元素，返回其索引
    end
  end

  -1  # 未找到目標元素，返回 -1
end

### 二分搜尋（左閉右開區間） ###
def binary_search_lcro(nums, target)
  # 初始化左閉右開區間 [0, n) ，即 i, j 分別指向陣列首元素、尾元素+1
  i, j = 0, nums.length

  # 迴圈，當搜尋區間為空時跳出（當 i = j 時為空）
  while i < j
    # 計算中點索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # 此情況說明 target 在區間 [m+1, j) 中
    elsif nums[m] > target
      j = m - 1 # 此情況說明 target 在區間 [i, m) 中
    else
      return m  # 找到目標元素，返回其索引
    end
  end

  -1  # 未找到目標元素，返回 -1
end

### Driver Code ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分搜尋（雙閉區間）
  index = binary_search(nums, target)
  puts "目標元素 6 的索引 =  #{index}"

  # 二分搜尋（左閉右開區間）
  index = binary_search_lcro(nums, target)
  puts "目標元素 6 的索引 =  #{index}"
end
