=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### メモ化探索 ###
def dfs(i, mem)
  # dp[1] と dp[2] は既知なので返す
  return i if i == 1 || i == 2
  # dp[i] の記録があれば、それをそのまま返す
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # dp[i] を記録する
  mem[i] = count
end

### 階段登り：メモ化探索 ###
def climbing_stairs_dfs_mem(n)
  # mem[i] は第 i 段まで上る方法の総数を記録し、-1 は未記録を表す
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "#{n} 段の階段を上る方法は全部で #{res} 通り"
end
