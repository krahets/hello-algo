=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 完全背包：動態規劃 ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # 初始化 dp 表
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # 狀態轉移
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # 若重量超過背包容量，就不選物品 i
        dp[i][c] = dp[i - 1][c]
      else
        # 取不選與選取物品 i 兩種情況中的較大值
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 完全背包：空間最佳化後的動態規劃 ###
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # 初始化 dp 表
  dp = Array.new(cap + 1, 0)
  # 狀態轉移
  for i in 1...(n + 1)
    # 正向走訪
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # 若重量超過背包容量，就不選物品 i
        dp[c] = dp[c]
      else
        # 取不選與選取物品 i 兩種情況中的較大值
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### 主程式 ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # 動態規劃
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "在背包容量限制內，物品的最大總價值為 #{res}"

  # 空間最佳化後的動態規劃
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "在背包容量限制內，物品的最大總價值為 #{res}"
end
