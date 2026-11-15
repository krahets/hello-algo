=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 二叉树节点类 ###
class TreeNode
  attr_accessor :val    # 节点值
  attr_accessor :height # 节点高度
  attr_accessor :left   # 左子节点引用
  attr_accessor :right  # 右子节点引用

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

### 将列表反序列化为二叉数树：递归 ###
def arr_to_tree_dfs(arr, i)
  # 如果索引超出数组长度，或者对应的元素为 nil ，则返回 nil
  return if i < 0 || i >= arr.length || arr[i].nil?
  # 构建当前节点
  root = TreeNode.new(arr[i])
  # 递归构建左右子树
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

### 将列表反序列化为二叉树 ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

### 将二叉树序列化为列表：递归 ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

### 将二叉树序列化为列表 ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
