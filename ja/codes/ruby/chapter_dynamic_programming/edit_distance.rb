=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 編集距離：総当たり探索 ###
def edit_distance_dfs(s, t, i, j)
  # s と t がともに空なら 0 を返す
  return 0 if i == 0 && j == 0
  # s が空なら t の長さを返す
  return j if i == 0
  # t が空なら s の長さを返す
  return i if j == 0
  # 2 つの文字が等しければ、その 2 文字をそのままスキップする
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # 最小編集回数を返す
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # s と t がともに空なら 0 を返す
  return 0 if i == 0 && j == 0
  # s が空なら t の長さを返す
  return j if i == 0
  # t が空なら s の長さを返す
  return i if j == 0
  # 記録済みなら、それをそのまま返す
  return mem[i][j] if mem[i][j] != -1
  # 2 つの文字が等しければ、その 2 文字をそのままスキップする
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # 最小編集回数を記録して返す
  mem[i][j] = [insert, delete, replace].min + 1
end

### 編集距離：動的計画法 ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # 状態遷移：先頭行と先頭列
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # 状態遷移: 残りの行と列
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # 2 つの文字が等しければ、その 2 文字をそのままスキップする
        dp[i][j] = dp[i - 1][j - 1]
      else
        # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### 編集距離：空間最適化した動的計画法 ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # 状態遷移：先頭行
  (1...(m + 1)).each { |j| dp[j] = j }
  # 状態遷移：残りの行
  for i in 1...(n + 1)
    # 状態遷移：先頭列
    leftup = dp.first # dp[i-1, j-1] を一時保存する
    dp[0] += 1
    # 状態遷移：残りの列
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # 2 つの文字が等しければ、その 2 文字をそのままスキップする
        dp[j] = leftup
      else
        # 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # 次の反復の dp[i-1, j-1] に更新する
    end
  end
  dp[m]
end

### Driver Code ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # 全探索
  res = edit_distance_dfs(s, t, n, m)
  puts "#{s} を #{t} に変更するには最小で #{res} 回の編集が必要"

  # メモ化探索
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "#{s} を #{t} に変更するには最小で #{res} 回の編集が必要"

  # 動的計画法
  res = edit_distance_dp(s, t)
  puts "#{s} を #{t} に変更するには最小で #{res} 回の編集が必要"

  # 空間最適化後の動的計画法
  res = edit_distance_dp_comp(s, t)
  puts "#{s} を #{t} に変更するには最小で #{res} 回の編集が必要"
end
