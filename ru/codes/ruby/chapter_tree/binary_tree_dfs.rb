=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## прямой обход ###
def pre_order(root)
  return if root.nil?

  # Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

# ## симметричный обход ###
def in_order(root)
  return if root.nil?

  # Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

# ## обратный обход ###
def post_order(root)
  return if root.nil?

  # Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двоичное дерево
  # Здесь используется функция, которая напрямую строит двоичное дерево из массива
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nИнициализировать двоичное дерево\n\n"
  print_tree(root)

  # Прямой обход
  $res = []
  pre_order(root)
  puts "\nПоследовательность узлов при прямом обходе = #{$res}"

  # Симметричный обход
  $res.clear
  in_order(root)
  puts "\nnПоследовательность узлов при симметричном обходе = #{$res}"

  # Обратный обход
  $res.clear
  post_order(root)
  puts "\nnПоследовательность узлов при обратном обходе = #{$res}"
end
