=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 編輯距離：暴力搜尋 ###
def edit_distance_dfs(s, t, i, j)
  # 若 s 和 t 都為空，則返回 0
  return 0 if i == 0 && j == 0
  # 若 s 為空，則返回 t 長度
  return j if i == 0
  # 若 t 為空，則返回 s 長度
  return i if j == 0
  # 若兩字元相等，則直接跳過此兩字元
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # 返回最少編輯步數
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # 若 s 和 t 都為空，則返回 0
  return 0 if i == 0 && j == 0
  # 若 s 為空，則返回 t 長度
  return j if i == 0
  # 若 t 為空，則返回 s 長度
  return i if j == 0
  # 若已有記錄，則直接返回之
  return mem[i][j] if mem[i][j] != -1
  # 若兩字元相等，則直接跳過此兩字元
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # 記錄並返回最少編輯步數
  mem[i][j] = [insert, delete, replace].min + 1
end

### 編輯距離：動態規劃 ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # 狀態轉移：首行首列
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # 狀態轉移：其餘行和列
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # 若兩字元相等，則直接跳過此兩字元
        dp[i][j] = dp[i - 1][j - 1]
      else
        # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### 編輯距離：空間最佳化後的動態規劃 ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # 狀態轉移：首行
  (1...(m + 1)).each { |j| dp[j] = j }
  # 狀態轉移：其餘行
  for i in 1...(n + 1)
    # 狀態轉移：首列
    leftup = dp.first # 暫存 dp[i-1, j-1]
    dp[0] += 1
    # 狀態轉移：其餘列
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # 若兩字元相等，則直接跳過此兩字元
        dp[j] = leftup
      else
        # 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # 更新為下一輪的 dp[i-1, j-1]
    end
  end
  dp[m]
end

### Driver Code ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # 暴力搜尋
  res = edit_distance_dfs(s, t, n, m)
  puts "將 #{s} 更改為 #{t} 最少需要編輯 #{res} 步"

  # 記憶化搜尋
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "將 #{s} 更改為 #{t} 最少需要編輯 #{res} 步"

  # 動態規劃
  res = edit_distance_dp(s, t)
  puts "將 #{s} 更改為 #{t} 最少需要編輯 #{res} 步"

  # 空間最佳化後的動態規劃
  res = edit_distance_dp_comp(s, t)
  puts "將 #{s} 更改為 #{t} 最少需要編輯 #{res} 步"
end
