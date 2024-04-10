=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 常數階 ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### 線性階 ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### 線性階（走訪陣列）###
def array_traversal(nums)
  count = 0

  # 迴圈次數與陣列長度成正比
  for num in nums
    count += 1
  end

  count
end

### 平方階 ###
def quadratic(n)
  count = 0

  # 迴圈次數與資料大小 n 成平方關係
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### 平方階（泡沫排序）###
def bubble_sort(nums)
  count = 0  # 計數器

  # 外迴圈：未排序區間為 [0, i]
  for i in (nums.length - 1).downto(0)
    # 內迴圈：將未排序區間 [0, i] 中的最大元素交換至該區間的最右端
    for j in 0...i
      if nums[j] > nums[j + 1]
        # 交換 nums[j] 與 nums[j + 1]
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # 元素交換包含 3 個單元操作
      end
    end
  end

  count
end

### 指數階（迴圈實現）###
def exponential(n)
  count, base = 0, 1

  # 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### 指數階（遞迴實現）###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### 對數階（迴圈實現）###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### 對數階（遞迴實現）###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### 線性對數階 ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### 階乘階（遞迴實現）###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # 從 1 個分裂出 n 個
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Driver Code ###
if __FILE__ == $0
  # 可以修改 n 執行，體會一下各種複雜度的操作數量變化趨勢
  n = 8
  puts "輸入資料大小 n = #{n}"

  count = constant(n)
  puts "常數階的操作數量 = #{count}"

  count = linear(n)
  puts "線性階的操作數量 = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "線性階（走訪陣列）的操作數量 = #{count}"

  count = quadratic(n)
  puts "平方階的操作數量 = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "平方階（泡沫排序）的操作數量 = #{count}"

  count = exponential(n)
  puts "指數階（迴圈實現）的操作數量 = #{count}"
  count = exp_recur(n)
  puts "指數階（遞迴實現）的操作數量 = #{count}"

  count = logarithmic(n)
  puts "對數階（迴圈實現）的操作數量 = #{count}"
  count = log_recur(n)
  puts "對數階（遞迴實現）的操作數量 = #{count}"

  count = linear_log_recur(n)
  puts "線性對數階（遞迴實現）的操作數量 = #{count}"

  count = factorial_recur(n)
  puts "階乘階（遞迴實現）的操作數量 = #{count}"
end
