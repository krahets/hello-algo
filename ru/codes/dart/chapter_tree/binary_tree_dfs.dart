/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// Создать список для последовательности обхода
List<int> list = [];

/* Прямой обход */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок посещения: корень -> левое поддерево -> правое поддерево
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* Симметричный обход */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок посещения: левое поддерево -> корень -> правое поддерево
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* Обратный обход */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // Порядок посещения: левое поддерево -> правое поддерево -> корень
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Основная программа */
void main() {
  /* Инициализация двоичного дерева */
  // Используем функцию, которая строит двоичное дерево непосредственно из массива
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nИнициализация двоичного дерева\n");
  printTree(root);

  /* Прямой обход */
  list.clear();
  preOrder(root);
  print("\nУзлы в порядке прямого обхода = $list");

  /* Симметричный обход */
  list.clear();
  inOrder(root);
  print("\nУзлы в порядке симметричного обхода = $list");

  /* Обратный обход */
  list.clear();
  postOrder(root);
  print("\nУзлы в порядке обратного обхода = $list");
}
