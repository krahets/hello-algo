=begin
File: subset_sum_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum II ###
def backtrack(state, target, choices, start, res)
  # Record a solution when the remaining target reaches zero
  if target.zero?
    res << state.dup
    return
  end

  # Iterate over all choices
  # Pruning 2: iterate from start to avoid generating duplicate subsets
  # Pruning 3: start after the previously chosen index to avoid choosing the same element again
  for i in start...choices.length
    # Pruning 1: exit the loop if this choice would exceed the remaining target
    # The array is sorted, so later elements are at least as large and would also exceed the remaining target
    break if target - choices[i] < 0
    # Pruning 4: if this element equals its left neighbor at the same search depth, the branch is a duplicate; skip it
    next if i > start && choices[i] == choices[i - 1]
    # Try: make a choice and update target and start
    state << choices[i]
    # Proceed to the next choice
    backtrack(state, target - choices[i], choices, i + 1, res)
    # Backtrack: undo the choice and restore the previous state
    state.pop
  end
end

### Solve subset sum II ###
def subset_sum_ii(nums, target)
  state = [] # State (subset)
  nums.sort! # Sort nums
  start = 0 # Starting index for iteration
  res = [] # Result list (list of subsets)
  backtrack(state, target, nums, start, res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [4, 4, 5]
  target = 9
  res = subset_sum_ii(nums, target)

  puts "Input array nums = #{nums}, target = #{target}"
  puts "All subsets with sum #{target}: res = #{res}"
end
