=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking ###
def backtrack(choices, state, n, res)
  # Count one more way when we reach stair n
  res[0] += 1 if state == n
  # Iterate over all choices
  for choice in choices
    # Prune moves that would overshoot stair n
    next if state + choice > n

    # Try a choice and update the state
    backtrack(choices, state + choice, n, res)
  end
  # Undo the choice
end

### Climbing stairs with backtracking ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # Each move can climb 1 or 2 stairs
  state = 0 # Start at stair 0
  res = [0] # Store the number of ways in res[0]
  backtrack(choices, state, n, res)
  res.first
end

### Driver code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "Climbing #{n} stairs: #{res} ways"
end
