=begin
File: list_node.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 链表节点类 ###
class ListNode
  attr_accessor :val  # 节点值
  attr_accessor :next # 指向下一节点的引用

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end

### 将列表反序列化为链表 ###
def arr_to_linked_list(arr)
  head = current = ListNode.new(arr[0])

  for i in 1...arr.length
    current.next = ListNode.new(arr[i])
    current = current.next
  end

  head
end

### 将链表序列化为列表 ###
def linked_list_to_arr(head)
  arr = []

  while head
    arr << head.val
    head = head.next
  end
end
