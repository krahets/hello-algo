=begin
File: binary_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

### 二分搜尋（閉區間） ###
def binary_search(nums, target)
  # 將閉區間設為 [0, n-1]，i 和 j 分別指向陣列的首、末元素
  i, j = 0, nums.length - 1

  # 當搜尋區間為空（i > j）時，結束迴圈
  while i <= j
    # Ruby 整數的大小只受記憶體容量限制，無須擔心整數溢位
    m = (i + j) / 2   # 計算中點索引 m
  
    if nums[m] < target
      i = m + 1 # 此時 target 若存在，必在區間 [m+1, j] 內
    elsif nums[m] > target
      j = m - 1 # 此時 target 若存在，必在區間 [i, m-1] 內
    else
      return m  # 找到目標元素，回傳其索引
    end
  end

  -1  # 找不到目標元素，回傳 -1
end

### 二分搜尋（左閉右開區間） ###
def binary_search_lcro(nums, target)
  # 將左閉右開區間設為 [0, n)，i 指向陣列的首元素，j 指向末元素的下一個位置
  i, j = 0, nums.length

  # 當搜尋區間為空（i = j）時，結束迴圈
  while i < j
    # 計算中點索引 m
    m = (i + j) / 2

    if nums[m] < target
      i = m + 1 # 此時 target 若存在，必在區間 [m+1, j) 內
    elsif nums[m] > target
      j = m # 此時 target 若存在，必在區間 [i, m) 內
    else
      return m  # 找到目標元素，回傳其索引
    end
  end

  -1  # 找不到目標元素，回傳 -1
end

### 主程式 ###
if __FILE__ == $0
  target = 6
  nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

  # 二分搜尋（閉區間）
  index = binary_search(nums, target)
  puts "目標元素 6 的索引 =  #{index}"

  # 二分搜尋（左閉右開區間）
  index = binary_search_lcro(nums, target)
  puts "目標元素 6 的索引 =  #{index}"
end
