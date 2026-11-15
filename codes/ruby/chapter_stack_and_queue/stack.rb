=begin
File: stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Driver Code ###
if __FILE__ == $0
  # [region]{init_stack}
  # 初始化栈
  # Ruby 没有内置的栈类，可以把 Array 当作栈来使用
  stack = []
  # [endregion]{init_stack}

  # [region]{push}
  # 元素入栈
  stack << 1
  stack << 3
  stack << 2
  stack << 5
  stack << 4
  # [endregion]{push}
  puts "栈 stack = #{stack}"

  # [region]{peek}
  # 访问栈顶元素
  peek = stack.last
  # [endregion]{peek}
  puts "栈顶元素 peek = #{peek}"

  # [region]{pop}
  # 元素出栈
  pop = stack.pop
  # [endregion]{pop}
  puts "出栈元素 pop = #{pop}"
  puts "出栈后 stack = #{stack}"

  # [region]{size}
  # 获取栈的长度
  size = stack.length
  # [endregion]{size}
  puts "栈的长度 size = #{size}"

  # [region]{is_empty}
  # 判断是否为空
  is_empty = stack.empty?
  # [endregion]{is_empty}
  puts "栈是否为空 = #{is_empty}"
end
