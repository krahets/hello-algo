=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum I ###
def backtrack(state, target, total, choices, res)
  # When the subset sum equals target, record the solution
  if total == target
    res << state.dup
    return
  end

  # Traverse all choices
  for i in 0...choices.length
    # Pruning: if the subset sum exceeds target, skip this choice
    next if total + choices[i] > target
    # Attempt: make choice, update element sum total
    state << choices[i]
    # Proceed to the next round of selection
    backtrack(state, target, total + choices[i], choices, res)
    # Backtrack: undo choice, restore to previous state
    state.pop
  end
end

### Solve subset sum I (with duplicate subsets) ###
def subset_sum_i_naive(nums, target)
  state = [] # State (subset)
  total = 0 # Subset sum
  res = [] # Result list (subset list)
  backtrack(state, target, total, nums, res)
  res
end

### Driver Code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "Input array nums = #{nums}, target = #{target}"
  puts "All subsets with sum equal to #{target} res = #{res}"
  puts "Please note that this method outputs results containing duplicate sets"
end
