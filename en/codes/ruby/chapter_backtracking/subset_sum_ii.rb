=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum II ###
def backtrack(state, target, choices, start, res)
  # Record a solution when the subset sums to target
  if target.zero?
    res << state.dup
    return
  end

  # Try each choice
  # Pruning rule 2: start at start to avoid duplicate subsets
  # Pruning rule 3: start at start to avoid reusing the same element
  for i in start...choices.length
    # Pruning rule 1: break if the subset sum would exceed target
    # The array is sorted, so later elements are at least as large and would also take the sum over target
    break if target - choices[i] < 0
    # Pruning rule 4: skip a value equal to its left neighbor, since its search branch is a duplicate
    next if i > start && choices[i] == choices[i - 1]
    # Make a choice and update target and start
    state << choices[i]
    # Make the next choice
    backtrack(state, target - choices[i], choices, i + 1, res)
    # Backtrack: undo the choice to restore the previous state
    state.pop
  end
end

### Solve subset sum II ###
def subset_sum_ii(nums, target)
  state = [] # State (current subset)
  nums.sort! # Sort nums
  start = 0 # Starting index
  res = [] # Results (list of subsets)
  backtrack(state, target, nums, start, res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "Input array nums = #{nums}, target = #{target}"
  puts "Subsets that sum to #{target}: res = #{res}"
end
