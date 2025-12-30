/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  /* Initialize binary tree */
  // Initialize node
  TreeNode n1 = TreeNode(1);
  TreeNode n2 = TreeNode(2);
  TreeNode n3 = TreeNode(3);
  TreeNode n4 = TreeNode(4);
  TreeNode n5 = TreeNode(5);
  // Build references (pointers) between nodes
  n1.left = n2;
  n1.right = n3;
  n2.left = n4;
  n2.right = n5;
  print("\nInitialize binary tree\n");
  printTree(n1);

  /* Insert node P between n1 -> n2 */
  TreeNode p = TreeNode(0);
  // Insert node p between n1 -> n2
  n1.left = p;
  p.left = n2;
  print("\nAfter inserting node P\n");
  printTree(n1);
  // Remove node P
  n1.left = n2;
  print("\nAfter removing node P\n");
  printTree(n1);
}
