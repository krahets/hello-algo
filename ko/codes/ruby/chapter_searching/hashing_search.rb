=begin
File: hashing_search.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/list_node'

### 해시 탐색(배열) ###
def hashing_search_array(hmap, target)
  # 해시 테이블의 key: 목표 원소, value: 인덱스
  # 해시 테이블에 해당 key가 없으면 -1을 반환한다
  hmap[target] || -1
end

### 해시 탐색(연결 리스트) ###
def hashing_search_linkedlist(hmap, target)
  # 해시 테이블의 key: 목표 원소, value: 노드 객체
  # 해시 테이블에 해당 key가 없으면 None을 반환한다
  hmap[target] || nil
end

### 실행 코드 ###
if __FILE__ == $0
  target = 3

  # 해시 탐색(배열)
  nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8]
  # 해시 테이블 초기화
  map0 = {}
  for i in 0...nums.length
    map0[nums[i]] = i # key: 원소, value: 인덱스
  end
  index = hashing_search_array(map0, target)
  puts "목표 원소 3의 인덱스 = #{index}"

  # 해시 탐색(연결 리스트)
  head = arr_to_linked_list(nums)
  # 해시 테이블 초기화
  map1 = {}
  while head
    map1[head.val] = head
    head = head.next
  end
  node = hashing_search_linkedlist(map1, target)
  puts "목표 노드 값 3에 해당하는 노드 객체: #{node}"
end
