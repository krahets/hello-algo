/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  /* Инициализация двоичного дерева */
  // Инициализировать узлы дерева
  TreeNode n1 = TreeNode(1);
  TreeNode n2 = TreeNode(2);
  TreeNode n3 = TreeNode(3);
  TreeNode n4 = TreeNode(4);
  TreeNode n5 = TreeNode(5);
  // Построить связи между узлами (указатели)
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  n2.right = n5;
  print("\nИнициализация двоичного дерева\n");
  printTree(n1);

  /* Вставка и удаление узлов */
  TreeNode p = TreeNode(0);
  // Вставить узел p между n1 -> n2
  n1.left = p;
  p.left = n2;
  print("\nПосле вставки узла P\n");
  printTree(n1);
  // Удалить узел P
  n1.left = n2;
  print("\nПосле удаления узла P\n");
  printTree(n1);
}
