=begin
File: binary_tree_dfs.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Предварительный обход ###
def pre_order(root)
  return if root.nil?

  # Порядок обхода: корень -> левое поддерево -> правое поддерево
  $res << root.val
  pre_order(root.left)
  pre_order(root.right)
end

# ## Симметричный обход ###
def in_order(root)
  return if root.nil?

  # Порядок обхода: левое поддерево -> корень -> правое поддерево
  in_order(root.left)
  $res << root.val
  in_order(root.right)
end

# ## Обратный обход ###
def post_order(root)
  return if root.nil?

  # Порядок обхода: левое поддерево -> правое поддерево -> корень
  post_order(root.left)
  post_order(root.right)
  $res << root.val
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двоичное дерево
  # Здесь используется функция, напрямую строящая двоичное дерево из массива
  root = arr_to_tree([1, 2, 3, 4, 5, 6, 7])
  puts "\nИнициализация двоичного дерева\n\n"
  print_tree(root)

  # Предварительный обход
  $res = []
  pre_order(root)
  puts "\nПоследовательность печати узлов при предварительном обходе = #{$res}"

  # Симметричный обход
  $res.clear
  in_order(root)
  puts "\nПоследовательность печати узлов при симметричном обходе = #{$res}"

  # Обратный обход
  $res.clear
  post_order(root)
  puts "\nПоследовательность печати узлов при обратном обходе = #{$res}"
end
