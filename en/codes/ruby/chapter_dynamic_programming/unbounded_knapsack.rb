=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Unbounded knapsack with dynamic programming ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # Initialize the dp table
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # State transition
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # Skip item i if its weight exceeds the capacity
        dp[i][c] = dp[i - 1][c]
      else
        # Take the larger value from skipping or taking item i
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### Unbounded knapsack with space-optimized dynamic programming ###
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Initialize the dp table
  dp = Array.new(cap + 1, 0)
  # State transition
  for i in 1...(n + 1)
    # Iterate in ascending order
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # Skip item i if its weight exceeds the capacity
        dp[c] = dp[c]
      else
        # Take the larger value from skipping or taking item i
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Driver code ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # Dynamic programming
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "Maximum total item value within the weight limit: #{res}"

  # Space-optimized dynamic programming
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "Maximum total item value within the weight limit: #{res}"
end
