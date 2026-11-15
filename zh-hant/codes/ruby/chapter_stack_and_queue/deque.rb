=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_deque}
  # 初始化雙向佇列
  # Ruby 沒有內直的雙端佇列，只能把 Array 當作雙端佇列來使用
  deque = []
  # [endregion]{init_deque}

  # [region]{push}
  # 元素入列
  deque << 2
  deque << 5
  deque << 4
  # 請注意，由於是陣列，Array#unshift 方法的時間複雜度為 O(n)
  deque.unshift(3)
  deque.unshift(1)
  # [endregion]{push}
  puts "雙向佇列 deque = #{deque}"

  # [region]{peek_first}
  # 訪問元素
  peek_first = deque.first
  # [endregion]{peek_first}
  puts "佇列首元素 peek_first = #{peek_first}"
  # [region]{peek_last}
  peek_last = deque.last
  # [endregion]{peek_last}
  puts "佇列尾元素 peek_last = #{peek_last}"

  # [region]{pop_first}
  # 元素出列
  # 請注意，由於是陣列， Array#shift 方法的時間複雜度為 O(n)
  pop_front = deque.shift
  # [endregion]{pop_first}
  puts "佇列首出列元素 pop_front = #{pop_front}，佇列首出列後 deque = #{deque}"
  # [region]{pop_last}
  pop_back = deque.pop
  # [endregion]{pop_last}
  puts "佇列尾出列元素 pop_back = #{pop_back}, 佇列尾出列後 deque = #{deque}"

  # [region]{size}
  # 獲取雙向佇列的長度
  size = deque.length
  # [endregion]{size}
  puts "雙向佇列長度 size = #{size}"

  # [region]{is_empty}
  # 判斷雙向佇列是否為空
  is_empty = size.zero?
  # [endregion]{is_empty}
  puts "雙向佇列是否為空 = #{is_empty}"
end
