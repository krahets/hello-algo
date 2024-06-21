=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最小路徑和：暴力搜尋 ###
def min_path_sum_dfs(grid, i, j)
  # 若為左上角單元格，則終止搜尋
  return grid[i][j] if i == 0 && j == 0
  # 若行列索引越界，則返回 +∞ 代價
  return Float::INFINITY if i < 0 || j < 0
  # 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑代價
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # 返回從左上角到 (i, j) 的最小路徑代價
  [left, up].min + grid[i][j]
end

### 最小路徑和：記憶化搜尋 ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # 若為左上角單元格，則終止搜尋
  return grid[0][0] if i == 0 && j == 0
  # 若行列索引越界，則返回 +∞ 代價
  return Float::INFINITY if i < 0 || j < 0
  # 若已有記錄，則直接返回
  return mem[i][j] if mem[i][j] != -1
  # 左邊和上邊單元格的最小路徑代價
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # 記錄並返回左上角到 (i, j) 的最小路徑代價
  mem[i][j] = [left, up].min + grid[i][j]
end

### 最小路徑和：動態規劃 ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # 初始化 dp 表
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # 狀態轉移：首行
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # 狀態轉移：首列
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # 狀態轉移：其餘行和列
  for i in 1...n
    for j in 1...m
      dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
    end
  end
  dp[n -1][m -1]
end

### 最小路徑和：空間最佳化後的動態規劃 ###
def min_path_sum_dp_comp(grid)
  n, m = grid.length, grid.first.length
  # 初始化 dp 表
  dp = Array.new(m, 0)
  # 狀態轉移：首行
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # 狀態轉移：其餘行
  for i in 1...n
    # 狀態轉移：首列
    dp[0] = dp[0] + grid[i][0]
    # 狀態轉移：其餘列
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### Driver Code ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # 暴力搜尋
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "從左上角到右下角的做小路徑和為 #{res}"

  # 記憶化搜尋
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "從左上角到右下角的做小路徑和為 #{res}"

  # 動態規劃
  res = min_path_sum_dp(grid)
  puts "從左上角到右下角的做小路徑和為 #{res}"

  # 空間最佳化後的動態規劃
  res = min_path_sum_dp_comp(grid)
  puts "從左上角到右下角的做小路徑和為 #{res}"
end
