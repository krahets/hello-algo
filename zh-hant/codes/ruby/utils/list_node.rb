=begin
File: list_node.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 鏈結串列節點類別 ###
class ListNode
  attr_accessor :val  # 節點值
  attr_accessor :next # 指向下一節點的引用

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end

### 將串列反序列化為鏈結串列 ###
def arr_to_linked_list(arr)
  head = current = ListNode.new(arr[0])

  for i in 1...arr.length
    current.next = ListNode.new(arr[i])
    current = current.next
  end

  head
end

### 將鏈結串列序列化為串列 ###
def linked_list_to_arr(head)
  arr = []

  while head
    arr << head.val
    head = head.next
  end
end
