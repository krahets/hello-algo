=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 knapsack with brute-force search ###
def knapsack_dfs(wgt, val, i, c)
  # Return a value of 0 if all items have been considered or no capacity remains
  return 0 if i == 0 || c == 0
  # If the item exceeds the remaining capacity, we can only skip it
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # Compute the maximum values for skipping and taking item i
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Return the larger of the two values
  [no, yes].max
end

### 0-1 knapsack with memoized search ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # Return a value of 0 if all items have been considered or no capacity remains
  return 0 if i == 0 || c == 0
  # Return the cached result if available
  return mem[i][c] if mem[i][c] != -1
  # If the item exceeds the remaining capacity, we can only skip it
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # Compute the maximum values for skipping and taking item i
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Cache and return the larger of the two values
  mem[i][c] = [no, yes].max
end

### 0-1 knapsack with dynamic programming ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 knapsack with space-optimized dynamic programming ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Initialize the dp table
  dp = Array.new(cap + 1, 0)
  # State transition
  for i in 1...(n + 1)
    # Iterate in descending order
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Brute-force search
  res = knapsack_dfs(wgt, val, n, cap)
  puts "Maximum total item value within the weight limit: #{res}"

  # Memoized search
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "Maximum total item value within the weight limit: #{res}"

  # Dynamic programming
  res = knapsack_dp(wgt, val, cap)
  puts "Maximum total item value within the weight limit: #{res}"

  # Space-optimized dynamic programming
  res = knapsack_dp_comp(wgt, val, cap)
  puts "Maximum total item value within the weight limit: #{res}"
end
