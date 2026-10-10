=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Binary tree node class ###
class TreeNode
  attr_accessor :val    # Node value
  attr_accessor :height # Node height
  attr_accessor :left   # Reference to left child node
  attr_accessor :right  # Reference to right child node

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

### Deserialize list to binary tree: recursion ###
def arr_to_tree_dfs(arr, i)
  # Return nil if index exceeds array length or element is nil
  return if i < 0 || i >= arr.length || arr[i].nil?
  # Build the current node
  root = TreeNode.new(arr[i])
  # Recursively build the left and right subtrees
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

### Deserialize list to binary tree ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

### Serialize binary tree to list: recursion ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

### Serialize binary tree to list ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
