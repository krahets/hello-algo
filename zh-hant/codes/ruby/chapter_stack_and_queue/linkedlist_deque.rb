=begin
File: linkedlist_deque.rb
Created Time: 2024-04-06
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 雙向鏈結串列節點
class ListNode
  attr_accessor :val
  attr_accessor :next # 後繼節點引用
  attr_accessor :prev # 前軀節點引用

  ### 建構子 ###
  def initialize(val)
    @val = val
  end
end

### 基於雙向鏈結串列實現的雙向佇列 ###
class LinkedListDeque
  ### 獲取雙向佇列的長度 ###
  attr_reader :size

  ### 建構子 ###
  def initialize
    @front = nil  # 頭節點 front
    @rear = nil   # 尾節點 rear
    @size = 0     # 雙向佇列的長度
  end

  ### 判斷雙向佇列是否為空 ###
  def is_empty?
    size.zero?
  end

  ### 入列操作 ###
  def push(num, is_front)
    node = ListNode.new(num)
    # 若鏈結串列為空， 則令 front 和 rear 都指向 node
    if is_empty?
      @front = @rear = node
    # 佇列首入列操作
    elsif is_front
      # 將 node 新增至鏈結串列頭部
      @front.prev = node
      node.next = @front
      @front = node # 更新頭節點
    # 佇列尾入列操作
    else
      # 將 node 新增至鏈結串列尾部
      @rear.next = node
      node.prev = @rear
      @rear = node # 更新尾節點
    end
    @size += 1 # 更新佇列長度
  end

  ### 佇列首入列 ###
  def push_first(num)
    push(num, true)
  end

  ### 佇列尾入列 ###
  def push_last(num)
    push(num, false)
  end

  ### 出列操作 ###
  def pop(is_front)
    raise IndexError, '雙向佇列為空' if is_empty?

    # 佇列首出列操作
    if is_front
      val = @front.val # 暫存頭節點值
      # 刪除頭節點
      fnext = @front.next
      unless fnext.nil?
        fnext.prev = nil
        @front.next = nil
      end
      @front = fnext # 更新頭節點
    # 佇列尾出列操作
    else
      val = @rear.val # 暫存尾節點值
      # 刪除尾節點
      rprev = @rear.prev
      unless rprev.nil?
        rprev.next = nil
        @rear.prev = nil
      end
      @rear = rprev # 更新尾節點
    end
    @size -= 1 # 更新佇列長度

    val
  end

  ### 佇列首出列 ###
  def pop_first
    pop(true)
  end

  ### 佇列首出列 ###
  def pop_last
    pop(false)
  end

  ### 訪問佇列首元素 ###
  def peek_first
    raise IndexError, '雙向佇列為空' if is_empty?

    @front.val
  end

  ### 訪問佇列尾元素 ###
  def peek_last
    raise IndexError, '雙向佇列為空' if is_empty?

    @rear.val
  end

  ### 返回陣列用於列印 ###
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
  # 初始化雙向佇列
  deque = LinkedListDeque.new
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "雙向佇列 deque = #{deque.to_array}"

  # 訪問元素
  peek_first = deque.peek_first
  puts "佇列首元素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "佇列首元素 peek_last = #{peek_last}"

  # 元素入列
  deque.push_last(4)
  puts "元素 4 佇列尾入列後 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "元素 1 佇列首入列後 deque = #{deque.to_array}"

  # 元素出列
  pop_last = deque.pop_last
  puts "佇列尾出列元素 = #{pop_last}, 佇列尾出列後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "佇列首出列元素 = #{pop_first}，佇列首出列後 deque = #{deque.to_array}"

  # 獲取雙向佇列的長度
  size = deque.size
  puts "雙向佇列長度 size = #{size}"

  # 判斷雙向佇列是否為空
  is_empty = deque.is_empty?
  puts "雙向佇列是否為空 = #{is_empty}"
end
