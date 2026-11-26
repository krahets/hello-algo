=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 이중 연결 리스트의 노드 ###
class ListNode
  attr_accessor :val
  attr_accessor :next # 다음 노드에 대한 참조
  attr_accessor :prev # 이전 노드에 대한 참조

  ### 생성자 ###
  def initialize(val)
    @val = val
  end
end

### 이중 연결 리스트로 구현한 덱 ###
class LinkedListDeque
  ### 덱의 길이 조회 ###
  attr_reader :size

  ### 생성자 ###
  def initialize
    @front = nil  # 첫 노드 front
    @rear = nil   # 마지막 노드 rear
    @size = 0     # 덱의 길이
  end

  ### 덱이 비어 있는지 확인 ###
  def is_empty?
    size.zero?
  end

  ### 삽입 연산 ###
  def push(num, is_front)
    node = ListNode.new(num)
    # 연결 리스트가 비어 있으면 front와 rear가 모두 node를 가리키게 한다
    if is_empty?
      @front = @rear = node
    # 맨 앞에 삽입하는 연산
    elsif is_front
      # 연결 리스트의 맨 앞에 node를 추가한다
      @front.prev = node
      node.next = @front
      @front = node # 첫 노드 갱신
    # 맨 뒤에 삽입하는 연산
    else
      # 연결 리스트의 맨 뒤에 node를 추가한다
      @rear.next = node
      node.prev = @rear
      @rear = node # 마지막 노드 갱신
    end
    @size += 1 # 덱의 길이 갱신
  end

  ### 맨 앞에 삽입 ###
  def push_first(num)
    push(num, true)
  end

  ### 맨 뒤에 삽입 ###
  def push_last(num)
    push(num, false)
  end

  ### 삭제 연산 ###
  def pop(is_front)
    raise IndexError, '덱이 비어 있다' if is_empty?

    # 덱의 길이가 1이면 앞쪽과 뒤쪽 포인터가 같은 노드를 가리킨다
    if @size == 1
      val = @front.val
      @front = nil
      @rear = nil
    # 맨 앞에서 꺼내는 연산
    elsif is_front
      val = @front.val # 첫 노드의 값을 임시로 저장한다
      # 첫 노드 삭제
      fnext = @front.next
      fnext.prev = nil
      @front.next = nil
      @front = fnext # 첫 노드 갱신
    # 맨 뒤에서 꺼내는 연산
    else
      val = @rear.val # 마지막 노드의 값을 임시로 저장한다
      # 마지막 노드 삭제
      rprev = @rear.prev
      rprev.next = nil
      @rear.prev = nil
      @rear = rprev # 마지막 노드 갱신
    end
    @size -= 1 # 덱의 길이 갱신

    val
  end

  ### 맨 앞에서 꺼내기 ###
  def pop_first
    pop(true)
  end

  ### 맨 뒤에서 꺼내기 ###
  def pop_last
    pop(false)
  end

  ### 맨 앞 원소 조회 ###
  def peek_first
    raise IndexError, '덱이 비어 있다' if is_empty?

    @front.val
  end

  ### 맨 뒤 원소 조회 ###
  def peek_last
    raise IndexError, '덱이 비어 있다' if is_empty?

    @rear.val
  end

  ### 출력할 배열 반환 ###
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

### 실행 예제 ###
if __FILE__ == $0
  # 덱 초기화
  deque = LinkedListDeque.new
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
