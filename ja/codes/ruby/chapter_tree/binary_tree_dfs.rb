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

  # 訪問順：根 -> 左部分木 -> 右部分木
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

### 通りがけ順走査 ###
def in_order(root)
  return if root.nil?

  # 訪問順：左部分木 -> 根 -> 右部分木
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

### 帰りがけ順走査 ###
def post_order(root)
  return if root.nil?

  # 訪問順：左部分木 -> 右部分木 -> 根
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### 実行例 ###
if __FILE__ == $0
  # 二分木を初期化する
  # ここでは配列から直接二分木を作る関数を使う
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化\n\n"
  print_tree(root)

  # 行きがけ順走査
  $res = []
  pre_order(root)
  puts "\n行きがけ順に出力したノードの列 = #{$res}"

  # 通りがけ順走査
  $res.clear
  in_order(root)
  puts "\nn通りがけ順に出力したノードの列 = #{$res}"

  # 帰りがけ順走査
  $res.clear
  post_order(root)
  puts "\nn帰りがけ順に出力したノードの列 = #{$res}"
end
