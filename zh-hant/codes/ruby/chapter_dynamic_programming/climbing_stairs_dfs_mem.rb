=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 記憶化搜尋 ###
def dfs(i, mem)
  # 已知 dp[1] 和 dp[2] ，返回之
  return i if i == 1 || i == 2
  # 若存在記錄 dp[i] ，則直接返回之
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # 記錄 dp[i]
  mem[i] = count
end

### 爬樓梯：記憶化搜尋 ###
def climbing_stairs_dfs_mem(n)
  # mem[i] 記錄爬到第 i 階的方案總數，-1 代表無記錄
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "爬 #{n} 階樓梯共有 #{res} 種方案"
end
