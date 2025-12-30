=begin
File: climbing_stairs_dfs_mem.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Memoization search ###
def dfs(i, mem)
  # Known dp[1] and dp[2], return them
  return i if i == 1 || i == 2
  # If record dp[i] exists, return it directly
  return mem[i] if mem[i] != -1

  # dp[i] = dp[i-1] + dp[i-2]
  count = dfs(i - 1, mem) + dfs(i - 2, mem)
  # Record dp[i]
  mem[i] = count
end

### Climbing stairs: memoization search ###
def climbing_stairs_dfs_mem(n)
  # mem[i] records the total number of solutions to climb to the i-th stair, -1 means no record
  mem = Array.new(n + 1, -1)
  dfs(n, mem)
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dfs_mem(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
