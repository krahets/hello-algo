=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Memoized search ###
def dfs(i, mem)
  # The values of dp[1] and dp[2] are known; return them
  return i if i == 1 || i == 2
  # If dp[i] has been recorded, return it directly
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # Record dp[i]
  mem[i] = count
end

### Climbing stairs: memoized search ###
def climbing_stairs_dfs_mem(n)
  # mem[i] stores the number of ways to reach step i; -1 means no result has been recorded
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Driver code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "Number of ways to climb #{n} stairs: #{res}"
end
