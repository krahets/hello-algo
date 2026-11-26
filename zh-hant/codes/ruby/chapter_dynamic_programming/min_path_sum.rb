=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最小路徑和：暴力搜尋 ###
def min_path_sum_dfs(grid, i, j)
  # 若已到達左上角的格子，就結束搜尋
  return grid[i][j] if i == 0 && j == 0
  # 若列或欄的索引超出範圍，就回傳成本 +∞
  return Float::INFINITY if i < 0 || j < 0
  # 計算從左上角到 (i-1, j) 和 (i, j-1) 的最小路徑成本
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # 回傳從左上角到 (i, j) 的最小路徑成本
  [left, up].min + grid[i][j]
end

### 最小路徑和：記憶化搜尋 ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # 若已到達左上角的格子，就結束搜尋
  return grid[0][0] if i == 0 && j == 0
  # 若列或欄的索引超出範圍，就回傳成本 +∞
  return Float::INFINITY if i < 0 || j < 0
  # 若已有紀錄，直接回傳該值
  return mem[i][j] if mem[i][j] != -1
  # 左方與上方格子的最小路徑成本
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # 記錄並回傳從左上角到 (i, j) 的最小路徑成本
  mem[i][j] = [left, up].min + grid[i][j]
end

### 最小路徑和：動態規劃 ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # 初始化 dp 表
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # 狀態轉移：第一列
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # 狀態轉移：第一欄
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # 狀態轉移：其餘各列與各欄
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
  # 狀態轉移：第一列
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # 狀態轉移：其餘各列
  for i in 1...n
    # 狀態轉移：第一欄
    dp[0] = dp[0] + grid[i][0]
    # 狀態轉移：其餘各欄
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### 主程式 ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # 暴力搜尋
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "從左上角到右下角的最小路徑和為 #{res}"

  # 記憶化搜尋
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "從左上角到右下角的最小路徑和為 #{res}"

  # 動態規劃
  res = min_path_sum_dp(grid)
  puts "從左上角到右下角的最小路徑和為 #{res}"

  # 空間最佳化後的動態規劃
  res = min_path_sum_dp_comp(grid)
  puts "從左上角到右下角的最小路徑和為 #{res}"
end
