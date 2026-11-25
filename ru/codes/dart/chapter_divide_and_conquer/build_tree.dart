/**
 * File: build_tree.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Построение двоичного дерева методом «разделяй и властвуй» */
TreeNode? dfs(
  List<int> preorder,
  Map<int, int> inorderMap,
  int i,
  int l,
  int r,
) {
  // Если интервал поддерева пуст, завершаем рекурсию
  if (r - l < 0) {
    return null;
  }
  // Создаём корень
  TreeNode? root = TreeNode(preorder[i]);
  // Находим m и разделяем левое и правое поддеревья
  int m = inorderMap[preorder[i]]!;
  // Подзадача: строим левое поддерево
  root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
  // Подзадача: строим правое поддерево
  root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
  // Возвращаем корень
  return root;
}

/* Построение двоичного дерева */
TreeNode? buildTree(List<int> preorder, List<int> inorder) {
  // Создаём хеш-таблицу индексов элементов inorder
  Map<int, int> inorderMap = {};
  for (int i = 0; i < inorder.length; i++) {
    inorderMap[inorder[i]] = i;
  }
  TreeNode? root = dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
  return root;
}

/* Основная программа */
void main() {
  List<int> preorder = [3, 9, 2, 1, 7];
  List<int> inorder = [9, 3, 1, 2, 7];
  print("Прямой обход = $preorder");
  print("Симметричный обход = $inorder");

  TreeNode? root = buildTree(preorder, inorder);
  print("Построенное двоичное дерево:");
  printTree(root!);
}
