/**
 * File: binary_search_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Двоичное дерево поиска */
class BinarySearchTree {
  late TreeNode? _root;

  /* Конструктор */
  BinarySearchTree() {
    // Инициализация пустого дерева
    _root = null;
  }

  /* Получить корень двоичного дерева */
  TreeNode? getRoot() {
    return _root;
  }

  /* Поиск узла */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // Искать в цикле до выхода за пределы листа
    while (cur != null) {
      // Искомый узел в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Искомый узел в левом поддереве cur
      else if (cur.val > _num)
        cur = cur.left;
      // Узел найден: выйти из цикла
      else
        break;
    }
    // Вернуть искомый узел
    return cur;
  }

  /* Вставка узла */
  void insert(int _num) {
    // Если дерево пусто, создать корень
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Искать в цикле до выхода за пределы листа
    while (cur != null) {
      // Такой узел уже есть: завершить вызов
      if (cur.val == _num) return;
      pre = cur;
      // Место вставки в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Место вставки в левом поддереве cur
      else
        cur = cur.left;
    }
    // Вставка узла
    TreeNode? node = TreeNode(_num);
    if (pre!.val < _num)
      pre.right = node;
    else
      pre.left = node;
  }

  /* Удаление узла */
  void remove(int _num) {
    // Если дерево пусто, сразу завершить вызов
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Искать в цикле до выхода за пределы листа
    while (cur != null) {
      // Узел для удаления найден: выйти из цикла
      if (cur.val == _num) break;
      pre = cur;
      // Узел для удаления в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Узел для удаления в левом поддереве cur
      else
        cur = cur.left;
    }
    // Если узел для удаления не найден, завершить вызов
    if (cur == null) return;
    // Число потомков равно 0 или 1
    if (cur.left == null || cur.right == null) {
      // Если потомков нет, child = null, если потомок один, child указывает на него
      TreeNode? child = cur.left ?? cur.right;
      // Удалить узел cur
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // Если удаляется корень, назначить новый корень
        _root = child;
      }
    } else {
      // Число потомков равно 2
      // Найти следующий за cur узел в порядке симметричного обхода
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // Рекурсивно удалить узел tmp
      remove(tmp.val);
      // Заменить значение cur значением tmp
      cur.val = tmp.val;
    }
  }
}

/* Основная программа */
void main() {
  /* Инициализация двоичного дерева поиска */
  BinarySearchTree bst = BinarySearchTree();
  // От порядка вставки зависит форма дерева. Эта последовательность даёт совершенное двоичное дерево
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\nИсходное двоичное дерево:\n");
  printTree(bst.getRoot());

  /* Поиск узла */
  TreeNode? node = bst.search(7);
  print("\nНайденный узел: $node, значение узла = ${node?.val}");

  /* Вставка узла */
  bst.insert(16);
  print("\nДвоичное дерево после вставки узла 16:\n");
  printTree(bst.getRoot());

  /* Удаление узла */
  bst.remove(1);
  print("\nДвоичное дерево после удаления узла 1:\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\nДвоичное дерево после удаления узла 2:\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\nДвоичное дерево после удаления узла 4:\n");
  printTree(bst.getRoot());
}
