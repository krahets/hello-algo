=begin
File: avl_tree.rb
Created Time: 2024-04-17
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

require_relative '../utils/tree_node'
require_relative '../utils/print_util'

### АВЛ-дерево ###
class AVLTree
  ### Конструктор ###
  def initialize
    @root = nil
  end

  ### Получить корень двоичного дерева ###
  def get_root
    @root
  end

  ### Получить высоту узла ###
  def height(node)
    # Высота пустого узла равна -1, высота листа равна 0
    return node.height unless node.nil?

    -1
  end

  ### Обновить высоту узла ###
  def update_height(node)
    # Высота узла на 1 больше высоты самого высокого поддерева
    node.height = [height(node.left), height(node.right)].max + 1
  end

  ### Получить коэффициент баланса ###
  def balance_factor(node)
    # Коэффициент баланса пустого узла равен 0
    return 0 if node.nil?

    # Коэффициент баланса узла равен высоте левого поддерева минус высота правого
    height(node.left) - height(node.right)
  end

  ### Правый поворот ###
  def right_rotate(node)
    child = node.left
    grand_child = child.right
    # Повернуть node вправо вокруг child
    child.right = node
    node.left = grand_child
    # Обновить высоту узла
    update_height(node)
    update_height(child)
    # Вернуть корень поддерева после поворота
    child
  end

  ### Левый поворот ###
  def left_rotate(node)
    child = node.right
    grand_child = child.left
    # Повернуть node влево вокруг child
    child.left = node
    node.right = grand_child
    # Обновить высоту узла
    update_height(node)
    update_height(child)
    # Вернуть корень поддерева после поворота
    child
  end

  ### Выполнить поворот, чтобы восстановить баланс поддерева ###
  def rotate(node)
    # Получить коэффициент баланса узла node
    balance_factor = balance_factor(node)
    # Перевес влево
    if balance_factor > 1
      if balance_factor(node.left) >= 0
        # Поворот вправо
        return right_rotate(node)
      else
        # Сначала поворот влево, затем вправо
        node.left = left_rotate(node.left)
        return right_rotate(node)
      end
    # Перевес вправо
    elsif balance_factor < -1
      if balance_factor(node.right) <= 0
        # Поворот влево
        return left_rotate(node)
      else
        # Сначала поворот вправо, затем влево
        node.right = right_rotate(node.right)
        return left_rotate(node)
      end
    end
    # Дерево сбалансировано: завершить вызов без поворота
    node
  end

  ### Вставка узла ###
  def insert(val)
    @root = insert_helper(@root, val)
  end

  ### Рекурсивная вставка узла (вспомогательный метод)###
  def insert_helper(node, val)
    return TreeNode.new(val) if node.nil?
    # 1. Найти место вставки и вставить узел
    if val < node.val
      node.left = insert_helper(node.left, val)
    elsif val > node.val
      node.right = insert_helper(node.right, val)
    else
      # Такой узел уже есть: завершить вызов без вставки
      return node
    end
    # Обновить высоту узла
    update_height(node)
    # 2. Восстановить баланс поддерева с помощью поворота
    rotate(node)
  end

  ### Удаление узла ###
  def remove(val)
    @root = remove_helper(@root, val)
  end

  ### Рекурсивное удаление узла (вспомогательный метод)###
  def remove_helper(node, val)
    return if node.nil?
    # 1. Найти и удалить узел
    if val < node.val
      node.left = remove_helper(node.left, val)
    elsif val > node.val
      node.right = remove_helper(node.right, val)
    else
      if node.left.nil? || node.right.nil?
        child = node.left || node.right
        # Нет потомков: удалить node и завершить вызов
        return if child.nil?
        # Один потомок: удалить node
        node = child
      else
        # Два потомка: удалить следующий узел симметричного обхода и заменить им текущий узел
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
    # 2. Восстановить баланс поддерева с помощью поворота
    rotate(node)
  end

  ### Поиск узла ###
  def search(val)
    cur = @root
    # Искать в цикле до выхода за пределы листа
    while !cur.nil?
      # Искомый узел в правом поддереве cur
      if cur.val < val
        cur = cur.right
      # Искомый узел в левом поддереве cur
      elsif cur.val > val
        cur = cur.left
      # Узел найден: выйти из цикла
      else
        break
      end
    end
    # Вернуть искомый узел
    cur
  end
end

### Основная программа ###
if __FILE__ == $0
  def test_insert(tree, val)
    tree.insert(val)
    puts "\nАВЛ-дерево после вставки узла #{val}:"
    print_tree(tree.get_root)
  end

  def test_remove(tree, val)
    tree.remove(val)
    puts "\nАВЛ-дерево после удаления узла #{val}:"
    print_tree(tree.get_root)
  end

  # Инициализация пустого АВЛ-дерева
  avl_tree = AVLTree.new

  # Вставка узла
  # Проследите, как АВЛ-дерево сохраняет баланс после вставки узла
  for val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]
    test_insert(avl_tree, val)
  end

  # Вставка повторяющегося узла
  test_insert(avl_tree, 7)

  # Удаление узла
  # Проследите, как АВЛ-дерево сохраняет баланс после удаления узла
  test_remove(avl_tree, 8) # Удаление узла без потомков
  test_remove(avl_tree, 5) # Удаление узла с одним потомком
  test_remove(avl_tree, 4) # Удаление узла с двумя потомками

  result_node = avl_tree.search(7)
  puts "\nНайденный узел: #{result_node}, значение узла = #{result_node.val}"
end
