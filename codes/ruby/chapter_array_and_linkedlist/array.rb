=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 随机访问元素 ###
def random_access(nums)
  # 在区间 [0, nums.length) 中随机抽取一个数字
  random_index = Random.rand(0...nums.length)

  # 获取并返回随机元素
  nums[random_index]
end


### 扩展数组长度 ###
# 请注意，Ruby 的 Array 是动态数组，可以直接扩展
# 为了方便学习，本函数将 Array 看作长度不可变的数组
def extend(nums, enlarge)
  # 初始化一个扩展长度后的数组
  res = Array.new(nums.length + enlarge, 0)

  # 将原数组中的所有元素复制到新数组
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # 返回扩展后的新数组
  res
end

### 在数组的索引 index 处插入元素 num ###
def insert(nums, num, index)
  # 把索引 index 以及之后的所有元素向后移动一位
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # 将 num 赋给 index 处的元素
  nums[index] = num
end


### 删除索引 index 处的元素 ###
def remove(nums, index)
  # 把索引 index 之后的所有元素向前移动一位
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### 遍历数组 ###
def traverse(nums)
  count = 0

  # 通过索引遍历数组
  for i in 0...nums.length
    count += nums[i]
  end

  # 直接遍历数组元素
  for num in nums
    count += num
  end
end

### 在数组中查找指定元素 ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver Code ###
if __FILE__ == $0
  # 初始化数组
  arr = Array.new(5, 0)
  puts "数组 arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "数组 nums = #{nums}"

  # 随机访问
  random_num = random_access(nums)
  puts "在 nums 中获取随机元素 #{random_num}"

  # 长度扩展
  nums = extend(nums, 3)
  puts "将数组长度扩展至 8 ，得到 nums = #{nums}"

  # 插入元素
  insert(nums, 6, 3)
  puts "在索引 3 处插入数字 6 ，得到 nums = #{nums}"

  # 删除元素
  remove(nums, 2)
  puts "删除索引 2 处的元素，得到 nums = #{nums}"

  # 遍历数组
  traverse(nums)

  # 查找元素
  index = find(nums, 3)
  puts "在 nums 中查找元素 3 ，得到索引 = #{index}"
end
