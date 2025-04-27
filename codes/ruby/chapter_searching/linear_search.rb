=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 线性查找（数组） ###
def linear_search_array(nums, target)
  # 遍历数组
  for i in 0...nums.length
    return i if nums[i] == target # 找到目标元素，返回其索引
  end

  -1 # 未找到目标元素，返回 -1
end

### 线性查找（链表） ###
def linear_search_linkedlist(head, target)
  # 遍历链表
  while head
    return head if head.val == target # 找到目标节点，返回之

    head = head.next
  end

  nil # 未找到目标节点，返回 None
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # 在数组中执行线性查找
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "目标元素 3 的索引 = #{index}"

  # 在链表中执行线性查找
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "目标节点值 3 的对应节点对象为 #{node}"
end
