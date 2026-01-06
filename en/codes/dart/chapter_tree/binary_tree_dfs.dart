/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// Initialize list for storing traversal sequence
List<int> list = [];

/* Preorder traversal */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // Visit priority: root node -> left subtree -> right subtree
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* Inorder traversal */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // Visit priority: left subtree -> root node -> right subtree
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* Postorder traversal */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // Visit priority: left subtree -> right subtree -> root node
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Driver Code */
void main() {
  /* Initialize binary tree */
  // Here we use a function to generate a binary tree directly from an array
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nInitialize binary tree\n");
  printTree(root);

  /* Preorder traversal */
  list.clear();
  preOrder(root);
  print("\nPre-order traversal node print sequence = $list");

  /* Inorder traversal */
  list.clear();
  inOrder(root);
  print("\nIn-order traversal node print sequence = $list");

  /* Postorder traversal */
  list.clear();
  postOrder(root);
  print("\nPost-order traversal node print sequence = $list");
}
