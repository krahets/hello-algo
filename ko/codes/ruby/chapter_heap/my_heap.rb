=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 최대 힙 ###
class MaxHeap
  attr_reader :max_heap

  ### 입력 리스트로 힙을 만드는 생성자 ###
  def initialize(nums)
    # 리스트의 원소를 그대로 힙에 추가
    @max_heap = nums
    # 리프를 제외한 모든 노드에서 힙 복구
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 왼쪽 자식 노드의 인덱스 구하기 ###
  def left(i)
    2 * i + 1
  end

  ### 오른쪽 자식 노드의 인덱스 구하기 ###
  def right(i)
    2 * i + 2
  end

  ### 부모 노드의 인덱스 구하기 ###
  def parent(i)
    (i - 1) / 2     # 나눗셈 결과를 내림
  end

  ### 원소 교환 ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### 힙 크기 구하기 ###
  def size
    @max_heap.length
  end

  ### 힙이 비었는지 확인 ###
  def is_empty?
    size == 0
  end

  ### 힙의 루트 원소 조회 ###
  def peek
    @max_heap[0]
  end

  ### 힙에 원소 삽입 ###
  def push(val)
    # 노드 추가
    @max_heap << val
    # 아래에서 위로 힙 복구
    sift_up(size - 1)
  end

  ### 노드 i부터 아래에서 위로 힙 복구 ###
  def sift_up(i)
    loop do
      # 노드 i의 부모 노드 구하기
      p = parent(i)
      # 루트를 지나거나 노드를 조정할 필요가 없으면 힙 복구 종료
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 두 노드 교환
      swap(i, p)
      # 위로 올라가며 힙 복구 반복
      i = p
    end
  end

  ### 힙에서 원소 꺼내기 ###
  def pop
    # 빈 힙 처리
    raise IndexError, "힙이 비어 있음" if is_empty?
    # 루트와 맨 오른쪽 리프 교환(첫 원소와 마지막 원소 교환)
    swap(0, size - 1)
    # 노드 삭제
    val = @max_heap.pop
    # 위에서 아래로 힙 복구
    sift_down(0)
    # 힙의 루트 원소 반환
    val
  end

  ### 노드 i부터 위에서 아래로 힙 복구 ###
  def sift_down(i)
    loop do
      # 노드 i, l, r 중 값이 가장 큰 노드의 인덱스를 ma에 저장
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # 노드 i가 가장 크거나 인덱스 l, r이 범위를 벗어나면 더 복구할 필요가 없으므로 반복 종료
      break if ma == i

      # 두 노드 교환
      swap(i, ma)
      # 아래로 내려가며 힙 복구 반복
      i = ma
    end
  end

  ### 힙 출력(이진 트리)###
  def __print__
    print_heap(@max_heap)
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 최대 힙 초기화
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\n입력 리스트로 만든 힙:"
  max_heap.__print__

  # 힙의 루트 원소 구하기
  peek = max_heap.peek
  puts "\n힙의 루트 원소: #{peek}"

  # 힙에 원소 삽입
  val = 7
  max_heap.push(val)
  puts "\n원소 #{val} 삽입 후"
  max_heap.__print__

  # 힙의 루트 원소 꺼내기
  peek = max_heap.pop
  puts "\n루트 원소 #{peek} 제거 후"
  max_heap.__print__

  # 힙 크기 구하기
  size = max_heap.size
  puts "\n힙의 원소 수: #{size}"

  # 힙이 비었는지 확인
  is_empty = max_heap.is_empty?
  puts "\n빈 힙 여부: #{is_empty}"
end
