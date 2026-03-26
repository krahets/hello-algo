=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## двоичное дерево поиска ###
class BinarySearchTree
  # ## Конструктор ###
  def initialize
    # Инициализировать пустое дерево
    @root = nil
  end

  # ## Получить корневой узел двоичного дерева ###
  def get_root
    @root
  end

  # ## Найти узел ###
  def search(num)
    cur = @root

    # Выполнять поиск в цикле и выйти после прохождения листового узла
    while !cur.nil?
      # Целевой узел находится в правом поддереве cur
      if cur.val < num
        cur = cur.right
      # Целевой узел находится в левом поддереве cur
      elsif cur.val > num
        cur = cur.left
      # Найти целевой узел и выйти из цикла
      else
        break
      end
    end

    cur
  end

  # ## вставить узел ###
  def insert(num)
    # Если дерево пусто, инициализировать корневой узел
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # Выполнять поиск в цикле и выйти после прохождения листового узла
    cur, pre = @root, nil
    while !cur.nil?
      # Найти дублирующийся узел и сразу вернуть результат
      return if cur.val == num

      pre = cur
      # Позиция вставки находится в правом поддереве cur
      if cur.val < num
        cur = cur.right
      # Позиция вставки находится в левом поддереве cur
      else
        cur = cur.left
      end
    end

    # Вставить узел
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  # ## Удалить узел ###
  def remove(num)
    # Если дерево пусто, сразу вернуть результат
    return if @root.nil?

    # Выполнять поиск в цикле и выйти после прохождения листового узла
    cur, pre = @root, nil
    while !cur.nil?
      # Найти узел для удаления и выйти из цикла
      break if cur.val == num

      pre = cur
      # Удаляемый узел находится в правом поддереве cur
      if cur.val < num
        cur = cur.right
      # Удаляемый узел находится в левом поддереве cur
      else
        cur = cur.left
      end
    end
    # Если узла для удаления нет, сразу вернуть результат
    return if cur.nil?

    # Число дочерних узлов = 0 или 1
    if cur.left.nil? || cur.right.nil?
      # Когда число дочерних узлов равно 0 / 1, child = null / этот дочерний узел
      child = cur.left || cur.right
      # Удалить узел cur
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # Если удаляемый узел является корневым, заново назначить корневой узел
        @root = child
      end
    # Число дочерних узлов = 2
    else
      # Получить следующий узел после cur в симметричном обходе
      tmp = cur.right
      while !tmp.left.nil?
        tmp = tmp.left
      end
      # Рекурсивно удалить узел tmp
      remove(tmp.val)
      # Заменить cur значением tmp
      cur.val = tmp.val
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализировать двоичное дерево поиска
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
  nums.each { |num| bst.insert(num) }
  puts "\nИнициализированное двоичное дерево:\n"
  print_tree(bst.get_root)

  # Найти узел
  node = bst.search(7)
  puts "\nНайденныйузелобъектравно: #{node}, значение узла = #{node.val}"

  # Вставить узел
  bst.insert(16)
  puts "\nПосле вставки узла 16 двоичное дерево имеет вид\n"
  print_tree(bst.get_root)

  # Удалить узел
  bst.remove(1)
  puts "\nПосле удаления узла 1 двоичное дерево имеет вид\n"
  print_tree(bst.get_root)

  bst.remove(2)
  puts "\nПосле удаления узла 2 двоичное дерево имеет вид\n"
  print_tree(bst.get_root)

  bst.remove(4)
  puts "\nПосле удаления узла 4 двоичное дерево имеет вид\n"
  print_tree(bst.get_root)
end
