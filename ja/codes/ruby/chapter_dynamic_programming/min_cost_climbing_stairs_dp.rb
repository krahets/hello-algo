=begin
File: min_cost_climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 階段を上る最小コスト：動的計画法 ###
def min_cost_climbing_stairs_dp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  # 部分問題の解を格納する dp テーブルを初期化する
  dp = Array.new(n + 1, 0)
  # 初期状態：最小の部分問題の解を設定する
  dp[1], dp[2] = cost[1], cost[2]
  # 状態遷移：小さな部分問題から順に大きな部分問題を解く
  (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
  dp[n]
end

# 階段を上る最小コスト：空間を最適化した動的計画法
def min_cost_climbing_stairs_dp_comp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  a, b = cost[1], cost[2]
  (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
  b
end

### 実行用コード ###
if __FILE__ == $0
  cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
  puts "入力した階段のコストのリストは #{cost}"

  res = min_cost_climbing_stairs_dp(cost)
  puts "階段を上り終える最小コストは #{res}"

  res = min_cost_climbing_stairs_dp_comp(cost)
  puts "階段を上り終える最小コストは #{res}"
end
