/**
 * File: preorder_traversal_i_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Прямой обход: пример 1 */
void preOrder(TreeNode? root, List<TreeNode> res) {
  if (root == null) {
    return;
  }
  if (root.val == 7) {
    // Сохраняем решение
    res.add(root);
  }
  preOrder(root.left, res);
  preOrder(root.right, res);
}

/* Основная программа */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nСоздаём двоичное дерево");
  printTree(root);

  // Прямой обход
  List<TreeNode> res = [];
  preOrder(root, res);

  print("\nВыводим все узлы со значением 7");
  print(List.generate(res.length, (i) => res[i].val));
}
