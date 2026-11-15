=begin
File: binary_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Driver Code ###
if __FILE__ == $0
  # Инициализация двоичного дерева
  # Инициализация узлов
  n1 = TreeNode.new(1)
  n2 = TreeNode.new(2)
  n3 = TreeNode.new(3)
  n4 = TreeNode.new(4)
  n5 = TreeNode.new(5)
  # Построить связи между узлами (указатели)
  n1.left = n2
  n1.right = n3
  n2.left = n4
  n2.right = n5
  puts "\nИнициализация двоичного дерева\n\n"
  print_tree(n1)

  # Вставка и удаление узлов
  _p = TreeNode.new(0)
  # Вставить узел _p между n1 -> n2
  n1.left = _p
  _p.left = n2
  puts "\nПосле вставки узла _p\n\n"
  print_tree(n1)
  # Удаление узла
  n1.left = n2
  puts "\nПосле удаления узла _p\n\n"
  print_tree(n1)
end
