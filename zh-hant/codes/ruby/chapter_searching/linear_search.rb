=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 循序搜尋（陣列） ###
def linear_search_array(nums, target)
  # 走訪陣列
  for i in 0...nums.length
    return i if nums[i] == target # 找到目標元素，回傳其索引
  end

  -1 # 找不到目標元素，回傳 -1
end

### 循序搜尋（鏈結串列） ###
def linear_search_linkedlist(head, target)
  # 走訪鏈結串列
  while head
    return head if head.val == target # 找到目標節點，回傳該節點

    head = head.next
  end

  nil # 找不到目標節點，回傳 None
end

### 主程式 ###
if __FILE__ == $0
  target = 3

  # 在陣列中執行循序搜尋
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "目標元素 3 的索引 = #{index}"

  # 在鏈結串列中執行循序搜尋
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "目標值 3 對應的節點物件為 #{node}"
end
