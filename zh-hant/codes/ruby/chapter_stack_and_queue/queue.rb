=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_queue}
  # 初始化佇列
  # Ruby 內建的佇列（Thread::Queue）沒有 peek 和走訪方法，可以把 Array 當作佇列來使用
  queue = []
  # [endregion]{init_queue}

  # [region]{push}
  # 元素入列
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  # [endregion]{push}
  puts "佇列 queue = #{queue}"

  # [region]{peek}
  # 訪問佇列元素
  peek = queue.first
  # [endregion]{peek}
  puts "佇列首元素 peek = #{peek}"

  # [region]{pop}
  # 元素出列
  # 請注意，由於是陣列，Array#shift 方法的時間複雜度為 O(n)
  pop = queue.shift
  # [endregion]{pop}
  puts "出列元素 pop = #{pop}"
  puts "出列後 queue = #{queue}"

  # [region]{size}
  # 獲取佇列的長度
  size = queue.length
  # [endregion]{size}
  puts "佇列長度 size = #{size}"

  # [region]{is_empty}
  # 判斷佇列是否為空
  is_empty = queue.empty?
  # [endregion]{is_empty}
  puts "佇列是否為空 = #{is_empty}"
end
