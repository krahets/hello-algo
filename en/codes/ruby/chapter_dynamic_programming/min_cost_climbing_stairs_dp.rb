=begin
File: min_cost_climbing_stairs_dp.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Minimum cost to climb stairs: dynamic programming ###
def min_cost_climbing_stairs_dp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  # Initialize the dp table to store subproblem solutions
  dp = Array.new(n + 1, 0)
  # Initial states: set the solutions to the smallest subproblems
  dp[1], dp[2] = cost[1], cost[2]
  # State transitions: solve progressively larger subproblems using smaller ones
  (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
  dp[n]
end

# Minimum cost to climb stairs: space-optimized dynamic programming
def min_cost_climbing_stairs_dp_comp(cost)
  n = cost.length - 1
  return cost[n] if n == 1 || n == 2
  a, b = cost[1], cost[2]
  (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
  b
end

### Driver code ###
if __FILE__ == $0
  cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
  puts "Input stair cost list: #{cost}"

  res = min_cost_climbing_stairs_dp(cost)
  puts "Minimum cost to climb all the stairs: #{res}"

  res = min_cost_climbing_stairs_dp_comp(cost)
  puts "Minimum cost to climb all the stairs: #{res}"
end
