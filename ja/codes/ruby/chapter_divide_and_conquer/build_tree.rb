=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 二分木を構築：分割統治 ###
def dfs(preorder, inorder_map, i, l, r)
  # 部分木区間が空なら終了する
  return if r - l < 0

  # ルートノードを初期化する
  root = TreeNode.new(preorder[i])
  # m を求めて左右部分木を分割する
  m = inorder_map[preorder[i]]
  # 部分問題：左部分木を構築する
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # 部分問題：右部分木を構築する
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # 根ノードを返す
  root
end

### 二分木を構築 ###
def build_tree(preorder, inorder)
  # inorder の要素からインデックスへの対応を格納するハッシュテーブルを初期化する
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### Driver Code ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "前順走査 = #{preorder}"
  puts "中順走査 = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "構築した二分木は："
  print_tree(root)
end
