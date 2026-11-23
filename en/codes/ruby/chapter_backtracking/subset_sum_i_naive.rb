=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum I ###
def backtrack(state, target, total, choices, res)
  # Record a solution when the subset sum equals target
  if total == target
    res << state.dup
    return
  end

  # Iterate over all choices
  for i in 0...choices.length
    # Prune: skip this choice if the subset sum would exceed target
    next if total + choices[i] > target
    # Try: make a choice and update the sum total
    state << choices[i]
    # Proceed to the next choice
    backtrack(state, target, total + choices[i], choices, res)
    # Backtrack: undo the choice and restore the previous state
    state.pop
  end
end

### Solve subset sum I (with duplicate subsets)###
def subset_sum_i_naive(nums, target)
  state = [] # State (subset)
  total = 0 # Subset sum
  res = [] # Result list (list of subsets)
  backtrack(state, target, total, nums, res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "Input array nums = #{nums}, target = #{target}"
  puts "All subsets with sum #{target}: res = #{res}"
  puts "Note that this method produces duplicate subsets"
end
