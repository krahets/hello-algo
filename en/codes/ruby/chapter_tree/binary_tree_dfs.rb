=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Preorder traversal ###
def pre_order(root)
  return if root.nil?

  # Visit order: root -> left subtree -> right subtree
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### Inorder traversal ###
def in_order(root)
  return if root.nil?

  # Visit order: left subtree -> root -> right subtree
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### Postorder traversal ###
def post_order(root)
  return if root.nil?

  # Visit order: left subtree -> right subtree -> root
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### Driver code ###
if __FILE__ == $0
  # Initialize the binary tree
  # Use a helper function that builds a binary tree directly from an array
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nInitialize the binary tree\n\n"
  print_tree(root)

  # Preorder traversal
  $res = []
  pre_order(root)
  puts "\nNode sequence from preorder traversal = #{$res}"

  # Inorder traversal
  $res.clear
  in_order(root)
  puts "\nNode sequence from inorder traversal = #{$res}"

  # Postorder traversal
  $res.clear
  post_order(root)
  puts "\nNode sequence from postorder traversal = #{$res}"
end
