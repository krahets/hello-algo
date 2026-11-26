=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Обход по уровням ###
def level_order(root)
  # Создать очередь и добавить корень
  queue = [root]
  # Создать список для последовательности обхода
  res = []
  while !queue.empty?
    node = queue.shift # Извлечь узел из очереди
    res << node.val # Сохранить значение узла
    queue << node.left unless node.left.nil? # Добавить левого потомка в очередь
    queue << node.right unless node.right.nil? # Добавить правого потомка в очередь
  end
  res
end

### Основная программа ###
if __FILE__ == $0
  # Инициализация двоичного дерева
  # Используем функцию, которая строит двоичное дерево непосредственно из массива
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nИнициализация двоичного дерева\n\n"
  print_tree(root)

  # Обход по уровням
  res = level_order(root)
  puts "\nУзлы в порядке обхода по уровням = #{res}"
end
