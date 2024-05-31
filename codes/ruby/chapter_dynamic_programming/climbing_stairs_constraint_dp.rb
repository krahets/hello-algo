=begin
File: climbing_stairs_constraint_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 带约束爬楼梯：动态规划 ###
def climbing_stairs_constraint_dp(n)
  return 1 if n == 1 || n == 2

  # 初始化 dp 表，用于存储子问题的解
  dp = Array.new(n + 1) { Array.new(3, 0) }
  # 初始状态：预设最小子问题的解
  dp[1][1], dp[1][2] = 1, 0
  dp[2][1], dp[2][2] = 0, 1
  # 状态转移：从较小子问题逐步求解较大子问题
  for i in 3...(n + 1)
    dp[i][1] = dp[i - 1][2]
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
  end

  dp[n][1] + dp[n][2]
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_constraint_dp(n)
  puts "爬 #{n} 阶楼梯共有 #{res} 种方案"
end
