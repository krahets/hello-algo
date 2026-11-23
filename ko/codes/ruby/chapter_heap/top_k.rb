=begin
File: top_k.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative "./my_heap"

### 힙에 원소 삽입 ###
def push_min_heap(heap, val)
  # 원소의 부호를 반전한다
  heap.push(-val)
end

### 힙에서 원소 꺼내기 ###
def pop_min_heap(heap)
  # 원소의 부호를 반전한다
  -heap.pop
end

### 힙의 루트 원소 접근 ###
def peek_min_heap(heap)
  # 원소의 부호를 반전한다
  -heap.peek
end

### 힙의 원소를 반환한다 ###
def get_min_heap(heap)
  # 힙의 모든 원소의 부호를 반전한다
  heap.max_heap.map { |x| -x }
end

### 힙을 이용하여 배열에서 가장 큰 k개 원소 탐색 ###
def top_k_heap(nums, k)
  # 최소 힙 초기화
  # 힙의 모든 원소의 부호를 반전하여 최대 힙으로 최소 힙을 구현한다는 점에 유의한다
  max_heap = MaxHeap.new([])

  # 배열의 앞쪽 k개 원소를 힙에 삽입한다
  for i in 0...k
    push_min_heap(max_heap, nums[i])
  end

  # k+1번째 원소부터 힙의 길이를 k로 유지한다
  for i in k...nums.length
    # 현재 원소가 힙의 루트 원소보다 크면 루트 원소를 꺼내고 현재 원소를 힙에 삽입한다
    if nums[i] > peek_min_heap(max_heap)
      pop_min_heap(max_heap)
      push_min_heap(max_heap, nums[i])
    end
  end

  get_min_heap(max_heap)
end

### 실행 코드 ###
if __FILE__ == $0
  nums = [1, 7, 6, 3, 2]
  k = 3

  res = top_k_heap(nums, k)
  puts "가장 큰 원소 #{k}개:"
  print_heap(res)
end
