=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 基於環形陣列實現的佇列 ###
class ArrayQueue
  ### 獲取佇列的長度 ###
  attr_reader :size

  ### 建構子 ###
  def initialize(size)
    @nums = Array.new(size, 0) # 用於儲存佇列元素的陣列
    @front = 0 # 佇列首指標，指向佇列首元素
    @size = 0 # 佇列長度
  end

  ### 獲取佇列的容量 ###
  def capacity
    @nums.length
  end

  ### 判斷佇列是否為空 ###
  def is_empty?
    size.zero?
  end

  ### 入列 ###
  def push(num)
    raise IndexError, '佇列已滿' if size == capacity

    # 計算佇列尾指標，指向佇列尾索引 + 1
    # 透過取餘操作實現 rear 越過陣列尾部後回到頭部
    rear = (@front + size) % capacity
    # 將 num 新增至佇列尾
    @nums[rear] = num
    @size += 1
  end

  ### 出列 ###
  def pop
    num = peek
    # 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### 訪問佇列首元素 ###
  def peek
    raise IndexError, '佇列為空' if is_empty?

    @nums[@front]
  end

  ### 返回串列用於列印 ###
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

### Driver Code ###
if __FILE__ == $0
  # 初始化佇列
  queue = ArrayQueue.new(10)

  # 元素入列
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "佇列 queue = #{queue.to_array}"

  # 訪問佇列首元素
  peek = queue.peek
  puts "佇列首元素 peek = #{peek}"

  # 元素出列
  pop = queue.pop
  puts "出列元素 pop = #{pop}"
  puts "出列後 queue = #{queue.to_array}"

  # 獲取佇列的長度
  size = queue.size
  puts "佇列長度 size = #{size}"

  # 判斷佇列是否為空
  is_empty = queue.is_empty?
  puts "佇列是否為空 = #{is_empty}"

  # 測試環形陣列
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "第 #{i} 輪入列 + 出列後 queue = #{queue.to_array}"
  end
end
