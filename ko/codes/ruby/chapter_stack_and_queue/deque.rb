=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 코드 ###
if __FILE__ == $0
  # [region]{init_deque}
  # 덱 초기화
  # Ruby에는 내장 덱이 없으므로 Array를 덱으로 사용한다
  deque = []
  # [endregion]{init_deque}

  # [region]{push}
  # 큐에 원소 삽입
  deque << 2
  deque << 5
  deque << 4
  # 배열이므로 Array#unshift 메서드의 시간 복잡도는 O(n)임에 유의한다
  deque.unshift(3)
  deque.unshift(1)
  # [endregion]{push}
  puts "덱 deque = #{deque}"

  # [region]{peek_first}
  # 원소 접근
  peek_first = deque.first
  # [endregion]{peek_first}
  puts "맨 앞 원소 peek_first = #{peek_first}"
  # [region]{peek_last}
  peek_last = deque.last
  # [endregion]{peek_last}
  puts "맨 뒤 원소 peek_last = #{peek_last}"

  # [region]{pop_first}
  # 큐에서 원소 꺼내기
  # 배열이므로 Array#shift 메서드의 시간 복잡도는 O(n)임에 유의한다
  pop_front = deque.shift
  # [endregion]{pop_first}
  puts "맨 앞에서 꺼낸 원소 pop_front = #{pop_front}, 맨 앞에서 꺼낸 후 deque = #{deque}"
  # [region]{pop_last}
  pop_back = deque.pop
  # [endregion]{pop_last}
  puts "맨 뒤에서 꺼낸 원소 pop_back = #{pop_back}, 맨 뒤에서 꺼낸 후 deque = #{deque}"

  # [region]{size}
  # 덱의 길이 반환
  size = deque.length
  # [endregion]{size}
  puts "덱 길이 size = #{size}"

  # [region]{is_empty}
  # 덱이 비어 있는지 판단
  is_empty = size.zero?
  # [endregion]{is_empty}
  puts "덱이 비어 있는가 = #{is_empty}"
end
