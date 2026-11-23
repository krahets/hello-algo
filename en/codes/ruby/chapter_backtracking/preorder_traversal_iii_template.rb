=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Check whether the current state is a solution ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### Record the solution ###
def record_solution(state, res)
  res << state.dup
end

### Check whether the choice is valid in the current state ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### Update the state ###
def make_choice(state, choice)
  state << choice
end

### Restore the state ###
def undo_choice(state, choice)
  state.pop
end

### Backtracking: example 3 ###
def backtrack(state, choices, res)
  # Check whether this is a solution
  record_solution(state, res) if is_solution?(state)

  # Iterate over all choices
  for choice in choices
    # Prune: check whether the choice is valid
    if is_valid?(state, choice)
      # Try: make a choice and update the state
      make_choice(state, choice)
      # Proceed to the next choice
      backtrack(state, [choice.left, choice.right], res)
      # Backtrack: undo the choice and restore the previous state
      undo_choice(state, choice)
    end
  end
end

### Driver code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nInitialize the binary tree"
  print_tree(root)

  # Backtracking algorithm
  res = []
  backtrack([], [root], res)

  puts "\nOutput all paths from the root to nodes with value 7, requiring that no node on the path has value 3"
  for path in res
    p path.map { |node| node.val }
  end
end
