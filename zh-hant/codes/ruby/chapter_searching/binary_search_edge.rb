=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### 用二分搜尋找最左邊的 target ###
def binary_search_left_edge(nums, target)
  # 等同於搜尋 target 的插入點
  i = binary_search_insertion(nums, target)

  # 找不到 target，回傳 -1
  return -1 if i == nums.length || nums[i] != target

  i # 找到 target，回傳索引 i
end

### 用二分搜尋找最右邊的 target ###
def binary_search_right_edge(nums, target)
  # 改為搜尋 target + 1 的最左插入位置
  i = binary_search_insertion(nums, target + 1)

  # j 指向最右邊的 target，i 指向第一個大於 target 的元素
  j = i - 1

  # 找不到 target，回傳 -1
  return -1 if j == -1 || nums[j] != target

  j # 找到 target，回傳索引 j
end

### 主程式 ###
if __FILE__ == $0
  # 含有重複元素的陣列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n陣列 nums = #{nums}"

  # 用二分搜尋找左界和右界
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "最左邊的元素 #{target} 的索引為 #{index}"
    index = binary_search_right_edge(nums, target)
    puts "最右邊的元素 #{target} 的索引為 #{index}"
  end
end
