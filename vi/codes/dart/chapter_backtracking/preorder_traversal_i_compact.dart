/**
 * File: preorder_traversal_i_compact.dart
 * Created Time: 2023-08-10
 * Author: liuyuxin (gvenusleo@gmail.com)
 */

import '../utils/print_util.dart';
import '../utils/tree_node.dart';

/* Preorder traversal: Example 1 */
void preOrder(TreeNode? root, List<TreeNode> res) {
  if (root == null) {
    return;
  }
  if (root.val == 7) {
    // Record solution
    res.add(root);
  }
  preOrder(root.left, res);
  preOrder(root.right, res);
}

/* Driver Code */
void main() {
  TreeNode? root = listToTree([1, 7, 3, 4, 5, 6, 7]);
  print("\nInitialize binary tree");
  printTree(root);

  // Preorder traversal
  List<TreeNode> res = [];
  preOrder(root, res);

  print("\nOutput all nodes with value 7");
  print(List.generate(res.length, (i) => res[i].val));
}
