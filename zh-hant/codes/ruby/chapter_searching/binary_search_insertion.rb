=begin
File: binary_search_insertion.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 用二分搜尋找插入點（無重複元素） ###
def binary_search_insertion_simple(nums, target)
  # 將閉區間設為 [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # 計算中點索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target 若存在，必在區間 [m+1, j] 內
    elsif nums[m] > target
      j = m - 1 # target 若存在，必在區間 [i, m-1] 內
    else
      return m  # 找到 target，回傳插入點 m
    end
  end

  i # 找不到 target，回傳插入點 i
end

### 用二分搜尋找插入點（有重複元素） ###
def binary_search_insertion(nums, target)
  # 將閉區間設為 [0, n-1]
  i, j = 0, nums.length - 1

  while i <= j
    # 計算中點索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # target 若存在，必在區間 [m+1, j] 內
    elsif nums[m] > target
      j = m - 1 # target 若存在，必在區間 [i, m-1] 內
    else
      j = m - 1 # 最右邊小於 target 的元素位於區間 [i, m-1] 內
    end
  end

  i # 回傳插入點 i
end

### 主程式 ###
if __FILE__ == $0
  # 不含重複元素的陣列
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
  puts "\n陣列 nums = #{nums}"
  # 用二分搜尋找插入點
  for target in [6, 9]
    index = binary_search_insertion_simple(nums, target)
    puts "元素 #{target} 的插入位置索引為 #{index}"
  end

  # 含有重複元素的陣列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n陣列 nums = #{nums}"
  # 用二分搜尋找插入點
  for target in [2, 6, 20]
    index = binary_search_insertion(nums, target)
    puts "元素 #{target} 的插入位置索引為 #{index}"
  end
end
