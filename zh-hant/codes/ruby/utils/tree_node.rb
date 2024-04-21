=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二元樹節點類別 ###
class TreeNode
  attr_accessor :val    # 節點值
  attr_accessor :height # 節點高度
  attr_accessor :left   # 左子節點引用
  attr_accessor :right  # 右子節點引用

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

### 將串列反序列化為二元數樹：遞迴 ###
def arr_to_tree_dfs(arr, i)
  # 如果索引超出陣列長度，或者對應的元素為 nil ，則返回 nil
  return if i < 0 || i >= arr.length || arr[i].nil?
  # 構建當前節點
  root = TreeNode.new(arr[i])
  # 遞迴構建左右子樹
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

### 將串列反序列化為二元樹 ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

### 將二元樹序列化為串列：遞迴 ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

### 將二元樹序列化為串列 ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
