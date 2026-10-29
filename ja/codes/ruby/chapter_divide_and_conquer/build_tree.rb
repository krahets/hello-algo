=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 二分木の構築：分割統治法 ###
def dfs(preorder, inorder_map, i, l, r)
  # 部分木の区間が空の場合、終了する
  return if r - l < 0

  # 根ノードを初期化する
  root = TreeNode.new(preorder[i])
  # m を調べ、左右の部分木に分割する
  m = inorder_map[preorder[i]]
  # 部分問題：左部分木の構築
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # 部分問題：右部分木の構築
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # 根ノードを返す
  root
end

### 二分木を構築する ###
def build_tree(preorder, inorder)
  # inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### 実行用コード ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "行きがけ順走査 = #{preorder}"
  puts "通りがけ順走査 = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "構築した二分木："
  print_tree(root)
end
