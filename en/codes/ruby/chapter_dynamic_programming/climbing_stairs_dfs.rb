=begin
File: climbing_stairs_dfs.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Search ###
def dfs(i)
  # Known dp[1] and dp[2], return them
  return i if i == 1 || i == 2
  # dp[i] = dp[i-1] + dp[i-2]
  dfs(i - 1) + dfs(i - 2)
end

### Climbing stairs: search ###
def climbing_stairs_dfs(n)
  dfs(n)
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
