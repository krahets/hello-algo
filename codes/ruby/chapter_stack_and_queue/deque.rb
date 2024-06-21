=begin
File: deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # 初始化双向队列
  # Ruby 没有内直的双端队列，只能把 Array 当作双端队列来使用
  deque = []

  # 元素如队
  deque << 2
  deque << 5
  deque << 4
  # 请注意，由于是数组，Array#unshift 方法的时间复杂度为 O(n)
  deque.unshift(3)
  deque.unshift(1)
  puts "双向队列 deque = #{deque}"

  # 访问元素
  peek_first = deque.first
  puts "队首元素 peek_first = #{peek_first}"
  peek_last = deque.last
  puts "队尾元素 peek_last = #{peek_last}"

  # 元素出队
  # 请注意，由于是数组， Array#shift 方法的时间复杂度为 O(n)
  pop_front = deque.shift
  puts "队首出队元素 pop_front = #{pop_front}，队首出队后 deque = #{deque}"
  pop_back = deque.pop
  puts "队尾出队元素 pop_back = #{pop_back}, 队尾出队后 deque = #{deque}"

  # 获取双向队列的长度
  size = deque.length
  puts "双向队列长度 size = #{size}"

  # 判断双向队列是否为空
  is_empty = size.zero?
  puts "双向队列是否为空 = #{is_empty}"
end
