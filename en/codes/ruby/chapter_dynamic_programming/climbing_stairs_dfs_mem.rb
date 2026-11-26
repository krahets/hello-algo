=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Memoized search ###
def dfs(i, mem)
  # Return the known value for dp[1] or dp[2]
  return i if i == 1 || i == 2
  # Return dp[i] directly if it is cached
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # Cache dp[i]
  mem[i] = count
end

### Climbing stairs with memoized search ###
def climbing_stairs_dfs_mem(n)
  # mem[i] stores the number of ways to reach stair i. A value of -1 means no result is cached
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Driver code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "Climbing #{n} stairs: #{res} ways"
end
