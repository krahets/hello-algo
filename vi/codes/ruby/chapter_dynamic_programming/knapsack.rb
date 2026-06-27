=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 knapsack: brute force search ###
def knapsack_dfs(wgt, val, i, c)
  # If all items have been selected or knapsack has no remaining capacity, return value 0
  return 0 if i == 0 || c == 0
  # If exceeds knapsack capacity, can only choose not to put it in
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # Calculate the maximum value of not putting in and putting in item i
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Return the larger value of the two options
  [no, yes].max
end

### 0-1 knapsack: memoization search ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # If all items have been selected or knapsack has no remaining capacity, return value 0
  return 0 if i == 0 || c == 0
  # If there's a record, return it directly
  return mem[i][c] if mem[i][c] != -1
  # If exceeds knapsack capacity, can only choose not to put it in
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # Calculate the maximum value of not putting in and putting in item i
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Record and return the larger value of the two options
  mem[i][c] = [no, yes].max
end

### 0-1 knapsack: dynamic programming ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 knapsack: space-optimized DP ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Initialize dp table
  dp = Array.new(cap + 1, 0)
  # State transition
  for i in 1...(n + 1)
    # Traverse in reverse order
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Brute-force search
  res = knapsack_dfs(wgt, val, n, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Memoization search
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Dynamic programming
  res = knapsack_dp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"

  # Space-optimized dynamic programming
  res = knapsack_dp_comp(wgt, val, cap)
  puts "Maximum item value not exceeding knapsack capacity is #{res}"
end
