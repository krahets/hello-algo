=begin
File: preorder_traversal_i_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Предварительный обход: пример 1 ###
def pre_order(root)
  return unless root

  # Записать решение
  $res << root if root.val == 7

  pre_order(root.left)
  pre_order(root.right)
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nИнициализация двоичного дерева"
  print_tree(root)

  # Предварительный обход
  $res = []
  pre_order(root)

  puts "\nВсе узлы со значением 7"
  p $res.map { |node| node.val }
end
