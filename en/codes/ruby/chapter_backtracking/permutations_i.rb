=begin
File: permutations_i.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Backtracking: permutations I ###
def backtrack(state, choices, selected, res)
  # When the state length equals the number of elements, record the solution
  if state.length == choices.length
    res << state.dup
    return
  end

  # Traverse all choices
  choices.each_with_index do |choice, i|
    # Pruning: do not allow repeated selection of elements
    unless selected[i]
      # Attempt: make choice, update state
      selected[i] = true
      state << choice
      # Proceed to the next round of selection
      backtrack(state, choices, selected, res)
      # Backtrack: undo choice, restore to previous state
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

### Driver Code ###
if __FILE__ == $0
  nums = [1, 2, 3]

  res = permutations_i(nums)

  puts "Input array nums = #{nums}"
  puts "All permutations res = #{res}"
end
