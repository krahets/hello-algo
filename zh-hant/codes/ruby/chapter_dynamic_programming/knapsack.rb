=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 背包：暴力搜尋 ###
def knapsack_dfs(wgt, val, i, c)
  # 若已選完所有物品或背包無剩餘容量，則返回價值 0
  return 0 if i == 0 || c == 0
  # 若超過背包容量，則只能選擇不放入背包
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # 計算不放入和放入物品 i 的最大價值
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 返回兩種方案中價值更大的那一個
  [no, yes].max
end

### 0-1 背包：記憶化搜尋 ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # 若已選完所有物品或背包無剩餘容量，則返回價值 0
  return 0 if i == 0 || c == 0
  # 若已有記錄，則直接返回
  return mem[i][c] if mem[i][c] != -1
  # 若超過背包容量，則只能選擇不放入背包
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # 計算不放入和放入物品 i 的最大價值
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 記錄並返回兩種方案中價值更大的那一個
  mem[i][c] = [no, yes].max
end

### 0-1 背包：動態規劃 ###
def knapsack_dp(wgt, val, cap)
  n = wgt.length
  # 初始化 dp 表
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # 狀態轉移
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # 若超過背包容量，則不選物品 i
        dp[i][c] = dp[i - 1][c]
      else
        # 不選和選物品 i 這兩種方案的較大值
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 背包：空間最佳化後的動態規劃 ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # 初始化 dp 表
  dp = Array.new(cap + 1, 0)
  # 狀態轉移
  for i in 1...(n + 1)
    # 倒序走訪
    for c in cap.downto(1)
      if wgt[i - 1] > c
        # 若超過背包容量，則不選物品 i
        dp[c] = dp[c]
      else
        # 不選和選物品 i 這兩種方案的較大值
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

  # 暴力搜尋
  res = knapsack_dfs(wgt, val, n, cap)
  puts "不超過背包容量的最大物品價值為 #{res}"

  # 記憶化搜尋
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "不超過背包容量的最大物品價值為 #{res}"

  # 動態規劃
  res = knapsack_dp(wgt, val, cap)
  puts "不超過背包容量的最大物品價值為 #{res}"

  # 空間最佳化後的動態規劃
  res = knapsack_dp_comp(wgt, val, cap)
  puts "不超過背包容量的最大物品價值為 #{res}"
end
