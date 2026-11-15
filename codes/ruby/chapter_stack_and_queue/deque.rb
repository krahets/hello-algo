=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_deque}
  # 初始化双向队列
  # Ruby 没有内直的双端队列，只能把 Array 当作双端队列来使用
  deque = []
  # [endregion]{init_deque}

  # [region]{push}
  # 元素入队
  deque << 2
  deque << 5
  deque << 4
  # 请注意，由于是数组，Array#unshift 方法的时间复杂度为 O(n)
  deque.unshift(3)
  deque.unshift(1)
  # [endregion]{push}
  puts "双向队列 deque = #{deque}"

  # [region]{peek_first}
  # 访问元素
  peek_first = deque.first
  # [endregion]{peek_first}
  puts "队首元素 peek_first = #{peek_first}"
  # [region]{peek_last}
  peek_last = deque.last
  # [endregion]{peek_last}
  puts "队尾元素 peek_last = #{peek_last}"

  # [region]{pop_first}
  # 元素出队
  # 请注意，由于是数组， Array#shift 方法的时间复杂度为 O(n)
  pop_front = deque.shift
  # [endregion]{pop_first}
  puts "队首出队元素 pop_front = #{pop_front}，队首出队后 deque = #{deque}"
  # [region]{pop_last}
  pop_back = deque.pop
  # [endregion]{pop_last}
  puts "队尾出队元素 pop_back = #{pop_back}, 队尾出队后 deque = #{deque}"

  # [region]{size}
  # 获取双向队列的长度
  size = deque.length
  # [endregion]{size}
  puts "双向队列长度 size = #{size}"

  # [region]{is_empty}
  # 判断双向队列是否为空
  is_empty = size.zero?
  # [endregion]{is_empty}
  puts "双向队列是否为空 = #{is_empty}"
end
