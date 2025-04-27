=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 哈希查找（数组） ###
def hashing_search_array(hmap, target)
  # 哈希表的 key: 目标元素，value: 索引
  # 若哈希表中无此 key ，返回 -1
  hmap[target] || -1
end

### 哈希查找（链表） ###
def hashing_search_linkedlist(hmap, target)
  # 哈希表的 key: 目标元素，value: 节点对象
  # 若哈希表中无此 key ，返回 None
  hmap[target] || nil
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # 哈希查找（数组）
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # 初始化哈希表
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key: 元素，value: 索引
  end
  index = hashing_search_array(map0, target)
  puts "目标元素 3 的索引 = #{index}"

  # 哈希查找（链表）
  head = arr_to_linked_list(nums)
  # 初始化哈希表
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "目标节点值 3 的对应节点对象为 #{node}"
end
