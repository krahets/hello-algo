=begin
File: my_list.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 列表类 ###
class MyList
  attr_reader :size       # 获取列表长度（当前元素数量）
  attr_reader :capacity   # 获取列表容量

  ### 构造方法 ###
  def initialize
    @capacity = 10
    @size = 0
    @extend_ratio = 2
    @arr = Array.new(capacity)
  end

  ### 访问元素 ###
  def get(index)
    # 索引如果越界，则抛出异常，下同
    raise IndexError, "索引越界" if index < 0 || index >= size
    @arr[index]
  end

  ### 访问元素 ###
  def set(index, num)
    raise IndexError, "索引越界" if index < 0 || index >= size
    @arr[index] = num
  end

  ### 在尾部添加元素 ###
  def add(num)
    # 元素数量超出容量时，触发扩容机制
    extend_capacity if size == capacity
    @arr[size] = num

    # 更新元素数量
    @size += 1
  end

  ### 在中间插入元素 ###
  def insert(index, num)
    raise IndexError, "索引越界" if index < 0 || index >= size

    # 元素数量超出容量时，触发扩容机制
    extend_capacity if size == capacity

    # 将索引 index 以及之后的元素都向后移动一位
    for j in (size - 1).downto(index)
      @arr[j + 1] = @arr[j]
    end
    @arr[index] = num

    # 更新元素数量
    @size += 1
  end

  ### 删除元素 ###
  def remove(index)
    raise IndexError, "索引越界" if index < 0 || index >= size
    num = @arr[index]

    # 将将索引 index 之后的元素都向前移动一位
    for j in index...size
      @arr[j] = @arr[j + 1]
    end

    # 更新元素数量
    @size -= 1

    # 返回被删除的元素
    num
  end

  ### 列表扩容 ###
  def extend_capacity
    # 新建一个长度为原数组 extend_ratio 倍的新数组，并将原数组复制到新数组
    arr = @arr.dup + Array.new(capacity * (@extend_ratio - 1))
    # 更新列表容量
    @capacity = arr.length
  end

  ### 将列表转换为数组 ###
  def to_array
    sz = size
    # 仅转换有效长度范围内的列表元素
    arr = Array.new(sz)
    for i in 0...sz
      arr[i] = get(i)
    end
    arr
  end
end

### Driver Code ###
if __FILE__ == $0
  # 初始化列表
  nums = MyList.new

  # 在尾部添加元素
  nums.add(1)
  nums.add(3)
  nums.add(2)
  nums.add(5)
  nums.add(4)
  puts "列表 nums = #{nums.to_array} ，容量 = #{nums.capacity} ，长度 = #{nums.size}"

  # 在中间插入元素
  nums.insert(3, 6)
  puts "在索引 3 处插入数字 6 ，得到 nums = #{nums.to_array}"

  # 删除元素
  nums.remove(3)
  puts "删除索引 3 的元素，得到 nums = #{nums.to_array}"

  # 访问元素
  num = nums.get(1)
  puts "访问索引 1 处的元素，得到 num = #{num}"

  # 更新元素
  nums.set(1, 0)
  puts "将索引 1 处的元素更新为 0 ，得到 nums = #{nums.to_array}"

  # 测试扩容机制
  for i in 0...10
    # 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
    nums.add(i)
  end
  puts "扩容后的列表 nums = #{nums.to_array} ，容量 = #{nums.capacity} ，长度 = #{nums.size}"
end
