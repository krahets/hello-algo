=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 코드 ###
if __FILE__ == $0
  # 덱 초기화
  # Ruby에는 내장 덱이 없으므로 Array를 덱으로 사용한다
  deque = []

  # 큐에 원소 삽입
  deque << 2
  deque << 5
  deque << 4
  # 배열이므로 Array#unshift 메서드의 시간 복잡도는 O(n)임에 유의한다
  deque.unshift(3)
  deque.unshift(1)
  puts "덱 deque = #{deque}"

  # 원소 접근
  peek_first = deque.first
  puts "맨 앞 원소 peek_first = #{peek_first}"
  peek_last = deque.last
  puts "맨 뒤 원소 peek_last = #{peek_last}"

  # 큐에서 원소 꺼내기
  # 배열이므로 Array#shift 메서드의 시간 복잡도는 O(n)임에 유의한다
  pop_front = deque.shift
  puts "맨 앞에서 꺼낸 원소 pop_front = #{pop_front}, 맨 앞에서 꺼낸 후 deque = #{deque}"
  pop_back = deque.pop
  puts "맨 뒤에서 꺼낸 원소 pop_back = #{pop_back}, 맨 뒤에서 꺼낸 후 deque = #{deque}"

  # 덱의 길이 반환
  size = deque.length
  puts "덱 길이 size = #{size}"

  # 덱이 비어 있는지 판단
  is_empty = size.zero?
  puts "덱이 비어 있는가 = #{is_empty}"
end
