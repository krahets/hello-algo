=begin
File: climbing_stairs_dfs.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 搜尋 ###
def dfs(i)
  # 已知 dp[1] 和 dp[2] ，返回之
  return i if i == 1 || i == 2
  # dp[i] = dp[i-1] + dp[i-2]
  dfs(i - 1) + dfs(i - 2)
end

### 爬樓梯：搜尋 ###
def climbing_stairs_dfs(n)
  dfs(n)
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs(n)
  puts "爬 #{n} 階樓梯共有 #{res} 種方案"
end
