=begin
File: min_cost_climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 爬樓梯的最低成本：動態規劃 ###
def min_cost_climbing_stairs_dp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  # 初始化 dp 表，用來儲存子問題的解
  dp = Array.new(n + 1, 0)
  # 初始狀態：設定最小子問題的解
  dp[1], dp[2] = cost[1], cost[2]
  # 狀態轉移：從較小的子問題逐步求出較大子問題的解
  (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
  dp[n]
end

### 爬樓梯的最低成本：空間最佳化後的動態規劃 ###
def min_cost_climbing_stairs_dp_comp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  a, b = cost[1], cost[2]
  (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
  b
end

### 主程式 ###
if __FILE__ == $0
  cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
  puts "輸入的各階樓梯成本為 #{cost}"

  res = min_cost_climbing_stairs_dp(cost)
  puts "爬完樓梯的最低成本為 #{res}"

  res = min_cost_climbing_stairs_dp_comp(cost)
  puts "爬完樓梯的最低成本為 #{res}"
end
