=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Edit distance with brute-force search ###
def edit_distance_dfs(s, t, i, j)
  # Return 0 if both s and t are empty
  return 0 if i == 0 && j == 0
  # Return the length of t if s is empty
  return j if i == 0
  # Return the length of s if t is empty
  return i if j == 0
  # Skip both characters if they match
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # Return the minimum number of edits
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # Return 0 if both s and t are empty
  return 0 if i == 0 && j == 0
  # Return the length of t if s is empty
  return j if i == 0
  # Return the length of s if t is empty
  return i if j == 0
  # Return the cached result if available
  return mem[i][j] if mem[i][j] != -1
  # Skip both characters if they match
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # Cache and return the minimum number of edits
  mem[i][j] = [insert, delete, replace].min + 1
end

### Edit distance with dynamic programming ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # State transitions for the first row and column
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # State transitions for the remaining rows and columns
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # Skip both characters if they match
        dp[i][j] = dp[i - 1][j - 1]
      else
        # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### Edit distance with space-optimized dynamic programming ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # State transitions for the first row
  (1...(m + 1)).each { |j| dp[j] = j }
  # State transitions for the remaining rows
  for i in 1...(n + 1)
    # State transitions for the first column
    leftup = dp.first # Save dp[i-1, j-1] temporarily
    dp[0] += 1
    # State transitions for the remaining columns
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # Skip both characters if they match
        dp[j] = leftup
      else
        # Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # Update the saved value to hold dp[i-1, j-1] for the next iteration
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
  puts "Changing #{s} to #{t} requires at least #{res} edits"

  # Memoized search
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "Changing #{s} to #{t} requires at least #{res} edits"

  # Dynamic programming
  res = edit_distance_dp(s, t)
  puts "Changing #{s} to #{t} requires at least #{res} edits"

  # Space-optimized dynamic programming
  res = edit_distance_dp_comp(s, t)
  puts "Changing #{s} to #{t} requires at least #{res} edits"
end
