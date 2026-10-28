=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 연결 리스트로 구현한 큐 ###
class LinkedListQueue
  ### 큐의 길이 반환 ###
  attr_reader :size

  ### 생성자 ###
  def initialize
    @front = nil  # 머리 노드 front
    @rear = nil   # 꼬리 노드 rear
    @size = 0
  end

  ### 큐가 비어 있는지 판단 ###
  def is_empty?
    @front.nil?
  end

  ### 큐에 삽입 ###
  def push(num)
    # 꼬리 노드 뒤에 num을 추가한다
    node = ListNode.new(num)

    # 큐가 비어 있으면 머리와 꼬리 노드가 모두 해당 노드를 가리키게 한다
    if @front.nil?
      @front = node
      @rear = node
    # 큐가 비어 있지 않으면 해당 노드를 꼬리 노드 뒤에 추가한다
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### 큐에서 꺼내기 ###
  def pop
    num = peek
    # 머리 노드를 삭제한다
    @front = @front.next
    @size -= 1
    num
  end

  ### 맨 앞 원소 접근 ###
  def peek
    raise IndexError, '큐가 비어 있다' if is_empty?

    @front.val
  end

  ### 연결 리스트를 Array로 변환하여 반환 ###
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

### 실행 코드 ###
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

  # 맨 앞 원소 접근
  peek = queue.peek
  puts "맨 앞 원소 front = #{peek}"

  # 큐에서 원소 꺼내기
  pop_front = queue.pop
  puts "큐에서 꺼낸 원소 pop = #{pop_front}"
  puts "큐에서 꺼낸 후 queue = #{queue.to_array}"

  # 큐의 길이 반환
  size = queue.size
  puts "큐 길이 size = #{size}"

  # 큐가 비어 있는지 판단
  is_empty = queue.is_empty?
  puts "큐가 비어 있는가 = #{is_empty}"
end
