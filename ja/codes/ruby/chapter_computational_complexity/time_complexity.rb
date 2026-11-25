=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 定数オーダー ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### 線形オーダー ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

### 線形オーダー（配列の走査）###
def array_traversal(nums)
  count = 0

  # 反復回数は配列の長さに比例
  for num in nums
    count += 1
  end

  count
end

### 二次オーダー ###
def quadratic(n)
  count = 0

  # 反復回数はデータサイズ n の二乗に比例
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

### 二次オーダー（バブルソート）###
def bubble_sort(nums)
  count = 0  # カウンタ

  # 外側のループ：未整列区間は [0, i]
  for i in (nums.length - 1).downto(0)
    # 内側のループ：未整列区間 [0, i] の最大要素を、交換しながら区間の右端へ移す
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j] と nums[j + 1] を交換
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # 要素の交換は 3 回の基本操作からなる
      end
    end
  end

  count
end

### 指数オーダー（ループによる実装）###
def exponential(n)
  count, base = 0, 1

  # 各回で細胞が二分し、分裂する細胞の数は 1, 2, 4, 8, ..., 2^(n-1) となる
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

### 指数オーダー（再帰による実装）###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

### 対数オーダー（ループによる実装）###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

### 対数オーダー（再帰による実装）###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### 線形対数オーダー ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

### 階乗オーダー（再帰による実装）###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # 1 個から n 個に分かれる
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### 実行例 ###
if __FILE__ == $0
  # n を変えて実行し、計算量ごとに操作回数の増え方を確かめる
  n = 8
  puts "入力データのサイズ n = #{n}"

  count = constant(n)
  puts "定数オーダーの操作回数 = #{count}"

  count = linear(n)
  puts "線形オーダーの操作回数 = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "線形オーダー（配列の走査）の操作回数 = #{count}"

  count = quadratic(n)
  puts "二次オーダーの操作回数 = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "二次オーダー（バブルソート）の操作回数 = #{count}"

  count = exponential(n)
  puts "指数オーダー（ループによる実装）の操作回数 = #{count}"
  count = exp_recur(n)
  puts "指数オーダー（再帰による実装）の操作回数 = #{count}"

  count = logarithmic(n)
  puts "対数オーダー（ループによる実装）の操作回数 = #{count}"
  count = log_recur(n)
  puts "対数オーダー（再帰による実装）の操作回数 = #{count}"

  count = linear_log_recur(n)
  puts "線形対数オーダー（再帰による実装）の操作回数 = #{count}"

  count = factorial_recur(n)
  puts "階乗オーダー（再帰による実装）の操作回数 = #{count}"
end
