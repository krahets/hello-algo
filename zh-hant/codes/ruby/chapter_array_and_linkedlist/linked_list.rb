=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### 在鏈結串列的節點 n0 之後插入節點 _p ###
# Ruby 的 `p` 是一個內建函式， `P` 是一個常數，所以可以使用 `_p` 代替
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### 刪除鏈結串列的節點 n0 之後的首個節點 ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### 訪問鏈結串列中索引為 index 的節點 ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### 在鏈結串列中查詢值為 target 的首個節點 ###
def find(head, target)
  index = 0
  while head
    return index if head.val == target
    head = head.next
    index += 1
  end

  -1
end

### Driver Code ###
if __FILE__ == $0
  # 初始化鏈結串列
  # 初始化各個節點
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # 構建節點之間的引用
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "初始化的鏈結串列為"
  print_linked_list(n0)

  # 插入節點
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # 刪除節點
  remove(n0)
  puts "刪除節點後的鏈結串列為"
  print_linked_list(n0)

  # 訪問節點
  node = access(n0, 3)
  puts "鏈結串列中索引 3 處的節點的值 = #{node.val}"

  # 查詢節點
  index = find(n0, 2)
  puts "鏈結串列中值為 2 的節點的索引 = #{index}"
end
