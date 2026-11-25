=begin
File: linear_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 배열에서의 선형 탐색 ###
def linear_search_array(nums, target)
  # 배열을 순회한다.
  for i in 0...nums.length
    return i if nums[i] == target # 목표 원소를 찾았으므로 그 인덱스를 반환한다.
  end

  -1 # 목표 원소를 찾지 못했으므로 -1을 반환한다.
end

### 연결 리스트에서의 선형 탐색 ###
def linear_search_linkedlist(head, target)
  # 연결 리스트를 순회한다.
  while head
    return head if head.val == target # 목표 노드를 찾았으므로 해당 노드를 반환한다.

    head = head.next
  end

  nil # 목표 노드를 찾지 못했으므로 None을 반환한다.
end

### 실행 예제 ###
if __FILE__ == $0
  target = 3

  # 배열에서 선형 탐색 수행
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  index = linear_search_array(nums, target)
  puts "목표 원소 3의 인덱스 = #{index}"

  # 연결 리스트에서 선형 탐색 수행
  head = arr_to_linked_list(nums)
  node = linear_search_linkedlist(head, target)
  puts "값이 3인 목표 노드의 객체 = #{node}"
end
