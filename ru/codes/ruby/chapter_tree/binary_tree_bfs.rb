=begin
File: binary_tree_bfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## обход по уровням ###
def level_order(root)
  # Инициализировать очередь и добавить корневой узел
  queue = [root]
  # Инициализировать список для хранения последовательности обхода
  res = []
  while !queue.empty?
    node = queue.shift # Извлечение из очереди
    res << node.val # Сохранить значение узла
    queue << node.left unless node.left.nil? # Поместить левого потомка в очередь
    queue << node.right unless node.right.nil? # Поместить правого потомка в очередь
  end
  res
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двоичное дерево
  # Здесь используется функция, которая напрямую строит двоичное дерево из массива
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nИнициализировать двоичное дерево\n\n"
  print_tree(root)

  # Обход по уровням
  res = level_order(root)
  puts "\nПоследовательность узлов при обходе по уровням = #{res}"
end
