=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 前順走査 ###
def pre_order(root)
  return if root.nil?

  # 訪問順序：根ノード -> 左部分木 -> 右部分木
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### 中順走査 ###
def in_order(root)
  return if root.nil?

  # 訪問優先順: 左部分木 -> 根ノード -> 右部分木
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### 後順走査 ###
def post_order(root)
  return if root.nil?

  # 訪問優先順: 左部分木 -> 右部分木 -> 根ノード
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### Driver Code ###
if __FILE__ == $0
  # 二分木を初期化
  # ここでは、配列から直接二分木を生成する関数を利用する
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化\n\n"
  print_tree(root)

  # 先行順走査
  $res = []
  pre_order(root)
  puts "\n前順走査のノード出力順 = #{$res}"

  # 中順走査
  $res.clear
  in_order(root)
  puts "\nn中順走査のノード出力順 = #{$res}"

  # 後順走査
  $res.clear
  post_order(root)
  puts "\nn後順走査のノード出力順 = #{$res}"
end
