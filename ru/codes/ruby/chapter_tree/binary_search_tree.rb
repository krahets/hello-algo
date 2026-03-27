=begin
File: binary_search_tree.rb
Created Time: 2024-04-18
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## Двоичное дерево поиска ###
class BinarySearchTree
  # ## Конструктор ###
  def initialize
    # Инициализировать пустое дерево
    @root = nil
  end

  # ## Получение корневого узла двоичного дерева ###
  def get_root
    @root
  end

  # ## Поиск узла ###
  def search(num)
    cur = @root

    # Искать в цикле и выйти после прохода за листовой узел
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

  # ## Вставка узла ###
  def insert(num)
    # Если дерево пусто, инициализировать корневой узел
    if @root.nil?
      @root = TreeNode.new(num)
      return
    end

    # Искать в цикле и выйти после прохода за листовой узел
    cur, pre = @root, nil
    while !cur.nil?
      # Найти повторяющийся узел и сразу вернуть
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

    # Вставка узла
    node = TreeNode.new(num)
    if pre.val < num
      pre.right = node
    else
      pre.left = node
    end
  end

  # ## Удаление узла ###
  def remove(num)
    # Если дерево пусто, сразу вернуть
    return if @root.nil?

    # Искать в цикле и выйти после прохода за листовой узел
    cur, pre = @root, nil
    while !cur.nil?
      # Найти узел для удаления и выйти из цикла
      break if cur.val == num

      pre = cur
      # Узел для удаления находится в правом поддереве cur
      if cur.val < num
        cur = cur.right
      # Узел для удаления находится в левом поддереве cur
      else
        cur = cur.left
      end
    end
    # Если узел для удаления отсутствует, сразу вернуть
    return if cur.nil?

    # Число дочерних узлов = 0 или 1
    if cur.left.nil? || cur.right.nil?
      # Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
      child = cur.left || cur.right
      # Удалить узел cur
      if cur != @root
        if pre.left == cur
          pre.left = child
        else
          pre.right = child
        end
      else
        # Если удаляемый узел является корнем, заново назначить корневой узел
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
      # Перезаписать cur значением tmp
      cur.val = tmp.val
    end
  end
end

### Driver Code ###
if __FILE__ == $0
  # Инициализация двоичного дерева поиска
  bst = BinarySearchTree.new
  nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15]
  # Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
  nums.each { |num| bst.insert(num) }
  puts "\nИсходное двоичное дерево\n"
  print_tree(bst.get_root)

  # Поиск узла
  node = bst.search(7)
  puts "\nНайденный объект узла: #{node}, значение узла = #{node.val}"

  # Вставка узла
  bst.insert(16)
  puts "\nПосле вставки узла 16 двоичное дерево имеет вид\n"
  print_tree(bst.get_root)

  # Удаление узла
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
