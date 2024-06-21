=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 构建二叉树：分治 ###
def dfs(preorder, inorder_map, i, l, r)
  # 子树区间为空时终止
  return if r - l < 0

  # 初始化根节点
  root = TreeNode.new(preorder[i])
  # 查询 m ，从而划分左右子树
  m = inorder_map[preorder[i]]
  # 子问题：构建左子树
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # 子问题：构建右子树
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # 返回根节点
  root
end

### 构建二叉树 ###
def build_tree(preorder, inorder)
  # 初始化哈希表，存储 inorder 元素到索引的映射
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### Driver Code ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "前序遍历 = #{preorder}"
  puts "中序遍历 = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "构建的二叉树为："
  print_tree(root)
end
