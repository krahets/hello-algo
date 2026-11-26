=begin
File: queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 範例程式 ###
if __FILE__ == $0
  # 初始化佇列
  # Ruby 內建的佇列（Thread::Queue）沒有 peek 方法，也沒有走訪元素的方法，可以用 Array 當作佇列
  queue = []

  # 將元素加入佇列
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "佇列 queue = #{queue}"

  # 讀取隊首元素
  peek = queue.first
  puts "隊首元素 peek = #{peek}"

  # 從佇列取出元素
  # 請注意，Array 是陣列，因此 Array#shift 的時間複雜度為 O(n)
  pop = queue.shift
  puts "出隊元素 pop = #{pop}"
  puts "出隊後 queue = #{queue}"

  # 取得佇列長度
  size = queue.length
  puts "佇列長度 size = #{size}"

  # 判斷佇列是否為空
  is_empty = queue.empty?
  puts "佇列是否為空 = #{is_empty}"
end
