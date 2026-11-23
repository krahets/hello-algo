/**
 * File: binary_tree_dfs.dart
 * Created Time: 2023-04-04
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

// Initialize a list to store the traversal sequence
List<int> list = [];

/* Preorder traversal */
void preOrder(TreeNode? node) {
  if (node == null) return;
  // Visit order: root -> left subtree -> right subtree
  list.add(node.val);
  preOrder(node.left);
  preOrder(node.right);
}

/* Inorder traversal */
void inOrder(TreeNode? node) {
  if (node == null) return;
  // Visit order: left subtree -> root -> right subtree
  inOrder(node.left);
  list.add(node.val);
  inOrder(node.right);
}

/* Postorder traversal */
void postOrder(TreeNode? node) {
  if (node == null) return;
  // Visit order: left subtree -> right subtree -> root
  postOrder(node.left);
  postOrder(node.right);
  list.add(node.val);
}

/* Driver code */
void main() {
  /* Initialize the binary tree */
  // Use a helper function that builds a binary tree directly from an array
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nInitialize the binary tree\n");
  printTree(root);

  /* Preorder traversal */
  list.clear();
  preOrder(root);
  print("\nNode sequence from preorder traversal = $list");

  /* Inorder traversal */
  list.clear();
  inOrder(root);
  print("\nNode sequence from inorder traversal = $list");

  /* Postorder traversal */
  list.clear();
  postOrder(root);
  print("\nNode sequence from postorder traversal = $list");
}
