/**
 * File: binary_tree_bfs.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmai.com)
 */

import 'dart:collection';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Обход по уровням */
List<int> levelOrder(TreeNode? root) {
  // Создать очередь и добавить корень
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // Создать список для последовательности обхода
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // Извлечь узел из очереди
    res.add(node!.val); // Сохранить значение узла
    if (node.left != null) queue.add(node.left); // Добавить левого потомка в очередь
    if (node.right != null) queue.add(node.right); // Добавить правого потомка в очередь
  }
  return res;
}

/* Основная программа */
void main() {
  /* Инициализация двоичного дерева */
  // Используем функцию, которая строит двоичное дерево непосредственно из массива
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nИнициализация двоичного дерева\n");
  printTree(root);

  // Обход по уровням
  List<int> res = levelOrder(root);
  print("\nУзлы в порядке обхода по уровням = $res");
}
