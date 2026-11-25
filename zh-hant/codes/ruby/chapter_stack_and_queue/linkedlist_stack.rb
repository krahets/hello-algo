=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 以鏈結串列實作堆疊 ###
class LinkedListStack
  attr_reader :size

  ### 初始化方法 ###
  def initialize
    @size = 0
  end

  ### 判斷堆疊是否為空 ###
  def is_empty?
    @peek.nil?
  end

  ### 推入堆疊 ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### 彈出堆疊頂端的元素 ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### 讀取堆疊頂端的元素 ###
  def peek
    raise IndexError, '堆疊為空' if is_empty?

    @peek.val
  end

  ### 將鏈結串列轉成 Array 並回傳 ###
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

### 範例程式 ###
if __FILE__ == $0
  # 初始化堆疊
  stack = LinkedListStack.new

  # 將元素推入堆疊
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "堆疊 stack = #{stack.to_array}"

  # 讀取堆疊頂端的元素
  peek = stack.peek
  puts "堆疊頂端元素 peek = #{peek}"

  # 從堆疊彈出元素
  pop = stack.pop
  puts "彈出的元素 pop = #{pop}"
  puts "彈出後 stack = #{stack.to_array}"

  # 取得堆疊長度
  size = stack.size
  puts "堆疊長度 size = #{size}"

  # 判斷堆疊是否為空
  is_empty = stack.is_empty?
  puts "堆疊是否為空 = #{is_empty}"
end
