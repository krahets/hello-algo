=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 记忆化搜索 ###
def dfs(i, mem)
  # 已知 dp[1] 和 dp[2] ，返回之
  return i if i == 1 || i == 2
  # 若存在记录 dp[i] ，则直接返回之
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # 记录 dp[i]
  mem[i] = count
end

### 爬楼梯：记忆化搜索 ###
def climbing_stairs_dfs_mem(n)
  # mem[i] 记录爬到第 i 阶的方案总数，-1 代表无记录
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "爬 #{n} 阶楼梯共有 #{res} 种方案"
end
