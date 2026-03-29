=begin
File: preorder_traversal_ii_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 前順走査：例題2 ###
def pre_order(root)
  return unless root

  # 試す
  $path << root

  # 解を記録
  $res << $path.dup if root.val == 7

  pre_order(root.left)
  pre_order(root.right)

  # バックトラック
  $path.pop
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化"
  print_tree(root)

  # 先行順走査
  $path, $res = [], []
  pre_order(root)

  puts "\n根ノードからノード 7 までのすべての経路を出力"
  for path in $res
    p path.map { |node| node.val }
  end
end
