=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 실행 예제 ###
if __FILE__ == $0
  # 큐 초기화
  # Ruby 내장 큐(Thread::Queue)에는 peek 메서드와 순회 메서드가 없으므로 Array를 큐로 사용할 수 있다
  queue = []

  # 큐에 원소 삽입
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "큐 queue = #{queue}"

  # 큐의 원소 조회
  peek = queue.first
  puts "맨 앞 원소 peek = #{peek}"

  # 큐에서 원소 꺼내기
  # Array는 배열이므로 Array#shift 메서드의 시간 복잡도는 O(n)이다
  pop = queue.shift
  puts "꺼낸 원소 pop = #{pop}"
  puts "꺼낸 후 queue = #{queue}"

  # 큐의 길이 조회
  size = queue.length
  puts "큐의 길이 size = #{size}"

  # 큐가 비어 있는지 확인
  is_empty = queue.empty?
  puts "큐가 비어 있는가 = #{is_empty}"
end
