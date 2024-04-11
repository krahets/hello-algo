=begin
File: linkedlist_stack.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 基於鏈結串列實現的堆疊 ###
class LinkedListStack
  attr_reader :size

  ### 建構子 ###
  def initialize
    @size = 0
  end

  ### 判斷堆疊是否為空 ###
  def is_empty?
    @peek.nil?
  end

  ### 入堆疊 ###
  def push(val)
    node = ListNode.new(val)
    node.next = @peek
    @peek = node
    @size += 1
  end

  ### 出堆疊 ###
  def pop
    num = peek
    @peek = @peek.next
    @size -= 1
    num
  end

  ### 訪問堆疊頂元素 ###
  def peek
    raise IndexError, '堆疊為空' if is_empty?

    @peek.val
  end

  ### 將鏈結串列轉化為 Array 並反回 ###
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
  # 初始化堆疊
  stack = LinkedListStack.new

  # 元素入堆疊
  stack.push(1)
  stack.push(3)
  stack.push(2)
  stack.push(5)
  stack.push(4)
  puts "堆疊 stack = #{stack.to_array}"

  # 訪問堆疊頂元素
  peek = stack.peek
  puts "堆疊頂元素 peek = #{peek}"

  # 元素出堆疊
  pop = stack.pop
  puts "出堆疊元素 pop = #{pop}"
  puts "出堆疊後 stack = #{stack.to_array}"

  # 獲取堆疊的長度
  size = stack.size
  puts "堆疊的長度 size = #{size}"

  # 判斷是否為空
  is_empty = stack.is_empty?
  puts "堆疊是否為空 = #{is_empty}"
end
