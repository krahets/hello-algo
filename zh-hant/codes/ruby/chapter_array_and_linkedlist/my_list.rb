=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 串列類別 ###
class MyList
  attr_reader :size       # 獲取串列長度（當前元素數量）
  attr_reader :capacity   # 獲取串列容量

  ### 建構子 ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### 訪問元素 ###
  def get(index)
    # 索引如果越界，則丟擲異常，下同
    raise IndexError, "索引越界" if index < 0 || index >= size
    @arr[index]
  end

  ### 訪問元素 ###
  def set(index, num)
    raise IndexError, "索引越界" if index < 0 || index >= size
    @arr[index] = num
  end

  ### 在尾部新增元素 ###
  def add(num)
    # 元素數量超出容量時，觸發擴容機制
    extend_capacity if size == capacity
    @arr[size] = num

    # 更新元素數量
    @size += 1
  end

  ### 在中間插入元素 ###
  def insert(index, num)
    raise IndexError, "索引越界" if index < 0 || index >= size

    # 元素數量超出容量時，觸發擴容機制
    extend_capacity if size == capacity

    # 將索引 index 以及之後的元素都向後移動一位
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # 更新元素數量
    @size += 1
  end

  ### 刪除元素 ###
  def remove(index)
    raise IndexError, "索引越界" if index < 0 || index >= size
    num = @arr[index]

    # 將將索引 index 之後的元素都向前移動一位
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # 更新元素數量
    @size -= 1

    # 返回被刪除的元素
    num
  end

  ### 串列擴容 ###
  def extend_capacity
    # 新建一個長度為原陣列 extend_ratio 倍的新陣列，並將原陣列複製到新陣列
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # 更新串列容量
    @capacity = arr.length
  end

  ### 將串列轉換為陣列 ###
  def to_array
    sz = size
    # 僅轉換有效長度範圍內的串列元素
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化串列
  nums = MyList.new

  # 在尾部新增元素
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "串列 nums = #{nums.to_array} ，容量 = #{nums.capacity} ，長度 = #{nums.size}"

  # 在中間插入元素
  nums.insert(3, 6)
  puts "在索引 3 處插入數字 6 ，得到 nums = #{nums.to_array}"

  # 刪除元素
  nums.remove(3)
  puts "刪除索引 3 的元素，得到 nums = #{nums.to_array}"

  # 訪問元素
  num = nums.get(1)
  puts "訪問索引 1 處的元素，得到 num = #{num}"

  # 更新元素
  nums.set(1, 0)
  puts "將索引 1 處的元素更新為 0 ，得到 nums = #{nums.to_array}"

  # 測試擴容機制
  for i in 0...10
    # 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
    nums.add(i)
  end
  puts "擴容後的串列 nums = #{nums.to_array} ，容量 = #{nums.capacity} ，長度 = #{nums.size}"
end
