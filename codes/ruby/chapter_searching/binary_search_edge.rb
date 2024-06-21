=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### 二分查找最左一个 target ###
def binary_search_left_edge(nums, target)
  # 等价于查找 target 的插入点
  i = binary_search_insertion(nums, target)

  # 未找到 target ，返回 -1
  return -1 if i == nums.length || nums[i] != target

  i # 找到 target ，返回索引 i
end

### 二分查找最右一个 target ###
def binary_search_right_edge(nums, target)
  # 转化为查找最左一个 target + 1
  i = binary_search_insertion(nums, target + 1)

  # j 指向最右一个 target ，i 指向首个大于 target 的元素
  j = i - 1

  # 未找到 target ，返回 -1
  return -1 if j == -1 || nums[j] != target

  j # 找到 target ，返回索引 j
end

### Driver Code ###
if __FILE__ == $0
  # 包含重复元素的数组
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n数组 nums = #{nums}"

  # 二分查找左边界和右边界
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "最左一个元素 #{target} 的索引为 #{index}"
    index = binary_search_right_edge(nums, target)
    puts "最右一个元素 #{target} 的索引为 #{index}"
  end
end
