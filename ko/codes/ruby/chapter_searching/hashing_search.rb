=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 배열에서의 해시 탐색 ###
def hashing_search_array(hmap, target)
  # 해시 테이블의 key는 목표 원소, value는 인덱스다.
  # 해시 테이블에 해당 키가 없으면 -1을 반환한다.
  hmap[target] || -1
end

### 연결 리스트에서의 해시 탐색 ###
def hashing_search_linkedlist(hmap, target)
  # 해시 테이블의 key는 목표 원소, value는 노드 객체다.
  # 해시 테이블에 해당 키가 없으면 None을 반환한다.
  hmap[target] || nil
end

### 실행 예제 ###
if __FILE__ == $0
  target = 3

  # 배열에서의 해시 탐색
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # 해시 테이블 초기화
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key는 원소, value는 인덱스다.
  end
  index = hashing_search_array(map0, target)
  puts "목표 원소 3의 인덱스 = #{index}"

  # 연결 리스트에서의 해시 탐색
  head = arr_to_linked_list(nums)
  # 해시 테이블 초기화
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "값이 3인 목표 노드의 객체 = #{node}"
end
