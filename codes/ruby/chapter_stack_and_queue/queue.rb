=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_queue}
  # 初始化队列
  # Ruby 内置的队列（Thread::Queue）没有 peek 和遍历方法，可以把 Array 当作队列来使用
  queue = []
  # [endregion]{init_queue}

  # [region]{push}
  # 元素入队
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  # [endregion]{push}
  puts "队列 queue = #{queue}"

  # [region]{peek}
  # 访问队列元素
  peek = queue.first
  # [endregion]{peek}
  puts "队首元素 peek = #{peek}"

  # [region]{pop}
  # 元素出队
  # 请注意，由于是数组，Array#shift 方法的时间复杂度为 O(n)
  pop = queue.shift
  # [endregion]{pop}
  puts "出队元素 pop = #{pop}"
  puts "出队后 queue = #{queue}"

  # [region]{size}
  # 获取队列的长度
  size = queue.length
  # [endregion]{size}
  puts "队列长度 size = #{size}"

  # [region]{is_empty}
  # 判断队列是否为空
  is_empty = queue.empty?
  # [endregion]{is_empty}
  puts "队列是否为空 = #{is_empty}"
end
