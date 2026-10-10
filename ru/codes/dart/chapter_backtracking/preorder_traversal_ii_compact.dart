/**
 * File: preorder_traversal_ii_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Предварительный обход: пример 2 */
void preOrder(
  TreeNode? root,
  List<TreeNode> path,
  List<List<TreeNode>> res,
) {
  if (root == null) {
    return;
  }

  // Попытка
  path.add(root);
  if (root.val == 7) {
    // Записать решение
    res.add(List.from(path));
  }
  preOrder(root.left, path, res);
  preOrder(root.right, path, res);
  // Откат
  path.removeLast();
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nИнициализация двоичного дерева");
  printTree(root);

  // Предварительный обход
  List<TreeNode> path = [];
  List<List<TreeNode>> res = [];
  preOrder(root, path, res);

  print("\nВсе пути от корня к узлу 7");
  for (List<TreeNode> vals in res) {
    print(List.generate(vals.length, (i) => vals[i].val));
  }
}
