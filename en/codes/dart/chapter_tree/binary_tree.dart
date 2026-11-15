/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  /* Initialize the binary tree */
  // Initialize the nodes
  TreeNode n1 = TreeNode(1);
  TreeNode n2 = TreeNode(2);
  TreeNode n3 = TreeNode(3);
  TreeNode n4 = TreeNode(4);
  TreeNode n5 = TreeNode(5);
  // Set up references (pointers) between the nodes
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  n2.right = n5;
  print("\nInitialize the binary tree\n");
  printTree(n1);

  /* Insert and remove nodes */
  TreeNode p = TreeNode(0);
  // Insert node p between n1 and n2
  n1.left = p;
  p.left = n2;
  print("\nAfter inserting node p:\n");
  printTree(n1);
  // Remove node p
  n1.left = n2;
  print("\nAfter removing node p:\n");
  printTree(n1);
}
