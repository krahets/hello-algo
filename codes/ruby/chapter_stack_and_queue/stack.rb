=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # 初始化栈
  # Ruby 没有内置的栈类，可以把 Array 当作栈来使用
  stack = []

  # 元素入栈
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  puts "栈 stack = #{stack}"

  # 访问栈顶元素
  peek = stack.last
  puts "栈顶元素 peek = #{peek}"

  # 元素出栈
  pop = stack.pop
  puts "出栈元素 pop = #{pop}"
  puts "出栈后 stack = #{stack}"

  # 获取栈的长度
  size = stack.length
  puts "栈的长度 size = #{size}"

  # 判断是否为空
  is_empty = stack.empty?
  puts "栈是否为空 = #{is_empty}"
end
