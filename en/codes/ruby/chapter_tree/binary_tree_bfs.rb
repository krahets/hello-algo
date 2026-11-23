=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Level-order traversal ###
def level_order(root)
  # Initialize a queue and enqueue the root
  queue = [root]
  # Initialize a list to store the traversal sequence
  res = []
  while !queue.empty?
    node = queue.shift # Dequeue from the queue
    res << node.val # Store the node value
    queue << node.left unless node.left.nil? # Enqueue the left child
    queue << node.right unless node.right.nil? # Enqueue the right child
  end
  res
end

### Driver code ###
if __FILE__ == $0
  # Initialize the binary tree
  # Use a helper function that builds a binary tree directly from an array
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nInitialize the binary tree\n\n"
  print_tree(root)

  # Level-order traversal
  res = level_order(root)
  puts "\nNode sequence from level-order traversal = #{res}"
end
