=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 基于环形数组实现的双向队列 ###
class ArrayDeque
  ### 获取双向队列的长度 ###
  attr_reader :size

  ### 构造方法 ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### 获取双向队列的容量 ###
  def capacity
    @nums.length
  end

  ### 判断双向队列是否为空 ###
  def is_empty?
    size.zero?
  end

  ### 队首入队 ###
  def push_first(num)
    if size == capacity
      puts '双向队列已满'
      return
    end

    # 队首指针向左移动一位
    # 通过取余操作实现 front 越过数组头部后回到尾部
    @front = index(@front - 1)
    # 将 num 添加至队首
    @nums[@front] = num
    @size += 1
  end

  ### 队尾入队 ###
  def push_last(num)
    if size == capacity
      puts '双向队列已满'
      return
    end

    # 计算队尾指针，指向队尾索引 + 1
    rear = index(@front + size)
    # 将 num 添加至队尾
    @nums[rear] = num
    @size += 1
  end

  ### 队首出队 ###
  def pop_first
    num = peek_first
    # 队首指针向后移动一位
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### 队尾出队 ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### 访问队首元素 ###
  def peek_first
    raise IndexError, '双向队列为空' if is_empty?

    @nums[@front]
  end

  ### 访问队尾元素 ###
  def peek_last
    raise IndexError, '双向队列为空' if is_empty?

    # 计算尾元素索引
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 返回数组用于打印 ###
  def to_array
    # 仅转换有效长度范围内的列表元素
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 计算环形数组索引 ###
  def index(i)
    # 通过取余操作实现数组首尾相连
    # 当 i 越过数组尾部后，回到头部
    # 当 i 越过数组头部后，回到尾部
    (i + capacity) % capacity
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化双向队列
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "双向队列 deque = #{deque.to_array}"

  # 访问元素
  peek_first = deque.peek_first
  puts "队首元素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "队尾元素 peek_last = #{peek_last}"

  # 元素入队
  deque.push_last(4)
  puts "元素 4 队尾入队后 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "元素 1 队尾入队后 deque = #{deque.to_array}"

  # 元素出队
  pop_last = deque.pop_last
  puts "队尾出队元素 = #{pop_last}，队尾出队后 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "队尾出队元素 = #{pop_first}，队尾出队后 deque = #{deque.to_array}"

  # 获取双向队列的长度
  size = deque.size
  puts "双向队列长度 size = #{size}"

  # 判断双向队列是否为空
  is_empty = deque.is_empty?
  puts "双向队列是否为空 = #{is_empty}"
end
