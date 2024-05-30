=begin
File: min_cost_climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 爬楼梯最小代价：动态规划 ###
def min_cost_climbing_stairs_dp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  # 初始化 dp 表，用于存储子问题的解
  dp = Array.new(n + 1, 0)
  # 初始状态：预设最小子问题的解
  dp[1], dp[2] = cost[1], cost[2]
  # 状态转移：从较小子问题逐步求解较大子问题
  (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
  dp[n]
end

# 爬楼梯最小代价：空间优化后的动态规划
def min_cost_climbing_stairs_dp_comp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  a, b = cost[1], cost[2]
  (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
  b
end

### Driver Code ###
if __FILE__ == $0
  cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
  puts "输入楼梯的代价列表为 #{cost}"

  res = min_cost_climbing_stairs_dp(cost)
  puts "爬完楼梯的最低代价为 #{res}"

  res = min_cost_climbing_stairs_dp_comp(cost)
  puts "爬完楼梯的最低代价为 #{res}"
end
