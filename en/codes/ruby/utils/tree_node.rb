=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Binary tree node class ###
class TreeNode
  attr_accessor :val    # Node value
  attr_accessor :height # Node height
  attr_accessor :left   # Reference to the left child
  attr_accessor :right  # Reference to the right child

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

### Deserialize a list into a binary tree: recursion ###
def arr_to_tree_dfs(arr, i)
  # Return nil if the index is out of bounds or the corresponding element is nil
  return if i < 0 || i >= arr.length || arr[i].nil?
  # Create the current node
  root = TreeNode.new(arr[i])
  # Recursively build the left and right subtrees
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

### Deserialize a list into a binary tree ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

### Serialize a binary tree into a list: recursion ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

### Serialize a binary tree into a list ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
