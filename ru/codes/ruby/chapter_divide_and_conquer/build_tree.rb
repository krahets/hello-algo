=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Построение двоичного дерева методом «разделяй и властвуй» ###
def dfs(preorder, inorder_map, i, l, r)
  # Если интервал поддерева пуст, завершаем рекурсию
  return if r - l < 0

  # Создаём корень
  root = TreeNode.new(preorder[i])
  # Находим m и разделяем левое и правое поддеревья
  m = inorder_map[preorder[i]]
  # Подзадача: строим левое поддерево
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # Подзадача: строим правое поддерево
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # Возвращаем корень
  root
end

### Построение двоичного дерева ###
def build_tree(preorder, inorder)
  # Создаём хеш-таблицу индексов элементов inorder
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### Основная программа ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "Прямой обход = #{preorder}"
  puts "Симметричный обход = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "Построенное двоичное дерево:"
  print_tree(root)
end
