=begin
File: preorder_traversal_iii_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 行きがけ順走査：例題 3 ###
def pre_order(root)
  # 枝刈り
  return if !root || root.val == 3

  # 試行
  $path.append(root)

  # 解を記録する
  $res << $path.dup if root.val == 7

  pre_order(root.left)
  pre_order(root.right)

  # 後戻り
  $path.pop
end

### 実行例 ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n二分木を初期化"
  print_tree(root)

  # 行きがけ順走査
  $path, $res = [], []
  pre_order(root)

  puts "\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力"
  for path in $res
    p path.map { |node| node.val }
  end
end
