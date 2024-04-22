=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 前序遍历 ###
def pre_order(root)
  return if root.nil?

  # 访问优先级：根节点 -> 左子树 -> 右子树
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### 中序遍历 ###
def in_order(root)
  return if root.nil?

  # 访问优先级：左子树 -> 根节点 -> 右子树
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### 后序遍历 ###
def post_order(root)
  return if root.nil?

  # 访问优先级：左子树 -> 右子树 -> 根节点
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### Driver Code ###
if __FILE__ == $0
  # 初始化二叉树
  # 这里借助了一个从数组直接生成二叉树的函数
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n初始化二叉树\n\n"
  print_tree(root)

  # 前序遍历
  $res = []
  pre_order(root)
  puts "\n前序遍历的节点打印序列 = #{$res}"

  # 中序遍历
  $res.clear
  in_order(root)
  puts "\nn中序遍历的节点打印序列 = #{$res}"

  # 后序遍历
  $res.clear
  post_order(root)
  puts "\nn后序遍历的节点打印序列 = #{$res}"
end
