=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 ナップサック: 全探索 ###
def knapsack_dfs(wgt, val, i, c)
  # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
  return 0 if i == 0 || c == 0
  # ナップサック容量を超える場合は、入れない選択しかできない
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # 品物 i を入れない場合と入れる場合の最大価値を計算する
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 2つの案のうち価値が大きいほうを返す
  [no, yes].max
end

### 0-1 ナップサック: メモ化探索 ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # すべての品物を選び終えたか、ナップサックに残り容量がなければ、価値 0 を返す
  return 0 if i == 0 || c == 0
  # 既に記録があればそのまま返す
  return mem[i][c] if mem[i][c] != -1
  # ナップサック容量を超える場合は、入れない選択しかできない
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # 品物 i を入れない場合と入れる場合の最大価値を計算する
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 2 つの案のうち価値が大きい方を記録して返す
  mem[i][c] = [no, yes].max
end

### 0-1 ナップサック: 動的計画法 ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 ナップサック: 空間最適化後の動的計画法 ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp テーブルを初期化
  dp = Array.new(cap + 1, 0)
  # 状態遷移
  for i in 1...(n + 1)
    # 逆順に走査する
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 全探索
  res = knapsack_dfs(wgt, val, n, cap)
  puts "ナップサック容量を超えない最大価値は #{res}"

  # メモ化探索
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "ナップサック容量を超えない最大価値は #{res}"

  # 動的計画法
  res = knapsack_dp(wgt, val, cap)
  puts "ナップサック容量を超えない最大価値は #{res}"

  # 空間最適化後の動的計画法
  res = knapsack_dp_comp(wgt, val, cap)
  puts "ナップサック容量を超えない最大価値は #{res}"
end
