=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 코드 ###
if __FILE__ == $0
  # [region]{init_stack}
  # 스택 초기화
  # Ruby에는 내장 스택 클래스가 없으므로 Array를 스택으로 사용할 수 있다
  stack = []
  # [endregion]{init_stack}

  # [region]{push}
  # 스택에 원소 삽입
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  # [endregion]{push}
  puts "스택 stack = #{stack}"

  # [region]{peek}
  # 스택 맨 위 원소 접근
  peek = stack.last
  # [endregion]{peek}
  puts "스택 맨 위 원소 peek = #{peek}"

  # [region]{pop}
  # 스택에서 원소 꺼내기
  pop = stack.pop
  # [endregion]{pop}
  puts "스택에서 꺼낸 원소 pop = #{pop}"
  puts "스택에서 꺼낸 후 stack = #{stack}"

  # [region]{size}
  # 스택의 길이 반환
  size = stack.length
  # [endregion]{size}
  puts "스택의 길이 size = #{size}"

  # [region]{is_empty}
  # 비어 있는지 판단
  is_empty = stack.empty?
  # [endregion]{is_empty}
  puts "스택이 비어 있는가 = #{is_empty}"
end
