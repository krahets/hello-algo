=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 배열로 구현한 스택 ###
class ArrayStack
  ### 생성자 ###
  def initialize
    @stack = []
  end

  ### 스택의 길이 반환 ###
  def size
    @stack.length
  end

  ### 스택이 비어 있는지 판단 ###
  def is_empty?
    @stack.empty?
  end

  ### 스택에 삽입 ###
  def push(item)
    @stack << item
  end

  ### 스택에서 꺼내기 ###
  def pop
    raise IndexError, '스택이 비어 있다' if is_empty?

    @stack.pop
  end

  ### 스택 맨 위 원소 접근 ###
  def peek
    raise IndexError, '스택이 비어 있다' if is_empty?

    @stack.last
  end

  ### 출력에 사용할 리스트 반환 ###
  def to_array
    @stack
  end
end

### 실행 코드 ###
if __FILE__ == $0
  # 스택 초기화
  stack = ArrayStack.new

  # 스택에 원소 삽입
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "스택 stack = #{stack.to_array}"

  # 스택 맨 위 원소 접근
  peek = stack.peek
  puts "스택 맨 위 원소 peek = #{peek}"

  # 스택에서 원소 꺼내기
  pop = stack.pop
  puts "스택에서 꺼낸 원소 pop = #{pop}"
  puts "스택에서 꺼낸 후 stack = #{stack.to_array}"

  # 스택의 길이 반환
  size = stack.size
  puts "스택의 길이 size = #{size}"

  # 비어 있는지 판단
  is_empty = stack.is_empty?
  puts "스택이 비어 있는가 = #{is_empty}"
end
