=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 编辑距离：暴力搜索 ###
def edit_distance_dfs(s, t, i, j)
  # 若 s 和 t 都为空，则返回 0
  return 0 if i == 0 && j == 0
  # 若 s 为空，则返回 t 长度
  return j if i == 0
  # 若 t 为空，则返回 s 长度
  return i if j == 0
  # 若两字符相等，则直接跳过此两字符
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # 返回最少编辑步数
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # 若 s 和 t 都为空，则返回 0
  return 0 if i == 0 && j == 0
  # 若 s 为空，则返回 t 长度
  return j if i == 0
  # 若 t 为空，则返回 s 长度
  return i if j == 0
  # 若已有记录，则直接返回之
  return mem[i][j] if mem[i][j] != -1
  # 若两字符相等，则直接跳过此两字符
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # 记录并返回最少编辑步数
  mem[i][j] = [insert, delete, replace].min + 1
end

### 编辑距离：动态规划 ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # 状态转移：首行首列
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # 状态转移：其余行和列
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # 若两字符相等，则直接跳过此两字符
        dp[i][j] = dp[i - 1][j - 1]
      else
        # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### 编辑距离：空间优化后的动态规划 ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # 状态转移：首行
  (1...(m + 1)).each { |j| dp[j] = j }
  # 状态转移：其余行
  for i in 1...(n + 1)
    # 状态转移：首列
    leftup = dp.first # 暂存 dp[i-1, j-1]
    dp[0] += 1
    # 状态转移：其余列
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # 若两字符相等，则直接跳过此两字符
        dp[j] = leftup
      else
        # 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # 更新为下一轮的 dp[i-1, j-1]
    end
  end
  dp[m]
end

### Driver Code ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # 暴力搜索
  res = edit_distance_dfs(s, t, n, m)
  puts "将 #{s} 更改为 #{t} 最少需要编辑 #{res} 步"

  # 记忆化搜索
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "将 #{s} 更改为 #{t} 最少需要编辑 #{res} 步"

  # 动态规划
  res = edit_distance_dp(s, t)
  puts "将 #{s} 更改为 #{t} 最少需要编辑 #{res} 步"

  # 空间优化后的动态规划
  res = edit_distance_dp_comp(s, t)
  puts "将 #{s} 更改为 #{t} 最少需要编辑 #{res} 步"
end
