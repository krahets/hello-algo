=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 前序走訪 ###
def pre_order(root)
  return if root.nil?

  # 訪問優先順序：根節點 -> 左子樹 -> 右子樹
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### 中序走訪 ###
def in_order(root)
  return if root.nil?

  # 訪問優先順序：左子樹 -> 根節點 -> 右子樹
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### 後序走訪 ###
def post_order(root)
  return if root.nil?

  # 訪問優先順序：左子樹 -> 右子樹 -> 根節點
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### Driver Code ###
if __FILE__ == $0
  # 初始化二元樹
  # 這裡藉助了一個從陣列直接生成二元樹的函式
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n初始化二元樹\n\n"
  print_tree(root)

  # 前序走訪
  $res = []
  pre_order(root)
  puts "\n前序走訪的節點列印序列 = #{$res}"

  # 中序走訪
  $res.clear
  in_order(root)
  puts "\nn中序走訪的節點列印序列 = #{$res}"

  # 後序走訪
  $res.clear
  post_order(root)
  puts "\nn後序走訪的節點列印序列 = #{$res}"
end
