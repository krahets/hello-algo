=begin
File: build_tree.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Построить двоичное дерево: разделяй и властвуй ###
def dfs(preorder, inorder_map, i, l, r)
  # Завершить при пустом диапазоне поддерева
  return if r - l < 0

  # Инициализировать корневой узел
  root = TreeNode.new(preorder[i])
  # Найти m, чтобы разделить левое и правое поддеревья
  m = inorder_map[preorder[i]]
  # Подзадача: построить левое поддерево
  root.left = dfs(preorder, inorder_map, i + 1, l, m - 1)
  # Подзадача: построить правое поддерево
  root.right = dfs(preorder, inorder_map, i + 1 + m - l, m + 1, r)

  # Вернуть корневой узел
  root
end

# ## Построить двоичное дерево ###
def build_tree(preorder, inorder)
  # Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
  inorder_map = {}
  inorder.each_with_index { |val, i| inorder_map[val] = i }
  dfs(preorder, inorder_map, 0, 0, inorder.length - 1)
end

### Driver Code ###
if __FILE__ == $0
  preorder = [3, 9, 2, 1, 7]
  inorder = [9, 3, 1, 2, 7]
  puts "Предварительный обход = #{preorder}"
  puts "Симметричный обход = #{inorder}"

  root = build_tree(preorder, inorder)
  puts "Построенное двоичное дерево:"
  print_tree(root)
end
