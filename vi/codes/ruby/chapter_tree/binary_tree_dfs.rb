=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Pre-order traversal ###
def pre_order(root)
  return if root.nil?

  # Visit priority: root node -> left subtree -> right subtree
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### In-order traversal ###
def in_order(root)
  return if root.nil?

  # Visit priority: left subtree -> root node -> right subtree
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### Post-order traversal ###
def post_order(root)
  return if root.nil?

  # Visit priority: left subtree -> right subtree -> root node
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### Driver Code ###
if __FILE__ == $0
  # Initialize binary tree
  # Here we use a function to generate a binary tree directly from an array
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nInitialize binary tree\n\n"
  print_tree(root)

  # Preorder traversal
  $res = []
  pre_order(root)
  puts "\nPre-order traversal node sequence = #{$res}"

  # Inorder traversal
  $res.clear
  in_order(root)
  puts "\nIn-order traversal node sequence = #{$res}"

  # Postorder traversal
  $res.clear
  post_order(root)
  puts "\nPost-order traversal node sequence = #{$res}"
end
