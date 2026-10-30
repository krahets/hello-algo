=begin
File: subset_sum_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum I ###
def backtrack(state, target, choices, start, res)
  # Record a solution when the remaining target reaches zero
  if target.zero?
    res << state.dup
    return
  end
  # Iterate over all choices
  # Pruning 2: iterate from start to avoid generating duplicate subsets
  for i in start...choices.length
    # Pruning 1: exit the loop if this choice would exceed the remaining target
    # The array is sorted, so later elements are at least as large and would also exceed the remaining target
    break if target - choices[i] < 0
    # Try: make a choice and update target and start
    state << choices[i]
    # Proceed to the next choice
    backtrack(state, target - choices[i], choices, i, res)
    # Backtrack: undo the choice and restore the previous state
    state.pop
  end
end

### Solve subset sum I ###
def subset_sum_i(nums, target)
  state = [] # State (subset)
  nums.sort! # Sort nums
  start = 0 # Starting index for iteration
  res = [] # Result list (list of subsets)
  backtrack(state, target, nums, start, res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i(nums, target)

  puts "Input array = #{nums}, target = #{target}"
  puts "All subsets with sum #{target}: res = #{res}"
end
