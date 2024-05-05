/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// Initialize the list for storing traversal sequences
List<int> list = [];

/* Pre-order traversal */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // Visit priority: root node -> left subtree -> right subtree
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* In-order traversal */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // Visit priority: left subtree -> root node -> right subtree
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* Post-order traversal */
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
  // Use a specific function to convert an array into a binary tree
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nInitialize binary tree\n");
  printTree(root);

  /* Pre-order traversal */
  list.clear();
  preOrder(root);
  print("\nPrint sequence of nodes in pre-order traversal = $list");

  /* In-order traversal */
  list.clear();
  inOrder(root);
  print("\nPrint sequence of nodes in in-order traversal = $list");

  /* Post-order traversal */
  list.clear();
  postOrder(root);
  print("\nPrint sequence of nodes in post-order traversal = $list");
}
