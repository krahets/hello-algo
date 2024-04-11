=begin
File: array_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 基于数组实现的栈 ###
class ArrayStack
  ### 构造方法 ###
  def initialize
    @stack = []
  end

  ### 获取栈的长度 ###
  def size
    @stack.length
  end

  ### 判断栈是否为空 ###
  def is_empty?
    @stack.empty?
  end

  ### 入栈 ###
  def push(item)
    @stack << item
  end

  ### 出栈 ###
  def pop
    raise IndexError, '栈为空' if is_empty?

    @stack.pop
  end

  ### 访问栈顶元素 ###
  def peek
    raise IndexError, '栈为空' if is_empty?

    @stack.last
  end

  ### 返回列表用于打印 ###
  def to_array
    @stack
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化栈
  stack = ArrayStack.new

  # 元素入栈
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "栈 stack = #{stack.to_array}"

  # 访问栈顶元素
  peek = stack.peek
  puts "栈顶元素 peek = #{peek}"

  # 元素出栈
  pop = stack.pop
  puts "出栈元素 pop = #{pop}"
  puts "出栈后 stack = #{stack.to_array}"

  # 获取栈的长度
  size = stack.size
  puts "栈的长度 size = #{size}"

  # 判断是否为空
  is_empty = stack.is_empty?
  puts "栈是否为空 = #{is_empty}"
end
