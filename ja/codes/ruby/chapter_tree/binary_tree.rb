=begin
File: binary_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # 二分木を初期化する
  # ノードを初期化する
  n1 = TreeNode.new(1)
  n2 = TreeNode.new(2)
  n3 = TreeNode.new(3)
  n4 = TreeNode.new(4)
  n5 = TreeNode.new(5)
  # ノード間の参照（ポインタ）を構築する
  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  puts "\n二分木を初期化\n\n"
  print_tree(n1)

  # ノードの挿入と削除
  _p = TreeNode.new(0)
  # n1 -> n2 の間にノード _p を挿入する
  n1.left = _p
  _p.left = n2
  puts "\nノード _p を挿入した後\n\n"
  print_tree(n1)
  # ノードを削除
  n1.left = n2
  puts "\nノード _p を削除した後\n\n"
  print_tree(n1)
end
