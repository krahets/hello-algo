=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 個数制限なしナップサック問題：動的計画法 ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # dp テーブルを初期化する
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # 状態遷移
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # ナップサックの容量を超える場合、品物 i を選ばない
        dp[i][c] = dp[i - 1][c]
      else
        # 品物 i を選ばない場合と選ぶ場合の大きいほうの値
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 個数制限なしナップサック問題：空間を最適化した動的計画法 ##3
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp テーブルを初期化する
  dp = Array.new(cap + 1, 0)
  # 状態遷移
  for i in 1...(n + 1)
    # 順方向に走査する
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # ナップサックの容量を超える場合、品物 i を選ばない
        dp[c] = dp[c]
      else
        # 品物 i を選ばない場合と選ぶ場合の大きいほうの値
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### 実行用コード ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # 動的計画法
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "ナップサックの容量を超えない品物の最大価値は #{res}"

  # 空間を最適化した動的計画法
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "ナップサックの容量を超えない品物の最大価値は #{res}"
end
