=begin
File: bubble_sort.rb
Created Time: 2024-04-17
Author: Martin Xu (martin.xus@gmail.com)
=end

### 冒泡排序 ###
def bubble_sort(nums)
  # 如果是空`nil`或者数组长度小于`2`，直接返回，无需排序
  return nums if nums.nil? || nums.length < 2
  
  # 从0开始至`nums.length - 2`
  0.upto(nums.length - 2) do |i|
    # 从`i + 1`开始，直至最后`nums.length - 1`
    (i + 1).upto(nums.length - 1) do |j|
      # 将较大的数值交换只后面
      swap(nums, i, j) if nums[i] > nums[j]
    end
  end

  # 返回已经排序号的数组
  nums
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
  sorted_nums = bubble_sort(nums.clone)

  # 打印排序结果
  puts "#{nums} => #{sorted_nums}"
end