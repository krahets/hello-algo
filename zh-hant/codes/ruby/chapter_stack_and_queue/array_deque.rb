=begin
File: array_deque.rb
Created Time: 2024-04-05
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 以環狀陣列實作雙端佇列 ###
class ArrayDeque
  ### 取得雙端佇列長度 ###
  attr_reader :size

  ### 初始化方法 ###
  def initialize(capacity)
    @nums = Array.new(capacity, 0)
    @front = 0
    @size = 0
  end

  ### 取得雙端佇列容量 ###
  def capacity
    @nums.length
  end

  ### 判斷雙端佇列是否為空 ###
  def is_empty?
    size.zero?
  end

  ### 從隊首加入元素 ###
  def push_first(num)
    if size == capacity
      puts '雙端佇列已滿'
      return
    end

    # 將隊首索引往左移一格
    # 取餘數，讓 @front 越過陣列開頭時繞回末端
    @front = index(@front - 1)
    # 將 num 加到隊首
    @nums[@front] = num
    @size += 1
  end

  ### 從隊尾加入元素 ###
  def push_last(num)
    if size == capacity
      puts '雙端佇列已滿'
      return
    end

    # 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
    rear = index(@front + size)
    # 將 num 加到隊尾
    @nums[rear] = num
    @size += 1
  end

  ### 從隊首取出元素 ###
  def pop_first
    num = peek_first
    # 將隊首索引往後移一格
    @front = index(@front + 1)
    @size -= 1
    num
  end

  ### 從隊尾取出元素 ###
  def pop_last
    num = peek_last
    @size -= 1
    num
  end

  ### 讀取隊首元素 ###
  def peek_first
    raise IndexError, '雙端佇列為空' if is_empty?

    @nums[@front]
  end

  ### 讀取隊尾元素 ###
  def peek_last
    raise IndexError, '雙端佇列為空' if is_empty?

    # 計算隊尾元素的索引
    last = index(@front + size - 1)
    @nums[last]
  end

  ### 回傳陣列以便輸出 ###
  def to_array
    # 只轉換雙端佇列中實際存放的元素
    res = []
    for i in 0...size
      res << @nums[index(@front + i)]
    end
    res
  end

  private

  ### 計算環狀陣列的索引 ###
  def index(i)
    # 取餘數，讓陣列的首尾相接
    # 當 i 超過陣列末端時，繞回開頭
    # 當 i 越過陣列開頭時，繞回末端
    (i + capacity) % capacity
  end
end

### 範例程式 ###
if __FILE__ == $0
  # 初始化雙端佇列
  deque = ArrayDeque.new(10)
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
  puts "從隊尾取出的元素 = #{pop_last}，取出後 deque = #{deque.to_array}"
  pop_first = deque.pop_first
  puts "從隊首取出的元素 = #{pop_first}，取出後 deque = #{deque.to_array}"

  # 取得雙端佇列長度
  size = deque.size
  puts "雙端佇列長度 size = #{size}"

  # 判斷雙端佇列是否為空
  is_empty = deque.is_empty?
  puts "雙端佇列是否為空 = #{is_empty}"
end
