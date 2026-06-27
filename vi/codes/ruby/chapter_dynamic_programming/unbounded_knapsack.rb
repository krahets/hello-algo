=begin
File: unbounded_knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Unbounded knapsack: dynamic programming ###
def unbounded_knapsack_dp(wgt, val, cap)
  n = wgt.length
  # Initialize dp table
  dp = Array.new(n + 1) { Array.new(cap + 1, 0) }
  # State transition
  for i in 1...(n + 1)
    for c in 1...(cap + 1)
      if wgt[i - 1] > c
        # If exceeds knapsack capacity, don't select item i
        dp[i][c] = dp[i - 1][c]
      else
        # The larger value between not selecting and selecting item i
        dp[i][c] = [dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### Unbounded knapsack: space-optimized DP ###
def unbounded_knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Initialize dp table
  dp = Array.new(cap + 1, 0)
  # State transition
  for i in 1...(n + 1)
    # Traverse in forward order
    for c in 1...(cap + 1)
      if wgt[i -1] > c
        # If exceeds knapsack capacity, don't select item i
        dp[c] = dp[c]
      else
        # The larger value between not selecting and selecting item i
        dp[c] = [dp[c], dp[c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[cap]
end

### Driver Code ###
if __FILE__ == $0
  wgt = [1, 2, 3]
  val = [5, 11, 15]
  cap = 4

  # Dynamic programming
  res = unbounded_knapsack_dp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Space-optimized dynamic programming
  res = unbounded_knapsack_dp_comp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"
end
