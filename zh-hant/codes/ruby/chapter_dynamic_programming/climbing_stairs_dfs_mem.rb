=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 記憶化搜尋 ###
def dfs(i, mem)
  # 已知 dp[1] 和 dp[2]，直接回傳對應的值
  return i if i == 1 || i == 2
  # 若已有 dp[i] 的紀錄，就直接回傳該值
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # 記錄 dp[i]
  mem[i] = count
end

### 爬樓梯：記憶化搜尋 ###
def climbing_stairs_dfs_mem(n)
  # mem[i] 記錄爬到第 i 階的走法總數，-1 表示尚無紀錄
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### 主程式 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "爬 #{n} 階樓梯共有 #{res} 種走法"
end
