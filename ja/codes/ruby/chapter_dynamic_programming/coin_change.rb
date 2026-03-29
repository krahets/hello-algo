=begin
File: coin_change.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### コイン両替：動的計画法 ###
def coin_change_dp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # dp テーブルを初期化
  dp = Array.new(n + 1) { Array.new(amt + 1, 0) }
  # 状態遷移：先頭行と先頭列
  (1...(amt + 1)).each { |a| dp[0][a] = _MAX }
  # 状態遷移: 残りの行と列
  for i in 1...(n + 1)
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 目標金額を超えるなら硬貨 i は選ばない
        dp[i][a] = dp[i - 1][a]
      else
        # 硬貨 i を選ばない場合と選ぶ場合の小さい方
        dp[i][a] = [dp[i - 1][a], dp[i][a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[n][amt] != _MAX ? dp[n][amt] : -1
end

### コイン両替：空間最適化した動的計画法 ###
def coin_change_dp_comp(coins, amt)
  n = coins.length
  _MAX = amt + 1
  # dp テーブルを初期化
  dp = Array.new(amt + 1, _MAX)
  dp[0] = 0
  # 状態遷移
  for i in 1...(n + 1)
    # 順方向に走査する
    for a in 1...(amt + 1)
      if coins[i - 1] > a
        # 目標金額を超えるなら硬貨 i は選ばない
        dp[a] = dp[a]
      else
        # 硬貨 i を選ばない場合と選ぶ場合の小さい方
        dp[a] = [dp[a], dp[a - coins[i - 1]] + 1].min
      end
    end
  end
  dp[amt] != _MAX ? dp[amt] : -1
end

### Driver Code ###
if __FILE__ == $0
  coins = [1, 2, 5]
  amt = 4

  # 動的計画法
  res = coin_change_dp(coins, amt)
  puts "目標金額にするために必要な最小硬貨枚数は #{res}"

  # 空間最適化後の動的計画法
  res = coin_change_dp_comp(coins, amt)
  puts "目標金額にするために必要な最小硬貨枚数は #{res}"
end
