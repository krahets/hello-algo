=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 範例程式 ###
if __FILE__ == $0
  # 初始化雙端佇列
  # Ruby 沒有內建雙端佇列，只能用 Array 來模擬
  deque = []

  # 將元素加入雙端佇列
  deque << 2
  deque << 5
  deque << 4
  # 請注意，Array 是陣列，因此 Array#unshift 的時間複雜度為 O(n)
  deque.unshift(3)
  deque.unshift(1)
  puts "雙端佇列 deque = #{deque}"

  # 讀取隊首與隊尾元素
  peek_first = deque.first
  puts "隊首元素 peek_first = #{peek_first}"
  peek_last = deque.last
  puts "隊尾元素 peek_last = #{peek_last}"

  # 從雙端佇列取出元素
  # 請注意，Array 是陣列，因此 Array#shift 的時間複雜度為 O(n)
  pop_front = deque.shift
  puts "從隊首取出的元素 pop_front = #{pop_front}，取出後 deque = #{deque}"
  pop_back = deque.pop
  puts "從隊尾取出的元素 pop_back = #{pop_back}， 取出後 deque = #{deque}"

  # 取得雙端佇列長度
  size = deque.length
  puts "雙端佇列長度 size = #{size}"

  # 判斷雙端佇列是否為空
  is_empty = size.zero?
  puts "雙端佇列是否為空 = #{is_empty}"
end
