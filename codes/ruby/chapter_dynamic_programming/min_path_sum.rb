=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最小路径和：暴力搜索 ###
def min_path_sum_dfs(grid, i, j)
  # 若为左上角单元格，则终止搜索
  return grid[i][j] if i == 0 && j == 0
  # 若行列索引越界，则返回 +∞ 代价
  return Float::INFINITY if i < 0 || j < 0
  # 计算从左上角到 (i-1, j) 和 (i, j-1) 的最小路径代价
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # 返回从左上角到 (i, j) 的最小路径代价
  [left, up].min + grid[i][j]
end

### 最小路径和：记忆化搜索 ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # 若为左上角单元格，则终止搜索
  return grid[0][0] if i == 0 && j == 0
  # 若行列索引越界，则返回 +∞ 代价
  return Float::INFINITY if i < 0 || j < 0
  # 若已有记录，则直接返回
  return mem[i][j] if mem[i][j] != -1
  # 左边和上边单元格的最小路径代价
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # 记录并返回左上角到 (i, j) 的最小路径代价
  mem[i][j] = [left, up].min + grid[i][j]
end

### 最小路径和：动态规划 ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # 初始化 dp 表
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # 状态转移：首行
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # 状态转移：首列
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # 状态转移：其余行和列
  for i in 1...n
    for j in 1...m
      dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
    end
  end
  dp[n -1][m -1]
end

### 最小路径和：空间优化后的动态规划 ###
def min_path_sum_dp_comp(grid)
  n, m = grid.length, grid.first.length
  # 初始化 dp 表
  dp = Array.new(m, 0)
  # 状态转移：首行
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # 状态转移：其余行
  for i in 1...n
    # 状态转移：首列
    dp[0] = dp[0] + grid[i][0]
    # 状态转移：其余列
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### Driver Code ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # 暴力搜索
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "从左上角到右下角的最小路径和为 #{res}"

  # 记忆化搜索
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "从左上角到右下角的最小路径和为 #{res}"

  # 动态规划
  res = min_path_sum_dp(grid)
  puts "从左上角到右下角的最小路径和为 #{res}"

  # 空间优化后的动态规划
  res = min_path_sum_dp_comp(grid)
  puts "从左上角到右下角的最小路径和为 #{res}"
end
