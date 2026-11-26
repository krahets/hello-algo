=begin
File: binary_search_edge.rb
Created Time: 2024-04-09
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative './binary_search_insertion'

### 이진 탐색으로 가장 왼쪽의 target 찾기 ###
def binary_search_left_edge(nums, target)
  # target의 삽입 위치를 찾는 것과 같다.
  i = binary_search_insertion(nums, target)

  # target을 찾지 못했으므로 -1을 반환한다.
  return -1 if i == nums.length || nums[i] != target

  i # target을 찾았으므로 인덱스 i를 반환한다.
end

### 이진 탐색으로 가장 오른쪽의 target 찾기 ###
def binary_search_right_edge(nums, target)
  # 가장 왼쪽의 target + 1을 찾는 문제로 바꾼다.
  i = binary_search_insertion(nums, target + 1)

  # j는 가장 오른쪽의 target을, i는 target보다 큰 첫 원소를 가리킨다.
  j = i - 1

  # target을 찾지 못했으므로 -1을 반환한다.
  return -1 if j == -1 || nums[j] != target

  j # target을 찾았으므로 인덱스 j를 반환한다.
end

### 실행 예제 ###
if __FILE__ == $0
  # 중복 원소가 있는 배열
  nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
  puts "\n배열 nums = #{nums}"

  # 이진 탐색으로 왼쪽 경계와 오른쪽 경계 찾기
  for target in [6, 7]
    index = binary_search_left_edge(nums, target)
    puts "찾을 값 = #{target} | 첫 인덱스 = #{index}"
    index = binary_search_right_edge(nums, target)
    puts "찾을 값 = #{target} | 마지막 인덱스 = #{index}"
  end
end
