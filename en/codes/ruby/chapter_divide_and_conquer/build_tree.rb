=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Build a binary tree using divide and conquer ###
def dfs(preorder, inorder_map, i, l, r)
  # Stop when the subtree interval is empty
  return if r - l < 0

  # Initialize the root
  root = TreeNode.new(preorder[i])
  # Look up m to separate the left and right subtrees
  m = inorder_map[preorder[i]]
  # Subproblem: build the left subtree
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # Subproblem: build the right subtree
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # Return the root
  root
end

### Build a binary tree ###
def build_tree(preorder, inorder)
  # Map each inorder value to its index in a hash table
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### Driver code ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "Preorder traversal = #{preorder}"
  puts "Inorder traversal = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "Reconstructed binary tree:"
  print_tree(root)
end
