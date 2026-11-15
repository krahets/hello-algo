=begin
File: list_node.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 連結リストのノードクラス ###
class ListNode
  attr_accessor :val  # ノードの値
  attr_accessor :next # 次のノードへの参照

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end

### リストをデシリアライズして連結リストにする ###
def arr_to_linked_list(arr)
  head = current = ListNode.new(arr[0])

  for i in 1...arr.length
    current.next = ListNode.new(arr[i])
    current = current.next
  end

  head
end

### 連結リストをシリアライズしてリストにする ###
def linked_list_to_arr(head)
  arr = []

  while head
    arr << head.val
    head = head.next
  end
end
