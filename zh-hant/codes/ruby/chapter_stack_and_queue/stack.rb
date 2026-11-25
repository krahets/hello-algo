=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 範例程式 ###
if __FILE__ == $0
  # 初始化堆疊
  # Ruby 沒有內建堆疊類別，可以用 Array 當作堆疊
  stack = []

  # 將元素推入堆疊
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "堆疊 stack = #{stack}"

  # 讀取堆疊頂端的元素
  peek = stack.last
  puts "堆疊頂端元素 peek = #{peek}"

  # 從堆疊彈出元素
  pop = stack.pop
  puts "彈出的元素 pop = #{pop}"
  puts "彈出後 stack = #{stack}"

  # 取得堆疊長度
  size = stack.length
  puts "堆疊長度 size = #{size}"

  # 判斷堆疊是否為空
  is_empty = stack.empty?
  puts "堆疊是否為空 = #{is_empty}"
end
