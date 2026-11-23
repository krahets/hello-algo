=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Edit distance: brute-force search ###
def edit_distance_dfs(s, t, i, j)
  # Return 0 if both prefixes s[0...i] and t[0...j] are empty
  return 0 if i == 0 && j == 0
  # If the prefix of s is empty, return the length j of the prefix of t
  return j if i == 0
  # If the prefix of t is empty, return the length i of the prefix of s
  return i if j == 0
  # If the two characters are equal, skip both of them
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # Return the minimum number of edits
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # Return 0 if both prefixes s[0...i] and t[0...j] are empty
  return 0 if i == 0 && j == 0
  # If the prefix of s is empty, return the length j of the prefix of t
  return j if i == 0
  # If the prefix of t is empty, return the length i of the prefix of s
  return i if j == 0
  # If a result has already been recorded, return it directly
  return mem[i][j] if mem[i][j] != -1
  # If the two characters are equal, skip both of them
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # Record and return the minimum number of edits
  mem[i][j] = [insert, delete, replace].min + 1
end

### Edit distance: dynamic programming ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # State transitions: first row and first column
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # State transitions: remaining rows and columns
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # If the two characters are equal, skip both of them
        dp[i][j] = dp[i - 1][j - 1]
      else
        # Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### Edit distance: space-optimized dynamic programming ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # State transitions: first row
  (1...(m + 1)).each { |j| dp[j] = j }
  # State transitions: remaining rows
  for i in 1...(n + 1)
    # State transitions: first column
    leftup = dp.first # Temporarily store dp[i-1, j-1]
    dp[0] += 1
    # State transitions: remaining columns
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # If the two characters are equal, skip both of them
        dp[j] = leftup
      else
        # Minimum edits = the minimum among the insertion, deletion, and replacement subproblems + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # Update to dp[i-1, j-1] for the next iteration
    end
  end
  dp[m]
end

### Driver code ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # Brute-force search
  res = edit_distance_dfs(s, t, n, m)
  puts "Minimum edits needed to change #{s} into #{t}: #{res}"

  # Memoized search
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "Minimum edits needed to change #{s} into #{t}: #{res}"

  # Dynamic programming
  res = edit_distance_dp(s, t)
  puts "Minimum edits needed to change #{s} into #{t}: #{res}"

  # Space-optimized dynamic programming
  res = edit_distance_dp_comp(s, t)
  puts "Minimum edits needed to change #{s} into #{t}: #{res}"
end
