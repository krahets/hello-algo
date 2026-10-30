=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: permutations I ###
def backtrack(state, choices, selected, res)
  # Record a solution when the state length equals the number of elements
  if state.length == choices.length
    res << state.dup
    return
  end

  # Iterate over all choices
  choices.each_with_index do |choice, i|
    # Prune: do not choose an element more than once
    unless selected[i]
      # Try: make a choice and update the state
      selected[i] = true
      state << choice
      # Proceed to the next choice
      backtrack(state, choices, selected, res)
      # Backtrack: undo the choice and restore the previous state
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
