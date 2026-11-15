=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # 初始化雙向佇列
  # Ruby 沒有內直的雙端佇列，只能把 Array 當作雙端佇列來使用
  deque = []

  # 元素如隊
  deque << 2
  deque << 5
  deque << 4
  # 請注意，由於是陣列，Array#unshift 方法的時間複雜度為 O(n)
  deque.unshift(3)
  deque.unshift(1)
  puts "雙向佇列 deque = #{deque}"

  # 訪問元素
  peek_first = deque.first
  puts "佇列首元素 peek_first = #{peek_first}"
  peek_last = deque.last
  puts "佇列尾元素 peek_last = #{peek_last}"

  # 元素出列
  # 請注意，由於是陣列， Array#shift 方法的時間複雜度為 O(n)
  pop_front = deque.shift
  puts "佇列首出列元素 pop_front = #{pop_front}，佇列首出列後 deque = #{deque}"
  pop_back = deque.pop
  puts "佇列尾出列元素 pop_back = #{pop_back}, 佇列尾出列後 deque = #{deque}"

  # 獲取雙向佇列的長度
  size = deque.length
  puts "雙向佇列長度 size = #{size}"

  # 判斷雙向佇列是否為空
  is_empty = size.zero?
  puts "雙向佇列是否為空 = #{is_empty}"
end
