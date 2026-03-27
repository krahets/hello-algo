=begin
File: tree_node.rb
Created Time: 2024-03-30
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

# ## Класс узла двоичного дерева ###
class TreeNode
  attr_accessor :val    # Значение узла
  attr_accessor :height # Высота узла
  attr_accessor :left   # Ссылка на левый дочерний узел
  attr_accessor :right  # Ссылка на правый дочерний узел

  def initialize(val=0)
    @val = val
    @height = 0
  end
end

# ## Десериализация списка в двоичное дерево: рекурсия ###
def arr_to_tree_dfs(arr, i)
  # Если индекс выходит за длину массива или соответствующий элемент равен nil, вернуть nil
  return if i < 0 || i >= arr.length || arr[i].nil?
  # Построить текущий узел
  root = TreeNode.new(arr[i])
  # Рекурсивно построить левое и правое поддеревья
  root.left = arr_to_tree_dfs(arr, 2 * i + 1)
  root.right = arr_to_tree_dfs(arr, 2 * i + 2)
  root
end

# ## Десериализация списка в двоичное дерево ###
def arr_to_tree(arr)
  arr_to_tree_dfs(arr, 0)
end

# ## Сериализация двоичного дерева в список: рекурсия ###
def tree_to_arr_dfs(root, i, res)
  return if root.nil?

  res += Array.new(i - res.length + 1) if i >= res.length
  res[i] = root.val

  tree_to_arr_dfs(root.left, 2 * i + 1, res)
  tree_to_arr_dfs(root.right, 2 * i + 2, res)
end

# ## Сериализация двоичного дерева в список ###
def tree_to_arr(root)
  res = []
  tree_to_arr_dfs(root, 0, res)
  res
end
