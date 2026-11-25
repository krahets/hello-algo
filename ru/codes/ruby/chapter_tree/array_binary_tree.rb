=begin
File: array_binary_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Класс двоичного дерева на основе массива ###
class ArrayBinaryTree
  ### Конструктор ###
  def initialize(arr)
    @tree = arr.to_a
  end

  ### Ёмкость списка ###
  def size
    @tree.length
  end

  ### Получить значение узла с индексом i ###
  def val(i)
    # Если индекс выходит за границы массива, вернуть nil — признак пустой позиции
    return if i < 0 || i >= size

    @tree[i]
  end

  ### Получить индекс левого потомка узла с индексом i ###
  def left(i)
    2 * i + 1
  end

  ### Получить индекс правого потомка узла с индексом i ###
  def right(i)
    2 * i + 2
  end

  ### Получить индекс родителя узла с индексом i ###
  def parent(i)
    (i - 1) / 2
  end

  ### Обход по уровням ###
  def level_order
    @res = []

    # Пройти непосредственно по массиву
    for i in 0...size
      @res << val(i) unless val(i).nil?
    end

    @res
  end

  ### Обход в глубину ###
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

  ### Прямой обход ###
  def pre_order
    @res = []
    dfs(0, :pre)
    @res
  end

  ### Симметричный обход ###
  def in_order
    @res = []
    dfs(0, :in)
    @res
  end

  ### Обратный обход ###
  def post_order
    @res = []
    dfs(0, :post)
    @res
  end
end

### Основная программа ###
if __FILE__ == $0
  # Инициализация двоичного дерева
  # Используем функцию, которая строит двоичное дерево непосредственно из массива
  arr = [1, 2, 3, 4, nil, 6, 7, 8, 9, nil, nil, 12, nil, nil, 15]
  root = arr_to_tree(arr)
  puts "\nИнициализация двоичного дерева\n\n"
  puts 'Двоичное дерево в виде массива:'
  pp arr
  puts 'Связное представление двоичного дерева:'
  print_tree(root)

  # Класс двоичного дерева на основе массива
  abt = ArrayBinaryTree.new(arr)

  # Доступ к узлу
  i = 1
  l, r, _p = abt.left(i), abt.right(i), abt.parent(i)
  puts "\nИндекс текущего узла: #{i}, значение: #{abt.val(i).inspect}"
  puts "Индекс левого потомка: #{l}, значение: #{abt.val(l).inspect}"
  puts "Индекс правого потомка: #{r}, значение: #{abt.val(r).inspect}"
  puts "Индекс родителя: #{_p}, значение: #{abt.val(_p).inspect}"

  # Обход дерева
  res = abt.level_order
  puts "\nОбход по уровням: #{res}"
  res = abt.pre_order
  puts "Прямой обход: #{res}"
  res = abt.in_order
  puts "Симметричный обход: #{res}"
  res = abt.post_order
  puts "Обратный обход: #{res}"
end
