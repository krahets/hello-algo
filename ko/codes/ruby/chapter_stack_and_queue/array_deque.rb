=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원형 배열로 구현한 덱 ###
class ArrayDeque
  ### 덱의 길이 조회 ###
  attr_reader :size

  ### 생성자 ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### 덱의 용량 조회 ###
  def capacity
    @nums.length
  end

  ### 덱이 비어 있는지 확인 ###
  def is_empty?
    size.zero?
  end

  ### 맨 앞에 삽입 ###
  def push_first(num)
    if size == capacity
      puts '덱이 가득 찼다'
      return
    end

    # 앞쪽 포인터를 왼쪽으로 한 칸 옮긴다
    # 나머지 연산을 이용해 front가 배열의 시작 위치보다 작아지면 끝으로 돌아가게 한다
    @front = index(@front - 1)
    # 맨 앞에 num을 추가한다
    @nums[@front] = num
    @size += 1
  end

  ### 맨 뒤에 삽입 ###
  def push_last(num)
    if size == capacity
      puts '덱이 가득 찼다'
      return
    end

    # 맨 뒤 원소의 다음 칸(맨 뒤 인덱스 + 1)을 가리키는 뒤쪽 포인터를 구한다
    rear = index(@front + size)
    # 맨 뒤에 num을 추가한다
    @nums[rear] = num
    @size += 1
  end

  ### 맨 앞에서 꺼내기 ###
  def pop_first
    num = peek_first
    # 앞쪽 포인터를 한 칸 전진시킨다
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### 맨 뒤에서 꺼내기 ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### 맨 앞 원소 조회 ###
  def peek_first
    raise IndexError, '덱이 비어 있다' if is_empty?

    @nums[@front]
  end

  ### 맨 뒤 원소 조회 ###
  def peek_last
    raise IndexError, '덱이 비어 있다' if is_empty?

    # 맨 뒤 원소의 인덱스 계산
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 출력할 배열 반환 ###
  def to_array
    # 실제 원소가 차지하는 범위의 리스트 원소만 변환한다
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 원형 배열의 인덱스 계산 ###
  def index(i)
    # 나머지 연산을 이용해 배열의 처음과 끝을 연결한다
    # i가 배열의 끝을 넘으면 처음으로 돌아간다
    # i가 배열의 시작 위치보다 작아지면 끝으로 돌아간다
    (i + capacity) % capacity
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 덱 초기화
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "덱 deque = #{deque.to_array}"

  # 원소 조회
  peek_first = deque.peek_first
  puts "맨 앞 원소 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "맨 뒤 원소 peek_last = #{peek_last}"

  # 덱에 원소 삽입
  deque.push_last(4)
  puts "맨 뒤에 원소 4를 삽입한 후 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "맨 앞에 원소 1을 삽입한 후 deque = #{deque.to_array}"

  # 덱에서 원소 꺼내기
  pop_last = deque.pop_last
  puts "맨 뒤에서 꺼낸 원소 = #{pop_last}, 맨 뒤에서 꺼낸 후 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "맨 앞에서 꺼낸 원소 = #{pop_first}, 맨 앞에서 꺼낸 후 deque = #{deque.to_array}"

  # 덱의 길이 조회
  size = deque.size
  puts "덱의 길이 size = #{size}"

  # 덱이 비어 있는지 확인
  is_empty = deque.is_empty?
  puts "덱이 비어 있는가 = #{is_empty}"
end
