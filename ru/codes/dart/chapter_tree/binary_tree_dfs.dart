/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// Инициализировать список для хранения последовательности обхода
List<int> list = [];

/* Прямой обход */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок обхода: корневой узел -> левое поддерево -> правое поддерево
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* Симметричный обход */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок обхода: левое поддерево -> корневой узел -> правое поддерево
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* Обратный обход */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок обхода: левое поддерево -> правое поддерево -> корневой узел
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Driver Code */
void main() {
  /* Инициализировать двоичное дерево */
  // Здесь используется функция, которая напрямую строит двоичное дерево из массива
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nИнициализировать двоичное дерево\n");
  printTree(root);

  /* Прямой обход */
  list.clear();
  preOrder(root);
  print("\nПоследовательность узлов при прямом обходе = $list");

  /* Симметричный обход */
  list.clear();
  inOrder(root);
  print("\nПоследовательность узлов при симметричном обходе = $list");

  /* Обратный обход */
  list.clear();
  postOrder(root);
  print("\nПоследовательность узлов при обратном обходе = $list");
}
