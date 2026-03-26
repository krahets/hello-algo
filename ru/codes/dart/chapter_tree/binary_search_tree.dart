/**
 * File: binary_search_tree.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* двоичное дерево поиска */
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

  /* Найти узел */
  TreeNode? search(int _num) {
    TreeNode? cur = _root;
    // Выполнять поиск в цикле и выйти после прохождения листового узла
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

  /* Вставить узел */
  void insert(int _num) {
    // Если дерево пусто, инициализировать корневой узел
    if (_root == null) {
      _root = TreeNode(_num);
      return;
    }
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Выполнять поиск в цикле и выйти после прохождения листового узла
    while (cur != null) {
      // Найти дублирующийся узел и сразу вернуть результат
      if (cur.val == _num) return;
      pre = cur;
      // Позиция вставки находится в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Позиция вставки находится в левом поддереве cur
      else
        cur = cur.left;
    }
    // Вставить узел
    TreeNode? node = TreeNode(_num);
    if (pre!.val < _num)
      pre.right = node;
    else
      pre.left = node;
  }

  /* Удалить узел */
  void remove(int _num) {
    // Если дерево пусто, сразу вернуть результат
    if (_root == null) return;
    TreeNode? cur = _root;
    TreeNode? pre = null;
    // Выполнять поиск в цикле и выйти после прохождения листового узла
    while (cur != null) {
      // Найти узел для удаления и выйти из цикла
      if (cur.val == _num) break;
      pre = cur;
      // Удаляемый узел находится в правом поддереве cur
      if (cur.val < _num)
        cur = cur.right;
      // Удаляемый узел находится в левом поддереве cur
      else
        cur = cur.left;
    }
    // Если удаляемого узла нет, сразу вернуть результат
    if (cur == null) return;
    // Число дочерних узлов = 0 или 1
    if (cur.left == null || cur.right == null) {
      // Когда число дочерних узлов равно 0 / 1, child = null / этот дочерний узел
      TreeNode? child = cur.left ?? cur.right;
      // Удалить узел cur
      if (cur != _root) {
        if (pre!.left == cur)
          pre.left = child;
        else
          pre.right = child;
      } else {
        // Если удаляемый узел является корневым, заново назначить корневой узел
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
      // Заменить cur значением tmp
      cur.val = tmp.val;
    }
  }
}

/* Driver Code */
void main() {
  /* Инициализировать двоичное дерево поиска */
  BinarySearchTree bst = BinarySearchTree();
  // Обратите внимание: разные порядки вставки порождают разные двоичные деревья, а данная последовательность может породить совершенное двоичное дерево
  List<int> nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
  for (int _num in nums) {
    bst.insert(_num);
  }
  print("\nИнициализированное двоичное дерево:\n");
  printTree(bst.getRoot());

  /* Найти узел */
  TreeNode? node = bst.search(7);
  print("\nНайденныйузелобъектравно $node, значение узла = ${node?.val}");

  /* Вставить узел */
  bst.insert(16);
  print("\nПосле вставки узла 16 двоичное дерево имеет вид\n");
  printTree(bst.getRoot());

  /* Удалить узел */
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
