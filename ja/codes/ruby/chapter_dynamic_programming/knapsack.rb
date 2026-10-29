=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 ナップサック問題：全探索 ###
def knapsack_dfs(wgt, val, i, c)
  # すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
  return 0 if i == 0 || c == 0
  # ナップサックの容量を超える場合、入れない選択しかできない
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # 品物 i を入れない場合と入れる場合の最大価値を計算する
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 2 通りの選択のうち、価値が大きいほうを返す
  [no, yes].max
end

### 0-1 ナップサック問題：メモ化探索 ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
  return 0 if i == 0 || c == 0
  # 記録済みなら、その値をそのまま返す
  return mem[i][c] if mem[i][c] != -1
  # ナップサックの容量を超える場合、入れない選択しかできない
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # 品物 i を入れない場合と入れる場合の最大価値を計算する
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # 2 通りの選択のうち、価値が大きいほうを記録して返す
  mem[i][c] = [no, yes].max
end

### 0-1 ナップサック問題：動的計画法 ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 ナップサック問題：空間を最適化した動的計画法 ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # dp テーブルを初期化する
  dp = Array.new(cap + 1, 0)
  # 状態遷移
  for i in 1...(n + 1)
    # 逆順に走査する
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # 全探索
  res = knapsack_dfs(wgt, val, n, cap)
  puts "ナップサックの容量を超えない品物の最大価値は #{res}"

  # メモ化探索
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "ナップサックの容量を超えない品物の最大価値は #{res}"

  # 動的計画法
  res = knapsack_dp(wgt, val, cap)
  puts "ナップサックの容量を超えない品物の最大価値は #{res}"

  # 空間を最適化した動的計画法
  res = knapsack_dp_comp(wgt, val, cap)
  puts "ナップサックの容量を超えない品物の最大価値は #{res}"
end
