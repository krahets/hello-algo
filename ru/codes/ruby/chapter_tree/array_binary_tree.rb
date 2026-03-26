=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Класс двоичного дерева в массивном представлении ###
class ArrayBinaryTree
  # ## Конструктор ###
  def initialize(arr)
    @tree = arr.to_a
  end

  # ## Вместимость списка ###
  def size
    @tree.length
  end

  # ## Получить значение узла с индексом i ###
  def val(i)
    # Если индекс выходит за границы, вернуть nil, обозначающий пустую клетку
    return if i < 0 || i >= size

    @tree[i]
  end

  # ## Получить индекс левого дочернего узла узла с индексом i ###
  def left(i)
    2 * i + 1
  end

  # ## Получить индекс правого дочернего узла узла с индексом i ###
  def right(i)
    2 * i + 2
  end

  # ## Получить индекс родительского узла узла с индексом i ###
  def parent(i)
    (i - 1) / 2
  end

  # ## обход по уровням ###
  def level_order
    @res = []

    # Непосредственно обойти массив
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  # ## обход в глубину ###
  def dfs(i, order)
    return if val(i).nil?
    # Прямой обход
    @res << val(i) if order == :pre
    dfs(left(i), order)
    # Симметричный обход
    @res << val(i) if order == :in
    dfs(right(i), order)
    # Обратный обход
    @res << val(i) if order == :post
  end

  # ## прямой обход ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  # ## симметричный обход ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  # ## обратный обход ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двоичное дерево
  # Здесь используется функция, которая напрямую строит двоичное дерево из массива
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\nИнициализировать двоичное дерево\n\n"
  puts 'Массивное представление двоичного дерева:'
  pp arr
  puts 'Связное представление двоичного дерева:'
  print_tree(root)

  # Класс двоичного дерева в массивном представлении
  abt = ArrayBinaryTree.new(arr)

  # Получить доступ к узлу
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\nИндекс текущего узла равен #{i}, значение равно #{abt.val(i).inspect}"
  puts "Индекс его левого дочернего узла равен #{l}, значение равно #{abt.val(l).inspect}"
  puts "Индекс его правого дочернего узла равен #{r}, значение равно #{abt.val(r).inspect}"
  puts "Индекс его родительского узла равен #{_p}, значение равно #{abt.val(_p).inspect}"

  # Обойти дерево
  res = abt.level_order
  puts "\nобход по уровнямравно: #{res}"
  res = abt.pre_order
  puts "прямой обходравно: #{res}"
  res = abt.in_order
  puts "симметричный обходравно: #{res}"
  res = abt.post_order
  puts "обратный обходравно: #{res}"
end
