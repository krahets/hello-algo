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

  # ## Получить корневой узел двоичного дерева ###
  def get_root
    @root
  end

  # ## Получить высоту узла ###
  def height(node)
    # Высота пустого узла равна -1, а высота листа равна 0
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
    # Баланс-фактор пустого узла равен 0
    return 0 if node.nil?

    # Баланс-фактор узла = высота левого поддерева - высота правого поддерева
    height(node.left) - height(node.right)
  end

  # ## Операция правого поворота ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # Используя child как опорную точку, выполнить правый поворот node
    child.right = node
    node.left = grand_child
    # Обновить высоту узла
    update_height(node)
    update_height(child)
    # Вернуть корневой узел поддерева после вращения
    child
  end

  # ## Операция левого поворота ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # Используя child как опорную точку, выполнить левый поворот node
    child.left = node
    node.right = grand_child
    # Обновить высоту узла
    update_height(node)
    update_height(child)
    # Вернуть корневой узел поддерева после вращения
    child
  end

  # ## Выполнить поворот, чтобы восстановить баланс этого поддерева ###
  def rotate(node)
    # Получить коэффициент баланса узла node
    balance_factor = balance_factor(node)
    # Левое поддерево
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # Правый поворот
        return right_rotate(node)
      else
        # Сначала выполнить левый поворот, затем правый
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # Правое поддерево
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # Левый поворот
        return left_rotate(node)
      else
        # Сначала выполнить правый поворот, затем левый
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # Дерево сбалансировано, вращение не требуется, можно сразу вернуть результат
    node
  end

  # ## вставить узел ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  # ## Рекурсивная вставка узла (вспомогательный метод)###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. Найти позицию вставки и вставить узел
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # Дублирующийся узел не вставлять, сразу вернуть результат
      return node
    end
    # Обновить высоту узла
    update_height(node)
    # 2. Выполнить вращение, чтобы снова сбалансировать это поддерево
    rotate(node)
  end

  # ## Удалить узел ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  # ## Рекурсивное удаление узла (вспомогательный метод)###
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
        # Если число дочерних узлов равно 0, сразу удалить node и вернуть результат
        return if child.nil?
        # Если число дочерних узлов равно 1, сразу удалить node
        node = child
      else
        # Если число дочерних узлов равно 2, удалить следующий узел симметричного обхода и заменить им текущий узел
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
    # 2. Выполнить вращение, чтобы снова сбалансировать это поддерево
    rotate(node)
  end

  # ## Найти узел ###
  def search(val)
    cur = @root
    # Выполнять поиск в цикле и выйти после прохождения листового узла
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
    puts "\nПосле вставки узла #{val} AVL-дерево имеет вид"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nПосле удаления узла #{val} AVL-дерево имеет вид"
    print_tree(tree.get_root)
  end

  # Инициализировать пустое AVL-дерево
  avl_tree = AVLTree.new

  # Вставка узла
  # Обратите внимание на то, как AVL-дерево сохраняет баланс после вставки узла
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # Вставить повторяющийся узел
  test_insert(avl_tree, 7)

  # Удаление узла
  # Обратите внимание на то, как AVL-дерево сохраняет баланс после удаления узла
  test_remove(avl_tree, 8) # Удалить узел степени 0
  test_remove(avl_tree, 5) # Удалить узел степени 1
  test_remove(avl_tree, 4) # Удалить узел степени 2

  result_node = avl_tree.search(7)
  puts "\nНайденный объект узла равен #{result_node}, значение узла = #{result_node.val}"
end
