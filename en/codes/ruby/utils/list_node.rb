=begin
File: list_node.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Linked list node class ###
class ListNode
  attr_accessor :val  # Node value
  attr_accessor :next # Reference to next node

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end

### Deserialize list to linked list ###
def arr_to_linked_list(arr)
  head = current = ListNode.new(arr[0])

  for i in 1...arr.length
    current.next = ListNode.new(arr[i])
    current = current.next
  end

  head
end

### Serialize linked list to list ###
def linked_list_to_arr(head)
  arr = []

  while head
    arr << head.val
    head = head.next
  end
end
