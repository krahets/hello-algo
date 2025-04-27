=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 完全背包：动态规划 ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # 初始化 dp 表
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # 状态转移
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # 若超过背包容量，则不选物品 i
        dp[i][c] = dp[i - 1][c]
      else
        # 不选和选物品 i 这两种方案的较大值
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 完全背包：空间优化后的动态规划 ##3
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # 初始化 dp 表
  dp = Array.new(cap + 1, 0)
  # 状态转移
  for i in 1...(n + 1)
    # 正序遍历
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # 若超过背包容量，则不选物品 i
        dp[c] = dp[c]
      else
        # 不选和选物品 i 这两种方案的较大值
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Driver Code ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # 动态规划
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "不超过背包容量的最大物品价值为 #{res}"

  # 空间优化后的动态规划
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "不超过背包容量的最大物品价值为 #{res}"
end
