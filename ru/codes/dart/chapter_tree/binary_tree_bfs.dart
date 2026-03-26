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
  // Инициализировать очередь и добавить корневой узел
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // Инициализировать список для хранения последовательности обхода
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // Извлечение из очереди
    res.add(node!.val); // Сохранить значение узла
    if (node.left != null) queue.add(node.left); // Поместить левого потомка в очередь
    if (node.right != null) queue.add(node.right); // Поместить правого потомка в очередь
  }
  return res;
}

/* Driver Code */
void main() {
  /* Инициализировать двоичное дерево */
  // Здесь используется функция, которая напрямую строит двоичное дерево из массива
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nИнициализировать двоичное дерево\n");
  printTree(root);

  // Обход по уровням
  List<int> res = levelOrder(root);
  print("\nПоследовательность узлов при обходе по уровням = $res");
}
