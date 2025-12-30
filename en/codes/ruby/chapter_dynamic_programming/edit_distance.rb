=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Edit distance: brute force search ###
def edit_distance_dfs(s, t, i, j)
  # If both s and t are empty, return 0
  return 0 if i == 0 && j == 0
  # If s is empty, return length of t
  return j if i == 0
  # If t is empty, return length of s
  return i if j == 0
  # If two characters are equal, skip both characters
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # Return minimum edit steps
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # If both s and t are empty, return 0
  return 0 if i == 0 && j == 0
  # If s is empty, return length of t
  return j if i == 0
  # If t is empty, return length of s
  return i if j == 0
  # If there's a record, return it directly
  return mem[i][j] if mem[i][j] != -1
  # If two characters are equal, skip both characters
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # Record and return minimum edit steps
  mem[i][j] = [insert, delete, replace].min + 1
end

### Edit distance: dynamic programming ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # State transition: first row and first column
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # State transition: rest of the rows and columns
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # If two characters are equal, skip both characters
        dp[i][j] = dp[i - 1][j - 1]
      else
        # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### Edit distance: space-optimized DP ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # State transition: first row
  (1...(m + 1)).each { |j| dp[j] = j }
  # State transition: rest of the rows
  for i in 1...(n + 1)
    # State transition: first column
    leftup = dp.first # Temporarily store dp[i-1, j-1]
    dp[0] += 1
    # State transition: rest of the columns
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # If two characters are equal, skip both characters
        dp[j] = leftup
      else
        # Minimum edit steps = minimum edit steps of insert, delete, replace + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # Update for next round's dp[i-1, j-1]
    end
  end
  dp[m]
end

### Driver Code ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # Brute-force search
  res = edit_distance_dfs(s, t, n, m)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"

  # Memoization search
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"

  # Dynamic programming
  res = edit_distance_dp(s, t)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"

  # Space-optimized dynamic programming
  res = edit_distance_dp_comp(s, t)
  puts "Changing #{s} to #{t} requires minimum #{res} edits"
end
