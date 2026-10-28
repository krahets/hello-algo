=begin
File: min_path_sum.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 최소 경로 합: 완전 탐색 ###
def min_path_sum_dfs(grid, i, j)
  # 왼쪽 위 모서리의 칸이면 탐색을 종료한다
  return grid[i][j] if i == 0 && j == 0
  # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
  return Float::INFINITY if i < 0 || j < 0
  # 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
  up = min_path_sum_dfs(grid, i - 1, j)
  left = min_path_sum_dfs(grid, i, j - 1)
  # 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
  [left, up].min + grid[i][j]
end

### 최소 경로 합: 메모이제이션을 이용한 탐색 ###
def min_path_sum_dfs_mem(grid, mem, i, j)
  # 왼쪽 위 모서리의 칸이면 탐색을 종료한다
  return grid[0][0] if i == 0 && j == 0
  # 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
  return Float::INFINITY if i < 0 || j < 0
  # 기록이 이미 있으면 바로 반환한다
  return mem[i][j] if mem[i][j] != -1
  # 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
  up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
  left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
  # 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
  mem[i][j] = [left, up].min + grid[i][j]
end

### 최소 경로 합: 동적 계획법 ###
def min_path_sum_dp(grid)
  n, m = grid.length, grid.first.length
  # dp 테이블을 초기화한다
  dp = Array.new(n) { Array.new(m, 0) }
  dp[0][0] = grid[0][0]
  # 상태 전이: 첫 번째 행
  (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
  # 상태 전이: 첫 번째 열
  (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
  # 상태 전이: 나머지 행과 열
  for i in 1...n
    for j in 1...m
      dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
    end
  end
  dp[n -1][m -1]
end

### 최소 경로 합: 공간을 최적화한 동적 계획법 ###
def min_path_sum_dp_comp(grid)
  n, m = grid.length, grid.first.length
  # dp 테이블을 초기화한다
  dp = Array.new(m, 0)
  # 상태 전이: 첫 번째 행
  dp[0] = grid[0][0]
  (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
  # 상태 전이: 나머지 행
  for i in 1...n
    # 상태 전이: 첫 번째 열
    dp[0] = dp[0] + grid[i][0]
    # 상태 전이: 나머지 열
    (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
  end
  dp[m - 1]
end

### 실행 코드 ###
if __FILE__ == $0
  grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]]
  n, m = grid.length, grid.first.length

  # 완전 탐색
  res = min_path_sum_dfs(grid, n - 1, m - 1)
  puts "왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: #{res}"

  # 메모이제이션을 이용한 탐색
  mem = Array.new(n) { Array.new(m, - 1) }
  res = min_path_sum_dfs_mem(grid, mem, n - 1, m -1)
  puts "왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: #{res}"

  # 동적 계획법
  res = min_path_sum_dp(grid)
  puts "왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: #{res}"

  # 공간을 최적화한 동적 계획법
  res = min_path_sum_dp_comp(grid)
  puts "왼쪽 위에서 오른쪽 아래까지의 최소 경로 합: #{res}"
end
