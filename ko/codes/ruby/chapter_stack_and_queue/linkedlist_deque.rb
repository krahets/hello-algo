=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 이중 연결 리스트 노드
class ListNode
  attr_accessor :val
  attr_accessor :next # 다음 노드 참조
  attr_accessor :prev # 이전 노드 참조

  ### 생성자 ###
  def initialize(val)
    @val = val
  end
end

### 이중 연결 리스트로 구현한 덱 ###
class LinkedListDeque
  ### 덱의 길이 반환 ###
  attr_reader :size

  ### 생성자 ###
  def initialize
    @front = nil  # 머리 노드 front
    @rear = nil   # 꼬리 노드 rear
    @size = 0     # 덱의 길이
  end

  ### 덱이 비어 있는지 판단 ###
  def is_empty?
    size.zero?
  end

  ### 큐 삽입 연산 ###
  def push(num, is_front)
    node = ListNode.new(num)
    # 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
    if is_empty?
      @front = @rear = node
    # 맨 앞에 삽입하는 연산
    elsif is_front
      # node를 연결 리스트의 맨 앞에 추가한다
      @front.prev = node
      node.next = @front
      @front = node # 머리 노드를 갱신한다
    # 맨 뒤에 삽입하는 연산
    else
      # node를 연결 리스트의 맨 뒤에 추가한다
      @rear.next = node
      node.prev = @rear
      @rear = node # 꼬리 노드를 갱신한다
    end
    @size += 1 # 큐 길이를 갱신한다
  end

  ### 맨 앞에 삽입 ###
  def push_first(num)
    push(num, true)
  end

  ### 맨 뒤에 삽입 ###
  def push_last(num)
    push(num, false)
  end

  ### 큐에서 꺼내는 연산 ###
  def pop(is_front)
    raise IndexError, '덱이 비어 있다' if is_empty?

    # 큐의 길이가 1이면 머리와 꼬리가 같은 노드를 가리킨다
    if @size == 1
      val = @front.val
      @front = nil
      @rear = nil
    # 맨 앞에서 꺼내는 연산
    elsif is_front
      val = @front.val # 머리 노드의 값을 임시로 저장한다
      # 머리 노드를 삭제한다
      fnext = @front.next
      fnext.prev = nil
      @front.next = nil
      @front = fnext # 머리 노드를 갱신한다
    # 맨 뒤에서 꺼내는 연산
    else
      val = @rear.val # 꼬리 노드의 값을 임시로 저장한다
      # 꼬리 노드를 삭제한다
      rprev = @rear.prev
      rprev.next = nil
      @rear.prev = nil
      @rear = rprev # 꼬리 노드를 갱신한다
    end
    @size -= 1 # 큐 길이를 갱신한다

    val
  end

  ### 맨 앞에서 꺼내기 ###
  def pop_first
    pop(true)
  end

  ### 맨 앞에서 꺼내기 ###
  def pop_last
    pop(false)
  end

  ### 맨 앞 원소 접근 ###
  def peek_first
    raise IndexError, '덱이 비어 있다' if is_empty?

    @front.val
  end

  ### 맨 뒤 원소 접근 ###
  def peek_last
    raise IndexError, '덱이 비어 있다' if is_empty?

    @rear.val
  end

  ### 출력에 사용할 배열 반환 ###
  def to_array
    node = @front
    res = Array.new(size, 0)
    for i in 0...size
      res[i] = node.val
      node = node.next
    end
    res
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 덱 초기화
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "덱 deque = #{deque.to_array}"

  # 원소 접근
  peek_first = deque.peek_first
  puts "맨 앞 원소 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "맨 앞 원소 peek_last = #{peek_last}"

  # 큐에 원소 삽입
  deque.push_last(4)
  puts "뒤쪽에 원소 4를 삽입한 후 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "앞쪽에 원소 1을 삽입한 후 deque = #{deque.to_array}"

  # 큐에서 원소 꺼내기
  pop_last = deque.pop_last
  puts "맨 뒤에서 꺼낸 원소 = #{pop_last}, 맨 뒤에서 꺼낸 후 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "맨 앞에서 꺼낸 원소 = #{pop_first}, 맨 앞에서 꺼낸 후 deque = #{deque.to_array}"

  # 덱의 길이 반환
  size = deque.size
  puts "덱 길이 size = #{size}"

  # 덱이 비어 있는지 판단
  is_empty = deque.is_empty?
  puts "덱이 비어 있는가 = #{is_empty}"
end
