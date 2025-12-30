/**
 * File: binary_tree_bfs.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmai.com)
 */

import 'dart:collection';
import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Level-order traversal */
List<int> levelOrder(TreeNode? root) {
  // Initialize queue, add root node
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // Initialize a list to save the traversal sequence
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // Dequeue
    res.add(node!.val); // Save node value
    if (node.left != null) queue.add(node.left); // Left child node enqueue
    if (node.right != null) queue.add(node.right); // Right child node enqueue
  }
  return res;
}

/* Driver Code */
void main() {
  /* Initialize binary tree */
  // Here we use a function to generate a binary tree directly from an array
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nInitialize binary tree\n");
  printTree(root);

  // Level-order traversal
  List<int> res = levelOrder(root);
  print("\nLevel-order traversal node print sequence = $res");
}
