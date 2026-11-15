/**
 * File: binary_tree.dart
 * Created Time: 2023-04-03
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

void main() {
  // [region]{init_binary_tree}
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
  // [endregion]{init_binary_tree}
  print("\nInitialize the binary tree\n");
  printTree(n1);

  // [region]{insert_node}
  /* Insert and remove nodes */
  TreeNode p = TreeNode(0);
  // Insert node P between n1 and n2 in n1 -> n2
  n1.left = p;
  p.left = n2;
  // [endregion]{insert_node}
  print("\nAfter inserting node p:\n");
  printTree(n1);
  // [region]{remove_node}
  // Remove node p
  n1.left = n2;
  // [endregion]{remove_node}
  print("\nAfter removing node p:\n");
  printTree(n1);
}
