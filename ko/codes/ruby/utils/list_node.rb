=begin
File: list_node.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 연결 리스트 노드 클래스 ###
class ListNode
  attr_accessor :val  # 노드 값
  attr_accessor :next # 다음 노드를 가리키는 참조

  def initialize(val=0, next_node=nil)
    @val = val
    @next = next_node
  end
end

### 리스트를 연결 리스트로 역직렬화 ###
def arr_to_linked_list(arr)
  head = current = ListNode.new(arr[0])

  for i in 1...arr.length
    current.next = ListNode.new(arr[i])
    current = current.next
  end

  head
end

### 연결 리스트를 리스트로 직렬화 ###
def linked_list_to_arr(head)
  arr = []

  while head
    arr << head.val
    head = head.next
  end
end
