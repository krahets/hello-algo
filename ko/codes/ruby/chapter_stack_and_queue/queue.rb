=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 코드 ###
if __FILE__ == $0
  # [region]{init_queue}
  # 큐 초기화
  # Ruby의 내장 큐(Thread::Queue)에는 peek 메서드와 순회 메서드가 없으므로 Array를 큐로 사용할 수 있다
  queue = []
  # [endregion]{init_queue}

  # [region]{push}
  # 큐에 원소 삽입
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  # [endregion]{push}
  puts "큐 queue = #{queue}"

  # [region]{peek}
  # 큐 원소 접근
  peek = queue.first
  # [endregion]{peek}
  puts "맨 앞 원소 peek = #{peek}"

  # [region]{pop}
  # 큐에서 원소 꺼내기
  # 배열이므로 Array#shift 메서드의 시간 복잡도는 O(n)임에 유의한다
  pop = queue.shift
  # [endregion]{pop}
  puts "큐에서 꺼낸 원소 pop = #{pop}"
  puts "큐에서 꺼낸 후 queue = #{queue}"

  # [region]{size}
  # 큐의 길이 반환
  size = queue.length
  # [endregion]{size}
  puts "큐 길이 size = #{size}"

  # [region]{is_empty}
  # 큐가 비어 있는지 판단
  is_empty = queue.empty?
  # [endregion]{is_empty}
  puts "큐가 비어 있는가 = #{is_empty}"
end
