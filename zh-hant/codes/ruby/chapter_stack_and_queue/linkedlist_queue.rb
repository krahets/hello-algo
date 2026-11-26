=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 以鏈結串列實作佇列 ###
class LinkedListQueue
  ### 取得佇列長度 ###
  attr_reader :size

  ### 初始化方法 ###
  def initialize
    @front = nil  # @front 指向首節點
    @rear = nil   # @rear 指向尾節點
    @size = 0
  end

  ### 判斷佇列是否為空 ###
  def is_empty?
    @front.nil?
  end

  ### 入隊 ###
  def push(num)
    # 建立存有 num 的新節點，準備接到隊尾
    node = ListNode.new(num)

    # 若佇列為空，讓隊首與隊尾都指向新節點
    if @front.nil?
      @front = node
      @rear = node
    # 若佇列非空，將新節點接在尾節點之後
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### 出隊 ###
  def pop
    num = peek
    # 移除首節點
    @front = @front.next
    @size -= 1
    num
  end

  ### 讀取隊首元素 ###
  def peek
    raise IndexError, '佇列為空' if is_empty?

    @front.val
  end

  ### 將鏈結串列轉成 Array 並回傳 ###
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

### 範例程式 ###
if __FILE__ == $0
  # 初始化佇列
  queue = LinkedListQueue.new

  # 將元素加入佇列
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "佇列 queue = #{queue.to_array}"

  # 讀取隊首元素
  peek = queue.peek
  puts "隊首元素 front = #{peek}"

  # 從佇列取出元素
  pop_front = queue.pop
  puts "出隊元素 pop = #{pop_front}"
  puts "出隊後 queue = #{queue.to_array}"

  # 取得佇列長度
  size = queue.size
  puts "佇列長度 size = #{size}"

  # 判斷佇列是否為空
  is_empty = queue.is_empty?
  puts "佇列是否為空 = #{is_empty}"
end
