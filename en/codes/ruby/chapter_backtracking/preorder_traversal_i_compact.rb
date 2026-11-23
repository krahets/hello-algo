=begin
File: preorder_traversal_i_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Preorder traversal: example 1 ###
def pre_order(root)
  return unless root

  # Record the solution
  $res << root if root.val == 7

  pre_order(root.left)
  pre_order(root.right)
end

### Driver code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nInitialize the binary tree"
  print_tree(root)

  # Preorder traversal
  $res = []
  pre_order(root)

  puts "\nOutput all nodes with value 7"
  p $res.map { |node| node.val }
end
