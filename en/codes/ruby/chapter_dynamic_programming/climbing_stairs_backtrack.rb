=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking ###
def backtrack(choices, state, n, res)
  # When step n is reached, increase the number of ways by 1
  res[0] += 1 if state == n
  # Iterate over all choices
  for choice in choices
    # Prune: do not go beyond step n
    next if state + choice > n

    # Try: make a choice and update the state
    backtrack(choices, state + choice, n, res)
  end
  # Backtrack
end

### Climbing stairs: backtracking ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # Choose to climb 1 or 2 steps
  state = 0 # Start climbing from step 0
  res = [0] # Use res[0] to record the number of ways
  backtrack(choices, state, n, res)
  res.first
end

### Driver code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "Number of ways to climb #{n} stairs: #{res}"
end
