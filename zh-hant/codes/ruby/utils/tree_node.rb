=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二元樹節點類別 ###
class TreeNode
  attr_accessor :val    # 節點值
  attr_accessor :height # 節點高度
  attr_accessor :left   # 指向左子節點的參照
  attr_accessor :right  # 指向右子節點的參照

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

### 以遞迴方式將陣列反序列化為二元樹 ###
def arr_to_tree_dfs(arr, i)
  # 若索引超出陣列範圍，或對應的元素為 nil，就回傳 nil
  return if i < 0 || i >= arr.length || arr[i].nil?
  # 建立目前的節點
  root = TreeNode.new(arr[i])
  # 以遞迴方式建立左右子樹
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

### 將陣列反序列化為二元樹 ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

### 以遞迴方式將二元樹序列化為陣列 ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

### 將二元樹序列化為陣列 ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
