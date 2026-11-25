=begin
File: climbing_stairs_dfs.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 探索 ###
def dfs(i)
  # 既知の値 dp[1] と dp[2] のうち、該当する方を返す
  return i if i == 1 || i == 2
  # dp[i] = dp[i-1] + dp[i-2]
  dfs(i - 1) + dfs(i - 2)
end

### 階段の登り方：探索 ###
def climbing_stairs_dfs(n)
  dfs(n)
end

### 実行例 ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs(n)
  puts "全 #{n} 段の階段の登り方は #{res} 通り"
end
