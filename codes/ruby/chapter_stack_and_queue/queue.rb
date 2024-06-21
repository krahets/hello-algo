=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # 初始化队列
  # Ruby 内置的队列（Thread::Queue) 没有 peek 和遍历方法，可以把 Array 当作队列来使用
  queue = []

  # 元素入队
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "队列 queue = #{queue}"

  # 访问队列元素
  peek = queue.first
  puts "队首元素 peek = #{peek}"

  # 元素出队
  # 清注意，由于是数组，Array#shift 方法时间复杂度为 O(n)
  pop = queue.shift
  puts "出队元素 pop = #{pop}"
  puts "出队后 queue = #{queue}"

  # 获取队列的长度
  size = queue.length
  puts "队列长度 size = #{size}"

  # 判断队列是否为空
  is_empty = queue.empty?
  puts "队列是否为空 = #{is_empty}"
end
