=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### Двоичное дерево поиска ###
class BinarySearchTree
  ### Конструктор ###
  def initialize
    # Инициализация пустого дерева
    @root = nil
  end

  ### Получить корень двоичного дерева ###
  def get_root
    @root
  end

  ### Поиск узла ###
  def search(num)
    cur = @root

    # Искать в цикле до выхода за пределы листа
    while !cur.nil?
      # Искомый узел в правом поддереве cur
      if cur.val < num
        cur = cur.right
      # Искомый узел в левом поддереве cur
      elsif cur.val > num
        cur = cur.left
      # Узел найден: выйти из цикла
      else
        break
      end
    end

    cur
  end

  ### Вставка узла ###
  def insert(num)
    # Если дерево пусто, создать корень
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # Искать в цикле до выхода за пределы листа
    cur, pre = @root, nil
    while !cur.nil?
      # Такой узел уже есть: завершить вызов
      return if cur.val == num

      pre = cur
      # Место вставки в правом поддереве cur
      if cur.val < num
        cur = cur.right
      # Место вставки в левом поддереве cur
      else
        cur = cur.left
      end
    end

    # Вставка узла
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  ### Удаление узла ###
  def remove(num)
    # Если дерево пусто, сразу завершить вызов
    return if @root.nil?

    # Искать в цикле до выхода за пределы листа
    cur, pre = @root, nil
    while !cur.nil?
      # Узел для удаления найден: выйти из цикла
      break if cur.val == num

      pre = cur
      # Узел для удаления в правом поддереве cur
      if cur.val < num
        cur = cur.right
      # Узел для удаления в левом поддереве cur
      else
        cur = cur.left
      end
    end
    # Если узел для удаления не найден, завершить вызов
    return if cur.nil?

    # Число потомков равно 0 или 1
    if cur.left.nil? || cur.right.nil?
      # Если потомков нет, child = null, если потомок один, child указывает на него
      child = cur.left || cur.right
      # Удалить узел cur
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # Если удаляется корень, назначить новый корень
        @root = child
      end
    # Число потомков равно 2
    else
      # Найти следующий за cur узел в порядке симметричного обхода
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # Рекурсивно удалить узел tmp
      remove(tmp.val)
      # Заменить значение cur значением tmp
      cur.val = tmp.val
    end
  end
end

### Основная программа ###
if __FILE__ == $0
  # Инициализация двоичного дерева поиска
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
  nums.each { |num| bst.insert(num) }
  puts "\nИсходное двоичное дерево:\n"
  print_tree(bst.get_root)

  # Поиск узла
  node = bst.search(7)
  puts "\nНайденный узел: #{node}, значение узла = #{node.val}"

  # Вставка узла
  bst.insert(16)
  puts "\nДвоичное дерево после вставки узла 16:\n"
  print_tree(bst.get_root)

  # Удаление узла
  bst.remove(1)
  puts "\nДвоичное дерево после удаления узла 1:\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\nДвоичное дерево после удаления узла 2:\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\nДвоичное дерево после удаления узла 4:\n"
  print_tree(bst.get_root)
end
