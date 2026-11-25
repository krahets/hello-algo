=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 列表類別 ###
class MyList
  attr_reader :size       # 取得列表長度（目前的元素數量）
  attr_reader :capacity   # 取得列表容量

  ### 建構方法 ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### 存取元素 ###
  def get(index)
    # 若索引超出範圍，就拋出例外，以下同理
    raise IndexError, "索引超出範圍" if index < 0 || index >= size
    @arr[index]
  end

  ### 存取元素 ###
  def set(index, num)
    raise IndexError, "索引超出範圍" if index < 0 || index >= size
    @arr[index] = num
  end

  ### 在尾端加入元素 ###
  def add(num)
    # 若加入元素後數量將超過容量，就觸發擴充機制
    extend_capacity if size == capacity
    @arr[size] = num

    # 更新元素數量
    @size += 1
  end

  ### 在中間插入元素 ###
  def insert(index, num)
    raise IndexError, "索引超出範圍" if index < 0 || index >= size

    # 若加入元素後數量將超過容量，就觸發擴充機制
    extend_capacity if size == capacity

    # 將索引 index 起的所有元素往後移一格
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # 更新元素數量
    @size += 1
  end

  ### 刪除元素 ###
  def remove(index)
    raise IndexError, "索引超出範圍" if index < 0 || index >= size
    num = @arr[index]

    # 將索引 index 之後的所有元素往前移一格
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # 更新元素數量
    @size -= 1

    # 回傳刪除的元素
    num
  end

  ### 擴充列表容量 ###
  def extend_capacity
    # 建立長度為原陣列 extend_ratio 倍的新陣列，並將原陣列的內容複製過去
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # 更新列表容量
    @capacity = arr.length
  end

  ### 將列表轉為陣列 ###
  def to_array
    sz = size
    # 僅轉換列表有效長度範圍內的元素
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### 範例主程式 ###
if __FILE__ == $0
  # 初始化列表
  nums = MyList.new

  # 在尾端加入元素
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "列表 nums = #{nums.to_array}，容量 = #{nums.capacity}，長度 = #{nums.size}"

  # 在中間插入元素
  nums.insert(3, 6)
  puts "在索引 3 處插入數字 6，得到 nums = #{nums.to_array}"

  # 刪除元素
  nums.remove(3)
  puts "刪除索引 3 處的元素，得到 nums = #{nums.to_array}"

  # 存取元素
  num = nums.get(1)
  puts "存取索引 1 處的元素，得到 num = #{num}"

  # 更新元素
  nums.set(1, 0)
  puts "將索引 1 處的元素更新為 0，得到 nums = #{nums.to_array}"

  # 測試容量擴充機制
  for i in 0...10
    # 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
    nums.add(i)
  end
  puts "擴充後的列表 nums = #{nums.to_array}，容量 = #{nums.capacity}，長度 = #{nums.size}"
end
