=begin
File: subset_sum_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum I ###
def backtrack(state, target, choices, start, res)
  # When the subset sum equals target, record the solution
  if target.zero?
    res << state.dup
    return
  end
  # Traverse all choices
  # Pruning 2: start traversing from start to avoid generating duplicate subsets
  for i in start...choices.length
    # Pruning 1: if the subset sum exceeds target, end the loop directly
    # This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
    break if target - choices[i] < 0
    # Attempt: make choice, update target, start
    state << choices[i]
    # Proceed to the next round of selection
    backtrack(state, target - choices[i], choices, i, res)
    # Backtrack: undo choice, restore to previous state
    state.pop
  end
end

### Solve subset sum I ###
def subset_sum_i(nums, target)
  state = [] # State (subset)
  nums.sort! # Sort nums
  start = 0 # Start point for traversal
  res = [] # Result list (subset list)
  backtrack(state, target, nums, start, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i(nums, target)

  puts "Input array = #{nums}, target = #{target}"
  puts "All subsets with sum equal to #{target} res = #{res}"
end
