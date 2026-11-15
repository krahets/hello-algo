=begin
File: linkedlist_queue.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/list_node'

### 基于链表头现的队列 ###
class LinkedListQueue
  ### 获取队列的长度 ###
  attr_reader :size

  ### 构造方法 ###
  def initialize
    @front = nil  # 头节点 front
    @rear = nil   # 尾节点 rear
    @size = 0
  end

  ### 判断队列是否为空 ###
  def is_empty?
    @front.nil?
  end

  ### 入队 ###
  def push(num)
    # 在尾节点后添加 num
    node = ListNode.new(num)

    # 如果队列为空，则令头，尾节点都指向该节点
    if @front.nil?
      @front = node
      @rear = node
    # 如果队列不为空，则令该节点添加到尾节点后
    else
      @rear.next = node
      @rear = node
    end

    @size += 1
  end

  ### 出队 ###
  def pop
    num = peek
    # 删除头节点
    @front = @front.next
    @size -= 1
    num
  end

  ### 访问队首元素 ###
  def peek
    raise IndexError, '队列为空' if is_empty?

    @front.val
  end

  ### 将链表为 Array 并返回 ###
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
  # 初始化队列
  queue = LinkedListQueue.new

  # 元素如队
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "队列 queue = #{queue.to_array}"

  # 访问队首元素
  peek = queue.peek
  puts "队首元素 front = #{peek}"

  # 元素出队
  pop_front = queue.pop
  puts "出队元素 pop = #{pop_front}"
  puts "出队后 queue = #{queue.to_array}"

  # 获取队列的长度
  size = queue.size
  puts "队列长度 size = #{size}"

  # 判断队列是否为空
  is_empty = queue.is_empty?
  puts "队列是否为空 = #{is_empty}"
end
