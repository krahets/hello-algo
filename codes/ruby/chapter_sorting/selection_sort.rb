=begin
File: selection_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### 选择排序 ###
def selection_sort(nums)
  # 如果是空nil或者数组长度大小小于2的，直接返回，无需排序
  return nums if nums.nil? || nums.length < 2
  
  # 从`[n, n-2]`开始遍历数组
  # 因为最后剩余的一个`nums[n-1]`一定是剩余数组中最小的，所以无需操作
  for i in 0..nums.length - 1
    # 找出剩余数组最小值的索引
    j = min_idx(nums, i)
    # 如果当前数就是最小值，则忽略
    next if j == i
    # 交换当前数值和查询到的最小值
    swap(nums, i, j)
  end

  # 返回已经排序号的数组
  nums
end

# 查找剩余数组[i, nums.length-1]最小值的索引
def min_idx(nums, i)
  j = i
  i.upto(nums.length - 1) do |idx|
    j = idx if nums[idx] < nums[j]
  end

  j
end

# 交换数组中量数值的位置
def swap(nums, i, j)
  # 使用临时变量做数值交换
  value = nums[i]

  nums[i] = nums[j]
  nums[j] = value
end

# 测试代码
if __FILE__ == $0
  # 随机产生10个数值
  nums = (0..100).to_a.sample(10)
  # 因为原地排序，所以clone一份，保留原值用于后续打印比对
  sorted_nums = selection_sort(nums.clone)

  # 打印排序结果
  puts "#{nums} => #{sorted_nums}"
end
  