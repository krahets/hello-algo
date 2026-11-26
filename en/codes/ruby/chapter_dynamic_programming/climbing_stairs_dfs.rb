=begin
File: climbing_stairs_dfs.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Search ###
def dfs(i)
  # Return the known value for dp[1] or dp[2]
  return i if i == 1 || i == 2
  # dp[i] = dp[i-1] + dp[i-2]
  dfs(i - 1) + dfs(i - 2)
end

### Climbing stairs with search ###
def climbing_stairs_dfs(n)
  dfs(n)
end

### Driver code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs(n)
  puts "Climbing #{n} stairs: #{res} ways"
end
