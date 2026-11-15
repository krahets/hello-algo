=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # 初始化堆疊
  # Ruby 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
  stack = []

  # 元素入堆疊
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "堆疊 stack = #{stack}"

  # 訪問堆疊頂元素
  peek = stack.last
  puts "堆疊頂元素 peek = #{peek}"

  # 元素出堆疊
  pop = stack.pop
  puts "出堆疊元素 pop = #{pop}"
  puts "出堆疊後 stack = #{stack}"

  # 獲取堆疊的長度
  size = stack.length
  puts "堆疊的長度 size = #{size}"

  # 判斷是否為空
  is_empty = stack.empty?
  puts "堆疊是否為空 = #{is_empty}"
end
