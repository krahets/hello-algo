=begin
File: climbing_stairs_constraint_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 制約付きの階段の上り方：動的計画法 ###
def climbing_stairs_constraint_dp(n)
  return 1 if n == 1 || n == 2

  # 部分問題の解を格納する dp テーブルを初期化する
  dp = Array.new(n + 1) { Array.new(3, 0) }
  # 初期状態：最小の部分問題の解を設定する
  dp[1][1], dp[1][2] = 1, 0
  dp[2][1], dp[2][2] = 0, 1
  # 状態遷移：小さな部分問題から順に大きな部分問題を解く
  for i in 3...(n + 1)
    dp[i][1] = dp[i - 1][2]
    dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
  end

  dp[n][1] + dp[n][2]
end

### 実行用コード ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_constraint_dp(n)
  puts "#{n} 段の階段を上る方法は全部で #{res} 通り"
end
