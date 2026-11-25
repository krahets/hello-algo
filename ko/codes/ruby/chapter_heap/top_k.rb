=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### 힙에 원소 삽입 ###
def push_min_heap(heap, val)
  # 원소의 부호 반전
  heap.push(-val)
end

### 힙에서 원소 꺼내기 ###
def pop_min_heap(heap)
  # 원소의 부호 반전
  -heap.pop
end

### 힙의 루트 원소 조회 ###
def peek_min_heap(heap)
  # 원소의 부호 반전
  -heap.peek
end

### 최소 힙의 모든 원소를 배열로 반환 ###
def get_min_heap(heap)
  # 힙의 모든 원소의 부호 반전
  heap.max_heap.map { |x| -x }
end

### 힙을 이용해 배열에서 가장 큰 원소 k개 찾기 ###
def top_k_heap(nums, k)
  # 최소 힙 초기화
  # 모든 원소의 부호를 바꾸면 최대 힙을 최소 힙처럼 사용할 수 있음
  max_heap = MaxHeap.new([])

  # 배열의 처음 k개 원소를 힙에 삽입
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # k+1번째 원소부터 힙의 크기를 k로 유지
  for i in k...nums.length
    # 현재 원소가 루트보다 크면 루트를 꺼내고 현재 원소를 삽입
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### 실행 예제 ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "가장 큰 원소 #{k}개:"
  print_heap(res)
end
