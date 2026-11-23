=begin
File: coin_change_ii.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 硬貨の両替 II：動的計画法 ###
def coin_change_ii_dp(coins, amt)
  n = coins.length
  # dp テーブルを初期化する
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 先頭列を初期化する
  (0...(n + 1)).each { |i| dp[i][0] = 1 }
  # 状態遷移
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 目標金額を超える場合、硬貨 i を選ばない
        dp[i][a] = dp[i - 1][a]
      else
        # 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
        dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
      end
    end
  end
  dp[n][amt]
end

### 硬貨の両替 II：空間を最適化した動的計画法 ###
def coin_change_ii_dp_comp(coins, amt)
  n = coins.length
  # dp テーブルを初期化する
  dp = Array.new(amt + 1, 0)
  dp[0] = 1
  # 状態遷移
  for i in 1...(n + 1)
    # 順方向に走査する
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 目標金額を超える場合、硬貨 i を選ばない
        dp[a] = dp[a]
      else
        # 硬貨 i を選ばない場合と選ぶ場合の方法の数の和
        dp[a] = dp[a] + dp[a - coins[i - 1]]
      end
    end
  end
  dp[amt]
end

### 実行用コード ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 5

  # 動的計画法
  res = coin_change_ii_dp(coins, amt)
  puts "目標金額になる硬貨の組み合わせの数は #{res}"

  # 空間を最適化した動的計画法
  res = coin_change_ii_dp_comp(coins, amt)
  puts "目標金額になる硬貨の組み合わせの数は #{res}"
end
