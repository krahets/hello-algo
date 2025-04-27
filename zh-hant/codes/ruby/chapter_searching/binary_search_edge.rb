=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### 二分搜尋最左一個 target ###
def binary_search_left_edge(nums, target)
  # 等價於查詢 target 的插入點
  i = binary_search_insertion(nums, target)

  # 未找到 target ，返回 -1
  return -1 if i == nums.length || nums[i] != target

  i # 找到 target ，返回索引 i
end

### 二分搜尋最右一個 target ###
def binary_search_right_edge(nums, target)
  # 轉化為查詢最左一個 target + 1
  i = binary_search_insertion(nums, target + 1)

  # j 指向最右一個 target ，i 指向首個大於 target 的元素
  j = i - 1

  # 未找到 target ，返回 -1
  return -1 if j == -1 || nums[j] != target

  j # 找到 target ，返回索引 j
end

### Driver Code ###
if __FILE__ == $0
  # 包含重複元素的陣列
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n陣列 nums = #{nums}"

  # 二分搜尋左邊界和右邊界
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "最左一個元素 #{target} 的索引為 #{index}"
    index = binary_search_right_edge(nums, target)
    puts "最右一個元素 #{target} 的索引為 #{index}"
  end
end
