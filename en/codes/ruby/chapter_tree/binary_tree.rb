=begin
File: binary_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # Initialize binary tree
  # Initialize nodes
  n1 = TreeNode.new(1)
  n2 = TreeNode.new(2)
  n3 = TreeNode.new(3)
  n4 = TreeNode.new(4)
  n5 = TreeNode.new(5)
  # Build references (pointers) between nodes
  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  puts "\nInitialize binary tree\n\n"
  print_tree(n1)

  # Insert node P between n1 -> n2
  _p = TreeNode.new(0)
  # Insert node _p between n1 -> n2
  n1.left = _p
  _p.left = n2
  puts "\nAfter inserting node _p\n\n"
  print_tree(n1)
  # Remove node
  n1.left = n2
  puts "\nAfter deleting node _p\n\n"
  print_tree(n1)
end
