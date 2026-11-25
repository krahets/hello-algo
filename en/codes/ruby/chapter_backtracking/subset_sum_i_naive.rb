=begin
File: subset_sum_i_naive.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: subset sum I ###
def backtrack(state, target, total, choices, res)
  # Record a solution when the subset sums to target
  if total == target
    res << state.dup
    return
  end

  # Try each choice
  for i in 0...choices.length
    # Prune: skip choices that would take the subset sum over target
    next if total + choices[i] > target
    # Make a choice and update the running sum total
    state << choices[i]
    # Make the next choice
    backtrack(state, target, total + choices[i], choices, res)
    # Backtrack: undo the choice to restore the previous state
    state.pop
  end
end

### Solve subset sum I (including duplicate subsets)###
def subset_sum_i_naive(nums, target)
  state = [] # State (current subset)
  total = 0 # Subset sum
  res = [] # Results (list of subsets)
  backtrack(state, target, total, nums, res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [3, 4, 5]
  target = 9
  res = subset_sum_i_naive(nums, target)

  puts "Input array nums = #{nums}, target = #{target}"
  puts "Subsets that sum to #{target}: res = #{res}"
  puts "This method returns duplicate subsets"
end
