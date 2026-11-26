=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 雙向鏈結串列的節點 ###
class ListNode
  attr_accessor :val
  attr_accessor :next # 指向下一個節點的參照
  attr_accessor :prev # 指向上一個節點的參照

  ### 初始化方法 ###
  def initialize(val)
    @val = val
  end
end

### 以雙向鏈結串列實作雙端佇列 ###
class LinkedListDeque
  ### 取得雙端佇列長度 ###
  attr_reader :size

  ### 初始化方法 ###
  def initialize
    @front = nil  # @front 指向首節點
    @rear = nil   # @rear 指向尾節點
    @size = 0     # 雙端佇列長度
  end

  ### 判斷雙端佇列是否為空 ###
  def is_empty?
    size.zero?
  end

  ### 加入元素 ###
  def push(num, is_front)
    node = ListNode.new(num)
    # 若鏈結串列為空，讓 @front 和 @rear 都指向 node
    if is_empty?
      @front = @rear = node
    # 從隊首加入元素
    elsif is_front
      # 將 node 加到鏈結串列的開頭
      @front.prev = node
      node.next = @front
      @front = node # 更新首節點
    # 從隊尾加入元素
    else
      # 將 node 加到鏈結串列的末端
      @rear.next = node
      node.prev = @rear
      @rear = node # 更新尾節點
    end
    @size += 1 # 將雙端佇列長度加 1
  end

  ### 從隊首加入元素 ###
  def push_first(num)
    push(num, true)
  end

  ### 從隊尾加入元素 ###
  def push_last(num)
    push(num, false)
  end

  ### 取出元素 ###
  def pop(is_front)
    raise IndexError, '雙端佇列為空' if is_empty?

    # 佇列長度為 1 時，首尾兩端指向同一個節點
    if @size == 1
      val = @front.val
      @front = nil
      @rear = nil
    # 從隊首取出元素
    elsif is_front
      val = @front.val # 暫存首節點的值
      # 移除首節點
      fnext = @front.next
      fnext.prev = nil
      @front.next = nil
      @front = fnext # 更新首節點
    # 從隊尾取出元素
    else
      val = @rear.val # 暫存尾節點的值
      # 移除尾節點
      rprev = @rear.prev
      rprev.next = nil
      @rear.prev = nil
      @rear = rprev # 更新尾節點
    end
    @size -= 1 # 將雙端佇列長度減 1

    val
  end

  ### 從隊首取出元素 ###
  def pop_first
    pop(true)
  end

  ### 從隊尾取出元素 ###
  def pop_last
    pop(false)
  end

  ### 讀取隊首元素 ###
  def peek_first
    raise IndexError, '雙端佇列為空' if is_empty?

    @front.val
  end

  ### 讀取隊尾元素 ###
  def peek_last
    raise IndexError, '雙端佇列為空' if is_empty?

    @rear.val
  end

  ### 回傳陣列以便輸出 ###
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

### 範例程式 ###
if __FILE__ == $0
  # 初始化雙端佇列
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "雙端佇列 deque = #{deque.to_array}"

  # 讀取隊首與隊尾元素
  peek_first = deque.peek_first
  puts "隊首元素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "隊尾元素 peek_last = #{peek_last}"

  # 將元素加入雙端佇列
  deque.push_last(4)
  puts "將元素 4 加到隊尾後 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "將元素 1 加到隊首後 deque = #{deque.to_array}"

  # 從雙端佇列取出元素
  pop_last = deque.pop_last
  puts "從隊尾取出的元素 = #{pop_last}， 取出後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "從隊首取出的元素 = #{pop_first}，取出後 deque = #{deque.to_array}"

  # 取得雙端佇列長度
  size = deque.size
  puts "雙端佇列長度 size = #{size}"

  # 判斷雙端佇列是否為空
  is_empty = deque.is_empty?
  puts "雙端佇列是否為空 = #{is_empty}"
end
