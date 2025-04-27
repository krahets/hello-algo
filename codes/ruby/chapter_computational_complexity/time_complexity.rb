=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 常数阶 ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### 线性阶 ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### 线性阶（遍历数组）###
def array_traversal(nums)
  count = 0

  # 循环次数与数组长度成正比
  for num in nums
    count += 1
  end

  count
end

### 平方阶 ###
def quadratic(n)
  count = 0

  # 循环次数与数据大小 n 成平方关系
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### 平方阶（冒泡排序）###
def bubble_sort(nums)
  count = 0  # 计数器

  # 外循环：未排序区间为 [0, i]
  for i in (nums.length - 1).downto(0)
    # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交换 nums[j] 与 nums[j + 1]
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # 元素交换包含 3 个单元操作
      end
    end
  end

  count
end

### 指数阶（循环实现）###
def exponential(n)
  count, base = 0, 1

  # 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### 指数阶（递归实现）###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### 对数阶（循环实现）###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### 对数阶（递归实现）###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### 线性对数阶 ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### 阶乘阶（递归实现）###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # 从 1 个分裂出 n 个
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Driver Code ###
if __FILE__ == $0
  # 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
  n = 8
  puts "输入数据大小 n = #{n}"

  count = constant(n)
  puts "常数阶的操作数量 = #{count}"

  count = linear(n)
  puts "线性阶的操作数量 = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "线性阶（遍历数组）的操作数量 = #{count}"

  count = quadratic(n)
  puts "平方阶的操作数量 = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "平方阶（冒泡排序）的操作数量 = #{count}"

  count = exponential(n)
  puts "指数阶（循环实现）的操作数量 = #{count}"
  count = exp_recur(n)
  puts "指数阶（递归实现）的操作数量 = #{count}"

  count = logarithmic(n)
  puts "对数阶（循环实现）的操作数量 = #{count}"
  count = log_recur(n)
  puts "对数阶（递归实现）的操作数量 = #{count}"

  count = linear_log_recur(n)
  puts "线性对数阶（递归实现）的操作数量 = #{count}"

  count = factorial_recur(n)
  puts "阶乘阶（递归实现）的操作数量 = #{count}"
end
