=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: permutations I ###
def backtrack(state, choices, selected, res)
  # Record a solution when the state contains all the elements
  if state.length == choices.length
    res << state.dup
    return
  end

  # Try each choice
  choices.each_with_index do |choice, i|
    # Prune: skip elements already in use
    unless selected[i]
      # Make a choice and update the state
      selected[i] = true
      state << choice
      # Make the next choice
      backtrack(state, choices, selected, res)
      # Backtrack: undo the choice to restore the previous state
      selected[i] = false
      state.pop
    end
  end
end

### Permutations I ###
def permutations_i(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "Input array nums = #{nums}"
  puts "All permutations res = #{res}"
end
