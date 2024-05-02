=begin
File: counting_sort.rb
Created Time: 2024-05-02
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 计数排序 ###
def counting_sort_naive(nums)
  # 简单实现，无法用于排序对象
  # 1. 统计数组最大元素 m
  m = 0
  nums.each { |num| m = [m, num].max }
  # 2. 统计各数字的出现次数
  # counter[num] 代表 num 的出现次数
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. 遍历 counter ，将各元素填入原数组 nums
  i = 0
  for num in 0...(m + 1)
    (0...counter[num]).each do
      nums[i] = num
      i += 1
    end
  end
end

### 计数排序 ###
def counting_sort(nums)
  # 完整实现，可排序对象，并且是稳定排序
  # 1. 统计数组最大元素 m
  m = nums.max
  # 2. 统计各数字的出现次数
  # counter[num] 代表 num 的出现次数
  counter = Array.new(m + 1, 0)
  nums.each { |num| counter[num] += 1 }
  # 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
  # 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
  (0...m).each { |i| counter[i + 1] += counter[i] }
  # 4. 倒序遍历 nums, 将各元素填入结果数组 res
  # 初始化数组 res 用于记录结果
  n = nums.length
  res = Array.new(n, 0)
  (n - 1).downto(0).each do |i|
    num = nums[i]
    res[counter[num] - 1] = num # 将 num 放置到对应索引处
    counter[num] -= 1 # 令前缀和自减 1 ，得到下次放置 num 的索引
  end
  # 使用结果数组 res 覆盖原数组 nums
  (0...n).each { |i| nums[i] = res[i] }
end

### Driver Code ###
if __FILE__ == $0
  nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]

  counting_sort_naive(nums)
  puts "计数排序（无法排序对象）完成后 nums = #{nums}"

  nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
  counting_sort(nums1)
  puts "计数排序完成后 nums1 = #{nums1}"
end
