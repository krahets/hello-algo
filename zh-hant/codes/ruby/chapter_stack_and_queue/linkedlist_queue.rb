=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 基於鏈結串列頭現的佇列 ###
class LinkedListQueue
  ### 獲取佇列的長度 ###
  attr_reader :size

  ### 建構子 ###
  def initialize
    @front = nil  # 頭節點 front
    @rear = nil   # 尾節點 rear
    @size = 0
  end

  ### 判斷佇列是否為空 ###
  def is_empty?
    @front.nil?
  end

  ### 入列 ###
  def push(num)
    # 在尾節點後新增 num
    node = ListNode.new(num)

    # 如果佇列為空，則令頭，尾節點都指向該節點
    if @front.nil?
      @front = node
      @rear = node
    # 如果佇列不為空，則令該節點新增到尾節點後
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### 出列 ###
  def pop
    num = peek
    # 刪除頭節點
    @front = @front.next
    @size -= 1
    num
  end

  ### 訪問佇列首元素 ###
  def peek
    raise IndexError, '佇列為空' if is_empty?

    @front.val
  end

  ### 將鏈結串列為 Array 並返回 ###
  def to_array
    queue = []
    temp = @front
    while temp
      queue << temp.val
      temp = temp.next
    end
    queue
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化佇列
  queue = LinkedListQueue.new

  # 元素如隊
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "佇列 queue = #{queue.to_array}"

  # 訪問佇列首元素
  peek = queue.peek
  puts "佇列首元素 front = #{peek}"

  # 元素出列
  pop_front = queue.pop
  puts "出列元素 pop = #{pop_front}"
  puts "出列後 queue = #{queue.to_array}"

  # 獲取佇列的長度
  size = queue.size
  puts "佇列長度 size = #{size}"

  # 判斷佇列是否為空
  is_empty = queue.is_empty?
  puts "佇列是否為空 = #{is_empty}"
end
