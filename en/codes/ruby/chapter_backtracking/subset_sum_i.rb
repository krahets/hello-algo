=begin
File: subset_sum_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum I ###
def backtrack(state, target, choices, start, res)
  # Record a solution when the subset sums to target
  if target.zero?
    res << state.dup
    return
  end
  # Try each choice
  # Pruning rule 2: start at start to avoid duplicate subsets
  for i in start...choices.length
    # Pruning rule 1: break if the subset sum would exceed target
    # The array is sorted, so later elements are at least as large and would also take the sum over target
    break if target - choices[i] < 0
    # Make a choice and update target and start
    state << choices[i]
    # Make the next choice
    backtrack(state, target - choices[i], choices, i, res)
    # Backtrack: undo the choice to restore the previous state
    state.pop
  end
end

### Solve subset sum I ###
def subset_sum_i(nums, target)
  state = [] # State (current subset)
  nums.sort! # Sort nums
  start = 0 # Starting index
  res = [] # Results (list of subsets)
  backtrack(state, target, nums, start, res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i(nums, target)

  puts "Input array = #{nums}, target = #{target}"
  puts "Subsets that sum to #{target}: res = #{res}"
end
