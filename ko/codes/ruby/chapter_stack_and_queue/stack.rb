=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 예제 ###
if __FILE__ == $0
  # 스택 초기화
  # Ruby에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
  stack = []

  # 스택에 원소 삽입
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "스택 stack = #{stack}"

  # 스택 맨 위의 원소 조회
  peek = stack.last
  puts "맨 위 원소 peek = #{peek}"

  # 스택에서 원소 꺼내기
  pop = stack.pop
  puts "꺼낸 원소 pop = #{pop}"
  puts "꺼낸 후 stack = #{stack}"

  # 스택의 길이 조회
  size = stack.length
  puts "스택의 길이 size = #{size}"

  # 비어 있는지 확인
  is_empty = stack.empty?
  puts "스택이 비어 있는가 = #{is_empty}"
end
