/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// Инициализировать список для хранения последовательности обхода
List<int> list = [];

/* Предварительный обход */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок обхода: корень -> левое поддерево -> правое поддерево
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* Симметричный обход */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок обхода: левое поддерево -> корень -> правое поддерево
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* Обратный обход */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок обхода: левое поддерево -> правое поддерево -> корень
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Driver Code */
void main() {
  /* Инициализация двоичного дерева */
  // Здесь используется функция, напрямую строящая двоичное дерево из массива
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nИнициализация двоичного дерева\n");
  printTree(root);

  /* Предварительный обход */
  list.clear();
  preOrder(root);
  print("\nПоследовательность печати узлов при предварительном обходе = $list");

  /* Симметричный обход */
  list.clear();
  inOrder(root);
  print("\nПоследовательность печати узлов при симметричном обходе = $list");

  /* Обратный обход */
  list.clear();
  postOrder(root);
  print("\nПоследовательность печати узлов при обратном обходе = $list");
}
