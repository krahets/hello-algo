=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 背包：暴力搜索 ###
def knapsack_dfs(wgt, val, i, c)
  # 若已选完所有物品或背包无剩余容量，则返回价值 0
  return 0 if i == 0 || c == 0
  # 若超过背包容量，则只能选择不放入背包
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # 计算不放入和放入物品 i 的最大价值
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 返回两种方案中价值更大的那一个
  [no, yes].max
end

### 0-1 背包：记忆化搜索 ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # 若已选完所有物品或背包无剩余容量，则返回价值 0
  return 0 if i == 0 || c == 0
  # 若已有记录，则直接返回
  return mem[i][c] if mem[i][c] != -1
  # 若超过背包容量，则只能选择不放入背包
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # 计算不放入和放入物品 i 的最大价值
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 记录并返回两种方案中价值更大的那一个
  mem[i][c] = [no, yes].max
end

### 0-1 背包：动态规划 ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 背包：空间优化后的动态规划 ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # 初始化 dp 表
  dp = Array.new(cap + 1, 0)
  # 状态转移
  for i in 1...(n + 1)
    # 倒序遍历
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 暴力搜索
  res = knapsack_dfs(wgt, val, n, cap)
  puts "不超过背包容量的最大物品价值为 #{res}"

  # 记忆化搜索
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "不超过背包容量的最大物品价值为 #{res}"

  # 动态规划
  res = knapsack_dp(wgt, val, cap)
  puts "不超过背包容量的最大物品价值为 #{res}"

  # 空间优化后的动态规划
  res = knapsack_dp_comp(wgt, val, cap)
  puts "不超过背包容量的最大物品价值为 #{res}"
end
