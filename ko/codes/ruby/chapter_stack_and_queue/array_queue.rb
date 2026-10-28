=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 원형 배열로 구현한 큐 ###
class ArrayQueue
  ### 큐의 길이 반환 ###
  attr_reader :size

  ### 생성자 ###
  def initialize(size)
    @nums = Array.new(size, 0) # 큐의 원소를 저장하는 배열
    @front = 0 # 맨 앞 원소를 가리키는 맨 앞 포인터
    @size = 0 # 큐 길이
  end

  ### 큐의 용량 반환 ###
  def capacity
    @nums.length
  end

  ### 큐가 비어 있는지 판단 ###
  def is_empty?
    size.zero?
  end

  ### 큐에 삽입 ###
  def push(num)
    raise IndexError, '큐가 가득 찼다' if size == capacity

    # 맨 뒤 인덱스 + 1을 가리키는 맨 뒤 포인터를 계산한다
    # 나머지 연산을 통해 rear가 배열의 끝을 넘어가면 처음으로 돌아오게 한다
    rear = (@front + size) % capacity
    # num을 맨 뒤에 추가한다
    @nums[rear] = num
    @size += 1
  end

  ### 큐에서 꺼내기 ###
  def pop
    num = peek
    # 맨 앞 포인터를 뒤로 한 칸 이동하고, 끝을 넘어가면 배열의 처음으로 돌아온다
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### 맨 앞 원소 접근 ###
  def peek
    raise IndexError, '큐가 비어 있다' if is_empty?

    @nums[@front]
  end

  ### 출력에 사용할 리스트 반환 ###
  def to_array
    res = Array.new(size, 0)
    j = @front

    for i in 0...size
      res[i] = @nums[j % capacity]
      j += 1
    end

    res
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 큐 초기화
  queue = ArrayQueue.new(10)

  # 큐에 원소 삽입
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "큐 queue = #{queue.to_array}"

  # 맨 앞 원소 접근
  peek = queue.peek
  puts "맨 앞 원소 peek = #{peek}"

  # 큐에서 원소 꺼내기
  pop = queue.pop
  puts "큐에서 꺼낸 원소 pop = #{pop}"
  puts "큐에서 꺼낸 후 queue = #{queue.to_array}"

  # 큐의 길이 반환
  size = queue.size
  puts "큐 길이 size = #{size}"

  # 큐가 비어 있는지 판단
  is_empty = queue.is_empty?
  puts "큐가 비어 있는가 = #{is_empty}"

  # 원형 배열 테스트
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "반복 #{i}회에서 삽입 + 꺼내기를 수행한 후 queue = #{queue.to_array}"
  end
end
