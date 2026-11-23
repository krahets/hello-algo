=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Minimum path sum: brute-force search ###
def min_path_sum_dfs(grid, i, j)
  # Stop searching at the top-left cell
  return grid[i][j] if i == 0 && j == 0
  # If a row or column index is out of bounds, return a cost of +∞
  return Float::INFINITY if i < 0 || j < 0
  # Calculate the minimum path costs from the top-left corner to (i-1, j) and (i, j-1)
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # Return the minimum path cost from the top-left corner to (i, j)
  [left, up].min + grid[i][j]
end

### Minimum path sum: memoized search ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # Stop searching at the top-left cell
  return grid[0][0] if i == 0 && j == 0
  # If a row or column index is out of bounds, return a cost of +∞
  return Float::INFINITY if i < 0 || j < 0
  # If a result has already been recorded, return it directly
  return mem[i][j] if mem[i][j] != -1
  # Minimum path costs to the cells on the left and above
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # Record and return the minimum path cost from the top-left corner to (i, j)
  mem[i][j] = [left, up].min + grid[i][j]
end

### Minimum path sum: dynamic programming ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # Initialize the dp table
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # State transitions: first row
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # State transitions: first column
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # State transitions: remaining rows and columns
  for i in 1...n
    for j in 1...m
      dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
    end
  end
  dp[n -1][m -1]
end

### Minimum path sum: space-optimized dynamic programming ###
def min_path_sum_dp_comp(grid)
  n, m = grid.length, grid.first.length
  # Initialize the dp table
  dp = Array.new(m, 0)
  # State transitions: first row
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # State transitions: remaining rows
  for i in 1...n
    # State transitions: first column
    dp[0] = dp[0] + grid[i][0]
    # State transitions: remaining columns
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### Driver code ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # Brute-force search
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "Minimum path sum from the top-left to the bottom-right corner: #{res}"

  # Memoized search
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "Minimum path sum from the top-left to the bottom-right corner: #{res}"

  # Dynamic programming
  res = min_path_sum_dp(grid)
  puts "Minimum path sum from the top-left to the bottom-right corner: #{res}"

  # Space-optimized dynamic programming
  res = min_path_sum_dp_comp(grid)
  puts "Minimum path sum from the top-left to the bottom-right corner: #{res}"
end
