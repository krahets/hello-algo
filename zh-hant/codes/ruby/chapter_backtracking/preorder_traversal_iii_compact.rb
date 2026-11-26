=begin
File: preorder_traversal_iii_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### 前序走訪：例題三 ###
def pre_order(root)
  # 剪枝
  return if !root || root.val == 3

  # 嘗試
  $path.append(root)

  # 記錄此解
  $res << $path.dup if root.val == 7

  pre_order(root.left)
  pre_order(root.right)

  # 回溯
  $path.pop
end

### 主程式 ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\n初始化二元樹"
  print_tree(root)

  # 前序走訪
  $path, $res = [], []
  pre_order(root)

  puts "\n輸出從根節點到值為 7 的節點的所有路徑，且路徑中不含值為 3 的節點"
  for path in $res
    p path.map { |node| node.val }
  end
end
