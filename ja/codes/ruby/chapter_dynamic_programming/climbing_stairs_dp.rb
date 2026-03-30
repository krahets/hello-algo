=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 階段登り：動的計画法 ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # 部分問題の解を保存するために dp テーブルを初期化
  dp = Array.new(n + 1, 0)
  # 初期状態：最小部分問題の解をあらかじめ設定
  dp[1], dp[2] = 1, 2
  # 状態遷移：小さい部分問題から大きい部分問題へ順に解く
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### 階段登り：空間最適化後の動的計画法 ###
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
  puts "#{n} 段の階段を上る方法は全部で #{res} 通り"

  res = climbing_stairs_dp_comp(n)
  puts "#{n} 段の階段を上る方法は全部で #{res} 通り"
end
