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
    // Инициализировать пустое дерево
    _root = null;
  }

  /* Получить корневой узел двоичного дерева */
  TreeNode? getRoot() {
    return _root;
  }

  /* Поиск узла */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // Искать в цикле и выйти после прохода за листовой узел
    while (cur != null) {
      // Целевой узел находится в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Целевой узел находится в левом поддереве cur
      else if (cur.val > _num)
        cur = cur.left;
      // Найти целевой узел и выйти из цикла
      else
        break;
    }
    // Вернуть целевой узел
    return cur;
  }

  /* Вставка узла */
  void insert(int _num) {
    // Если дерево пусто, инициализировать корневой узел
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Искать в цикле и выйти после прохода за листовой узел
    while (cur != null) {
      // Найти повторяющийся узел и сразу вернуть
      if (cur.val == _num) return;
      pre = cur;
      // Позиция вставки находится в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Позиция вставки находится в левом поддереве cur
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
    // Если дерево пусто, сразу вернуть
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Искать в цикле и выйти после прохода за листовой узел
    while (cur != null) {
      // Найти узел для удаления и выйти из цикла
      if (cur.val == _num) break;
      pre = cur;
      // Узел для удаления находится в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Узел для удаления находится в левом поддереве cur
      else
        cur = cur.left;
    }
    // Если удаляемого узла нет, сразу вернуть
    if (cur == null) return;
    // Число дочерних узлов = 0 или 1
    if (cur.left == null || cur.right == null) {
      // Когда число дочерних узлов = 0 / 1, child = null / этот дочерний узел
      TreeNode? child = cur.left ?? cur.right;
      // Удалить узел cur
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // Если удаляемый узел является корнем, заново назначить корневой узел
        _root = child;
      }
    } else {
      // Число дочерних узлов = 2
      // Получить следующий узел после cur в симметричном обходе
      TreeNode? tmp = cur.right;
      while (tmp!.left != null) {
        tmp = tmp.left;
      }
      // Рекурсивно удалить узел tmp
      remove(tmp.val);
      // Перезаписать cur значением tmp
      cur.val = tmp.val;
    }
  }
}

/* Driver Code */
void main() {
  /* Инициализация двоичного дерева поиска */
  BinarySearchTree bst = BinarySearchTree();
  // Обратите внимание: разные порядки вставки порождают разные двоичные деревья; данная последовательность может построить совершенное двоичное дерево
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\nИсходное двоичное дерево\n");
  printTree(bst.getRoot());

  /* Поиск узла */
  TreeNode? node = bst.search(7);
  print("\nНайденный объект узла = $node, значение узла = ${node?.val}");

  /* Вставка узла */
  bst.insert(16);
  print("\nПосле вставки узла 16 двоичное дерево имеет вид\n");
  printTree(bst.getRoot());

  /* Удаление узла */
  bst.remove(1);
  print("\nПосле удаления узла 1 двоичное дерево имеет вид\n");
  printTree(bst.getRoot());
  bst.remove(2);
  print("\nПосле удаления узла 2 двоичное дерево имеет вид\n");
  printTree(bst.getRoot());
  bst.remove(4);
  print("\nПосле удаления узла 4 двоичное дерево имеет вид\n");
  printTree(bst.getRoot());
}
