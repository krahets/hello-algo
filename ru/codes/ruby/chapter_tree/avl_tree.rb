=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

# ## AVL-дерево ###
class AVLTree
  # ## Конструктор ###
  def initialize
    @root = nil
  end

  # ## Получение корневого узла двоичного дерева ###
  def get_root
    @root
  end

  # ## Получить высоту узла ###
  def height(node)
    # Высота пустого узла равна -1, высота листового узла равна 0
    return node.height unless node.nil?

    -1
  end

  # ## Обновить высоту узла ###
  def update_height(node)
    # Высота узла равна высоте более высокого поддерева + 1
    node.height = [height(node.left), height(node.right)].max + 1
  end

  # ## Получить коэффициент баланса ###
  def balance_factor(node)
    # Коэффициент баланса пустого узла равен 0
    return 0 if node.nil?

    # Коэффициент баланса узла = высота левого поддерева - высота правого поддерева
    height(node.left) - height(node.right)
  end

  # ## Операция правого вращения ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # Выполнить правое вращение узла node вокруг child
    child.right = node
    node.left = grand_child
    # Обновить высоту узла
    update_height(node)
    update_height(child)
    # Вернуть корневой узел поддерева после вращения
    child
  end

  # ## Операция левого вращения ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # Выполнить левое вращение узла node вокруг child
    child.left = node
    node.right = grand_child
    # Обновить высоту узла
    update_height(node)
    update_height(child)
    # Вернуть корневой узел поддерева после вращения
    child
  end

  # ## Выполнить вращение, чтобы снова сбалансировать поддерево ###
  def rotate(node)
    # Получить коэффициент баланса узла node
    balance_factor = balance_factor(node)
    # Обойти левое поддерево
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # Правое вращение
        return right_rotate(node)
      else
        # Сначала левое вращение, затем правое
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # Правостороннее дерево обхода
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # Левое вращение
        return left_rotate(node)
      else
        # Сначала правое вращение, затем левое
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # Дерево сбалансировано, вращение не требуется, вернуть сразу
    node
  end

  # ## Вставка узла ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  # ## Рекурсивная вставка узла (вспомогательный метод) ###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. Найти позицию вставки и вставить узел
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # Повторяющийся узел не вставлять, сразу вернуть
      return node
    end
    # Обновить высоту узла
    update_height(node)
    # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
    rotate(node)
  end

  # ## Удаление узла ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  # ## Рекурсивное удаление узла (вспомогательный метод) ###
  def remove_helper(node, val)
    return if node.nil?
    # 1. Найти узел и удалить его
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # Число дочерних узлов = 0, удалить node и сразу вернуть
        return if child.nil?
        # Число дочерних узлов = 1, удалить node напрямую
        node = child
      else
        # Число дочерних узлов = 2, удалить следующий по симметричному обходу узел и заменить им текущий узел
        temp = node.right
        while !temp.left.nil?
          temp = temp.left
        end
        node.right = remove_helper(node.right, temp.val)
        node.val = temp.val
      end
    end
    # Обновить высоту узла
    update_height(node)
    # 2. Выполнить вращение, чтобы снова сбалансировать поддерево
    rotate(node)
  end

  # ## Поиск узла ###
  def search(val)
    cur = @root
    # Искать в цикле и выйти после прохода за листовой узел
    while !cur.nil?
      # Целевой узел находится в правом поддереве cur
      if cur.val < val
        cur = cur.right
      # Целевой узел находится в левом поддереве cur
      elsif cur.val > val
        cur = cur.left
      # Найти целевой узел и выйти из цикла
      else
        break
      end
    end
    # Вернуть целевой узел
    cur
  end
end

### Driver Code ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\nAVL-дерево после вставки узла #{val}:"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nAVL-дерево после удаления узла #{val}:"
    print_tree(tree.get_root)
  end

  # Инициализация пустого AVL-дерева
  avl_tree = AVLTree.new

  # Вставка узла
  # Обратите внимание, как AVL-дерево сохраняет баланс после вставки узла
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # Вставка повторяющегося узла
  test_insert(avl_tree, 7)

  # Удаление узла
  # Обратите внимание, как AVL-дерево сохраняет баланс после удаления узла
  test_remove(avl_tree, 8) # Удаление узла степени 0
  test_remove(avl_tree, 5) # Удаление узла степени 1
  test_remove(avl_tree, 4) # Удаление узла степени 2

  result_node = avl_tree.search(7)
  puts "\nНайденный объект узла = #{result_node}, значение узла = #{result_node.val}"
end
