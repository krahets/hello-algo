=begin
File: radix_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 获取元素 num 的第 k 位，其中 exp = 10^(k-1) ###
def digit(num, exp)
  # 转入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
  (num / exp) % 10
end

### 计数排序（根据 nums 第 k 位排序）###
def counting_sort_digit(nums, exp)
  # 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
  counter = Array.new(10, 0)
  n = nums.length
  # 统计 0~9 各数字的出现次数
  for i in 0...n
    d = digit(nums[i], exp) # 获取 nums[i] 第 k 位，记为 d
    counter[d] += 1 # 统计数字 d 的出现次数
  end
  # 求前缀和，将“出现个数”转换为“数组索引”
  (1...10).each { |i| counter[i] += counter[i - 1] }
  # 倒序遍历，根据桶内统计结果，将各元素填入 res
  res = Array.new(n, 0)
  for i in (n - 1).downto(0)
    d = digit(nums[i], exp)
    j = counter[d] - 1 # 获取 d 在数组中的索引 j
    res[j] = nums[i] # 将当前元素填入索引 j
    counter[d] -= 1 # 将 d 的数量减 1
  end
  # 使用结果覆盖原数组 nums
  (0...n).each { |i| nums[i] = res[i] }
end

### 基数排序 ###
def radix_sort(nums)
  # 获取数组的最大元素，用于判断最大位数
  m = nums.max
  # 按照从低位到高位的顺序遍历
  exp = 1
  while exp <= m
    # 对数组元素的第 k 位执行计数排序
    # k = 1 -> exp = 1
    # k = 2 -> exp = 10
    # 即 exp = 10^(k-1)
    counting_sort_digit(nums, exp)
    exp *= 10
  end
end

### Driver Code ###
if __FILE__ == $0
  # 基数排序
  nums = [
    10546151,
    35663510,
    42865989,
    34862445,
    81883077,
    88906420,
    72429244,
    30524779,
    82060337,
    63832996,
  ]
  radix_sort(nums)
  puts "基数排序完成后 nums = #{nums}"
end
