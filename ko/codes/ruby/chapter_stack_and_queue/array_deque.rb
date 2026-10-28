=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원형 배열로 구현한 덱 ###
class ArrayDeque
  ### 덱의 길이 반환 ###
  attr_reader :size

  ### 생성자 ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### 덱의 용량 반환 ###
  def capacity
    @nums.length
  end

  ### 덱이 비어 있는지 판단 ###
  def is_empty?
    size.zero?
  end

  ### 맨 앞에 삽입 ###
  def push_first(num)
    if size == capacity
      puts '덱이 가득 찼다'
      return
    end

    # 맨 앞 포인터를 왼쪽으로 한 칸 이동한다
    # 나머지 연산을 통해 front가 배열의 처음을 넘어가면 끝으로 돌아오게 한다
    @front = index(@front - 1)
    # num을 맨 앞에 추가한다
    @nums[@front] = num
    @size += 1
  end

  ### 맨 뒤에 삽입 ###
  def push_last(num)
    if size == capacity
      puts '덱이 가득 찼다'
      return
    end

    # 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
    rear = index(@front + size)
    # num을 맨 뒤에 추가한다
    @nums[rear] = num
    @size += 1
  end

  ### 맨 앞에서 꺼내기 ###
  def pop_first
    num = peek_first
    # 맨 앞 포인터를 뒤로 한 칸 이동한다
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

  ### 맨 앞 원소 접근 ###
  def peek_first
    raise IndexError, '덱이 비어 있다' if is_empty?

    @nums[@front]
  end

  ### 맨 뒤 원소 접근 ###
  def peek_last
    raise IndexError, '덱이 비어 있다' if is_empty?

    # 마지막 원소의 인덱스를 계산한다
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 출력에 사용할 배열 반환 ###
  def to_array
    # 유효한 길이 범위 안의 리스트 원소만 변환한다
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 원형 배열 인덱스 계산 ###
  def index(i)
    # 나머지 연산을 통해 배열의 처음과 끝을 연결한다
    # i가 배열의 끝을 넘어가면 처음으로 돌아온다
    # i가 배열의 처음을 넘어가면 끝으로 돌아온다
    (i + capacity) % capacity
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 덱 초기화
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "덱 deque = #{deque.to_array}"

  # 원소 접근
  peek_first = deque.peek_first
  puts "맨 앞 원소 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "맨 뒤 원소 peek_last = #{peek_last}"

  # 큐에 원소 삽입
  deque.push_last(4)
  puts "뒤쪽에 원소 4를 삽입한 후 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "뒤쪽에 원소 1을 삽입한 후 deque = #{deque.to_array}"

  # 큐에서 원소 꺼내기
  pop_last = deque.pop_last
  puts "맨 뒤에서 꺼낸 원소 = #{pop_last}, 맨 뒤에서 꺼낸 후 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "맨 뒤에서 꺼낸 원소 = #{pop_first}, 맨 뒤에서 꺼낸 후 deque = #{deque.to_array}"

  # 덱의 길이 반환
  size = deque.size
  puts "덱 길이 size = #{size}"

  # 덱이 비어 있는지 판단
  is_empty = deque.is_empty?
  puts "덱이 비어 있는가 = #{is_empty}"
end
