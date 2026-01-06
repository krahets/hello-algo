=begin
File: climbing_stairs_backtrack.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking ###
def backtrack(choices, state, n, res)
  # When climbing to the n-th stair, add 1 to the solution count
  res[0] += 1 if state == n
  # Traverse all choices
  for choice in choices
    # Pruning: not allowed to go beyond the n-th stair
    next if state + choice > n

    # Attempt: make choice, update state
    backtrack(choices, state + choice, n, res)
  end
  # Backtrack
end

### Climbing stairs: backtracking ###
def climbing_stairs_backtrack(n)
  choices = [1, 2] # Can choose to climb up 1 or 2 stairs
  state = 0 # Start climbing from the 0-th stair
  res = [0] # Use res[0] to record the solution count
  backtrack(choices, state, n, res)
  res.first
end

### Driver Code ###
if __FILE__ == $0
  n = 9

  res = climbing_stairs_backtrack(n)
  puts "Climbing #{n} stairs has #{res} solutions"
end
