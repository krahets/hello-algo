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
  // Initialize a queue and enqueue the root
  Queue<TreeNode?> queue = Queue();
  queue.add(root);
  // Initialize a list to store the traversal sequence
  List<int> res = [];
  while (queue.isNotEmpty) {
    TreeNode? node = queue.removeFirst(); // Dequeue from the queue
    res.add(node!.val); // Store the node value
    if (node.left != null) queue.add(node.left); // Enqueue the left child
    if (node.right != null) queue.add(node.right); // Enqueue the right child
  }
  return res;
}

/* Driver code */
void main() {
  /* Initialize the binary tree */
  // Use a helper function that builds a binary tree directly from an array
  TreeNode? root = listToTree([1, 2, 3, 4, 5, 6, 7]);
  print("\nInitialize the binary tree\n");
  printTree(root);

  // Level-order traversal
  List<int> res = levelOrder(root);
  print("\nNode sequence from level-order traversal = $res");
}
