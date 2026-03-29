=begin
File: time_complexity.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 定数階 ###
def constant(n)
  count = 0
  size = 100000

  (0...size).each { count += 1 }

  count
end

### 線形階 ###
def linear(n)
  count = 0
  (0...n).each { count += 1 }
  count
end

# ## 線形階（配列を走査）###
def array_traversal(nums)
  count = 0

  # ループ回数は配列長に比例する
  for num in nums
    count += 1
  end

  count
end

### 平方階 ###
def quadratic(n)
  count = 0

  # ループ回数はデータサイズ n の二乗に比例する
  for i in 0...n
    for j in 0...n
      count += 1
    end
  end

  count
end

# ## 平方階（バブルソート）###
def bubble_sort(nums)
  count = 0  # カウンタ

  # 外側のループ：未ソート区間は [0, i]
  for i in (nums.length - 1).downto(0)
    # 内側のループ：未ソート区間 [0, i] の最大要素をその区間の最右端へ交換
    for j in 0...i
      if nums[j] > nums[j + 1]
        # nums[j] と nums[j + 1] を交換
        tmp = nums[j]
        nums[j] = nums[j + 1]
        nums[j + 1] = tmp
        count += 3 # 要素交換には 3 回の単位操作が含まれる
      end
    end
  end

  count
end

# ## 指数階（ループ実装）###
def exponential(n)
  count, base = 0, 1

  # 細胞は各ラウンドで 2 つに分裂し、数列 1, 2, 4, 8, ..., 2^(n-1) を形成する
  (0...n).each do
    (0...base).each { count += 1 }
    base *= 2
  end

  # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
  count
end

# ## 指数階（再帰実装）###
def exp_recur(n)
  return 1 if n == 1
  exp_recur(n - 1) + exp_recur(n - 1) + 1
end

# ## 対数階（ループ実装）###
def logarithmic(n)
  count = 0

  while n > 1
    n /= 2
    count += 1
  end

  count
end

# ## 対数階（再帰実装）###
def log_recur(n)
  return 0 unless n > 1
  log_recur(n / 2) + 1
end

### 線形対数時間 ###
def linear_log_recur(n)
  return 1 unless n > 1

  count = linear_log_recur(n / 2) + linear_log_recur(n / 2)
  (0...n).each { count += 1 }

  count
end

# ## 階乗階（再帰実装）###
def factorial_recur(n)
  return 1 if n == 0

  count = 0
  # 1個から n 個に分裂
  (0...n).each { count += factorial_recur(n - 1) }

  count
end

### Driver Code ###
if __FILE__ == $0
  # n を変えて実行し、各計算量で操作回数がどう変化するかを確認できる
  n = 8
  puts "入力データサイズ n = #{n}"

  count = constant(n)
  puts "定数時間の操作回数 = #{count}"

  count = linear(n)
  puts "線形時間の操作回数 = #{count}"
  count = array_traversal(Array.new(n, 0))
  puts "線形時間（配列走査）の操作回数 = #{count}"

  count = quadratic(n)
  puts "二次時間の操作回数 = #{count}"
  nums = Array.new(n) { |i| n - i } # [n, n-1, ..., 2, 1]
  count = bubble_sort(nums)
  puts "二次時間（バブルソート）の操作回数 = #{count}"

  count = exponential(n)
  puts "指数時間（ループ実装）の操作回数 = #{count}"
  count = exp_recur(n)
  puts "指数時間（再帰実装）の操作回数 = #{count}"

  count = logarithmic(n)
  puts "対数時間（ループ実装）の操作回数 = #{count}"
  count = log_recur(n)
  puts "対数時間（再帰実装）の操作回数 = #{count}"

  count = linear_log_recur(n)
  puts "線形対数時間（再帰実装）の操作回数 = #{count}"

  count = factorial_recur(n)
  puts "階乗時間（再帰実装）の操作回数 = #{count}"
end
