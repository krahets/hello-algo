=begin
File: heap_sort.rb
Created Time: 2024-04-10
Author: junminhong (junminhong1110@gmail.com)
=end

### 길이 n인 힙에서 노드 i부터 아래로 내려가며 힙 속성 복원 ###
def sift_down(nums, n, i)
  while true
    # 노드 i, l, r 중 값이 가장 큰 노드를 ma에 기록
    l = 2 * i + 1
    r = 2 * i + 2
    ma = i
    ma = l if l < n && nums[l] > nums[ma]
    ma = r if r < n && nums[r] > nums[ma]
    # 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나 더 진행할 필요가 없으면 종료
    break if ma == i
    # 두 노드 교환
    nums[i], nums[ma] = nums[ma], nums[i]
    # 아래로 내려가며 힙 속성 복원 반복
    i = ma
  end
end

### 힙 정렬 ###
def heap_sort(nums)
  # 힙 구성: 리프 노드를 제외한 모든 노드에서 힙 속성 복원
  (nums.length / 2 - 1).downto(0) do |i|
    sift_down(nums, nums.length, i)
  end
  # 힙에서 최댓값 추출을 n-1회 반복
  (nums.length - 1).downto(1) do |i|
    # 루트 노드와 맨 오른쪽 리프 노드 교환(첫 원소와 마지막 원소 교환)
    nums[0], nums[i] = nums[i], nums[0]
    # 루트 노드부터 아래로 내려가며 힙 속성 복원
    sift_down(nums, i, 0)
  end
end

### 실행 예제 ###
if __FILE__ == $0
  nums = [4, 1, 3, 1, 5, 2]
  heap_sort(nums)
  puts "힙 정렬 후 nums = #{nums.inspect}"
end
