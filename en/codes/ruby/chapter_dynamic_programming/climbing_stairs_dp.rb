=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Climbing stairs: dynamic programming ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # Initialize the dp table to store subproblem solutions
  dp = Array.new(n + 1, 0)
  # Initial states: set the solutions to the smallest subproblems
  dp[1], dp[2] = 1, 2
  # State transitions: solve progressively larger subproblems using smaller ones
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### Climbing stairs: space-optimized dynamic programming ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### Driver code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "Number of ways to climb #{n} stairs: #{res}"

  res = climbing_stairs_dp_comp(n)
  puts "Number of ways to climb #{n} stairs: #{res}"
end
