=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Level-order traversal ###
def level_order(root)
  # Initialize queue, add root node
  queue = [root]
  # Initialize a list to save the traversal sequence
  res = []
  while !queue.empty?
    node = queue.shift # Dequeue
    res << node.val # Save node value
    queue << node.left unless node.left.nil? # Left child node enqueue
    queue << node.right unless node.right.nil? # Right child node enqueue
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  # Initialize binary tree
  # Here we use a function to generate a binary tree directly from an array
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nInitialize binary tree\n\n"
  print_tree(root)

  # Level-order traversal
  res = level_order(root)
  puts "\nLevel-order traversal node sequence = #{res}"
end
