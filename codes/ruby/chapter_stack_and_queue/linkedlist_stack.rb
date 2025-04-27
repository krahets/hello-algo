=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 基于链表实现的栈 ###
class LinkedListStack
  attr_reader :size

  ### 构造方法 ###
  def initialize
    @size = 0
  end

  ### 判断栈是否为空 ###
  def is_empty?
    @peek.nil?
  end

  ### 入栈 ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### 出栈 ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### 访问栈顶元素 ###
  def peek
    raise IndexError, '栈为空' if is_empty?

    @peek.val
  end

  ### 将链表转化为 Array 并反回 ###
  def to_array
    arr = []
    node = @peek
    while node
      arr << node.val
      node = node.next
    end
    arr.reverse
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化栈
  stack = LinkedListStack.new

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
