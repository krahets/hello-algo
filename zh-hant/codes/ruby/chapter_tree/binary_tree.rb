=begin
File: binary_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # 初始化二元樹
  # 初始化節點
  n1 = TreeNode.new(1)
  n2 = TreeNode.new(2)
  n3 = TreeNode.new(3)
  n4 = TreeNode.new(4)
  n5 = TreeNode.new(5)
  # 構建節點之間的引用（指標）
  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  puts "\n初始化二元樹\n\n"
  print_tree(n1)

  # 插入與刪除節點
  _p = TreeNode.new(0)
  # 在 n1 -> n2 中間插入節點 _p
  n1.left = _p
  _p.left = n2
  puts "\n插入節點 _p 後\n\n"
  print_tree(n1)
  # 刪除節點
  n1.left = n2
  puts "\n刪除節點 _p 後\n\n"
  print_tree(n1)
end
