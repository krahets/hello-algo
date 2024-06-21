=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 雜湊查詢（陣列） ###
def hashing_search_array(hmap, target)
  # 雜湊表的 key: 目標元素，value: 索引
  # 若雜湊表中無此 key ，返回 -1
  hmap[target] || -1
end

### 雜湊查詢（鏈結串列） ###
def hashing_search_linkedlist(hmap, target)
  # 雜湊表的 key: 目標元素，value: 節點物件
  # 若雜湊表中無此 key ，返回 None
  hmap[target] || nil
end

### Driver Code ###
if __FILE__ == $0
  target = 3

  # 雜湊查詢（陣列）
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # 初始化雜湊表
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key: 元素，value: 索引
  end
  index = hashing_search_array(map0, target)
  puts "目標元素 3 的索引 = #{index}"

  # 雜湊查詢（鏈結串列）
  head = arr_to_linked_list(nums)
  # 初始化雜湊表
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "目標節點值 3 的對應節點物件為 #{node}"
end
