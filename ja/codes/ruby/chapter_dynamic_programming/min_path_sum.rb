=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 最小経路和：全探索 ###
def min_path_sum_dfs(grid, i, j)
  # 左上のセルなら探索を終了する
  return grid[i][j] if i == 0 && j == 0
  # 行または列のインデックスが範囲外なら、コスト +∞ を返す
  return Float::INFINITY if i < 0 || j < 0
  # 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # 左上隅から (i, j) までの最小経路コストを返す
  [left, up].min + grid[i][j]
end

### 最小経路和：メモ化探索 ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # 左上のセルなら探索を終了する
  return grid[0][0] if i == 0 && j == 0
  # 行または列のインデックスが範囲外なら、コスト +∞ を返す
  return Float::INFINITY if i < 0 || j < 0
  # 既に記録があればそのまま返す
  return mem[i][j] if mem[i][j] != -1
  # 左と上のセルからの最小経路コスト
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # 左上から (i, j) までの最小経路コストを記録して返す
  mem[i][j] = [left, up].min + grid[i][j]
end

### 最小経路和：動的計画法 ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # dp テーブルを初期化
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # 状態遷移：先頭行
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # 状態遷移：先頭列
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # 状態遷移: 残りの行と列
  for i in 1...n
    for j in 1...m
      dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
    end
  end
  dp[n -1][m -1]
end

### 最小経路和：空間最適化後の動的計画法 ###
def min_path_sum_dp_comp(grid)
  n, m = grid.length, grid.first.length
  # dp テーブルを初期化
  dp = Array.new(m, 0)
  # 状態遷移：先頭行
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # 状態遷移：残りの行
  for i in 1...n
    # 状態遷移：先頭列
    dp[0] = dp[0] + grid[i][0]
    # 状態遷移：残りの列
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### Driver Code ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # 全探索
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "左上から右下までの最小経路和は #{res}"

  # メモ化探索
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "左上から右下までの最小経路和は #{res}"

  # 動的計画法
  res = min_path_sum_dp(grid)
  puts "左上から右下までの最小経路和は #{res}"

  # 空間最適化後の動的計画法
  res = min_path_sum_dp_comp(grid)
  puts "左上から右下までの最小経路和は #{res}"
end
