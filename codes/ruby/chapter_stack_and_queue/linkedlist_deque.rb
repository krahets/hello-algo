=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 双向链表节点
class ListNode
  attr_accessor :val
  attr_accessor :next # 后继节点引用
  attr_accessor :prev # 前躯节点引用

  ### 构造方法 ###
  def initialize(val)
    @val = val
  end
end

### 基于双向链表实现的双向队列 ###
class LinkedListDeque
  ### 获取双向队列的长度 ###
  attr_reader :size

  ### 构造方法 ###
  def initialize
    @front = nil  # 头节点 front
    @rear = nil   # 尾节点 rear
    @size = 0     # 双向队列的长度
  end

  ### 判断双向队列是否为空 ###
  def is_empty?
    size.zero?
  end

  ### 入队操作 ###
  def push(num, is_front)
    node = ListNode.new(num)
    # 若链表为空， 则令 front 和 rear 都指向 node
    if is_empty?
      @front = @rear = node
    # 队首入队操作
    elsif is_front
      # 将 node 添加至链表头部
      @front.prev = node
      node.next = @front
      @front = node # 更新头节点
    # 队尾入队操作
    else
      # 将 node 添加至链表尾部
      @rear.next = node
      node.prev = @rear
      @rear = node # 更新尾节点
    end
    @size += 1 # 更新队列长度
  end

  ### 队首入队 ###
  def push_first(num)
    push(num, true)
  end

  ### 队尾入队 ###
  def push_last(num)
    push(num, false)
  end

  ### 出队操作 ###
  def pop(is_front)
    raise IndexError, '双向队列为空' if is_empty?

    # 队首出队操作
    if is_front
      val = @front.val # 暂存头节点值
      # 删除头节点
      fnext = @front.next
      unless fnext.nil?
        fnext.prev = nil
        @front.next = nil
      end
      @front = fnext # 更新头节点
    # 队尾出队操作
    else
      val = @rear.val # 暂存尾节点值
      # 删除尾节点
      rprev = @rear.prev
      unless rprev.nil?
        rprev.next = nil
        @rear.prev = nil
      end
      @rear = rprev # 更新尾节点
    end
    @size -= 1 # 更新队列长度

    val
  end

  ### 队首出队 ###
  def pop_first
    pop(true)
  end

  ### 队首出队 ###
  def pop_last
    pop(false)
  end

  ### 访问队首元素 ###
  def peek_first
    raise IndexError, '双向队列为空' if is_empty?

    @front.val
  end

  ### 访问队尾元素 ###
  def peek_last
    raise IndexError, '双向队列为空' if is_empty?

    @rear.val
  end

  ### 返回数组用于打印 ###
  def to_array
    node = @front
    res = Array.new(size, 0)
    for i in 0...size
      res[i] = node.val
      node = node.next
    end
    res
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化双向队列
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "双向队列 deque = #{deque.to_array}"

  # 访问元素
  peek_first = deque.peek_first
  puts "队首元素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "队首元素 peek_last = #{peek_last}"

  # 元素入队
  deque.push_last(4)
  puts "元素 4 队尾入队后 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "元素 1 队首入队后 deque = #{deque.to_array}"

  # 元素出队
  pop_last = deque.pop_last
  puts "队尾出队元素 = #{pop_last}, 队尾出队后 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "队首出队元素 = #{pop_first}，队首出队后 deque = #{deque.to_array}"

  # 获取双向队列的长度
  size = deque.size
  puts "双向队列长度 size = #{size}"

  # 判断双向队列是否为空
  is_empty = deque.is_empty?
  puts "双向队列是否为空 = #{is_empty}"
end
