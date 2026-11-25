=begin
File: preorder_traversal_ii_compact.rb
Created Time: 2024-05-22
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Прямой обход: пример 2 ###
def pre_order(root)
  return unless root

  # Пробуем вариант
  $path << root

  # Сохраняем решение
  $res << $path.dup if root.val == 7

  pre_order(root.left)
  pre_order(root.right)

  # Возврат
  $path.pop
end

### Основная программа ###
if __FILE__ == $0
  root = arr_to_tree([1, 7, 3, 4, 5, 6, 7])
  puts "\nСоздаём двоичное дерево"
  print_tree(root)

  # Прямой обход
  $path, $res = [], []
  pre_order(root)

  puts "\nВыводим все пути от корня до узлов со значением 7"
  for path in $res
    p path.map { |node| node.val }
  end
end
