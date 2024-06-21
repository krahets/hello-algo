=begin
File: array.rb
Created Time: 2024-03-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 隨機訪問元素 ###
def random_access(nums)
  # 在區間 [0, nums.length) 中隨機抽取一個數字
  random_index = Random.rand(0...nums.length)

  # 獲取並返回隨機元素
  nums[random_index]
end


### 擴展陣列長度 ###
# 請注意，Ruby 的 Array 是動態陣列，可以直接擴展
# 為了方便學習，本函式將 Array 看作長度不可變的陣列
def extend(nums, enlarge)
  # 初始化一個擴展長度後的陣列
  res = Array.new(nums.length + enlarge, 0)

  # 將原陣列中的所有元素複製到新陣列
  for i in 0...nums.length
    res[i] = nums[i]
  end

  # 返回擴展後的新陣列
  res
end

### 在陣列的索引 index 處插入元素 num ###
def insert(nums, num, index)
  # 把索引 index 以及之後的所有元素向後移動一位
  for i in (nums.length - 1).downto(index + 1)
    nums[i] = nums[i - 1]
  end

  # 將 num 賦給 index 處的元素
  nums[index] = num
end


### 刪除索引 index 處的元素 ###
def remove(nums, index)
  # 把索引 index 之後的所有元素向前移動一位
  for i in index...(nums.length - 1)
    nums[i] = nums[i + 1]
  end
end

### 走訪陣列 ###
def traverse(nums)
  count = 0

  # 透過索引走訪陣列
  for i in 0...nums.length
    count += nums[i]
  end

  # 直接走訪陣列元素
  for num in nums
    count += num
  end
end

### 在陣列中查詢指定元素 ###
def find(nums, target)
  for i in 0...nums.length
    return i if nums[i] == target
  end

  -1
end


### Driver Code ###
if __FILE__ == $0
  # 初始化陣列
  arr = Array.new(5, 0)
  puts "陣列 arr = #{arr}"
  nums = [1, 3, 2, 5, 4]
  puts "陣列 nums = #{nums}"

  # 隨機訪問
  random_num = random_access(nums)
  puts "在 nums 中獲取隨機元素 #{random_num}"

  # 長度擴展
  nums = extend(nums, 3)
  puts "將陣列長度擴展至 8 ，得到 nums = #{nums}"

  # 插入元素
  insert(nums, 6, 3)
  puts "在索引 3 處插入數字 6 ，得到 nums = #{nums}"

  # 刪除元素
  remove(nums, 2)
  puts "刪除索引 2 處的元素，得到 nums = #{nums}"

  # 走訪陣列
  traverse(nums)

  # 查詢元素
  index = find(nums, 3)
  puts "在 nums 中查詢元素 3 ，得到索引 = #{index}"
end
