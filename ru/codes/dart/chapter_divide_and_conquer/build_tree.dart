/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Построить двоичное дерево: разделяй и властвуй */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // Завершить при пустом диапазоне поддерева
  if (r - l < 0) {
    return null;
  }
  // Инициализировать корневой узел
  TreeNode? root = TreeNode(preorder[i]);
  // Найти m, чтобы разделить левое и правое поддеревья
  int m = inorderMap[preorder[i]]!;
  // Подзадача: построить левое поддерево
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // Подзадача: построить правое поддерево
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // Вернуть корневой узел
  return root;
}

/* Построить двоичное дерево */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // Инициализировать хеш-таблицу для хранения соответствия элементов inorder их индексам
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* Driver Code */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("Предварительный обход = $preorder");
  print("Симметричный обход = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("Построенное двоичное дерево:");
  printTree(root!);
}
