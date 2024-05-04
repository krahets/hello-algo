=begin
File: radix_sort.rb
Created Time: 2024-05-03
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 獲取元素 num 的第 k 位，其中 exp = 10^(k-1) ###
def digit(num, exp)
  # 轉入 exp 而非 k 可以避免在此重複執行昂貴的次方計算
  (num / exp) % 10
end

### 計數排序（根據 nums 第 k 位排序）###
def counting_sort_digit(nums, exp)
  # 十進位制的位範圍為 0~9 ，因此需要長度為 10 的桶陣列
  counter = Array.new(10, 0)
  n = nums.length
  # 統計 0~9 各數字的出現次數
  for i in 0...n
    d = digit(nums[i], exp) # 獲取 nums[i] 第 k 位，記為 d
    counter[d] += 1 # 統計數字 d 的出現次數
  end
  # 求前綴和，將“出現個數”轉換為“陣列索引”
  (1...10).each { |i| counter[i] += counter[i - 1] }
  # 倒序走訪，根據桶內統計結果，將各元素填入 res
  res = Array.new(n, 0)
  for i in (n - 1).downto(0)
    d = digit(nums[i], exp)
    j = counter[d] - 1 # 獲取 d 在陣列中的索引 j
    res[j] = nums[i] # 將當前元素填入索引 j
    counter[d] -= 1 # 將 d 的數量減 1
  end
  # 使用結果覆蓋原陣列 nums
  (0...n).each { |i| nums[i] = res[i] }
end

### 基數排序 ###
def radix_sort(nums)
  # 獲取陣列的最大元素，用於判斷最大位數
  m = nums.max
  # 按照從低位到高位的順序走訪
  exp = 1
  while exp <= m
    # 對陣列元素的第 k 位執行計數排序
    # k = 1 -> exp = 1
    # k = 2 -> exp = 10
    # 即 exp = 10^(k-1)
    counting_sort_digit(nums, exp)
    exp *= 10
  end
end

### Driver Code ###
if __FILE__ == $0
  # 基數排序
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
  puts "基數排序完成後 nums = #{nums}"
end
