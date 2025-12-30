=begin
File: climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Climbing stairs: dynamic programming ###
def climbing_stairs_dp(n)
  return n  if n == 1 || n == 2

  # Initialize dp table, used to store solutions to subproblems
  dp = Array.new(n + 1, 0)
  # Initial state: preset the solution to the smallest subproblem
  dp[1], dp[2] = 1, 2
  # State transition: gradually solve larger subproblems from smaller ones
  (3...(n + 1)).each { |i| dp[i] = dp[i - 1] + dp[i - 2] }

  dp[n]
end

### Climbing stairs: space-optimized DP ###
def climbing_stairs_dp_comp(n)
  return n if n == 1 || n == 2

  a, b = 1, 2
  (3...(n + 1)).each { a, b = b, a + b }

  b
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_dp(n)
  puts "Climbing #{n} stairs has #{res} solutions"

  res = climbing_stairs_dp_comp(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
