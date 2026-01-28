=begin
File: preorder_traversal_iii_template.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Check if current state is solution ###
def is_solution?(state)
  !state.empty? && state.last.val == 7
end

### Record solution ###
def record_solution(state, res)
  res << state.dup
end

### Check if choice is valid in current state ###
def is_valid?(state, choice)
  choice && choice.val != 3
end

### Update state ###
def make_choice(state, choice)
  state << choice
end

### Restore state ###
def undo_choice(state, choice)
  state.pop
end

### Backtracking: example 3 ###
def backtrack(state, choices, res)
  # Check if it is a solution
  record_solution(state, res) if is_solution?(state)

  # Traverse all choices
  for choice in choices
    # Pruning: check if the choice is valid
    if is_valid?(state, choice)
      # Attempt: make choice, update state
      make_choice(state, choice)
      # Proceed to the next round of selection
      backtrack(state, [choice.left, choice.right], res)
      # Backtrack: undo choice, restore to previous state
      undo_choice(state, choice)
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nInitialize binary tree"
  print_tree(root)

  # Backtracking algorithm
  res = []
  backtrack([], [root], res)

  puts "\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3"
  for path in res
    p path.map { |node| node.val }
  end
end
