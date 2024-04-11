=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 基於環形陣列實現的雙向佇列 ###
class ArrayDeque
  ### 獲取雙向佇列的長度 ###
  attr_reader :size

  ### 建構子 ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### 獲取雙向佇列的容量 ###
  def capacity
    @nums.length
  end

  ### 判斷雙向佇列是否為空 ###
  def is_empty?
    size.zero?
  end

  ### 佇列首入列 ###
  def push_first(num)
    if size == capacity
      puts '雙向佇列已滿'
      return
    end

    # 佇列首指標向左移動一位
    # 透過取餘操作實現 front 越過陣列頭部後回到尾部
    @front = index(@front - 1)
    # 將 num 新增至佇列首
    @nums[@front] = num
    @size += 1
  end

  ### 佇列尾入列 ###
  def push_last(num)
    if size == capacity
      puts '雙向佇列已滿'
      return
    end

    # 計算佇列尾指標，指向佇列尾索引 + 1
    rear = index(@front + size)
    # 將 num 新增至佇列尾
    @nums[rear] = num
    @size += 1
  end

  ### 佇列首出列 ###
  def pop_first
    num = peek_first
    # 佇列首指標向後移動一位
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### 佇列尾出列 ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### 訪問佇列首元素 ###
  def peek_first
    raise IndexError, '雙向佇列為空' if is_empty?

    @nums[@front]
  end

  ### 訪問佇列尾元素 ###
  def peek_last
    raise IndexError, '雙向佇列為空' if is_empty?

    # 計算尾元素索引
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 返回陣列用於列印 ###
  def to_array
    # 僅轉換有效長度範圍內的串列元素
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 計算環形陣列索引 ###
  def index(i)
    # 透過取餘操作實現陣列首尾相連
    # 當 i 越過陣列尾部後，回到頭部
    # 當 i 越過陣列頭部後，回到尾部
    (i + capacity) % capacity
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化雙向佇列
  deque = ArrayDeque.new(10)
  deque.push_last(3)
  deque.push_last(2)
  deque.push_last(5)
  puts "雙向佇列 deque = #{deque.to_array}"

  # 訪問元素
  peek_first = deque.peek_first
  puts "佇列首元素 peek_first = #{peek_first}"
  peek_last = deque.peek_last
  puts "佇列尾元素 peek_last = #{peek_last}"

  # 元素入列
  deque.push_last(4)
  puts "元素 4 佇列尾入列後 deque = #{deque.to_array}"
  deque.push_first(1)
  puts "元素 1 佇列尾入列後 deque = #{deque.to_array}"

  # 元素出列
  pop_last = deque.pop_last
  puts "佇列尾出列元素 = #{pop_last}，佇列尾出列後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "佇列尾出列元素 = #{pop_first}，佇列尾出列後 deque = #{deque.to_array}"

  # 獲取雙向佇列的長度
  size = deque.size
  puts "雙向佇列長度 size = #{size}"

  # 判斷雙向佇列是否為空
  is_empty = deque.is_empty?
  puts "雙向佇列是否為空 = #{is_empty}"
end
