=begin
File: linked_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'
require_relative '../utils/print_util'

### 연결 리스트의 노드 n0 뒤에 노드 _p 삽입 ###
# Ruby에서 `p`는 내장 함수이고 `P`는 상수이므로 대신 `_p`를 사용할 수 있다.
def insert(n0, _p)
  n1 = n0.next
  _p.next = n1
  n0.next = _p
end

### 연결 리스트에서 n0 바로 다음 노드 삭제 ###
def remove(n0)
  return if n0.next.nil?

  # n0 -> remove_node -> n1
  remove_node = n0.next
  n1 = remove_node.next
  n0.next = n1
end

### 연결 리스트의 인덱스 index에 있는 노드에 접근 ###
def access(head, index)
  for i in 0...index
    return nil if head.nil?
    head = head.next
  end

  head
end

### 연결 리스트에서 값이 target인 첫 번째 노드 찾기 ###
def find(head, target)
  index = 0
  while head
    return index if head.val == target
    head = head.next
    index += 1
  end

  -1
end

### 실행 예제 ###
if __FILE__ == $0
  # 연결 리스트 초기화
  # 각 노드 초기화
  n0 = ListNode.new(1)
  n1 = ListNode.new(3)
  n2 = ListNode.new(2)
  n3 = ListNode.new(5)
  n4 = ListNode.new(4)
  # 노드 사이의 참조 연결
  n0.next = n1
  n1.next = n2
  n2.next = n3
  n3.next = n4
  puts "초기화한 연결 리스트:"
  print_linked_list(n0)

  # 노드 삽입
  insert(n0, ListNode.new(0))
  print_linked_list n0

  # 노드 삭제
  remove(n0)
  puts "노드 삭제 후 연결 리스트:"
  print_linked_list(n0)

  # 노드 접근
  node = access(n0, 3)
  puts "연결 리스트에서 인덱스 3인 노드의 값 = #{node.val}"

  # 노드 찾기
  index = find(n0, 2)
  puts "연결 리스트에서 값이 2인 노드의 인덱스 = #{index}"
end
