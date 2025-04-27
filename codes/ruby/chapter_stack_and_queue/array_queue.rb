=begin
File: array_queue.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 基于环形数组实现的队列 ###
class ArrayQueue
  ### 获取队列的长度 ###
  attr_reader :size

  ### 构造方法 ###
  def initialize(size)
    @nums = Array.new(size, 0) # 用于存储队列元素的数组
    @front = 0 # 队首指针，指向队首元素
    @size = 0 # 队列长度
  end

  ### 获取队列的容量 ###
  def capacity
    @nums.length
  end

  ### 判断队列是否为空 ###
  def is_empty?
    size.zero?
  end

  ### 入队 ###
  def push(num)
    raise IndexError, '队列已满' if size == capacity

    # 计算队尾指针，指向队尾索引 + 1
    # 通过取余操作实现 rear 越过数组尾部后回到头部
    rear = (@front + size) % capacity
    # 将 num 添加至队尾
    @nums[rear] = num
    @size += 1
  end

  ### 出队 ###
  def pop
    num = peek
    # 队首指针向后移动一位，若越过尾部，则返回到数组头部
    @front = (@front + 1) % capacity
    @size -= 1
    num
  end

  ### 访问队首元素 ###
  def peek
    raise IndexError, '队列为空' if is_empty?

    @nums[@front]
  end

  ### 返回列表用于打印 ###
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
  # 初始化队列
  queue = ArrayQueue.new(10)

  # 元素入队
  queue.push(1)
  queue.push(3)
  queue.push(2)
  queue.push(5)
  queue.push(4)
  puts "队列 queue = #{queue.to_array}"

  # 访问队首元素
  peek = queue.peek
  puts "队首元素 peek = #{peek}"

  # 元素出队
  pop = queue.pop
  puts "出队元素 pop = #{pop}"
  puts "出队后 queue = #{queue.to_array}"

  # 获取队列的长度
  size = queue.size
  puts "队列长度 size = #{size}"

  # 判断队列是否为空
  is_empty = queue.is_empty?
  puts "队列是否为空 = #{is_empty}"

  # 测试环形数组
  for i in 0...10
    queue.push(i)
    queue.pop
    puts "第 #{i} 轮入队 + 出队后 queue = #{queue.to_array}"
  end
end
