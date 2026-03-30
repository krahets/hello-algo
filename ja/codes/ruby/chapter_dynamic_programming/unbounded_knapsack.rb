=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 完全ナップサック：動的計画法 ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # dp テーブルを初期化
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # 状態遷移
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # ナップサック容量を超えるなら品物 i は選ばない
        dp[i][c] = dp[i - 1][c]
      else
        # 品物 i を選ばない場合と選ぶ場合の大きい方
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

# ## 完全ナップサック: 空間最適化後の動的計画法 ##3
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp テーブルを初期化
  dp = Array.new(cap + 1, 0)
  # 状態遷移
  for i in 1...(n + 1)
    # 順方向に走査する
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # ナップサック容量を超えるなら品物 i は選ばない
        dp[c] = dp[c]
      else
        # 品物 i を選ばない場合と選ぶ場合の大きい方
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Driver Code ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # 動的計画法
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "ナップサック容量を超えない最大価値は #{res}"

  # 空間最適化後の動的計画法
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "ナップサック容量を超えない最大価値は #{res}"
end
