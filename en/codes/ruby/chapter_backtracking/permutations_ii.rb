=begin
File: permutations_ii.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require 'set'

### Backtracking: permutations II ###
def backtrack(state, choices, selected, res)
  # Record a solution when the state contains all the elements
  if state.length == choices.length
    res << state.dup
    return
  end

  # Try each choice
  duplicated = Set.new
  choices.each_with_index do |choice, i|
    # Skip elements already in use and values already tried at this level
    if !selected[i] && !duplicated.include?(choice)
      # Make a choice and update the state
      duplicated.add(choice)
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

### Permutations II ###
def permutations_ii(nums)
  res = []
  backtrack([], nums, Array.new(nums.length, false), res)
  res
end

### Driver code ###
if __FILE__ == $0
  nums = [1, 2, 2]

  res = permutations_ii(nums)

  puts "Input array nums = #{nums}"
  puts "All permutations res = #{res}"
end
