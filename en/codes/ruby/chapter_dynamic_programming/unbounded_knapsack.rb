=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Unbounded knapsack: dynamic programming ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # Initialize the dp table
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # State transitions
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # If item i exceeds the remaining capacity, do not choose it
        dp[i][c] = dp[i - 1][c]
      else
        # Take the larger value obtained by excluding and including item i
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### Unbounded knapsack: space-optimized dynamic programming ###
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Initialize the dp table
  dp = Array.new(cap + 1, 0)
  # State transitions
  for i in 1...(n + 1)
    # Traverse in increasing order
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # If item i exceeds the remaining capacity, do not choose it
        dp[c] = dp[c]
      else
        # Take the larger value obtained by excluding and including item i
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
  puts "Maximum total item value within the knapsack capacity: #{res}"

  # Space-optimized dynamic programming
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "Maximum total item value within the knapsack capacity: #{res}"
end
