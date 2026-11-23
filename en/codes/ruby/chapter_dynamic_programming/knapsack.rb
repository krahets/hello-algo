=begin
File: knapsack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 0-1 knapsack: brute-force search ###
def knapsack_dfs(wgt, val, i, c)
  # If all items have been considered or no capacity remains, return value 0
  return 0 if i == 0 || c == 0
  # If the item exceeds the remaining capacity, it must be excluded
  return knapsack_dfs(wgt, val, i - 1, c) if wgt[i - 1] > c
  # Calculate the maximum values obtained by excluding and including item i
  no = knapsack_dfs(wgt, val, i - 1, c)
  yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Return the larger value from the two choices
  [no, yes].max
end

### 0-1 knapsack: memoized search ###
def knapsack_dfs_mem(wgt, val, mem, i, c)
  # If all items have been considered or no capacity remains, return value 0
  return 0 if i == 0 || c == 0
  # If a result has already been recorded, return it directly
  return mem[i][c] if mem[i][c] != -1
  # If the item exceeds the remaining capacity, it must be excluded
  return knapsack_dfs_mem(wgt, val, mem, i - 1, c) if wgt[i - 1] > c
  # Calculate the maximum values obtained by excluding and including item i
  no = knapsack_dfs_mem(wgt, val, mem, i - 1, c)
  yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1]
  # Record and return the larger value from the two choices
  mem[i][c] = [no, yes].max
end

### 0-1 knapsack: dynamic programming ###
def knapsack_dp(wgt, val, cap)
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
        dp[i][c] = [dp[i - 1][c], dp[i - 1][c - wgt[i - 1]] + val[i - 1]].max
      end
    end
  end
  dp[n][cap]
end

### 0-1 knapsack: space-optimized dynamic programming ###
def knapsack_dp_comp(wgt, val, cap)
  n = wgt.length
  # Initialize the dp table
  dp = Array.new(cap + 1, 0)
  # State transitions
  for i in 1...(n + 1)
    # Traverse in decreasing order
    for c in cap.downto(1)
      if wgt[i - 1] > c
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
  wgt = [10, 20, 30, 40, 50]
  val = [50, 120, 150, 210, 240]
  cap = 50
  n = wgt.length

  # Brute-force search
  res = knapsack_dfs(wgt, val, n, cap)
  puts "Maximum total item value within the knapsack capacity: #{res}"

  # Memoized search
  mem = Array.new(n + 1) { Array.new(cap + 1, -1) }
  res = knapsack_dfs_mem(wgt, val, mem, n, cap)
  puts "Maximum total item value within the knapsack capacity: #{res}"

  # Dynamic programming
  res = knapsack_dp(wgt, val, cap)
  puts "Maximum total item value within the knapsack capacity: #{res}"

  # Space-optimized dynamic programming
  res = knapsack_dp_comp(wgt, val, cap)
  puts "Maximum total item value within the knapsack capacity: #{res}"
end
