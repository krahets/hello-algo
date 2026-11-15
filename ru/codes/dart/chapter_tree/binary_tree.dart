/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  // [region]{init_binary_tree}
  /* Инициализация двоичного дерева */
  // Инициализация узлов
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
  // [endregion]{init_binary_tree}
  print("\nИнициализация двоичного дерева\n");
  printTree(n1);

  // [region]{insert_node}
  /* Вставка и удаление узлов */
  TreeNode p = TreeNode(0);
  // Вставить узел P между n1 -> n2
  n1.left = p;
  p.left = n2;
  // [endregion]{insert_node}
  print("\nПосле вставки узла P\n");
  printTree(n1);
  // [region]{remove_node}
  // Удалить узел P
  n1.left = n2;
  // [endregion]{remove_node}
  print("\nПосле удаления узла P\n");
  printTree(n1);
}
