=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 爬楼梯：动态规划 ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # 初始化 dp 表，用于存储子问题的解
  dp = Array.new(n + 1, 0)
  # 初始状态：预设最小子问题的解
  dp[1], dp[2] = 1, 2
  # 状态转移：从较小子问题逐步求解较大子问题
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### 爬楼梯：空间优化后的动态规划 ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "爬 #{n} 阶楼梯共有 #{res} 种方案"

  res = climbing_stairs_dp_comp(n)
  puts "爬 #{n} 阶楼梯共有 #{res} 种方案"
end
