=begin
File: preorder_traversal_iii_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Предварительный обход: пример 3 ###
def pre_order(root)
  # Отсечение
  return if !root || root.val == 3

  # Попытка
  $path.append(root)

  # Записать решение
  $res << $path.dup if root.val == 7

  pre_order(root.left)
  pre_order(root.right)

  # Откат
  $path.pop
end

### Driver Code ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nИнициализация двоичного дерева"
  print_tree(root)

  # Предварительный обход
  $path, $res = [], []
  pre_order(root)

  puts "\nВсе пути от корня к узлу 7, не содержащие узлов со значением 3"
  for path in $res
    p path.map { |node| node.val }
  end
end
