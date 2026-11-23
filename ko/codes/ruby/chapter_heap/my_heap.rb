=begin
File: my_heap.rb
Created Time: 2024-04-19
Author: Blue Bean (lonnnnnnner@gmail.com)
=end

require_relative '../utils/print_util'

### 최대 힙 ###
class MaxHeap
  attr_reader :max_heap

  ### 생성자: 입력 리스트를 바탕으로 힙 구성 ###
  def initialize(nums)
    # 리스트 원소를 그대로 힙에 추가한다
    @max_heap = nums
    # 리프 노드를 제외한 모든 노드에 힙 재정렬을 수행한다
    parent(size - 1).downto(0) do |i|
      sift_down(i)
    end
  end

  ### 왼쪽 자식 노드의 인덱스 반환 ###
  def left(i)
    2 * i + 1
  end

  ### 오른쪽 자식 노드의 인덱스 반환 ###
  def right(i)
    2 * i + 2
  end

  ### 부모 노드의 인덱스 반환 ###
  def parent(i)
    (i - 1) / 2     # 나눗셈의 결과를 내림한다
  end

  ### 원소 교환 ###
  def swap(i, j)
    @max_heap[i], @max_heap[j] = @max_heap[j], @max_heap[i]
  end

  ### 힙 크기 반환 ###
  def size
    @max_heap.length
  end

  ### 힙이 비어 있는지 판단 ###
  def is_empty?
    size == 0
  end

  ### 힙의 루트 원소 접근 ###
  def peek
    @max_heap[0]
  end

  ### 힙에 원소 삽입 ###
  def push(val)
    # 노드 추가
    @max_heap << val
    # 아래에서 위로 힙을 재정렬한다
    sift_up(size - 1)
  end

  ### 노드 i에서 시작하여 아래에서 위로 힙 재정렬 ###
  def sift_up(i)
    loop do
      # 노드 i의 부모 노드를 구한다
      p = parent(i)
      # 루트 노드를 넘어가거나 노드를 수정할 필요가 없으면 힙 재정렬을 마친다
      break if p < 0 || @max_heap[i] <= @max_heap[p]
      # 두 노드를 교환한다
      swap(i, p)
      # 위쪽으로 힙 재정렬을 반복한다
      i = p
    end
  end

  ### 힙에서 원소 꺼내기 ###
  def pop
    # 비어 있는 경우를 처리한다
    raise IndexError, "힙이 비어 있다" if is_empty?
    # 루트 노드와 가장 오른쪽 리프 노드를 교환한다(첫 원소와 마지막 원소 교환)
    swap(0, size - 1)
    # 노드 삭제
    val = @max_heap.pop
    # 위에서 아래로 힙을 재정렬한다
    sift_down(0)
    # 힙의 루트 원소를 반환한다
    val
  end

  ### 노드 i에서 시작하여 위에서 아래로 힙 재정렬 ###
  def sift_down(i)
    loop do
      # 노드 i, l, r 중 값이 가장 큰 노드를 찾아 ma로 표시한다
      l, r, ma = left(i), right(i), i
      ma = l if l < size && @max_heap[l] > @max_heap[ma]
      ma = r if r < size && @max_heap[r] > @max_heap[ma]

      # 노드 i의 값이 가장 크거나 인덱스 l, r이 범위를 벗어나면 힙을 더 재정렬할 필요가 없으므로 종료한다
      break if ma == i

      # 두 노드를 교환한다
      swap(i, ma)
      # 아래쪽으로 힙 재정렬을 반복한다
      i = ma
    end
  end

  ### 힙 출력(이진 트리)###
  def __print__
    print_heap(@max_heap)
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 최대 힙 초기화
  max_heap = MaxHeap.new([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2])
  puts "\n리스트를 입력하여 힙을 구성한 후"
  max_heap.__print__

  # 힙의 루트 원소 반환
  peek = max_heap.peek
  puts "\n힙의 루트 원소: #{peek}"

  # 힙에 원소 삽입
  val = 7
  max_heap.push(val)
  puts "\n원소를 힙에 삽입한 후(원소: #{val})"
  max_heap.__print__

  # 힙의 루트 원소 꺼내기
  peek = max_heap.pop
  puts "\n힙의 루트 원소를 꺼낸 후(원소: #{peek})"
  max_heap.__print__

  # 힙 크기 반환
  size = max_heap.size
  puts "\n힙의 원소 개수: #{size}"

  # 힙이 비어 있는지 판단
  is_empty = max_heap.is_empty?
  puts "\n힙이 비어 있는가: #{is_empty}"
end
