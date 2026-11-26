=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 建構二元樹：分治法 ###
def dfs(preorder, inorder_map, i, l, r)
  # 子樹區間為空時終止
  return if r - l < 0

  # 初始化根節點
  root = TreeNode.new(preorder[i])
  # 查出 m，據此劃分左右子樹
  m = inorder_map[preorder[i]]
  # 子問題：建構左子樹
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # 子問題：建構右子樹
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # 回傳根節點
  root
end

### 建構二元樹 ###
def build_tree(preorder, inorder)
  # 初始化雜湊表，記錄 inorder 中各元素對應的索引
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### 主程式 ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "前序走訪 = #{preorder}"
  puts "中序走訪 = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "建構出的二元樹為："
  print_tree(root)
end
