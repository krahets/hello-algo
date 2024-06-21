=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分搜尋插入點（無重複元素） ###
def binary_search_insertion_simple(nums, target)
  # 初始化雙閉區間 [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # 計算中點索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target 在區間 [m+1, j] 中
    elsif nums[m] > target
      j = m - 1 # target 在區間 [i, m-1] 中
    else
      return m  # 找到 target ，返回插入點 m
    end
  end

  i # 未找到 target ，返回插入點 i
end

### 二分搜尋插入點（存在重複元素） ###
def binary_search_insertion(nums, target)
  # 初始化雙閉區間 [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # 計算中點索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target 在區間 [m+1, j] 中
    elsif nums[m] > target
      j = m - 1 # target 在區間 [i, m-1] 中
    else
      j = m - 1 # 首個小於 target 的元素在區間 [i, m-1] 中
    end
  end

  i # 返回插入點 i
end

### Driver Code ###
if __FILE__ == $0
  # 無重複元素的陣列
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\n陣列 nums = #{nums}"
  # 二分搜尋插入點
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "元素 #{target} 的插入點的索引為 #{index}"
  end

  # 包含重複元素的陣列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n陣列 nums = #{nums}"
  # 二分搜尋插入點
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "元素 #{target} 的插入點的索引為 #{index}"
  end
end
