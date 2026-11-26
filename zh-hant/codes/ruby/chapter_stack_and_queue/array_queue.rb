=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 以環狀陣列實作佇列 ###
class ArrayQueue
  ### 取得佇列長度 ###
  attr_reader :size

  ### 初始化方法 ###
  def initialize(size)
    @nums = Array.new(size, 0) # 存放佇列元素的陣列
    @front = 0 # 隊首索引，記錄隊首元素在陣列中的位置
    @size = 0 # 佇列長度
  end

  ### 取得佇列容量 ###
  def capacity
    @nums.length
  end

  ### 判斷佇列是否為空 ###
  def is_empty?
    size.zero?
  end

  ### 入隊 ###
  def push(num)
    raise IndexError, '佇列已滿' if size == capacity

    # 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
    # 取餘數，讓 rear 超過陣列末端時繞回開頭
    rear = (@front + size) % capacity
    # 將 num 加到隊尾
    @nums[rear] = num
    @size += 1
  end

  ### 出隊 ###
  def pop
    num = peek
    # 將隊首索引往後移一格，若超過陣列末端就繞回開頭
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### 讀取隊首元素 ###
  def peek
    raise IndexError, '佇列為空' if is_empty?

    @nums[@front]
  end

  ### 回傳陣列以便輸出 ###
  def to_array
    res = Array.new(size, 0)
    j = @front

    for i in 0...size
      res[i] = @nums[j % capacity]
      j += 1
    end

    res
  end
end

### 範例程式 ###
if __FILE__ == $0
  # 初始化佇列
  queue = ArrayQueue.new(10)

  # 將元素加入佇列
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "佇列 queue = #{queue.to_array}"

  # 讀取隊首元素
  peek = queue.peek
  puts "隊首元素 peek = #{peek}"

  # 從佇列取出元素
  pop = queue.pop
  puts "出隊元素 pop = #{pop}"
  puts "出隊後 queue = #{queue.to_array}"

  # 取得佇列長度
  size = queue.size
  puts "佇列長度 size = #{size}"

  # 判斷佇列是否為空
  is_empty = queue.is_empty?
  puts "佇列是否為空 = #{is_empty}"

  # 測試環狀陣列
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "第 #{i} 輪入隊 + 出隊後 queue = #{queue.to_array}"
  end
end
