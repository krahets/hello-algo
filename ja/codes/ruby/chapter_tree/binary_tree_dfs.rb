=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 行きがけ順走査 ###
def pre_order(root)
  return if root.nil?

  # 訪問順序：根ノード -> 左部分木 -> 右部分木
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### 通りがけ順走査 ###
def in_order(root)
  return if root.nil?

  # 訪問順序：左部分木 -> 根ノード -> 右部分木
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### 帰りがけ順走査 ###
def post_order(root)
  return if root.nil?

  # 訪問順序：左部分木 -> 右部分木 -> 根ノード
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### 実行用コード ###
if __FILE__ == $0
  # 二分木を初期化する
  # ここでは配列から二分木を直接生成する関数を使う
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化する\n\n"
  print_tree(root)

  # 行きがけ順走査
  $res = []
  pre_order(root)
  puts "\n行きがけ順走査で表示するノードの順序 = #{$res}"

  # 通りがけ順走査
  $res.clear
  in_order(root)
  puts "\nn通りがけ順走査で表示するノードの順序 = #{$res}"

  # 帰りがけ順走査
  $res.clear
  post_order(root)
  puts "\nn帰りがけ順走査で表示するノードの順序 = #{$res}"
end
