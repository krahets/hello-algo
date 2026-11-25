=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 연결 리스트로 구현한 큐 ###
class LinkedListQueue
  ### 큐의 길이 조회 ###
  attr_reader :size

  ### 생성자 ###
  def initialize
    @front = nil  # 첫 노드 front
    @rear = nil   # 마지막 노드 rear
    @size = 0
  end

  ### 큐가 비어 있는지 확인 ###
  def is_empty?
    @front.nil?
  end

  ### 큐에 삽입 ###
  def push(num)
    # 마지막 노드 뒤에 num을 추가한다
    node = ListNode.new(num)

    # 큐가 비어 있으면 앞쪽과 뒤쪽 포인터가 모두 이 노드를 가리키게 한다
    if @front.nil?
      @front = node
      @rear = node
    # 큐가 비어 있지 않으면 마지막 노드 뒤에 이 노드를 추가한다
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### 큐에서 꺼내기 ###
  def pop
    num = peek
    # 첫 노드 삭제
    @front = @front.next
    @size -= 1
    num
  end

  ### 맨 앞 원소 조회 ###
  def peek
    raise IndexError, '큐가 비어 있다' if is_empty?

    @front.val
  end

  ### 연결 리스트를 Array로 변환해 반환한다 ###
  def to_array
    queue = []
    temp = @front
    while temp
      queue << temp.val
      temp = temp.next
    end
    queue
  end
end

### 실행 예제 ###
if __FILE__ == $0
  # 큐 초기화
  queue = LinkedListQueue.new

  # 큐에 원소 삽입
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "큐 queue = #{queue.to_array}"

  # 맨 앞 원소 조회
  peek = queue.peek
  puts "맨 앞 원소 front = #{peek}"

  # 큐에서 원소 꺼내기
  pop_front = queue.pop
  puts "꺼낸 원소 pop = #{pop_front}"
  puts "꺼낸 후 queue = #{queue.to_array}"

  # 큐의 길이 조회
  size = queue.size
  puts "큐의 길이 size = #{size}"

  # 큐가 비어 있는지 확인
  is_empty = queue.is_empty?
  puts "큐가 비어 있는가 = #{is_empty}"
end
